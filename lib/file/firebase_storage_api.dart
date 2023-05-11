import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../utils/listtostring_stringtolist.dart';
import '../widgets/widget_default/__toast.dart';

class FirebaseApi {
  // static uploadFilewithSelection({required BuildContext context, FileType fileType = FileType.any, String? destination = 'files', String? renameTo}) async {
  //   // select file.
  //   PlatformFile? pickedFile = await selectFile(fileType: fileType);
  //   if (pickedFile == null) return;
  //   if (context.mounted) context.read<Upload>().setFile(pickedFile, pickedFile.name);

  //   // Confirmation Dialog

  //   // File
  //   final file = File(pickedFile.path!);

  //   // Firebase Saving Destination and FileName.
  //   var path = '$destination/${pickedFile.name}';

  //   // Firebase Saving Destination and Renamed file.
  //   if (renameTo != null && renameTo.isNotEmpty) path = '$destination/$renameTo.${pickedFile.extension}';

  //   // --------------- renaming if exist
  //   if (renameTo == null) {
  //     log('renaming');
  //     log('Destinaton:: $destination');
  //     String? newFileName = pickedFile.name; // new file name for checking.=
  //     String? extension = pickedFile.extension; // fule extesion
  //     int i = 1; // count for rename numbering,
  //     while (await FirebaseApi.isFileExist(address: destination ?? 'junk', filename: newFileName ?? '')) {
  //       // checking
  //       log('exist');
  //       newFileName = removeExtension(pickedFile.name); // removing extension. from the actual file name and assign it.
  //       newFileName = "$newFileName-($i)"; // adding number.
  //       newFileName = '$newFileName.$extension'; // adding extension.
  //       i++; // increading
  //     }
  //     if (context.mounted) context.read<Upload>().setFile(pickedFile, newFileName);
  //     path = '$destination/$newFileName';
  //   }
  //   // -------------------------

  //   try {
  //     myToast('uploading...');
  //     final ref = FirebaseStorage.instance.ref().child(path);
  //     UploadTask? uploadTask = ref.putFile(file);

  //     // Upload Provider: sending uploaded bytes
  //     uploadTask.snapshotEvents.listen((event) {
  //       log((event.bytesTransferred.toDouble() / event.totalBytes.toDouble()).toString());
  //       var value = (event.bytesTransferred.toDouble() / event.totalBytes.toDouble());
  //       if (context.mounted) context.read<Upload>().updateValue(value, true);
  //     }).onError((error) {});

  //     final snapshot = await uploadTask.whenComplete(() => {});
  //     final downloadURL = await snapshot.ref.getDownloadURL();

  //     // Upload Provider: sending file download link;
  //     if (context.mounted) context.read<Upload>().setImageURL(downloadURL);
  //     log("Download URL : $downloadURL");

  //     // return null;
  //   } on FirebaseException catch (e) {
  //     log(e.toString());
  //     myToast('upload failed!');
  //     // return null;
  //   }
  // }

  static Future<PlatformFile?> selectFile({FileType fileType = FileType.any, bool multipleFiles = false}) async {
    try {
      final results = await FilePicker.platform.pickFiles(allowMultiple: multipleFiles, type: fileType);
      // log('File path');
      // final file = File(results!.files.first.path ?? '');
      // log(file.path);
      return results!.files.first;
    } catch (e) {
      myToast('something went wrong!');
    }
    return null;
  }

  static Future<UploadTask?> uploadFile({required BuildContext context, PlatformFile? pickedFile, String? destination = 'images', String? renameTo}) async {
    log('uploading ....');
    // select file.
    if (pickedFile == null) return null;

    // Confirmation Dialog

    // File
    log('file ....');
    final file = File(pickedFile.path!);

    log('path ....');
    // Firebase Saving Destination and FileName.
    var path = '$destination/${pickedFile.name}';

    // Firebase Saving Destination and Renamed file.
    if (renameTo != null && renameTo.isNotEmpty) path = '$destination/$renameTo.${pickedFile.extension}';

    // --------------- renaming if exist
    if (renameTo == null || renameTo.isEmpty) {
      String? newFileName = pickedFile.name; // new file name for checking.=
      String? extension = pickedFile.extension; // fule extesion
      int i = 1; // count for rename numbering,
      while (await FirebaseApi.isFileExist(address: destination ?? 'junk', filename: newFileName ?? '')) {
        // checking
        newFileName = removeExtension(newFileName ?? ''); // removing extension.
        newFileName = "$newFileName-($i)"; // adding number.
        newFileName = '$newFileName.$extension'; // adding extension.
        i++; // increading
      }
    }
    // -------------------------

    try {
      myToast('uploading...');
      final ref = FirebaseStorage.instance.ref().child(path);
      // final storagfe = ref.getMetadata()
      UploadTask? uploadTask = ref.putFile(file);

      // final snapshot = await uploadTask.whenComplete(() => {});
      // final downloadURL = await snapshot.ref.getDownloadURL();

      // // Upload Provider: sending file download link;
      // log("Download URL : $downloadURL");

      return uploadTask;
    } on FirebaseException catch (e) {
      log(e.toString());
      myToast('upload failed!');
      return null;
    }
  }

  static Future<bool> isFileExist({String address = '', required String filename}) async {
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child(address).child(filename);
    try {
      await ref.getMetadata();
      return true;
    } catch (e) {
      return false;
    }

    // final storage = FirebaseStorage.instance.ref();

    // storage.ListResult result = await storage.FirebaseStorage.instance.ref().listAll();

    // try {
    //   final dataList = await FirebaseStorage.instance.ref().child(address).listAll();

    //   for (var i = 0; i < dataList.items.length; i++) {
    //     if (dataList.items[i].name == filename) {
    //       log("${dataList.items[i].name} == $filename");
    //       return true;
    //     }
    //   }
    //   return false;
    // } catch (e) {
    //   log("ERROR::: $e");
    // }
    // return false;
    //   for (var element in dataList.items) {
    //     log("${element.name} == ${filename}");

    //   }
    //   int i = dataList.items.indexWhere((element) => (element.name == filename));

    //   return (i == -1) ? false : true;
    // } catch (e) {
    //   log('Error -- $e');
    //   return true;
    // }
  }

  //   log('FILENAME:: $filename');
  //   log('Destination:: $address');
  //   try {

  //     final storage = FirebaseStorage.instance.ref();
  //     final storageFile = storage.bucket.indexOf(pattern);
  // String link = await storage.child('$address/$filename').getDownloadURL();
  // log("LINK: $link");
  // if (link.isNotEmpty) return true;

  // FirebaseStorage.instance.ref().child('$address/$filename').getDownloadURL().then((value) => log(value));
  //   } catch (e) {
  //     return false;
  //   }
  //   return false;
  // }

  //   final storage = FirebaseStorage.instance;
  //   final ref = storage.ref().child(address);

  //   ref.getMetadata().then((metadata) {
  //     // The file exists
  //     log('File exists!');
  //     return true;
  //   }).catchError((error) {
  //     if (error.code == 'storage/object-not-found') {
  //       // The file doesn't exist
  //       log('File does not exist!');
  //       return false;
  //     } else {
  //       // An error occurred while getting the metadata
  //       log('Error: $error');
  //       return false;
  //     }
  //   });
  //   return false;
  // }
}
