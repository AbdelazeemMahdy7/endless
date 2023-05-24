import 'package:endless/domain/entity/login_entity.dart';

class LogInModel extends LogInEntity {
  LogInModel({
    required super.token,
    required super.msg,
    required super.status,
    required super.success,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) {
    return LogInModel(
      token: json['token'],
      msg: json['msg'],
      status: json['status'],
      success: json['success'],
    );
  }
}
