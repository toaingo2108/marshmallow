// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryDTO {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  bool? get enable => throw _privateConstructorUsedError;
  bool? get isHome => throw _privateConstructorUsedError;
  String? get parent => throw _privateConstructorUsedError;
  List<CategoryDTO>? get subCategories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryDTOCopyWith<CategoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDTOCopyWith<$Res> {
  factory $CategoryDTOCopyWith(
          CategoryDTO value, $Res Function(CategoryDTO) then) =
      _$CategoryDTOCopyWithImpl<$Res, CategoryDTO>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? icon,
      bool? enable,
      bool? isHome,
      String? parent,
      List<CategoryDTO>? subCategories});
}

/// @nodoc
class _$CategoryDTOCopyWithImpl<$Res, $Val extends CategoryDTO>
    implements $CategoryDTOCopyWith<$Res> {
  _$CategoryDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = freezed,
    Object? enable = freezed,
    Object? isHome = freezed,
    Object? parent = freezed,
    Object? subCategories = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      enable: freezed == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool?,
      isHome: freezed == isHome
          ? _value.isHome
          : isHome // ignore: cast_nullable_to_non_nullable
              as bool?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategories: freezed == subCategories
          ? _value.subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryDTOCopyWith<$Res>
    implements $CategoryDTOCopyWith<$Res> {
  factory _$$_CategoryDTOCopyWith(
          _$_CategoryDTO value, $Res Function(_$_CategoryDTO) then) =
      __$$_CategoryDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? icon,
      bool? enable,
      bool? isHome,
      String? parent,
      List<CategoryDTO>? subCategories});
}

/// @nodoc
class __$$_CategoryDTOCopyWithImpl<$Res>
    extends _$CategoryDTOCopyWithImpl<$Res, _$_CategoryDTO>
    implements _$$_CategoryDTOCopyWith<$Res> {
  __$$_CategoryDTOCopyWithImpl(
      _$_CategoryDTO _value, $Res Function(_$_CategoryDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = freezed,
    Object? enable = freezed,
    Object? isHome = freezed,
    Object? parent = freezed,
    Object? subCategories = freezed,
  }) {
    return _then(_$_CategoryDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      enable: freezed == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool?,
      isHome: freezed == isHome
          ? _value.isHome
          : isHome // ignore: cast_nullable_to_non_nullable
              as bool?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategories: freezed == subCategories
          ? _value._subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDTO>?,
    ));
  }
}

/// @nodoc

class _$_CategoryDTO extends _CategoryDTO {
  const _$_CategoryDTO(
      {required this.id,
      required this.name,
      this.icon,
      this.enable,
      this.isHome,
      this.parent,
      final List<CategoryDTO>? subCategories})
      : _subCategories = subCategories,
        super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String? icon;
  @override
  final bool? enable;
  @override
  final bool? isHome;
  @override
  final String? parent;
  final List<CategoryDTO>? _subCategories;
  @override
  List<CategoryDTO>? get subCategories {
    final value = _subCategories;
    if (value == null) return null;
    if (_subCategories is EqualUnmodifiableListView) return _subCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CategoryDTO(id: $id, name: $name, icon: $icon, enable: $enable, isHome: $isHome, parent: $parent, subCategories: $subCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.enable, enable) || other.enable == enable) &&
            (identical(other.isHome, isHome) || other.isHome == isHome) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            const DeepCollectionEquality()
                .equals(other._subCategories, _subCategories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, icon, enable, isHome,
      parent, const DeepCollectionEquality().hash(_subCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryDTOCopyWith<_$_CategoryDTO> get copyWith =>
      __$$_CategoryDTOCopyWithImpl<_$_CategoryDTO>(this, _$identity);
}

abstract class _CategoryDTO extends CategoryDTO {
  const factory _CategoryDTO(
      {required final String id,
      required final String name,
      final String? icon,
      final bool? enable,
      final bool? isHome,
      final String? parent,
      final List<CategoryDTO>? subCategories}) = _$_CategoryDTO;
  const _CategoryDTO._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String? get icon;
  @override
  bool? get enable;
  @override
  bool? get isHome;
  @override
  String? get parent;
  @override
  List<CategoryDTO>? get subCategories;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryDTOCopyWith<_$_CategoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
