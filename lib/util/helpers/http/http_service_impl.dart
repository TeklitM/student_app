part of util;

class HttpServiceImpl extends HttpService {
  @override
  Future<String?> get(HttpAttribOptions httpAttribOptions) async {
    try {
      /*prepare header*/

      String contentType = 'application/json'; /*default content type*/

      switch (httpAttribOptions.serializationMethod) {
        case BodySerializationMethod.UrlEncoded:
          contentType = 'application/x-www-form-urlencoded';
          break;
        default:
      }
      Map<String, String> header = {
        'Content-type': contentType,
      };
      http.Response? response;
      var url = Uri.parse(httpAttribOptions.baseUrl + httpAttribOptions.path);

      var _client = RetryClient(http.Client(), retries: 2,
          when: (http.BaseResponse response) {
        return HttpStatusWorthRetrying.isWorthyRetry(response.statusCode);
      });

      if (httpAttribOptions.method == HttpMethods.GET) {
        response = await _client
            .get(url, headers: header)
            .timeout(const Duration(seconds: 60));
      }

      if (response?.statusCode == 200) {
        return response?.body;
      }
    } catch (ex, stack) {
      // await logAsync(stack);
      log(stack.toString());
    }

    return null;
  }
  @override
  Future<String?> post(HttpAttribOptions httpAttribOptions) async {
    try {
            var request = http.MultipartRequest(
                'POST',
                Uri.parse(
                    httpAttribOptions.baseUrl + httpAttribOptions.path));
            httpAttribOptions.files?.forEach((key, value) {
              request.files.add(
                http.MultipartFile.fromBytes(
                  'avatar',
                  value,
                  filename: key,
                  contentType: MediaType.parse("image/x-png"),
                ),
              );
            });
            if(httpAttribOptions.fields !=null){
              request.fields.addAll(httpAttribOptions.fields!);
            }


            final response = await request.send();
            var result = await http.Response.fromStream(response);
            if (result.body != "") {
             return result.body;
            }

            return null;
          } catch (ex, stack) {
            print(ex);
            return null;
    }
  }

}
