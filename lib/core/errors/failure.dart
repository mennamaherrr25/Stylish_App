class ErrorModel {
  final String error;
  final int? status;

  ErrorModel({
    required this.error,
    this.status,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {

    final message = jsonData["message"];

    return ErrorModel(
      error: message is List
          ? message.join(', ')
          : message.toString(),

      status: jsonData["statusCode"],
    );
  }
}
