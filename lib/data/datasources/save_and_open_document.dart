// import 'dart:io';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/widgets.dart';

// class SaveAndOpenDocument {
//   static Future<File> savePdf({
//     required String name,
//     required Document pdf,
//   }) async {
//     final root = await getExternalStorageDirectory();
//     final file = File('${root!.path}/$name');
//     await file.writeAsBytes(await pdf.save());
//   }

//   static Future<File> openPdf(File file) async {
//     final path = file.path;
//     await OpenFile.open(path);
//   }
// }
