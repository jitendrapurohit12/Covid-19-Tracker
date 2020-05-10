import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

void showErrorFlushbar({
  @required BuildContext context,
  @required String message,
}) =>
    FlushbarHelper.createError(message: message)..show(context);
