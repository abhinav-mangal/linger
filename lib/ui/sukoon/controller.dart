import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AudioController extends GetxController {
  Duration? duration;
  Duration position = const Duration();

  void updateDuration(Duration? newDuration) {
    duration = newDuration;
    update();
  }
  void updatePossition(Duration? newPossition) {
    position = newPossition!;
    update();
  }
}
