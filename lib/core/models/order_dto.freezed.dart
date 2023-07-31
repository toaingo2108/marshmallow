// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderDTO {
  Map<String, dynamic> get products => throw _privateConstructorUsedError;
  String get orderID => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  Timestamp get date => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get fee => throw _privateConstructorUsedError;
  double get tip => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String get addressID => throw _privateConstructorUsedError;
  String? get driverID => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  Timestamp? get scheduledDelivery => throw _privateConstructorUsedError;
  bool get isFasterDelivery => throw _privateConstructorUsedError;
  List<dynamic> get rewards => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDTOCopyWith<OrderDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDTOCopyWith<$Res> {
  factory $OrderDTOCopyWith(OrderDTO value, $Res Function(OrderDTO) then) =
      _$OrderDTOCopyWithImpl<$Res, OrderDTO>;
  @useResult
  $Res call(
      {Map<String, dynamic> products,
      String orderID,
      String status,
      Timestamp date,
      double subtotal,
      double fee,
      double tip,
      String paymentMethod,
      String addressID,
      String? driverID,
      double tax,
      Timestamp? scheduledDelivery,
      bool isFasterDelivery,
      List<dynamic> rewards});
}

/// @nodoc
class _$OrderDTOCopyWithImpl<$Res, $Val extends OrderDTO>
    implements $OrderDTOCopyWith<$Res> {
  _$OrderDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? orderID = null,
    Object? status = null,
    Object? date = null,
    Object? subtotal = null,
    Object? fee = null,
    Object? tip = null,
    Object? paymentMethod = null,
    Object? addressID = null,
    Object? driverID = freezed,
    Object? tax = null,
    Object? scheduledDelivery = freezed,
    Object? isFasterDelivery = null,
    Object? rewards = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      orderID: null == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      tip: null == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      addressID: null == addressID
          ? _value.addressID
          : addressID // ignore: cast_nullable_to_non_nullable
              as String,
      driverID: freezed == driverID
          ? _value.driverID
          : driverID // ignore: cast_nullable_to_non_nullable
              as String?,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      scheduledDelivery: freezed == scheduledDelivery
          ? _value.scheduledDelivery
          : scheduledDelivery // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      isFasterDelivery: null == isFasterDelivery
          ? _value.isFasterDelivery
          : isFasterDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      rewards: null == rewards
          ? _value.rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderDTOCopyWith<$Res> implements $OrderDTOCopyWith<$Res> {
  factory _$$_OrderDTOCopyWith(
          _$_OrderDTO value, $Res Function(_$_OrderDTO) then) =
      __$$_OrderDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic> products,
      String orderID,
      String status,
      Timestamp date,
      double subtotal,
      double fee,
      double tip,
      String paymentMethod,
      String addressID,
      String? driverID,
      double tax,
      Timestamp? scheduledDelivery,
      bool isFasterDelivery,
      List<dynamic> rewards});
}

