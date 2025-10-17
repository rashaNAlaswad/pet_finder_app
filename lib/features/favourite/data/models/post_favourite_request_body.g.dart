// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_favourite_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostFavouriteRequestBody _$PostFavouriteRequestBodyFromJson(
  Map<String, dynamic> json,
) => PostFavouriteRequestBody(
  imageId: json['image_id'] as String,
  subId: json['sub_id'] as String?,
);

Map<String, dynamic> _$PostFavouriteRequestBodyToJson(
  PostFavouriteRequestBody instance,
) => <String, dynamic>{'image_id': instance.imageId, 'sub_id': instance.subId};
