import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class ImportantFunctions {
  Future<String> localPath(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    debugPrint('${directory.path}');
    return '${directory.path}/$filename';
  }

  Future<File> localFile(String filename) async {
    final path = await localPath;
    return File('$path/$filename');
  }
}
