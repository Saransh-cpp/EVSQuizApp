// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HiveService.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveServiceAdapter extends TypeAdapter<HiveService> {
  @override
  final int typeId = 0;

  @override
  HiveService read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveService(
      highScore: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveService obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.highScore);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveServiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
