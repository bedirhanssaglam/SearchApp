enum ServicePath { users }

extension on ServicePath {
  String get rawValue {
    switch (this) {
      case _ServicePath.users:
        return '/users';
    }
  }
}
