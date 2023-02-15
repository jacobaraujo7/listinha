import 'package:result_dart/result_dart.dart';

import 'value_object.dart';

class TextVO extends ValueObject<String> {
  const TextVO(super.value);

  @override
  Validation validator([Object? obj]) {
    if (value.isEmpty) {
      return '$runtimeType não é válido'.toFailure();
    }
    return Success(unit);
  }
}
