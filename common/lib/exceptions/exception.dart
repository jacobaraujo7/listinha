abstract class ListinhaException implements Exception {
  final String name;
  final StackTrace? stackTrace;

  ListinhaException(this.name, [this.stackTrace]);
}

class InvalidParams extends ListinhaException {
  InvalidParams(super.name, [super.stackTrace]);
}
