import 'package:freezed_annotation/freezed_annotation.dart';
part 'permission_failure.freezed.dart';

@freezed
class PermissionFailure with _$PermissionFailure {
  const PermissionFailure._();
  const factory PermissionFailure.denied() = _Denied;
  const factory PermissionFailure.deniedForever() = _DeniedForever;
}
