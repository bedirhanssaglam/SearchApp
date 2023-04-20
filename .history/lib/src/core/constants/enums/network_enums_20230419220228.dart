enum _ServicePath { users }

extension on _ServicePath {
  String get rawValue {
    switch (this) {
      case _ServicePath.users:
        return '/users';
    }
  }
}
