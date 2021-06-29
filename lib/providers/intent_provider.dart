import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class IntentProvider extends ChangeNotifier {
  IntentProvider() : super() {
    _initialize();
  }
  bool _isFired = false;
  bool get isFired => _isFired;

  int get fireId => _fireId;
  int _fireId = 0;
  late StreamSubscription _intentDateStreamSubscription;
  void _initialize() {
    ReceiveSharingIntent.getInitialText().then((String? value) {});
    _intentDateStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen((String value) {});
  }
}
