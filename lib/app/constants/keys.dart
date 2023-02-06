// 🌎 Project imports:
import '../../core/services/app.service.dart';
import '../../meta/models/key.model.dart';
import '../../meta/models/value.model.dart';

class Keys {
  /// Admin key
  static final PassKey adminKey = PassKey(
    key: 'admin',
    sharedBy: AppServices.sdkServices.currentAtSign,
    sharedWith: AppServices.sdkServices.currentAtSign,
    value: Value(
      type: 'admin',
    ),
  );

  /// Profile picture key
  static final PassKey profilePicKey = PassKey(
    key: 'profilepic',
    isPublic: false,
    isHidden: true,
    createdDate: DateTime.now(),
    value: Value(
      isHidden: true,
      labelName: 'Profile pic',
    ),
  );

  /// User name key
  static final PassKey nameKey = PassKey(
    key: 'name',
    isPublic: false,
    isHidden: true,
    createdDate: DateTime.now(),
    value: Value(
      labelName: 'Username',
      isHidden: true,
    ),
  );

  /// Master image key
  static final PassKey masterImgKey = PassKey(
    key: 'masterpassimg',
    isPublic: false,
    isHidden: true,
    sharedBy: AppServices.sdkServices.currentAtSign,
    sharedWith: AppServices.sdkServices.currentAtSign,
    createdDate: DateTime.now(),
    value: Value(
      labelName: 'Master password image',
      isHidden: true,
    ),
  );

  /// Password key
  static final PassKey passwordKey = PassKey(
    isPublic: false,
    isHidden: true,
    sharedBy: AppServices.sdkServices.currentAtSign,
    sharedWith: AppServices.sdkServices.currentAtSign,
    createdDate: DateTime.now(),
    value: Value(
      labelName: 'Password',
      isHidden: true,
    ),
  );

  /// Cards key
  static final PassKey cardsKey = PassKey(
    isPublic: false,
    isHidden: true,
    sharedBy: AppServices.sdkServices.currentAtSign,
    sharedWith: AppServices.sdkServices.currentAtSign,
    createdDate: DateTime.now(),
    value: Value(
      labelName: 'Cards',
      isHidden: true,
    ),
  );

  /// Images key
  static final PassKey imagesKey = PassKey(
    isPublic: false,
    isHidden: true,
    sharedBy: AppServices.sdkServices.currentAtSign,
    sharedWith: AppServices.sdkServices.currentAtSign,
    createdDate: DateTime.now(),
    value: Value(
      labelName: 'Images',
      isHidden: true,
    ),
  );

  /// Fingerprint key
  static final PassKey fingerprintKey = PassKey(
    isPublic: false,
    key: 'fingerprint',
    createdDate: DateTime.now(),
    isHidden: true,
    value: Value(
      labelName: 'Fingerprint',
      isHidden: true,
    ),
  );

  /// App dark Theme key
  static final PassKey isDarkTheme = PassKey(
    isPublic: false,
    key: 'darktheme',
    sharedBy: AppServices.sdkServices.currentAtSign,
    sharedWith: AppServices.sdkServices.currentAtSign,
    createdDate: DateTime.now(),
    isHidden: true,
    value: Value(
      labelName: 'Is dark theme',
      isHidden: true,
    ),
  );

  /// App Theme key
  static final PassKey themeKey = PassKey(
    isPublic: false,
    key: 'themecolor',
    sharedBy: AppServices.sdkServices.currentAtSign,
    sharedWith: AppServices.sdkServices.currentAtSign,
    createdDate: DateTime.now(),
    isHidden: true,
    value: Value(
      labelName: 'App Theme',
      isHidden: true,
    ),
  );
}
