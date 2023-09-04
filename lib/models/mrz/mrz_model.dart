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
    this.personalNumber2,
  });

  final String documentType;
  final String countryCode;
  final String surName;
  final String fullName;
  final String documentNumber;
  final String nationalityCountryCode;
  final DateTime birthDate;
  final String gender;
  final DateTime expiryDate;
  final String personalNumber;
  final String? personalNumber2;
}