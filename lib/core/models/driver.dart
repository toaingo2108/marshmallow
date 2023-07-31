import 'package:freezed_annotation/freezed_annotation.dart';
part 'driver.freezed.dart';

@freezed
class Driver with _$Driver {
  const Driver._();
  const factory Driver({
    String? driverID,
    String? name,
    String? phone,
  }) = _Driver;
}
