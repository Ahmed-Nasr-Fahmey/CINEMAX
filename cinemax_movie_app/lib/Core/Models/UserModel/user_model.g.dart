// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      userName: fields[0] as String?,
      userEmail: fields[1] as String?,
      userPassword: fields[2] as String?,
      userImageUrl: fields[3] as String?,
      likedMoviesList: (fields[4] as List).cast<MovieModel>(),
      downloadedMoviesList: (fields[5] as List).cast<MovieModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.userEmail)
      ..writeByte(2)
      ..write(obj.userPassword)
      ..writeByte(3)
      ..write(obj.userImageUrl)
      ..writeByte(4)
      ..write(obj.likedMoviesList)
      ..writeByte(5)
      ..write(obj.downloadedMoviesList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
