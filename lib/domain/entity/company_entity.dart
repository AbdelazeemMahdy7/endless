class CompanyEntity {
  int? id;
  String name;
  String media;
  String phone;
  String email;
  String site;
  int locationId;
  int rate;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  CompanyEntity({
    this.id,
    required this.name,
    required this.media,
    required this.phone,
    required this.email,
    required this.site,
    required this.locationId,
    required this.rate,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });
}
