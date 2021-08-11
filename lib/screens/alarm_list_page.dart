import 'package:alarmrev/model/alarm.dart';
import 'package:alarmrev/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AlarmListPage extends HookWidget {
  const AlarmListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _showResetTime(context: context);
            },
          )
        ],
      ),
      body: _AlarmListPageBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _selectTimeAndSetAlarm(context: context);
        },
        tooltip: 'Create New Alarm',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showResetTime({required BuildContext context}) async {
    final TimeOfDay? _selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    final DateTime _now = DateTime.now();
    DateTime? _selectedDateTime;
    if (_selectedTime != null) {
      _selectedDateTime = DateTime(_now.year, _now.month, _now.day,
          _selectedTime.hour, _selectedTime.minute);
      if (_now.isAfter(_selectedDateTime)) {
        _selectedDateTime = _selectedDateTime.add(const Duration(days: 1));
      }
      await context
          .read(alarmProvider.notifier)
          .resetAllAlarmAtSpecificTime(resetTime: _selectedDateTime);
    }
  }

  Future<void> _selectTimeAndSetAlarm({required BuildContext context}) async {
    final TimeOfDay? _selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    final DateTime _now = DateTime.now();
    DateTime? _selectedDateTime;
    if (_selectedTime != null) {
      _selectedDateTime = DateTime(_now.year, _now.month, _now.day,
          _selectedTime.hour, _selectedTime.minute);
      if (_now.isAfter(_selectedDateTime)) {
        _selectedDateTime = _selectedDateTime.add(const Duration(days: 1));
      }
      final Alarm _alarm = Alarm(
          isOn: true,
          uid: 'nouid',
          id: await context.read(alarmProvider.notifier).retreiveAlarmId(),
          wakeUpTime: _selectedDateTime,
          createdAt: DateTime.now());
      await context.read(alarmProvider.notifier).createAlarm(_alarm);
    }
  }
}

// ignore: must_be_immutable
class _AlarmListPageBody extends HookWidget {
  _AlarmListPageBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _alarms = useProvider(alarmProvider);
    return ListView.builder(
        itemCount: _alarms.length,
        itemBuilder: (context, index) {
          return Card(
            child: SwitchListTile(
              controlAffinity: ListTileControlAffinity.leading,
              secondary: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  _showRemoveDialog(context: context, alarm: _alarms[index]);
                },
              ),
              value: _alarms[index].isOn,
              title: Text(t.format(_alarms[index].wakeUpTime)),
              onChanged: (value) {
                context
                    .read(alarmProvider.notifier)
                    .toggleAlarm(target: _alarms[index], status: value);
              },
            ),
          );
        });
  }

  void _showRemoveDialog(
      {required BuildContext context, required Alarm alarm}) {
    showDialog<dynamic>(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('remove?'),
            content: const Text('remove?'),
            actions: [
              TextButton(
                  onPressed: () {
                    context.read(alarmProvider.notifier).deleteAlarm(alarm);
                    Navigator.pop(context);
                  },
                  child: const Text('delete')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('cansel'))
            ],
          );
        });
  }

  DateFormat t = DateFormat('HH:mm');
}
