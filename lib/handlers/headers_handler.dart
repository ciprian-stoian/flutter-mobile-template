class HeadersHandler {
  static Map<String, String> createBasicHeader() {
    return {
      "Content-type": "application/json",
    };
  }

  static Map<String, String> createBasicAuthHeader(String baseAuth) {
    return {
      "Content-type": "application/json",
      "Authorization": "Basic " + baseAuth,
    };
  }

  static Map<String, String> createBearerAuthHeader(String token) {
    return {
      "Content-type": "application/json",
      "Authorization": "Bearer " + token,
    };
  }
}
