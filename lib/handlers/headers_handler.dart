class HeadersHandler {
  static Map<String, String> createBasicHeader() {
    return {
      "Content-type": "application/json",
    };
  }

  static Map<String, String> createBasicAuthHeader(String baseAuth) {
    return {
      "Authorization": "Basic " + baseAuth,
    };
  }

  static Map<String, String> createBearerAuthHeader(String token) {
    return {
      "Authorization": "Bearer " + token,
    };
  }
}
