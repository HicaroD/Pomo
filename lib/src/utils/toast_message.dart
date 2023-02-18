import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  static void show(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
