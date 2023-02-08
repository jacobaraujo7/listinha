enum SynchronizationStatus { updated, pending }

class Synchronization {
  final SynchronizationStatus status;
  final DateTime lastUpdated;

  Synchronization({
    required this.status,
    required this.lastUpdated,
  });
}
