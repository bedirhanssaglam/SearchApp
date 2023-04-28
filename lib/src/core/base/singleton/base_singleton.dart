import '../../components/popup/popups.dart';
import '../../constants/app/app_constants.dart';
import '../../constants/app/color_constants.dart';
import '../functions/base_functions.dart';

mixin BaseSingleton {
  AppConstants get constants => AppConstants.instance;
  ColorConstants get colors => ColorConstants.instance;
  BaseFunctions get functions => BaseFunctions.instance;
  Popups get popups => Popups.instance;
}
