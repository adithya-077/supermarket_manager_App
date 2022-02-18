import 'package:image_picker/image_picker.dart';

pickImage(ImageSource imgSource) async {
  final ImagePicker _imgpicker = ImagePicker();

  XFile? img = await _imgpicker.pickImage(source: imgSource);

  if (img != null) {
    return img.readAsBytes();
  }
  //print('no image was selected');
}
