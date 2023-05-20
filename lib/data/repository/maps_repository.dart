import 'package:endless/data/models/place_suggestion.dart';
import 'package:endless/data/webServices/places_webServices.dart';

class MapRepository {
  final PlacesWebServices placesWebServices;

  MapRepository(this.placesWebServices);

  Future<List<dynamic>> getPlacesSuggestion(
    String places,
    String sessionToken,
  ) async {
    final suggestions =await placesWebServices.getPlacesSuggestion(places, sessionToken);

    return suggestions.map((suggestation) =>
        PlaceSuggestion.fromJson(suggestation))
        .toList();
  }
}
