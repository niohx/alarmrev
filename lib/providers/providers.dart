import 'package:alarmrev/providers/alarm_provider.dart';

import 'intent_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/alarm.dart';

final intentProvider = ChangeNotifierProvider((ref) => IntentProvider());

final alarmProvider = StateNotifierProvider<AlarmProvider, List<Alarm>>((ref) {
  final _intent = ref.watch(intentProvider);
  return AlarmProvider();
});
