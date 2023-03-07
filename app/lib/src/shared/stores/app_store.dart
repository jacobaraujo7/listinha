import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

part 'app_store.g.dart';

@RxStore()
abstract class _AppStore {
  @RxValue()
  ThemeMode themeMode = ThemeMode.system;
  @RxValue()
  DateTime? syncDate;
}
