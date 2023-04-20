enum ServicePath { users }

extension on ServicePath {
  String get path {
    switch (this) {
      case ServicePath.users:
        return '/users';
    }
  }
}
