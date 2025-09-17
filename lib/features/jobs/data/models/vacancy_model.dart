import 'package:hhproject/features/jobs/domain/entities/vacancy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vacancy_model.freezed.dart';

@freezed
abstract class VacancyModel with _$VacancyModel {
  const factory VacancyModel({
    required String id,
    required String title,
    required String company,
  }) = _VacancyModel;

  factory VacancyModel.fromJson(Map<String, dynamic> json) {
    return VacancyModel(
      id: json['id'] as String? ?? '',
      title: json['name'] as String? ?? 'Без названия',
      company:
          (json['employer']?['name'] as String?) ?? 'Не указан работодатель',
    );
  }
}

extension VacancyMapper on VacancyModel {
  Vacancy toEntity() => Vacancy(id: id, title: title, company: company);
}
