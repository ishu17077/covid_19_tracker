import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class ImportantFunctions {
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    debugPrint('${directory.path}');
    return '${directory.path}/covid_cases.json';
  }

  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/covid_cases.json');
  }
}
