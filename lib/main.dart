import 'package:alarmrev/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import './screens/alarm_list_page.dart';
import './screens/alarm_ringing_page.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(ProviderScope(child: (MyApp())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlarmMainPage(),
    );
  }
}

class AlarmMainPage extends HookWidget {
  const AlarmMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _intent = useProvider(intentProvider);
    return ProviderListener(
        provider: intentProvider,
        onChange: (context, intent) {
          if (_intent.isFired) {
            Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    builder: (context) => AlarmRingingPage()));
          }
        },
        child: const AlarmListPage());
  }
}
