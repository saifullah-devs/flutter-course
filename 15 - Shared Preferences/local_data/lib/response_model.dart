import 'package:local_data/user_model.dart' show AppUser;

class ApiResponse {
  String? message;
  int? statusCode;
  AppUser? data;

  ApiResponse({this.message, this.statusCode, this.data});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? AppUser.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
