import 'package:endless/domain/entity/register_entity.dart';

class RegisterModel extends RegisterEntity{
  RegisterModel({required super.message, required super.status});

  factory RegisterModel.fromJson(Map<String,dynamic> json){
    return RegisterModel(
      message: json['message'],
      status: json['status'],
    );
  }
}