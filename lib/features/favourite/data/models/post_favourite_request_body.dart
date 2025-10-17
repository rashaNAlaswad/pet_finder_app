import 'package:json_annotation/json_annotation.dart';

part 'post_favourite_request_body.g.dart';

@JsonSerializable()
class PostFavouriteRequestBody {
  @JsonKey(name: 'image_id')
  final String imageId;

  @JsonKey(name: 'sub_id')
  final String? subId;

  PostFavouriteRequestBody({required this.imageId, this.subId});

  factory PostFavouriteRequestBody.fromJson(Map<String, dynamic> json) =>
      _$PostFavouriteRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$PostFavouriteRequestBodyToJson(this);
}
