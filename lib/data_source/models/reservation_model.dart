import 'package:endless/domain/entity/reservation_entity.dart';

class ReservationModel extends ReservationEntity{
  ReservationModel({required super.message, required super.status});
  
  factory ReservationModel.fromJson(Map<String,dynamic> json){
    return ReservationModel(message: json['message'], status: json['status']);
  }
}