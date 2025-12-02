class EditProfileRequestModel {
  String? email;
  String? phone;
  String? name;
  String? companyName;
  String? language;


  EditProfileRequestModel({
    this.email,
    this.phone,
    this.name,
    this.companyName,
    this.language
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['email'] = email;
    map['name'] = name;
    map['companyName'] = companyName;
    map['language'] = language;
    return map;
  }
}

