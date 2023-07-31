import 'package:dartz/dartz.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:latlng/latlng.dart' as latlng;
import 'package:marshmallow/core/api_failure.dart';

class SearchAddressRepository {
  final _places =
      FlutterGooglePlacesSdk('AIzaSyDECafnF1AufKbjFFCVcgcHlO9N8GIRIx8');
  Future<Either<List<AutocompletePrediction>, APIFailure>>
      getAutocompletePlaces(String query) async {
    try {
      final predictions = await _places.findAutocompletePredictions(
        query,
        countries: ['US'],
      );
      return left(predictions.predictions.take(5).toList());
    } catch (e) {
      return right(APIFailure.google(e.toString()));
    }
  }

  Future<Either<latlng.LatLng, APIFailure>> getPlaceLocation(
    String placeID,
  ) async {
    try {
      final place =
          await _places.fetchPlace(placeID, fields: [PlaceField.Location]);

      if (place.place != null && place.place?.latLng != null) {
        return left(
          latlng.LatLng(
            place.place!.latLng!.lat,
            place.place!.latLng!.lng,
          ),
        );
      } else {
        return right(const APIFailure.google('Location not found'));
      }
    } catch (e) {
      return right(APIFailure.google(e.toString()));
    }
  }
}
