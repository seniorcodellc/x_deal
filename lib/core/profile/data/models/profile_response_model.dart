import 'package:x_deal/config/network/model/response_model.dart';

class ProfileResponseModel extends ObjectResponseModel {
  ProfileResponseModel.fromJson(super.json) : super.fromJson();

  @override
  // TODO: implement getFromJsonFunction
  Function(Map<String, dynamic> data) get getFromJsonFunction =>
      ProfileModel.fromJson;
}

class ProfileModel {
  String? code;
  String? name;
  String? email;
  String? phone;

  double? totalPoints;
  double? pointDelevery;
  double? points;
  double? balance;
  String? companyName;
  ProfileModel({
    this.code,
    this.name,
    this.email,
    this.phone,
    this.totalPoints,
    this.pointDelevery,
    this.points,
    this.companyName,
    this.balance,
  });

  factory ProfileModel.fromJson(dynamic json) => ProfileModel(
    name: json['name'],
    email: json['email'],
    companyName: json['companyName'],
    phone: json['phone'],
    totalPoints: json['totalPoint'],
    pointDelevery: json['pointDelevery'],
    points: json['points'],
    balance: json['balance'],
    code: json['code'],
  );
}
