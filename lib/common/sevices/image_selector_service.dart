import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageSelectorService {
  final ImagePicker picker = ImagePicker();

  Future<File> getPickGalleryImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  Future<File> getPickCameraImage() async {
    final cameraFile = await picker.getImage(source: ImageSource.camera);
    if (cameraFile != null) {
      return File(cameraFile.path);
    } else {
      return null;
    }
  }
}
