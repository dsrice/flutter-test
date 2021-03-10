import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalFileService{
  void outputFile(String target, String filename) async {
    getFilePath(filename).then((File file){
      file.writeAsString(target);
    });
  }

  Future<String> load(filename) async{
    final file = await getFilePath(filename);
    return file.readAsString();
  }

  Future<File> getFilePath(String filename) async {
    final directory = await getApplicationSupportDirectory();
    return File(directory.path + "/" + filename);
  }

  void deleteFile(String filename) async {
    await getFilePath(filename).then((File file) =>{
      file.delete()
    });
  }
}