import 'package:alarmrev/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/providers.dart';

class AlarmRingingPage extends HookWidget {
  const AlarmRingingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _intent = useProvider(intentProvider);
    return Scaffold(
      body: Row(
        children: [
          Text('alarm fire! and alarm id is ${_intent.fireId}'),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('turnOff Alarm'))
        ],
      ),
    );
  }
}
