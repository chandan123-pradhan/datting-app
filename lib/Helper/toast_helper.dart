import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  void showErrorMsg({required context, required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ThemeConfiguration.errorColor,
        textColor: ThemeConfiguration.whiteColor,
        fontSize: 16.0);
  }

  void showMsg({required context, required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ThemeConfiguration.successColor,
        textColor: ThemeConfiguration.whiteColor,
        fontSize: 16.0);
  }
}
