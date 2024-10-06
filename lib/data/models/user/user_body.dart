import 'package:json_annotation/json_annotation.dart';
part 'user_body.g.dart';
@JsonSerializable()
class AuthBody {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "gender")
  final String gender;
  @JsonKey(name: "birthDate")
  final DateTime birthDate;

  AuthBody({
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.birthDate,
  });

  AuthBody copyWith({
    String? name,
    String? email,
    String? password,
    String? gender,
    DateTime? birthDate,
  }) =>
      AuthBody(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
      );

  factory AuthBody.fromJson(Map<String, dynamic> json) => _$AuthBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AuthBodyToJson(this);
}
