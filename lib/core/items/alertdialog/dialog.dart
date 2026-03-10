import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';

class ShowDialog {
  String? title;
  String? desc;
  void Function()? btnOkOnPress;
  void Function()? btnCancelOnPress;
  DialogType? dialogType;
  ShowDialog({
    this.title,
    this.desc,
    this.btnOkOnPress,
    this.btnCancelOnPress,
    this.dialogType,
  });
  void showdialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: dialogType ?? DialogType.info,
      animType: AnimType.leftSlide,
      title: title,
      desc: desc,
      btnCancelOnPress: btnCancelOnPress,
      btnOkOnPress: btnOkOnPress,
    ).show();
  }
}
