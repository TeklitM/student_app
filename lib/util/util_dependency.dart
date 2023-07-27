part of util;

class UtilDependency {
  static var httpService = Get.find<HttpService>();
  static Future init() async {
    Get.put<HttpService>(HttpServiceImpl());

  }
}
