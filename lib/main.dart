import 'package:alarmrev/providers/providers.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './screens/alarm_list_page.dart';
import './screens/alarm_ringing_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AlarmMainPage(),
    );
  }
}

class AlarmMainPage extends HookWidget {
  const AlarmMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myObserver = useMemoized(() => MyAppObserver());
    useEffect(() {
      WidgetsBinding.instance!.addObserver(myObserver);
      return () => WidgetsBinding.instance!.removeObserver(myObserver);
    });
    final _intent = useProvider(intentProvider);
    return ProviderListener(
        provider: intentProvider,
        onChange: (context, intent) async {
          if (_intent.isFired) {
            await Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    builder: (context) => const AlarmRingingPage()));
            await context.read(intentProvider.notifier).turnOff(_intent.fireId);
          }
        },
        child: const AlarmListPage());
  }
}
