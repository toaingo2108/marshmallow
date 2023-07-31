import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_failure.freezed.dart';

@freezed
class APIFailure with _$APIFailure {
  const APIFailure._();
  const factory APIFailure.google(String? error) = _Google;
}
