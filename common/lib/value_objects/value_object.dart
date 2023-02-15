import 'package:result_dart/result_dart.dart';

typedef Validation = Result<Unit, String>;

abstract class ValueObject<T> {
  final T value;
  const ValueObject(this.value);

  Validation validator([Object? obj]);
}
