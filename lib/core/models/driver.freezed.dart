// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Driver {
  String? get driverID => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DriverCopyWith<Driver> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverCopyWith<$Res> {
  factory $DriverCopyWith(Driver value, $Res Function(Driver) then) =
      _$DriverCopyWithImpl<$Res, Driver>;
  @useResult
  $Res call({String? driverID, String? name, String? phone});
}

/// @nodoc
class _$DriverCopyWithImpl<$Res, $Val extends Driver>
    implements $DriverCopyWith<$Res> {
  _$DriverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverID = freezed,
    Object? name = freezed,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      driverID: freezed == driverID
          ? _value.driverID
          : driverID // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DriverCopyWith<$Res> implements $DriverCopyWith<$Res> {
  factory _$$_DriverCopyWith(_$_Driver value, $Res Function(_$_Driver) then) =
      __$$_DriverCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? driverID, String? name, String? phone});
}

/// @nodoc
class __$$_DriverCopyWithImpl<$Res>
    extends _$DriverCopyWithImpl<$Res, _$_Driver>
    implements _$$_DriverCopyWith<$Res> {
  __$$_DriverCopyWithImpl(_$_Driver _value, $Res Function(_$_Driver) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverID = freezed,
    Object? name = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$_Driver(
      driverID: freezed == driverID
          ? _value.driverID
          : driverID // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Driver extends _Driver {
  const _$_Driver({this.driverID, this.name, this.phone}) : super._();

  @override
  final String? driverID;
  @override
  final String? name;
  @override
  final String? phone;

  @override
  String toString() {
    return 'Driver(driverID: $driverID, name: $name, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Driver &&
            (identical(other.driverID, driverID) ||
                other.driverID == driverID) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, driverID, name, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DriverCopyWith<_$_Driver> get copyWith =>
      __$$_DriverCopyWithImpl<_$_Driver>(this, _$identity);
}

abstract class _Driver extends Driver {
  const factory _Driver(
      {final String? driverID,
      final String? name,
      final String? phone}) = _$_Driver;
  const _Driver._() : super._();

  @override
  String? get driverID;
  @override
  String? get name;
  @override
  String? get phone;
  @override
  @JsonKey(ignore: true)
  _$$_DriverCopyWith<_$_Driver> get copyWith =>
      throw _privateConstructorUsedError;
}
