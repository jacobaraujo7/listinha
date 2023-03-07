// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// RxGenerator
// **************************************************************************

class AppStore = _AppStore with _AppStoreMixin;

mixin _AppStoreMixin on _AppStore {
  ///
  /// GENERATED themeMode(ThemeMode)
  ///

  late final _themeModeRx = RxNotifier<ThemeMode>(super.themeMode);
  ValueListenable<ThemeMode> get themeModeListenable => _themeModeRx;

  @override
  set themeMode(ThemeMode _themeModeValue) =>
      _themeModeRx.value = _themeModeValue;
  @override
  ThemeMode get themeMode => _themeModeRx.value;

  ///
  /// GENERATED syncDate(DateTime?)
  ///

  late final _syncDateRx = RxNotifier<DateTime?>(super.syncDate);
  ValueListenable<DateTime?> get syncDateListenable => _syncDateRx;

  @override
  set syncDate(DateTime? _syncDateValue) => _syncDateRx.value = _syncDateValue;
  @override
  DateTime? get syncDate => _syncDateRx.value;
}
