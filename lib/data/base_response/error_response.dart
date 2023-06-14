class ErrorResponse {

  String? message;

  ErrorResponse({ this.message});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    message = json['error']['message'];
  }

}
