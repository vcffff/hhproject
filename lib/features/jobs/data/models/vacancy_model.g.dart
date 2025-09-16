// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VacancyModel _$VacancyModelFromJson(Map<String, dynamic> json) =>
    _VacancyModel(
      id: json['id'] as String,
      title: json['title'] as String,
      company: json['company'] as String,
    );

Map<String, dynamic> _$VacancyModelToJson(_VacancyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'company': instance.company,
    };
