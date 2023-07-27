part of util;

class HttpStatusWorthRetrying {
  static bool isWorthyRetry(int statusCode) {
    if (statusCode == HttpStatus.requestTimeout ||
        statusCode == HttpStatus.internalServerError ||
        statusCode == HttpStatus.badGateway ||
        statusCode == HttpStatus.serviceUnavailable ||
        statusCode == HttpStatus.gatewayTimeout) return true;
    return false;
  }
}
