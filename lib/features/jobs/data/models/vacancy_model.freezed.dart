// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vacancy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VacancyModel {

 String get id; String get title; String get company;
/// Create a copy of VacancyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VacancyModelCopyWith<VacancyModel> get copyWith => _$VacancyModelCopyWithImpl<VacancyModel>(this as VacancyModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VacancyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.company, company) || other.company == company));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,company);

@override
String toString() {
  return 'VacancyModel(id: $id, title: $title, company: $company)';
}


}

/// @nodoc
abstract mixin class $VacancyModelCopyWith<$Res>  {
  factory $VacancyModelCopyWith(VacancyModel value, $Res Function(VacancyModel) _then) = _$VacancyModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String company
});




}
/// @nodoc
class _$VacancyModelCopyWithImpl<$Res>
    implements $VacancyModelCopyWith<$Res> {
  _$VacancyModelCopyWithImpl(this._self, this._then);

  final VacancyModel _self;
  final $Res Function(VacancyModel) _then;

/// Create a copy of VacancyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? company = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VacancyModel].
extension VacancyModelPatterns on VacancyModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VacancyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VacancyModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VacancyModel value)  $default,){
final _that = this;
switch (_that) {
case _VacancyModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VacancyModel value)?  $default,){
final _that = this;
switch (_that) {
case _VacancyModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String company)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VacancyModel() when $default != null:
return $default(_that.id,_that.title,_that.company);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String company)  $default,) {final _that = this;
switch (_that) {
case _VacancyModel():
return $default(_that.id,_that.title,_that.company);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String company)?  $default,) {final _that = this;
switch (_that) {
case _VacancyModel() when $default != null:
return $default(_that.id,_that.title,_that.company);case _:
  return null;

}
}

}

/// @nodoc


class _VacancyModel implements VacancyModel {
  const _VacancyModel({required this.id, required this.title, required this.company});
  

@override final  String id;
@override final  String title;
@override final  String company;

/// Create a copy of VacancyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VacancyModelCopyWith<_VacancyModel> get copyWith => __$VacancyModelCopyWithImpl<_VacancyModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VacancyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.company, company) || other.company == company));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,company);

@override
String toString() {
  return 'VacancyModel(id: $id, title: $title, company: $company)';
}


}

/// @nodoc
abstract mixin class _$VacancyModelCopyWith<$Res> implements $VacancyModelCopyWith<$Res> {
  factory _$VacancyModelCopyWith(_VacancyModel value, $Res Function(_VacancyModel) _then) = __$VacancyModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String company
});




}
/// @nodoc
class __$VacancyModelCopyWithImpl<$Res>
    implements _$VacancyModelCopyWith<$Res> {
  __$VacancyModelCopyWithImpl(this._self, this._then);

  final _VacancyModel _self;
  final $Res Function(_VacancyModel) _then;

/// Create a copy of VacancyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? company = null,}) {
  return _then(_VacancyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
