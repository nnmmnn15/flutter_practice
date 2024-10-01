import 'package:getx_must_eat_place_app/vm/gps_handler.dart';
import 'package:image_picker/image_picker.dart';

class ImageHandler extends GpsHandler {
  XFile? imageFile;
  final ImagePicker picker = ImagePicker();

  getImageFromGallery(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      imageFile = XFile(pickedFile.path);
      update();
    }
  }
}
