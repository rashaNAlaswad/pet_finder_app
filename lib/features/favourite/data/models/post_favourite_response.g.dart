// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_favourite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostFavouriteResponse _$PostFavouriteResponseFromJson(
  Map<String, dynamic> json,
) => PostFavouriteResponse(
  message: json['message'] as String,
  id: (json['id'] as num).toInt(),
);

Map<String, dynamic> _$PostFavouriteResponseToJson(
  PostFavouriteResponse instance,
) => <String, dynamic>{'message': instance.message, 'id': instance.id};
