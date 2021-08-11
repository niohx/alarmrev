import 'dart:convert';

import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:alarmrev/alarm_functions.dart';
import '../model/alarm.dart';
import 'intent_provider.dart';

var _uuid = const Uuid();

abstract class AlarmProviderModel {
  Future<void> createAlarm(Alarm alarm);
  Future<void> toggleAlarm({required Alarm target, required bool status});
  Future<void> deleteAlarm(Alarm alarm);
  Future<void> resetAllAlarmAtSpecificTime({required DateTime resetTime});
  Future<int> retreiveAlarmId();
}

class AlarmProvider extends StateNotifier<List<Alarm>>
    implements AlarmProviderModel {
  AlarmProvider({required this.intent}) : super([]) {
    _initialize();
  }
  IntentProvider intent;
  Future<void> _initialize() async {
    if (intent.fireId == 0) {
      await clearState();
    }
    state = await loadState();
  }

  static Future<List<Alarm>> loadState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('state')) {
      final List<String> alarmList = prefs.getStringList('state')!;
      print(alarmList);
      return alarmList
          .map((alarm) =>
              Alarm.fromJson(json.decode(alarm) as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  Future<void> clearState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('ActiveAlarms')) {
      List<int> activeIds = [];
      activeIds = prefs
          .getStringList('ActiveAlarms')!
          .map((element) => int.parse(element))
          .toList();
      activeIds.forEach((activeId) async {
        await AndroidAlarmManager.cancel(activeId);
      });
    }
    await prefs.clear();
    state = [];
  }

  static Future<void> saveState(List<Alarm> state) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'state', state.map((alarm) => json.encode(alarm.toJson())).toList());
  }

  static Future<List<int?>> retreiveActiveAlarmIds() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('ActiveAlarms')) {
      return prefs
          .getStringList('ActiveAlarms')!
          .map((element) => int.parse(element))
          .toList();
    } else {
      return [null];
    }
  }

  static Future<void> saveActiveAlarmIds(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('save active id called');
    List<int> ids = [];
    if (prefs.containsKey('ActiveAlarms')) {
      final List<int> ids = prefs
          .getStringList('ActiveAlarms')!
          .map((element) => int.parse(element))
          .toList();
    }
    ids = [...ids, id];
    print(ids);
    await prefs.setStringList(
        'ActiveAlarms', ids.map((element) => element.toString()).toList());
  }

  static Future<void> removeActiveAlarmIds(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //print('remove action called');
    List<int?> ids = [];
    if (prefs.containsKey('ActiveAlarms')) {
      ids = prefs
          .getStringList('ActiveAlarms')!
          .map((element) => int.parse(element))
          .toList();
    }
    ids.remove(id);
    print(ids);
    await prefs.setStringList(
        'ActiveAlarms', ids.map((element) => element.toString()).toList());
  }

  // static Future<void> resetAlarmFromBackGround() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<int> _activeAlarms = [];
  //   if (prefs.containsKey('ActiveAlarms')) {
  //     _activeAlarms = prefs
  //         .getStringList('ActiveAlarms')!
  //         .map((element) => int.parse(element))
  //         .toList();

  //     _activeAlarms.forEach((int id) => AndroidAlarmManager.cancel(id));
  //     await prefs.setStringList('ActiveAlarms', []);
  //   } else {
  //     print('no alarms found');
  //   }
  // }

  // Future<void> resetAlarmFromForeGround() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<int> _activeAlarms = [];
  //   if (prefs.containsKey('ActiveAlarms')) {
  //     _activeAlarms = prefs
  //         .getStringList('ActiveAlarms')!
  //         .map((element) => int.parse(element))
  //         .toList();
  //     _activeAlarms.forEach((int id) => AndroidAlarmManager.cancel(id));
  //     await prefs.setStringList('ActiveAlarms', []);
  //     state = [];
  //   } else {
  //     print('no alarms found');
  //   }
  // }
  @override
  Future<void> resetAllAlarmAtSpecificTime(
      {required DateTime resetTime}) async {
    if (resetTime.isBefore(DateTime.now())) {
      resetTime = resetTime.add(const Duration(days: 1));
    }
    await AndroidAlarmManager.periodic(
        const Duration(days: 1), 0, AlarmFunc.invokeAlarmApp,
        startAt: resetTime);
  }

  @override
  Future<void> createAlarm(Alarm alarm) async {
    print('creating alarms...');
    final String _uid = _uuid.v4();

    // ignore: parameter_assignments
    alarm = alarm.copyWith(uid: _uid);

    state = [...state, alarm];
    await AndroidAlarmManager.oneShotAt(
        alarm.wakeUpTime, alarm.id, AlarmFunc.invokeAlarmApp);
    await saveState(state);
    await saveActiveAlarmIds(alarm.id);
    print(state);
  }

  @override
  Future<void> toggleAlarm(
      {required Alarm target, required bool status}) async {
    print(status);
    state = state.map((alarm) {
      if (target.uid == alarm.uid) {
        return target.copyWith(isOn: status);
      } else {
        return alarm;
      }
    }).toList();
    if (target.isOn == true) {
      print('alarm is set again and id is ${target.id}');
      await AndroidAlarmManager.oneShotAt(
          target.wakeUpTime, target.id, AlarmFunc.invokeAlarmApp);
      await saveActiveAlarmIds(target.id);
    } else {
      await AndroidAlarmManager.cancel(target.id);
      print('alarm is canseld id is ${target.id}');
      await removeActiveAlarmIds(target.id);
    }
    await saveState(state);
  }

  @override
  Future<void> deleteAlarm(Alarm target) async {
    state = state.where((element) => element.uid != target.uid).toList();
    await AndroidAlarmManager.cancel(target.id);
    await saveState(state);
  }

  @override
  Future<int> retreiveAlarmId() async {
    int maxNum;
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('maxNum')) {
      maxNum = _prefs.getInt('maxNum')! + 1;
      await _prefs.setInt('maxNum', maxNum);
      return maxNum;
    } else {
      await _prefs.setInt('maxNum', 1);
      return 1;
    }
  }
}
