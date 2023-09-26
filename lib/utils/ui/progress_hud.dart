import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

class ProgressHud {
  static ProgressHud shared = ProgressHud(); // instance
  BuildContext? context; // context

  Widget createLoadingView({Color? color, double size = 50.0}) {
    return Stack(
      children: [getCircularIndicator(color: color, size: size)],
    );
  }

  Widget getCircularIndicator({Color? color, double size = 50.0}) {
    return Center(
      child: SpinKitFadingCircle(color: color ?? Colors.blue, size: size),
    );
  }

  void startLoading(BuildContext? context) {
    if (context == null) {
      return;
    }
    ProgressHud.shared.context = context;

    showDialog(
        context: context,
        builder: (context) {
          return createLoadingView();
        },
        barrierDismissible: false);
  }

  void stopLoading() {
    try {
      if (ProgressHud.shared.context != null &&
          Navigator.of(ProgressHud.shared.context!).canPop()) {
        Navigator.of(ProgressHud.shared.context!, rootNavigator: true).pop();
        ProgressHud.shared.context = null;
      }
    } catch (_) {}
  }
}
