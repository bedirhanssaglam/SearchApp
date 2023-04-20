import 'dart:async';
import 'dart:developer';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:search_app/src/core/base/singleton/base_singleton.dart';

class SearchField extends StatefulWidget {
  final void Function(String value) onChanged;
  final TextEditingController? controller;

  const SearchField({
    Key? key,
    required this.onChanged,
    this.controller,
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
    return TextField(
      controller: widget.controller,
      onChanged: _onItemChanged,
      cursorColor: colors.mainColor,
      textInputAction: TextInputAction.search,
      onSubmitted: _onItemChanged,
      decoration: InputDecoration(
        hintText: constants.formHintText,
        prefixIcon: Icon(
          Icons.search,
          color: colors.textColor,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            widget.controller?.clear();
            _onItemChanged(widget.controller!.text.trim());
          },
          icon: Icon(
            Icons.close,
            color: colors.textColor,
          ),
        ),
      ),
    );
  }
}
