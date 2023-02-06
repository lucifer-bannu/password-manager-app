// 🎯 Dart imports:
// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

// 📦 Package imports:
// ignore: implementation_imports
import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_onboarding_flutter/services/onboarding_service.dart';
import 'package:at_onboarding_flutter/utils/at_onboarding_response_status.dart';
import 'package:at_server_status/at_server_status.dart';
import 'package:at_utils/at_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// 🌎 Project imports:
import '../../app/constants/keys.dart';
import '../../app/constants/theme.dart';
import '../../meta/extensions/logger.ext.dart';
import '../../meta/models/key.model.dart';
import 'app.service.dart';
import 'passman.env.dart';

class SdkServices {
  final AppLogger _logger = AppLogger('SDK services');

  /// singleton with getInstance()
  static final SdkServices _singleton = SdkServices._internal();

  SdkServices._internal();
  factory SdkServices.getInstance() {
    return _singleton;
  }

  AtClientManager atClientManager = AtClientManager.getInstance();

  /// Get @sign status
  Future<AtStatus> getAtSignStatus(String atSign) async => AtStatusImpl(
        rootUrl: PassmanEnv.rootDomain,
      ).get(atSign);

  /// Function to get [AtClientPreference].
  Future<AtClientPreference> getAtClientPreferences() async {
    String appDirPath = (await getApplicationDocumentsDirectory()).path;
    return AtClientPreference()
      ..commitLogPath = p.join(appDirPath, 'commitLog')
      ..hiveStoragePath = p.join(appDirPath, 'hiveStorage')
      ..downloadPath = p.join(appDirPath, 'downloads')
      ..syncRegex = PassmanEnv.syncRegex
      ..isLocalStoreRequired = true
      ..syncPageLimit = 500
      ..rootDomain = PassmanEnv.rootDomain
      ..namespace = PassmanEnv.appNamespace;
  }

  /// Onboard the app with an @sign and return the response as bool
  Future<AtOnboardingResponseStatus> onboardWithAtKeys(
      String atSign, String keysData) async {
    _logger.finer('Onboarding with @sign: $atSign using atKeys file');
    try {
      AtOnboardingResponseStatus status = await AppServices.onboardingService
          .authenticate(atSign,
              jsonData: keysData, decryptKey: json.decode(keysData)[atSign]);
      _logger.finer('Onboarding with atKeys file result: $status');
      return status;
    } on Exception catch (e, s) {
      _logger.severe('Error onboarding with @sign: $atSign', e, s);
      return AtOnboardingResponseStatus.authFailed;
    }
  }

  Future<bool> checkUserStatus(String atSign) async {
    List<String>? atSignsList;
    atSignsList =
        await KeyChainManager.getInstance().getAtSignListFromKeychain();
    try {
      AtStatus s = await getAtSignStatus(atSign)
          .timeout(const Duration(seconds: 30), onTimeout: () {
        _logger.warning('Timeout checking @sign status: $atSign');
        throw 'timeOut';
      });
      bool atSignExist = atSignsList.contains(atSign);
      s.serverStatus == ServerStatus.teapot ? atSignExist = false : atSignExist;
      return atSignExist;
    } on Exception catch (e, s) {
      _logger.severe('Error checking user status: $atSign', e, s);
      return false;
    }
  }

  /// Checks if any @sign is onboarded and returns the result.
  Future<bool> checkIfUserAlreadyExist() async {
    try {
      _logger.finer('Checking if user already exist...');
      return (await KeyChainManager.getInstance().getAtsignsWithStatus())
          .values
          .contains(true);
    } on Exception catch (e, s) {
      _logger.severe('Error checking if user already exist', e, s);
      return false;
    }
  }

  /// Check if user is onboarded and returns the result.
  Future<bool> checkIfAtSignExistInDevice(
      String atSign, AtClientPreference preference) async {
    _logger.finer('Checking if @sign exist in device: $atSign');
    bool isExists = await (OnboardingService.getInstance()
          ..setAtsign = atSign
          ..setAtClientPreference = preference)
        .isExistingAtsign(atSign);
    _logger.finer('@sign exist in device: $isExists');
    return isExists;
  }

  /// Returns the current status of the @sign.
  Future<bool> actiavteAtSign(
      String atSign, AtClientPreference preference) async {
    try {
      _logger.finer('Activating @sign: $atSign');
      AtOnboardingResponseStatus cramAuthResponse =
          await OnboardingService.getInstance()
              .authenticate(atSign, cramSecret: preference.cramSecret);
      if (cramAuthResponse.name == 'authSuccess') {
        _logger.finer('CRAM authentication success');
        Map<String, String> keyData = await AppServices.getKeysFileData(atSign);
        AtOnboardingResponseStatus pkamAuthResponse =
            await onboardWithAtKeys(atSign, jsonEncode(keyData));
        _logger.finer('PKAM authentication result: ${pkamAuthResponse.name}');
        pkamAuthResponse.name == 'authSuccess'
            ? await AtClientManager.getInstance()
                .setCurrentAtSign(atSign, PassmanEnv.appNamespace, preference)
            : null;
        return pkamAuthResponse.name == 'authSuccess';
      } else {
        return false;
      }
    } on Exception catch (e) {
      Exception('Error while activating @sign : $e');
      return false;
    }
  }

  String? get currentAtSign =>
      AtUtils.formatAtSign(atClientManager.atClient.getCurrentAtSign());

