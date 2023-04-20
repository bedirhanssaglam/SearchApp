import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/src/core/base/singleton/base_singleton.dart';
import 'package:search_app/src/view/users/cubit/search_cubit.dart';

class SearchField extends StatefulWidget {
  String? text;
  final void Function(String value) onChanged;
  final TextEditingController? controller;
  const SearchField({Key? key, required this.onChanged, this.controller})
      : super(key: key);

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
        print('Canceled');
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
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: colors.textColor,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            widget.controller?.clear();
            // cancellableOperation = CancelableOperation.fromFuture(
            //   Future.delayed(_delayTime),
            //   onCancel: () {
            //     print('Canceled');
            //   },
            // );
            // cancellableOperation.cancel();
            // _start();
            // cancellableOperation.value.whenComplete(() {
            //   widget.onChanged;
            // });
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
