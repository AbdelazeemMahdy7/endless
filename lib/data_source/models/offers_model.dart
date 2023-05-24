import 'package:endless/domain/entity/offer_entity.dart';

class OfferModel extends OfferEntity {
  OfferModel({
    required super.id,
    required super.name,
    super.companyId,
    super.placeId,
    super.eventId,
    required super.price,
    required super.date,
    required super.details,
    super.updatedAt,
    super.createdAt,
    super.deletedAt,
    super.companyName,
    super.eventName,
    super.placeName,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      name: json['name'],
      id: json['id'],
      price: json['price'],
      companyId: json['company_id'],
      date: json['date'],
      details: json['details'],
      eventId: json['event_id'],
      placeId: json['place_id'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      companyName: json['company_name'],
      eventName: json['event_name'],
      placeName: json['place_name'],
    );
  }
}
