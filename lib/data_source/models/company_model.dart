import 'package:endless/domain/entity/company_entity.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel({
    super.id,
    required super.name,
    required super.media,
    required super.phone,
    required super.email,
    required super.site,
    required super.locationId,
    required super.rate,
    super.createdAt,
    super.deletedAt,
    super.updatedAt,
  });

  factory CompanyModel.fromJson(Map<String,dynamic> json){
    return CompanyModel(
      phone: json['phone'],
      name: json['name'],
      email: json['email'],
      id: json['id'],
      locationId: json['location_id'],
      media: json['media'].replaceAll("192.168.1.8", "192.168.43.143"),
      rate: json['rate'],
      site: json['site'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
