String changeFileName(String fileName, String newName) {
  // String fileNameWithoutExtension = fileName.substring(0, fileName.lastIndexOf('.'));
  String fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1);
  return '$newName.$fileExtension';
}
