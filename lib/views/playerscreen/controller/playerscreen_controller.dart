import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:random_avatar/random_avatar.dart';

part "playerscreen_controller.g.dart";

class PlayerScreenController = _PlayerScreenControllerBase with _$PlayerScreenController;
  
abstract class _PlayerScreenControllerBase with Store {

  @observable
  double _size = 0;

  @observable
  bool _large = false;

  @observable
  String picture = "";

  @computed
  double get size => _size;

  @computed
  bool get large => _large;

  @computed
  String get svg => picture;

  @action
  void setPicture(String svg) {
    picture = svg;
  }

  @action
  createRandomNewAvatar(){
    picture = RandomAvatarString(
    DateTime.now().toIso8601String(),
    trBackground: false,);
  }

  @action
  void updateSize(){ 
     _large = !large;
    _size = large ? 60 : 0;
   
  }

  ImagePicker imagePicker = ImagePicker();

  @observable
  XFile? _selectedImage;

  @computed
  XFile? get selectedImage => _selectedImage;

  @action
  Future<void> takePhoto() async {
    final XFile? selectedTemporaryImage = await imagePicker.pickImage(source: ImageSource.camera);
    if(selectedTemporaryImage != null){
      _selectedImage = XFile(selectedTemporaryImage.path);
    }
  }

  @action
  Future<void> getImageFromGallery() async {
    final XFile? selectedTemporaryImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if(selectedTemporaryImage != null){
      _selectedImage = XFile(selectedTemporaryImage.path);
    }
  }
}