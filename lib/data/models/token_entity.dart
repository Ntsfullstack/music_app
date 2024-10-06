import 'package:json_annotation/json_annotation.dart';

part 'token_entity.g.dart';

@JsonSerializable()
class TokenEntity {
  TokenEntity({required this.accessToken, required this.refreshToken});

  final String? accessToken;
  final String? refreshToken;



  factory TokenEntity.fromJson(Map<String, dynamic> json) =>
      _$TokenEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TokenEntityToJson(this);
}
