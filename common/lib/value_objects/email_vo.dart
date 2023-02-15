import 'package:result_dart/result_dart.dart';
import 'package:string_validator/string_validator.dart' as string_validator;

import 'text_vo.dart';
import 'value_object.dart';

class EmailVO extends TextVO {
  EmailVO(super.value);

  @override
  Validation validator([Object? obj]) {
    return super
        .validator() //
        .flatMap(_validator);
  }

  Validation _validator(_) {
    if (!string_validator.isEmail(value)) {
      return 'Email não é válido'.toFailure();
    }
    return Success.unit();
  }
}
