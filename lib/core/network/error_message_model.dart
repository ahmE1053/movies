class ErrorMessageModel {
  final int statusCode;
  final bool success;
  final String statusMessage;

  ErrorMessageModel({
    required this.statusCode,
    required this.success,
    required this.statusMessage,
  });
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json['status_code'],
      success: json['success'],
      statusMessage: json['status_message'],
    );
  }
}
