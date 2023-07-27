part of util;

abstract class HttpService {
  Future<String?> post(HttpAttribOptions httpAttribOptions);
  Future<String?> get(HttpAttribOptions httpAttribOptions);
}
