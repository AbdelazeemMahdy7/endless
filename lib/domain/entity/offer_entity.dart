class OfferEntity{

  int id;
  String name;
  int? companyId;
  int? placeId;
  int? eventId;
  int price;
  String date;
  String details;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? companyName;
  String? placeName;
  String? eventName;

  OfferEntity({
    required this.id,
    required this.name,
    this.companyId,
    this.placeId,
    this.eventId,
    required this.price,
    required this.date,
    required this.details,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.companyName,
    this.eventName,
    this.placeName,
  });
}