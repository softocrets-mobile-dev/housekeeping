class AuthLoginResponseDataModel {
  String? token;
  String? hotelName;
  String? tenantId;
  int? expiresIn;
  int? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? role;

  AuthLoginResponseDataModel(
      {this.token,
      this.hotelName,
      this.tenantId,
      this.expiresIn,
      this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.role});

  AuthLoginResponseDataModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    hotelName = json['hotelName'];
    tenantId = json['tenantId'];
    expiresIn = json['expiresIn'];
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['hotelName'] = hotelName;
    data['tenantId'] = tenantId;
    data['expiresIn'] = expiresIn;
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['role'] = role;
    return data;
  }
}
