import 'package:flutter/material.dart';
import 'package:search_app/src/core/extensions/context_extensions.dart';

import '../../constants/app/color_constants.dart';

Future<dynamic> mainPopup(
  BuildContext context, {
  double height = 0.5,
  double width = double.infinity,
  required Widget child,
}) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return ScaleTransition(
        scale: Tween<double>(begin: .5, end: 1).animate(animation),
        child: AlertDialog(
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: ColorConstants.instance.mainColor,
              width: 1.5,
            ),
          ),
          content: SizedBox(
            height: context.dynamicHeight(height),
            width: double.infinity,
            child: child,
          ),
        ),
      );
    },
  );
}
