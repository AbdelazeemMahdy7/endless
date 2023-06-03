import 'package:endless/domain/entity/log_out_entity.dart';

class LogOutModel extends LogOutEntity{
  LogOutModel({required super.message, required super.status});

  factory LogOutModel.fromJson(Map<String,dynamic> json){
    return LogOutModel(
      message: json['msg'],
      status: json['status'],
    );
  }
}