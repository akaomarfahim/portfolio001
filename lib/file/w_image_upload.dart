import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
import '../widgets/widget_default/__loadings.dart';
import '../widgets/widget_default/__toast.dart';

class MyWidgetFirebaseImageUpload {
  static double? height = 200;
  static double? width = double.infinity;
  static EdgeInsets? margin = const EdgeInsets.fromLTRB(10, 0, 10, 0);
  static EdgeInsets? padding = EdgeInsets.zero;
  static BoxDecoration decoration = BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.black38);
}

// Select File :
Future<PlatformFile?> selectFile({FileType fileType = FileType.any, bool multipleFiles = false}) async {
  try {
    final results = await FilePicker.platform.pickFiles(allowMultiple: multipleFiles, type: fileType);
    return results!.files.first;
  } catch (e) {
    // myToast('Error: selecting File.');
  }
  return null;
}

// Image Widget :
class FirebaseImageUpload extends StatefulWidget {
  final Function(String) callbackImageUlr;
  final String? imageUrl;
  final String firebaseStoragePath;
  final String? changeFileNameTo;
  double? height;
  double? width;
  EdgeInsets? margin = const EdgeInsets.fromLTRB(15, 10, 15, 10);
  EdgeInsets? padding;
  BoxDecoration? decoration;
  FirebaseImageUpload(
      {super.key, required this.callbackImageUlr, this.firebaseStoragePath = 'files', this.height, this.width, this.margin, this.padding, this.changeFileNameTo, this.imageUrl});

  @override
  State<FirebaseImageUpload> createState() => _FirebaseImageUploadState();
}

class _FirebaseImageUploadState extends State<FirebaseImageUpload> {
  String? imageUrl;
  String? newFileName;
  PlatformFile? result;
  double? uploadPercentage;

  @override
  void initState() {
    super.initState();
    imageUrl = widget.imageUrl;
    widget.height ??= MyWidgetFirebaseImageUpload.height;
    widget.width ??= MyWidgetFirebaseImageUpload.width;
    widget.margin ??= MyWidgetFirebaseImageUpload.margin;
    widget.padding ??= MyWidgetFirebaseImageUpload.padding;
    widget.decoration ??= MyWidgetFirebaseImageUpload.decoration;
  }

  void _sendDataToParent(String imageUrl) {
    widget.callbackImageUlr(imageUrl);
  }

  Future<String> uploadFile(String path, String? changedFileName) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child(path);
      Uint8List? fileBytes;
      String fileName;
      result = await selectFile();
      File? file;

      if (result != null) {
        fileName = result!.name;
        fileName = changedFileName ?? fileName;
        log('name: $fileName');
        fileBytes = result!.bytes;
        if (!kIsWeb && !Platform.isWindows) file = File(result!.path!);
      } else {
        return "";
      }

      // checking if file exist in the bucket ::: ---------------
      int fileNumber = 0;
      bool fileExists = false;
      String fileNameWithoutExtension = fileName.substring(0, fileName.lastIndexOf('.'));
      String fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1);
      newFileName = fileName;
      do {
        try {
          // Check if file exists
          await ref.child(newFileName!).getMetadata();
          fileExists = true;
          fileNumber++;
          setState(() => newFileName = '$fileNameWithoutExtension-($fileNumber).$fileExtension');
        } catch (e) {
          // File doesn't exist
          fileExists = false;
        }
      } while (fileExists);

      // ------------

      if (!fileExists) {
        // Upload file if it doesn't exist
        myToast('uploading cover image...');
        UploadTask uploadTask = (kIsWeb) ? ref.child(newFileName!).putData(fileBytes!) : ref.child(newFileName!).putFile(file!);
        uploadTask.snapshotEvents.listen((event) {
          debugPrint((event.bytesTransferred.toDouble() / event.totalBytes.toDouble()).toString());
          setState(() => uploadPercentage = (event.bytesTransferred.toDouble() / event.totalBytes.toDouble()));
        }).onError((error) => myToast('Error! uploading image.'));
        TaskSnapshot snapshot = await uploadTask;
        imageUrl = await snapshot.ref.getDownloadURL();
        setState(() {});
        myToast('image uploaded');
        return imageUrl!;
      } else {
        // File already exists, return new filename
        return newFileName!;
      }
    } catch (e) {
      myToast('Error! Uploading Image... $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: widget.width,
        margin: widget.margin,
        padding: widget.padding,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            (imageUrl != null && imageUrl != '')
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(imageUrl ?? 'https://images.pexels.com/photos/16401178/pexels-photo-16401178.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        fit: BoxFit.cover, loadingBuilder: (context, child, loadingProgress) => (loadingProgress == null) ? child : myCircularLoader()),
                  )
                : Container(),
            Positioned.fill(
                child: InkWell(
                    onTap: () async {
                      String imageUrl = await uploadFile(widget.firebaseStoragePath, widget.changeFileNameTo);
                      _sendDataToParent(imageUrl);
                      debugPrint(imageUrl);
                    },
                    child: Container(
                        decoration: widget.decoration,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.file_upload_rounded, size: (widget.height ?? 200) * 0.40, color: Colors.white),
                            if (newFileName != null) MyText(newFileName, textColor: Colors.white, fontWeight: FontWeight.w500, fontFamily: 'RobotoSlab'),
                            if (uploadPercentage != null) myLinearLoader(value: uploadPercentage, showPercentage: true, percentageColor: Colors.white)
                          ],
                        )))),
          ],
        ));
  }
}
