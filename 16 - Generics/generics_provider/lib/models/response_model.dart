import 'package:generics_provider/models/user_model.dart';

class ApiResponse<T extends ApiDataModel> {
  String? message;
  int? statusCode;
  T? data;

  ApiResponse({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  ApiResponse.fromJson(Map<String, dynamic> json, T appUserData) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = appUserData;
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "statusCode": statusCode,
      "data": data?.toJson(),
    };
  }
}
