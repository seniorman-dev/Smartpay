

class SecretResponse{
  SecretResponse({
    required this.message,
    required this.data
  });
  final String message;
  final Map<String, dynamic> data;


  factory SecretResponse.fromJson(Map<String, dynamic> json) {
    return SecretResponse(
      message: json['message'] ?? 'nil',
      data: json['data'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': message
    };
  }
}
