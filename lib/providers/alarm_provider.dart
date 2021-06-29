import 'dart:convert';

import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:alarmrev/alarm_functions.dart';
import '../model/alarm.dart';

var _uuid = const Uuid();

abstract class AlarmProviderModel {
  Future<void> createAlarm(Alarm alarm);
  Future<void> toggleAlarm(Alarm alarm);
  Future<void> deleteAlarm(Alarm alarm);
  Future<void> resetAlarm(Alarm alarm);
  Future<int> retreiveAlarmId();
}

class AlarmProvider extends StateNotifier<List<Alarm>>
    implements AlarmProviderModel {
  AlarmProvider() : super([]) {
    _initialize();
  }
  Future<void> _initialize() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.clear();
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
    if (prefs.containsKey('ActiveAlarms')) {
      List<int?> ids = prefs
          .getStringList('ActiveAlarms')!
          .map((element) => int.parse(element))
          .toList();
      ids = [...ids, id];
      await prefs.setStringList(
          'ActiveAlarms', ids.map((element) => element.toString()).toList());
    }
  }

  static Future<void> removeActiveAlarmIds(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('ActiveAlarms')) {
      List<int?> ids = prefs
          .getStringList('ActiveAlarms')!
          .map((element) => int.parse(element))
          .toList();
      ids.remove(id);
      await prefs.setStringList(
          'ActiveAlarms', ids.map((element) => element.toString()).toList());
    }
  }

  @override
  Future<void> createAlarm(Alarm alarm) async {
    print('creating alarms...');
    final String _uid = _uuid.v4();

    alarm = alarm.copyWith(uid: _uid);

    state = [...state, alarm];
    await AndroidAlarmManager.oneShotAt(
        alarm.wakeUpTime, alarm.id, AlarmFunc.invokeAlarmApp);
    await saveState(state);
    await saveActiveAlarmIds(alarm.id);
    print(state);
  }

  @override
  Future<void> toggleAlarm(Alarm target) async {
    print(state);
    state = state.map((alarm) {
      if (target.uid == alarm.uid) {
        return target.copyWith(isOn: !target.isOn);
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
    await saveState(state);
  }

  @override
  Future<void> resetAlarm(Alarm alarm) async {}
  @override
  Future<int> retreiveAlarmId() async {
    int maxNum;
    SharedPreferences _prefs = await SharedPreferences.getInstance();
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
