import 'package:json_annotation/json_annotation.dart';

part 'get_favourite_response.g.dart';

@JsonSerializable()
class GetFavouriteResponse {
  final int id;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'image_id')
  final String imageId;
  @JsonKey(name: 'sub_id')
  final String subId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final Map<String, dynamic> image;

  GetFavouriteResponse({
    required this.id,
    required this.userId,
    required this.imageId,
    required this.subId,
    required this.createdAt,
    required this.image,
  });
  factory GetFavouriteResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFavouriteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetFavouriteResponseToJson(this);
}
