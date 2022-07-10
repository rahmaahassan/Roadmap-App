class UserModel {
  String? name;
  String? email;
  String? uId;
  String? image;
  bool? isEmailVerified;

  UserModel({
    this.email,
    this.name,
    this.uId,
    this.image,
    this.isEmailVerified,
  });

  UserModel.fromJson(Map<String, dynamic> json)
  {
    email = json['email'];
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'name':name,
      'email':email,
      'uId':uId,
      'image':image,
      'isEmailVerified':isEmailVerified,
    };
  }
}