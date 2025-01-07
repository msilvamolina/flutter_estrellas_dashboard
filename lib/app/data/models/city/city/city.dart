import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.freezed.dart';
part 'city.g.dart';

@freezed
abstract class CityModel with _$CityModel {
  const factory CityModel({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'dropi_id') int? dropiId,
    @JsonKey(name: 'department_id') int? departmenId,
    @JsonKey(name: 'cod_dane') String? codeDane,
    @JsonKey(name: 'name') String? name,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
