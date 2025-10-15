import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final int? statusCode;
  final String? message;
  @JsonKey(defaultValue: {})
  final Map<String, List<String>> errors;

  ApiErrorModel({this.statusCode, this.message, this.errors = const {}});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// Returns a string of all error messages, each separated by a newline.
  /// If errors map is empty, returns the main message.
  String getAllErrorMessages() {
    if (errors.isNotEmpty) {
      final List<String> allMessages = [];
      errors.forEach((key, messages) {
        allMessages.addAll(messages);
      });
      return allMessages.join('\n');
    }
    return message ?? '';
  }
}
