import 'dart:io';

import 'package:flutter/widgets.dart';

goBack(context) {
  if (Platform.isAndroid) {
    Navigator.pop(context);
  } else {
    exit(0);
  }
}
