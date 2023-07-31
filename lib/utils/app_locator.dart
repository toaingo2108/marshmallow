import 'package:get_it/get_it.dart';
import 'package:marshmallow/services/firebase_function_service.dart';
import 'package:marshmallow/services/firebase_storage_service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<FirebaseFunctionService>(
    FirebaseFunctionServiceImpl(),
  );
  locator.registerSingleton<FirebaseStorageService>(
    FirebaseStorageServiceImpl(),
  );

  _setupFactory();
}

void _setupFactory() {

}
