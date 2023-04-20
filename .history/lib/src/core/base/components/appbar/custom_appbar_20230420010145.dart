import 'package:flutter/material.dart';
import 'package:search_app/src/core/base/singleton/base_singleton.dart';
import 'package:search_app/src/core/extensions/context_extensions.dart';
import 'package:search_app/src/core/extensions/string_extensions.dart';

import '../../../constants/enums/icon_enums.dart';

class CustomAppBar extends StatelessWidget with BaseSingleton {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            IconEnums.appLogo.iconName.toPng,
            height: 30,
            width: 60,
          ),
          Text(
            constants.appName,
            style: context.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
