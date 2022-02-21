import 'package:get/get.dart';


class Context extends GetxController {
  String text1 = "This is text 1";


  void updateText() {
    text1 = "This is text 2";
  }
}