import '../models/image_model.dart';
import '../models/user_model.dart';

abstract class IUsersService {
  Future<List<UserModel>>? fetchAllUsers();
  Future<ImageModel> fetchUsersImage({required String id});
}
