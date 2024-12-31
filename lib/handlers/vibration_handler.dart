import 'dart:developer';

import 'package:vibration/vibration.dart';

void triggerVibration({int duration = 600}) async {
  if (await Vibration.hasVibrator() ?? false) {
    Vibration.vibrate(duration: duration);
  } else {
    log("This device does not support vibration.");
  }
}