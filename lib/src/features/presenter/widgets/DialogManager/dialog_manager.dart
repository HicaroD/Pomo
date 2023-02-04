import 'package:flutter/material.dart';

import 'custom_dialog.dart';
import 'dialog_type.dart';

class DialogManager {
  static void showPomoDialog(BuildContext context, DialogType dialogType) {
    switch (dialogType) {
      case DialogType.noInternetConnection:
        showDialog(
          context: context,
          builder: (_) => const CustomDialog(
            icon: Icon(Icons.signal_wifi_connected_no_internet_4),
            text: "Sem conexão com a Internet",
          ),
        );
        break;
      case DialogType.invalidCredentials:
        break;
    }
  }
}
