class AppConstants {
  static AppConstants? _instance;
  static AppConstants get instance {
    _instance ??= AppConstants._init();
    return _instance!;
  }

  AppConstants._init();

  String appName = "Search App";
  String baseUrl = "https://jsonplaceholder.typicode.com/";
  String baseUrlForImage = "https://picsum.photos/id/";
  String formHintText = "Aramak için kelime giriniz";
  String serviceError = "Something went wrong!";
  String noFoundUser = "Kullanıcı Bulunamadı!";
}
