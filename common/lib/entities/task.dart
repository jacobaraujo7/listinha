import 'package:common/entities/entity.dart';
import 'package:common/value_objects/text_vo.dart';
import 'package:common/value_objects/value_object.dart';

import '../value_objects/uuid_vo.dart';

class Task extends Entity {
  final UuidVO id;
  final TextVO description;
  final bool done;

  Task({
    required this.id,
    required this.description,
    required this.done,
  });

  @override
  Validation validator([Object? _]) {
    return id.validator().flatMap(description.validator);
  }
}
