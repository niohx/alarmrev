import 'package:android_intent/android_intent.dart';

class AlarmFunc {
  static Future<void> invokeAlarmApp(int id) async {
    print('alarm fired! and alarm Id is $id ');
    final AndroidIntent intent = AndroidIntent(
        action: 'android.intent.action.VIEW',
        package: 'com.iseya.alarmrev',
        componentName: 'com.iseya.alarmrev.MainActivity',
        data: id.toString());
    await intent.launch();
  }

  static void canselAlarmApp() {}

  static void clearAllAlarm() {}
}
