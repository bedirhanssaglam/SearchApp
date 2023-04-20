import '../constants/enums/network_enums.dart';

extension ServicePath on ServicePathEnums {
  String get path {
    switch (this) {
      case ServicePathEnums.users:
        return 'users';
    }
  }
}
