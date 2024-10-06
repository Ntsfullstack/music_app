
import 'package:json_annotation/json_annotation.dart';
part 'users.g.dart';
@JsonSerializable()
class Auth {
  @JsonKey(name: "_id")
  final String id;
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
  @JsonKey(name: "likedSongs")
  final List<dynamic> likedSongs;
  @JsonKey(name: "playlists")
  final List<dynamic> playlists;
  @JsonKey(name: "isAdmin")
  final bool isAdmin;
  @JsonKey(name: "__v")
  final int v;

  Auth({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.birthDate,
    required this.likedSongs,
    required this.playlists,
    required this.isAdmin,
    required this.v,
  });

  Auth copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? gender,
    DateTime? birthDate,
    List<dynamic>? likedSongs,
    List<dynamic>? playlists,
    bool? isAdmin,
    int? v,
  }) =>
      Auth(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
        likedSongs: likedSongs ?? this.likedSongs,
        playlists: playlists ?? this.playlists,
        isAdmin: isAdmin ?? this.isAdmin,
        v: v ?? this.v,
      );

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
