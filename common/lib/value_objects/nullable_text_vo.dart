import 'package:common/value_objects/value_object.dart';
import 'package:result_dart/result_dart.dart';

class NullableTextVO extends ValueObject<String?> {
  NullableTextVO([super.value]);

  @override
  Validation validator([Object? obj]) {
    final value = this.value;

    if (value == null) {
      return Success.unit();
    }

    if (value.isEmpty) {
      return 'Texto não é válido'.toFailure();
    }
    return Success.unit();
  }
}
