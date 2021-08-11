import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntentProvider extends ChangeNotifier {
  IntentProvider() : super() {
    _initialize();
  }
  bool _isFired = false;
  bool get isFired => _isFired;

  int get fireId => _fireId;
  late int _fireId;
  late StreamSubscription _intentDateStreamSubscription;
  void _initialize() {
    int incomingId = -1;
    _intentDateStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen((String value) {
      try {
        incomingId = int.parse(value);
        if (incomingId == 0) {
          _fireId = incomingId;
          notifyListeners();
        }
      } catch (e) {
        print(e);
      }
      handler(incomingId: incomingId).then((value) {
        if (value) {
          _isFired = true;
          _fireId = incomingId;
          notifyListeners();
        }
      });
    });

    ReceiveSharingIntent.getInitialText().then((String? value) {
      if (value != null) {
        print('from wakeup');
        try {
          incomingId = int.parse(value);
          if (incomingId == 0) {
            _fireId = incomingId;
            notifyListeners();
          }
        } catch (e) {
          print(e);
        }
        handler(incomingId: incomingId).then((value) {
          if (value) {
            _isFired = true;
            _fireId = incomingId;
            notifyListeners();
          }
        });
      }
    });
  }

  Future<bool> handler({required int incomingId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<int> activeIds = [];

    if (prefs.containsKey('ActiveAlarms')) {
      activeIds = prefs
          .getStringList('ActiveAlarms')!
          .map((element) => int.parse(element))
          .toList();
    }
    print(activeIds);

    if (activeIds.contains(incomingId)) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> turnOff(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<int> activeIds = [];
    if (prefs.containsKey('ActiveAlarms')) {
      print('turn off..');
      activeIds = prefs
          .getStringList('ActiveAlarms')!
          .map((element) => int.parse(element))
          .toList();
      activeIds.remove(id);
      await prefs.setStringList(
          'ActiveAlarms', activeIds.map((id) => id.toString()).toList());
      _isFired = false;
      notifyListeners();
    } else {
      print('not found');
      _isFired = false;
      notifyListeners();
    }
  }
}
