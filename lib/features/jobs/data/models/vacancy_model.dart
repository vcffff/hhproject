import 'package:hhproject/features/jobs/domain/entities/vacancy.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'vacancy_model.freezed.dart';
part 'vacancy_model.g.dart';

@freezed
abstract class VacancyModel with _$VacancyModel {
  const factory VacancyModel({
    required String id,
    required String title,
    required String company,
  }) = _VacancyModel;

  factory VacancyModel.fromJson(Map<String, dynamic> json) =>
      _$VacancyModelFromJson(json);
}

extension VacancyMapper on VacancyModel {
  Vacancy toEntity() => Vacancy(
        id: id,
        title: title,
        company: company,
      );
}
