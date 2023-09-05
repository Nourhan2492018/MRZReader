// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mrz_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MRZModelAdapter extends TypeAdapter<MRZModel> {
  @override
  final int typeId = 1;

  @override
  MRZModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MRZModel(
      documentType: fields[6] as String,
      countryCode: fields[7] as String,
      surName: fields[8] as String,
      fullName: fields[0] as String,
      documentNumber: fields[9] as String,
      nationalityCountryCode: fields[3] as String,
      birthDate: fields[2] as String,
      gender: fields[1] as String,
      expiryDate: fields[4] as String,
      personalNumber: fields[5] as String,
      personalNumber2: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MRZModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.birthDate)
      ..writeByte(3)
      ..write(obj.nationalityCountryCode)
      ..writeByte(4)
      ..write(obj.expiryDate)
      ..writeByte(5)
      ..write(obj.personalNumber)
      ..writeByte(6)
      ..write(obj.documentType)
      ..writeByte(7)
      ..write(obj.countryCode)
      ..writeByte(8)
      ..write(obj.surName)
      ..writeByte(9)
      ..write(obj.documentNumber)
      ..writeByte(10)
      ..write(obj.personalNumber2);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MRZModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
