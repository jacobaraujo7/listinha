import 'package:result_dart/result_dart.dart';
import 'package:string_validator/string_validator.dart' as string_validator;

import 'text_vo.dart';
import 'value_object.dart';

class URLVO extends TextVO {
  URLVO(super.value);

  @override
  Validation validator([Object? obj]) {
    return super
        .validator() //
        .flatMap(_validator);
  }

  Validation _validator(_) {
    if (!string_validator.isURL(value)) {
      return 'URL não é válido'.toFailure();
    }
    return Success.unit();
  }
}
