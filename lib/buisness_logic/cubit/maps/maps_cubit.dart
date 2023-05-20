import 'package:endless/data/repository/maps_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'maps_state.dart';

class MapsCubit extends Cubit<MapsStates> {

  final MapRepository mapRepository;
  MapsCubit(this.mapRepository) : super(MapsInitial());

  void emitPlaceSuggestation(String places,String sessionToken){
    mapRepository.getPlacesSuggestion(places, sessionToken).then((suggestions) {
      emit(PlacesLoaded(suggestions));
    });
  }

}