  Future<Map<String, dynamic>> getTheme([Size? size]) async {
    _logger.finer('Checking the app theme...');
    Map<String, dynamic> data = <String, dynamic>{};
    try {
      bool? isDarkThemeSet = await get(PassKey(key: Keys.isDarkTheme.key));
      if (isDarkThemeSet == null) {
        data['isDarkTheme'] = false;
        await put(Keys.isDarkTheme..value!.value = false);
        _logger.finer('Current Theme is light');
      } else {
        data['isDarkTheme'] = isDarkThemeSet;
        _logger.finer('Current Theme is ${isDarkThemeSet ? 'dark' : 'light'}');
      }
      String? theme = await get(PassKey(key: Keys.themeKey.key));
      if (theme == null) {
        String defaultCode =
            AppTheme.primary.value.toRadixString(16).padLeft(8, '0');
        data['themeHex'] = defaultCode;
        _logger.finer('Current Theme color is Color(0x$defaultCode)');
      } else {
        data['themeHex'] = theme;
        _logger.finer('Current Theme color is Color(0x$theme)');
      }
    } on Exception catch (e, s) {
      _logger.severe('Error while checking the app theme', e, s);
    }
    return data;
  }

  Future<String?> getProPic() async {
    _logger.finer('Fetching profile pic');
    try {
      List<AtKey> list = await atClientManager.atClient
          .getAtKeys(regex: 'profilepic', sharedBy: currentAtSign);
      for (AtKey key in list) {
        if (key.key == 'profilepic' &&
            key.namespace == PassmanEnv.appNamespace) {
          AtValue img = await atClientManager.atClient.get(key);
          _logger.finer('Got profile pic value');
          return json.decode(img.value)['value'];
        }
      }
      _logger.warning('Cannot get profile pic value');
      return null;
    } on Exception catch (e, s) {
      _logger.severe('Error getting profile pic', e, s);
      return null;
    }
  }

  /// Checks if master image exists or not in remote secondary returns the result.
  Future<String?> checkMasterImageKey() async {
    _logger.finer('Getting master image key');
    List<AtKey> allKeys = await getAllKeys(regex: Keys.masterImgKey.key);
    for (AtKey masterImgKey in allKeys) {
      String? imgData = await get(PassKey.fromAtKey(masterImgKey));
      if (imgData == null || imgData.isEmpty) {
        _logger.warning('No master image key found');
      } else {
        _logger.finer('Master image key found');
        return imgData;
      }
    }
    return null;
  }

  /// Checks if master image exists or not in remote secondary returns the result.
  Future<bool> checkFingerprint() async {
    _logger.finer('Checking fingerprint');
    bool enabled = await get(PassKey(key: 'fingerprint')) ?? false;
    if (!enabled) {
      _logger.warning('No fingerprint key found');
    } else {
      _logger.finer('Fingerprint enabled : $enabled');
    }
    return enabled;
  }

  Future<String?> getName() async {
    _logger.finer('Getting name');
    try {
      List<AtKey> names =
          await getAllKeys(regex: 'name.${PassmanEnv.appNamespace}');
      if (names.isNotEmpty) {
        String? name = await get(
          PassKey.fromAtKey(names.first),
        );
        return name;
      }
      return null;
    } on Exception catch (e, s) {
      _logger.severe('Error getting name', e, s);
      return null;
    }
  }

  // --------------------- //
  //    CRUD operations    //
  // --------------------- //

  Future<bool> put(PassKey entity) async {
    try {
      //set value
      dynamic value = entity.isBinary == false
          ? jsonEncode(entity.value?.toJson())
          : entity.value?.value;
      bool putResult =
          await atClientManager.atClient.put(entity.toAtKey(), value);
      if (putResult) {
        if (entity.key!.contains('report')) {
          await AppServices.sdkServices.atClientManager.notificationService
              .notify(
                NotificationParams.forUpdate(
                  entity.toAtKey(),
                  value: entity.value?.value['title'],
                ),
              )
              .then((NotificationResult value) => _logger.finer(
                  'Notification status: ${value.notificationStatusEnum.name}'));
        }
      }
      AppServices.syncData();
      return putResult;
    } catch (e, s) {
      _logger.severe('Error while putting data: $e', e, s);
      return false;
    }
  }

  /// Get the value of the key.
  Future<dynamic> get(PassKey entity) async {
    try {
      AtValue value = await atClientManager.atClient.get(entity.toAtKey());
      return jsonDecode(value.value)['value'];
    } on KeyNotFoundException catch (e, s) {
      _logger.severe('Key not found with message ${e.message}', e, s);
      return null;
    } on FormatException catch (e, s) {
      _logger.severe('FormatError: $e', e, s);
    } on Exception catch (e, s) {
      _logger.severe('Error while getting data, Error: $e', e, s);
      return null;
    }
  }

  Future<bool> delete(String key, [Function? onSyncDone]) async {
    bool keyDeleted = false;
    try {
      List<AtKey> a = await getAllKeys(regex: key);
      if (a.length > 1) {
        _logger
            .severe('Looks like you have more that one key with the keyname');
        return false;
      }
      for (AtKey k in a) {
        keyDeleted = await atClientManager.atClient.delete(k);
      }
      if (keyDeleted) {
        _logger.finer('$key deleted successfully');
        AppServices.syncData(onSyncDone);
      }
      return keyDeleted;
    } on KeyNotFoundException catch (e, s) {
      _logger.severe('${e.message} to delete it.', e, s);
      return false;
    } on Exception catch (e, s) {
      _logger.severe('Error while deleting data', e, s);
      return false;
    }
  }

  Future<List<AtKey>> getAllKeys({
    String? regex,
    String? sharedBy,
    String? sharedWith,
  }) async {
    try {
      List<AtKey> result = await atClientManager.atClient
          .getAtKeys(regex: regex, sharedBy: sharedBy, sharedWith: sharedWith);
      return result;
    } on Exception catch (e, s) {
      _logger.severe('Error while fetching keys', e, s);
      return <AtKey>[];
    }
  }
}
