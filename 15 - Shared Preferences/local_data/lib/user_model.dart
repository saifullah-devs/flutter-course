class AppUser {
  int? id;
  String? email;
  String? phone;
  String? password;
  String? accessToken;

  AppUser({this.id, this.email, this.phone, this.password, this.accessToken});

  AppUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['accessToken'] = accessToken;
    return data;
  }
}
