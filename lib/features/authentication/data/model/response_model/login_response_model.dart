import 'package:x_deal/config/network/model/response_model.dart';

class UserResponseModel extends ObjectResponseModel {
  UserResponseModel.fromJson(super.json) : super.fromJson();

  @override
  // TODO: implement getFromJsonFunction
  Function(Map<String, dynamic> data) get getFromJsonFunction =>
      UserModel.fromJson;
}

class UserModel {
  String? name;
  String? email;
  String? token;
  bool? isMerchant;

  UserModel({this.name, this.email, this.token, this.isMerchant});

  factory UserModel.fromJson(dynamic json) => UserModel(
    name: json['name'],
    email: json['email'],
    token: json['token'],
    isMerchant: json['isMerchant'],
  );
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'token': token,
    'isMerchant': isMerchant,
  };
}
