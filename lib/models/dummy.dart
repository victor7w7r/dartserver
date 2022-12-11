import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/models/dummy.freezed.dart';
part '../generated/models/dummy.g.dart';

@freezed
class Dummy with _$Dummy {

  const factory Dummy(String id, String name) = _Dummy;

  factory Dummy.fromJson(Map<String, dynamic> json) => _$DummyFromJson(json);

}