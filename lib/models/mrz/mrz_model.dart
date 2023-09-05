import 'package:hive/hive.dart';
part 'mrz_model.g.dart';
@HiveType(typeId: 1)
class MRZModel {
 
  const MRZModel({
    required this.documentType,
    required this.countryCode,
    required this.surName,
    required this.fullName,
    required this.documentNumber,
    required this.nationalityCountryCode,
    required this.birthDate,
    required this.gender,
    required this.expiryDate,
    required this.personalNumber,
    this.personalNumber2='',
  });
  @HiveField(0)
  final String fullName;
  @HiveField(1)
  final String gender;
  @HiveField(2)
  final String birthDate;
  @HiveField(3)
  final String nationalityCountryCode;
  @HiveField(4)
  final String expiryDate;
  @HiveField(5)
  final String personalNumber;
  @HiveField(6)
  final String documentType;
  @HiveField(7)
  final String countryCode;
  @HiveField(8)
  final String surName;
  @HiveField(9)
  final String documentNumber;
  @HiveField(10)
  final String? personalNumber2;
}