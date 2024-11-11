import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.freezed.dart';
part 'city.g.dart';

@freezed
abstract class CityModel with _$CityModel {
  const factory CityModel({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'dropi_id') required int dropiId,
    @JsonKey(name: 'department_id') required int departmenId,
    @JsonKey(name: 'cod_dane') required String codeDane,
    required String name,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
