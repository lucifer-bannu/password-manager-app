// 🐦 Flutter imports:

// 🎯 Dart imports:
import 'dart:ui';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:at_base2e15/at_base2e15.dart';
import 'package:provider/provider.dart';
import 'package:tabler_icons/tabler_icons.dart';

// 🌎 Project imports:
import '../../../../core/services/app.service.dart';
import '../../../../meta/models/freezed/image.model.dart';
import '../../../../meta/notifiers/theme.notifier.dart';
import '../../../../meta/notifiers/user_data.notifier.dart';
import '../../../constants/theme.dart';
import '../../../provider/listeners/user_data.listener.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({Key? key}) : super(key: key);

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  String? _img;
  @override
  void dispose() {
    _img = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: RefreshIndicator(
            backgroundColor: Theme.of(context).backgroundColor,
            color: context.read<AppThemeNotifier>().primary,
            onRefresh: () async => AppServices.getImages(),
            child: UserDataListener(
              builder: (BuildContext context, UserData userData) {
                List<Images> images = userData.images;
                return userData.images.isEmpty
                    ? const Text('Not images saved yet')
                    : ListView.builder(
                        itemCount: images.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int i) {
                          return Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Text(
                                    images[i].folderName,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: AppTheme.grey[400],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Wrap(
                                    children: <Widget>[
                                      for (String img in images[i].images)
                                        GestureDetector(
                                          onTap: () {
                                            setState(() => _img = img);
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Image.memory(
                                              Base2e15.decode(img),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
              },
            ),
          ),
        ),
        if (_img != null)
          Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                    ),
                    child: Image(
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                      image: Image.memory(
                        Base2e15.decode(_img!),
                      ).image,
                    ),
                  ),
                  Positioned(
                    right: -10,
                    top: -10,
                    child: IconButton(
                      icon: const Icon(
                        TablerIcons.x,
                        color: Colors.red,
                      ),
                      onPressed: () => setState(
                        () => _img = null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
