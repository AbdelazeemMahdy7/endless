class OfferEntity{

  int id;
  String name;
  int? companyId;
  int? placeId;
  int? eventId;
  String price;
  String date;
  String details;
  String placeImage;
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
    required this.placeImage,
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