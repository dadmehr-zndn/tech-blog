import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controllers/article/articles_manage_controller.dart';
import 'package:tech_blog/controllers/file_picker_controller.dart';

FilePickerController filePickerController = Get.put(FilePickerController());
ArticlesManageController articlesManageController =
    Get.put(ArticlesManageController());

Future pickImage() async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);

  filePickerController.file.value = result!.files.first;
}

//TODO: not sure
saveImage() {
  articlesManageController.articleSingleModel.value.image =
      filePickerController.file.value.path;
}
