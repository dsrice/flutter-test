import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

//ファイルの出力処理
void outputFile(String target, String filename) async {
  print(target);
  getFilePath(filename).then((File file) {
    file.writeAsString(target);
  });
}

//テキストファイルの読み込み
Future<String> load(filename) async {
  final file = await getFilePath(filename);
  return file.readAsString();
}

//テキストファイルを保存するパスを取得する
Future<File> getFilePath(String filename) async {
  final directory = await getApplicationSupportDirectory();
  return File(directory.path + '/' + filename);
}

Future<void> deleteFile(String filename) async {
  await getFilePath(filename).then((File file) {
    file.delete();
  });
}