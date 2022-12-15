import 'package:logger/logger.dart';

class AppLogger {
  static final Logger appLogger = Logger();

  static e(String e) {
    appLogger.e(e);
  }

  static d(String d) {
    appLogger.d(d);
  }

  static i(String i) {
    appLogger.i(i);
  }

  static printLongString(String text) {
    final RegExp pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern
        .allMatches(text)
        .forEach((RegExpMatch match) => print(match.group(0) ?? ''));
  }
}
