import 'package:flutter/material.dart' show AppLifecycleState;
import 'package:riverpod/riverpod.dart';

final appStateProvider = StateProvider<AppLifecycleState>((ref) {
  return AppLifecycleState.resumed ;
});