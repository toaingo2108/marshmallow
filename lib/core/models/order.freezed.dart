// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Order {
  List<Product> get products => throw _privateConstructorUsedError;
  List<Product> get rewards => throw _privateConstructorUsedError;
  String get orderID => throw _privateConstructorUsedError;
  OrderStatus get status => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get fee => throw _privateConstructorUsedError;
  double get tip => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  Address? get address => throw _privateConstructorUsedError;
  Driver get driver => throw _privateConstructorUsedError;
  DateTime? get scheduledDelivery => throw _privateConstructorUsedError;
  bool get isFasterDelivery => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {List<Product> products,
      List<Product> rewards,
      String orderID,
      OrderStatus status,
      DateTime date,
      double subtotal,
      double fee,
      double tip,
      double tax,
      PaymentMethod paymentMethod,
      Address? address,
      Driver driver,
      DateTime? scheduledDelivery,
      bool isFasterDelivery});

  $AddressCopyWith<$Res>? get address;
  $DriverCopyWith<$Res> get driver;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? rewards = null,
    Object? orderID = null,
    Object? status = null,
    Object? date = null,
    Object? subtotal = null,
    Object? fee = null,
    Object? tip = null,
    Object? tax = null,
    Object? paymentMethod = null,
    Object? address = freezed,
    Object? driver = null,
    Object? scheduledDelivery = freezed,
    Object? isFasterDelivery = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      rewards: null == rewards
          ? _value.rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      orderID: null == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      driver: null == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver,
      scheduledDelivery: freezed == scheduledDelivery
          ? _value.scheduledDelivery
          : scheduledDelivery // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isFasterDelivery: null == isFasterDelivery
          ? _value.isFasterDelivery
          : isFasterDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DriverCopyWith<$Res> get driver {
    return $DriverCopyWith<$Res>(_value.driver, (value) {
      return _then(_value.copyWith(driver: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Product> products,
      List<Product> rewards,
      String orderID,
      OrderStatus status,
      DateTime date,
      double subtotal,
      double fee,
      double tip,
      double tax,
      PaymentMethod paymentMethod,
      Address? address,
      Driver driver,
      DateTime? scheduledDelivery,
      bool isFasterDelivery});

  @override
  $AddressCopyWith<$Res>? get address;
  @override
  $DriverCopyWith<$Res> get driver;
}

/// @nodoc
class __$$_OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res, _$_Order>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? rewards = null,
    Object? orderID = null,
    Object? status = null,
    Object? date = null,
    Object? subtotal = null,
    Object? fee = null,
    Object? tip = null,
    Object? tax = null,
    Object? paymentMethod = null,
    Object? address = freezed,
    Object? driver = null,
    Object? scheduledDelivery = freezed,
    Object? isFasterDelivery = null,
  }) {
    return _then(_$_Order(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      rewards: null == rewards
          ? _value._rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      orderID: null == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      driver: null == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver,
      scheduledDelivery: freezed == scheduledDelivery
          ? _value.scheduledDelivery
          : scheduledDelivery // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isFasterDelivery: null == isFasterDelivery
          ? _value.isFasterDelivery
          : isFasterDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Order extends _Order {
  const _$_Order(
      {required final List<Product> products,
      required final List<Product> rewards,
      required this.orderID,
      required this.status,
      required this.date,
      required this.subtotal,
      required this.fee,
      required this.tip,
      required this.tax,
      required this.paymentMethod,
      required this.address,
      required this.driver,
      this.scheduledDelivery,
      required this.isFasterDelivery})
      : _products = products,
        _rewards = rewards,
        super._();

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<Product> _rewards;
  @override
  List<Product> get rewards {
    if (_rewards is EqualUnmodifiableListView) return _rewards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rewards);
  }

  @override
  final String orderID;
  @override
  final OrderStatus status;
  @override
  final DateTime date;
  @override
  final double subtotal;
  @override
  final double fee;
  @override
  final double tip;
  @override
  final double tax;
  @override
  final PaymentMethod paymentMethod;
  @override
  final Address? address;
  @override
  final Driver driver;
  @override
  final DateTime? scheduledDelivery;
  @override
  final bool isFasterDelivery;

  @override
  String toString() {
    return 'Order(products: $products, rewards: $rewards, orderID: $orderID, status: $status, date: $date, subtotal: $subtotal, fee: $fee, tip: $tip, tax: $tax, paymentMethod: $paymentMethod, address: $address, driver: $driver, scheduledDelivery: $scheduledDelivery, isFasterDelivery: $isFasterDelivery)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality().equals(other._rewards, _rewards) &&
            (identical(other.orderID, orderID) || other.orderID == orderID) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.tip, tip) || other.tip == tip) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.driver, driver) || other.driver == driver) &&
            (identical(other.scheduledDelivery, scheduledDelivery) ||
                other.scheduledDelivery == scheduledDelivery) &&
            (identical(other.isFasterDelivery, isFasterDelivery) ||
                other.isFasterDelivery == isFasterDelivery));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_rewards),
      orderID,
      status,
      date,
      subtotal,
      fee,
      tip,
      tax,
      paymentMethod,
      address,
      driver,
      scheduledDelivery,
      isFasterDelivery);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);
}

abstract class _Order extends Order {
  const factory _Order(
      {required final List<Product> products,
      required final List<Product> rewards,
      required final String orderID,
      required final OrderStatus status,
      required final DateTime date,
      required final double subtotal,
      required final double fee,
      required final double tip,
      required final double tax,
      required final PaymentMethod paymentMethod,
      required final Address? address,
      required final Driver driver,
      final DateTime? scheduledDelivery,
      required final bool isFasterDelivery}) = _$_Order;
  const _Order._() : super._();

  @override
  List<Product> get products;
  @override
  List<Product> get rewards;
  @override
  String get orderID;
  @override
  OrderStatus get status;
  @override
  DateTime get date;
  @override
  double get subtotal;
  @override
  double get fee;
  @override
  double get tip;
  @override
  double get tax;
  @override
  PaymentMethod get paymentMethod;
  @override
  Address? get address;
  @override
  Driver get driver;
  @override
  DateTime? get scheduledDelivery;
  @override
  bool get isFasterDelivery;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}
