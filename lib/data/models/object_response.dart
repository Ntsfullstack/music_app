import 'package:json_annotation/json_annotation.dart';

part 'object_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ObjectResponse<T> {
  @JsonKey(name: 'Success')
  final bool? status;

  @JsonKey(name: 'Object')
  final T? data;

  @JsonKey(name: 'Description')
  final String? description;

  ObjectResponse({
    this.status,
    this.data,
    this.description,
  });

  factory ObjectResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ObjectResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ObjectResponseToJson(this, toJsonT);
}
