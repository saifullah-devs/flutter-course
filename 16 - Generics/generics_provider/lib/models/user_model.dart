abstract class ApiDataModel {
  Map<String, dynamic> toJson();
}

class AppUser implements ApiDataModel {
  int? id;
  String? email;
  String? phone;
  String? password;
  String? accessToken;

  AppUser(this.id, this.email, this.phone, this.password, this.accessToken);

  AppUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    accessToken = json['accessToken'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "phone": phone,
      "password": password,
      "accessToken": accessToken,
    };
  }
}

class Category {
  int? id;
  String? title;
  String? icon;
  String? color;

  Category({this.id, this.title, this.icon, this.color});
}
