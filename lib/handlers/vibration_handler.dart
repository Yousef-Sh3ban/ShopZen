import 'dart:developer';

import 'package:vibration/vibration.dart';

void triggerVibration({int duration = 600}) async {
  if (await Vibration.hasVibrator() ?? false) {
    Vibration.vibrate(duration: duration); // Vibrates for 500ms
  } else {
    log("This device does not support vibration.");
  }
}