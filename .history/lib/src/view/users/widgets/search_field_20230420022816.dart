import 'dart:async';
import 'dart:developer';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:search_app/src/core/base/singleton/base_singleton.dart';
import 'package:search_app/src/core/extensions/context_extensions.dart';

class SearchField extends StatefulWidget {
  final void Function(String value) onChanged;
  final TextEditingController controller;

  const SearchField({
    Key? key,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> with BaseSingleton {
  late CancelableOperation<void> cancellableOperation;
  final _delayTime = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() {
    cancellableOperation = CancelableOperation.fromFuture(
      Future.delayed(_delayTime),
      onCancel: () {
        log('Canceled');
      },
    );
  }

  void _onItemChanged(String value) {
    cancellableOperation.cancel();
    _start();
    cancellableOperation.value.whenComplete(() {
      widget.onChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        //If we use [Form], we'll use [TextFormField],
        //so we don't need [TextFormField] for this application.
        controller: widget.controller,
        onChanged: _onItemChanged,
        cursorColor: colors.mainColor,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: constants.formHintText,
          prefixIcon: Icon(
            Icons.search,
            color: colors.textColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              widget.controller.clear();
              _onItemChanged(widget.controller.text.trim());
            },
            icon: Icon(
              Icons.close,
              color: colors.textColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.dynamicHeight(10)),
            borderSide: BorderSide(color: colors.mainColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.dynamicHeight(10)),
            borderSide: BorderSide(color: colors.mainColor),
          ),
        ),
      ),
    );
  }
}
