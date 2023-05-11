import 'package:file_picker/file_picker.dart';

import '../widgets/widget_default/__toast.dart';

Future<PlatformFile?> selectFile({FileType fileType = FileType.any, bool multipleFiles = false}) async {
  try {
    final results = await FilePicker.platform.pickFiles(allowMultiple: multipleFiles, type: fileType);
    if (results != null) return results.files.first;
  } catch (e) {
    myToast('something went wrong!');
  }
  return null;
}
