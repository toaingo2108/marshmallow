import 'package:freezed_annotation/freezed_annotation.dart';
part 'firestore_failure.freezed.dart';

@freezed
class FirebaseFailure with _$FirebaseFailure {
  const FirebaseFailure._();
  const factory FirebaseFailure.firestore(String? error) = _Api;
}
