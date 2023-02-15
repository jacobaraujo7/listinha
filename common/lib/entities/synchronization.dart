import 'package:common/entities/entity.dart';
import 'package:common/value_objects/value_object.dart';
import 'package:result_dart/result_dart.dart';

enum SynchronizationStatus { updated, pending }

class Synchronization extends Entity {
  final SynchronizationStatus status;
  final DateTime lastUpdated;

  Synchronization({
    required this.status,
    required this.lastUpdated,
  });

  @override
  Validation validator([Object? _]) {
    return Success.unit();
  }
}
