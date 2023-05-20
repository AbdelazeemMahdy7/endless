part of 'maps_cubit.dart';

abstract class MapsStates {}

class MapsInitial extends MapsStates {}

class PlacesLoaded extends MapsStates {
  final List<dynamic> places;

  PlacesLoaded(this.places);
}


