import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

part '../generated/models/dummy.g.dart';

@JsonSerializable()
class Dummy {

  const Dummy(this.id, this.name);

  final String id;
  final String name;

  factory Dummy.fromJson(Map<String, dynamic> json) => _$DummyFromJson(json);
  Map<String, dynamic> toJson() => _$DummyToJson(this);

}