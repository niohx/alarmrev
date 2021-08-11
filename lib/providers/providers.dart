import 'package:alarmrev/providers/alarm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/alarm.dart';
import 'intent_provider.dart';

final intentProvider = ChangeNotifierProvider((ref) => IntentProvider());

final alarmProvider = StateNotifierProvider<AlarmProvider, List<Alarm>>((ref) {
  final _intent = ref.watch(intentProvider);
  // final _fireId = _intent.fireId;
  return AlarmProvider(intent: _intent);
});

//書くとこないからここに書いておく
class MyAppObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
  }
}
