class UserModel {
  const UserModel({
    required this.documentType,
    required this.countryCode,
    required this.surnames,
    required this.givenNames,
    required this.documentNumber,
    required this.nationalityCountryCode,
    required this.birthDate,
    required this.sex,
    required this.expiryDate,
    required this.personalNumber,
    this.personalNumber2,
  });

  final String documentType;
  final String countryCode;
  final String surnames;
  final String givenNames;
  final String documentNumber;
  final String nationalityCountryCode;
  final DateTime birthDate;
  final String sex;
  final DateTime expiryDate;
  final String personalNumber;
  final String? personalNumber2;
}