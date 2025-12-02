class TechSignUpModel {
  String? email;
  String? password;
  String? phone;
  String? name;
  String? confirmPassword;
  int? merchantId;
  String? answer;
  TechSignUpModel({
    this.email,
    this.password,
    this.phone,
    this.name,
    this.answer,
    this.confirmPassword,
    this.merchantId,
  });
  toJson() {
    final map = <String, dynamic>{};
    map["email"] = email;
    map["password"] = password;
    map["phone"] = phone;
    map["name"] = name;
    map["answer"] = answer;
    map["confirmPassword"] = confirmPassword;
    map["merchantid"] = merchantId;
    return map;
  }
}