/// @nodoc
class __$$_OrderDTOCopyWithImpl<$Res>
    extends _$OrderDTOCopyWithImpl<$Res, _$_OrderDTO>
    implements _$$_OrderDTOCopyWith<$Res> {
  __$$_OrderDTOCopyWithImpl(
      _$_OrderDTO _value, $Res Function(_$_OrderDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? orderID = null,
    Object? status = null,
    Object? date = null,
    Object? subtotal = null,
    Object? fee = null,
    Object? tip = null,
    Object? paymentMethod = null,
    Object? addressID = null,
    Object? driverID = freezed,
    Object? tax = null,
    Object? scheduledDelivery = freezed,
    Object? isFasterDelivery = null,
    Object? rewards = null,
  }) {
    return _then(_$_OrderDTO(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      orderID: null == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      tip: null == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      addressID: null == addressID
          ? _value.addressID
          : addressID // ignore: cast_nullable_to_non_nullable
              as String,
      driverID: freezed == driverID
          ? _value.driverID
          : driverID // ignore: cast_nullable_to_non_nullable
              as String?,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      scheduledDelivery: freezed == scheduledDelivery
          ? _value.scheduledDelivery
          : scheduledDelivery // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      isFasterDelivery: null == isFasterDelivery
          ? _value.isFasterDelivery
          : isFasterDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      rewards: null == rewards
          ? _value._rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$_OrderDTO extends _OrderDTO {
  const _$_OrderDTO(
      {required final Map<String, dynamic> products,
      required this.orderID,
      required this.status,
      required this.date,
      required this.subtotal,
      required this.fee,
      required this.tip,
      required this.paymentMethod,
      required this.addressID,
      required this.driverID,
      required this.tax,
      required this.scheduledDelivery,
      required this.isFasterDelivery,
      required final List<dynamic> rewards})
      : _products = products,
        _rewards = rewards,
        super._();

  final Map<String, dynamic> _products;
  @override
  Map<String, dynamic> get products {
    if (_products is EqualUnmodifiableMapView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_products);
  }

  @override
  final String orderID;
  @override
  final String status;
  @override
  final Timestamp date;
  @override
  final double subtotal;
  @override
  final double fee;
  @override
  final double tip;
  @override
  final String paymentMethod;
  @override
  final String addressID;
  @override
  final String? driverID;
  @override
  final double tax;
  @override
  final Timestamp? scheduledDelivery;
  @override
  final bool isFasterDelivery;
  final List<dynamic> _rewards;
  @override
  List<dynamic> get rewards {
    if (_rewards is EqualUnmodifiableListView) return _rewards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rewards);
  }

  @override
  String toString() {
    return 'OrderDTO(products: $products, orderID: $orderID, status: $status, date: $date, subtotal: $subtotal, fee: $fee, tip: $tip, paymentMethod: $paymentMethod, addressID: $addressID, driverID: $driverID, tax: $tax, scheduledDelivery: $scheduledDelivery, isFasterDelivery: $isFasterDelivery, rewards: $rewards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDTO &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.orderID, orderID) || other.orderID == orderID) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.tip, tip) || other.tip == tip) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.addressID, addressID) ||
                other.addressID == addressID) &&
            (identical(other.driverID, driverID) ||
                other.driverID == driverID) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.scheduledDelivery, scheduledDelivery) ||
                other.scheduledDelivery == scheduledDelivery) &&
            (identical(other.isFasterDelivery, isFasterDelivery) ||
                other.isFasterDelivery == isFasterDelivery) &&
            const DeepCollectionEquality().equals(other._rewards, _rewards));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      orderID,
      status,
      date,
      subtotal,
      fee,
      tip,
      paymentMethod,
      addressID,
      driverID,
      tax,
      scheduledDelivery,
      isFasterDelivery,
      const DeepCollectionEquality().hash(_rewards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderDTOCopyWith<_$_OrderDTO> get copyWith =>
      __$$_OrderDTOCopyWithImpl<_$_OrderDTO>(this, _$identity);
}

abstract class _OrderDTO extends OrderDTO {
  const factory _OrderDTO(
      {required final Map<String, dynamic> products,
      required final String orderID,
      required final String status,
      required final Timestamp date,
      required final double subtotal,
      required final double fee,
      required final double tip,
      required final String paymentMethod,
      required final String addressID,
      required final String? driverID,
      required final double tax,
      required final Timestamp? scheduledDelivery,
      required final bool isFasterDelivery,
      required final List<dynamic> rewards}) = _$_OrderDTO;
  const _OrderDTO._() : super._();

  @override
  Map<String, dynamic> get products;
  @override
  String get orderID;
  @override
  String get status;
  @override
  Timestamp get date;
  @override
  double get subtotal;
  @override
  double get fee;
  @override
  double get tip;
  @override
  String get paymentMethod;
  @override
  String get addressID;
  @override
  String? get driverID;
  @override
  double get tax;
  @override
  Timestamp? get scheduledDelivery;
  @override
  bool get isFasterDelivery;
  @override
  List<dynamic> get rewards;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDTOCopyWith<_$_OrderDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
