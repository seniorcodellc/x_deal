/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

class ChangePasswordRequestModel {
    ChangePasswordRequestModel({
        required this.password,
        required this.newPassword,
        required this.confirmPassword,
    });

    String password;
    String newPassword;
    String confirmPassword;

    factory ChangePasswordRequestModel.fromJson(Map<dynamic, dynamic> json) => ChangePasswordRequestModel(
        password: json["password"],
        newPassword: json["newPassword"],
        confirmPassword: json["confirmPassword"],
    );

    Map<dynamic, dynamic> toJson() => {
        "password": password,
        "newPassword": newPassword,
        "confirmPassword": confirmPassword,
    };
}
