// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favourite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFavouriteResponse _$GetFavouriteResponseFromJson(
  Map<String, dynamic> json,
) => GetFavouriteResponse(
  id: (json['id'] as num).toInt(),
  userId: json['user_id'] as String,
  imageId: json['image_id'] as String,
  subId: json['sub_id'] as String,
  createdAt: json['created_at'] as String,
  image: json['image'] as Map<String, dynamic>,
);

Map<String, dynamic> _$GetFavouriteResponseToJson(
  GetFavouriteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'image_id': instance.imageId,
  'sub_id': instance.subId,
  'created_at': instance.createdAt,
  'image': instance.image,
};
