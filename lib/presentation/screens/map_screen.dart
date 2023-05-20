import 'dart:async';
import 'package:endless/buisness_logic/cubit/maps/maps_cubit.dart';
import 'package:endless/constant/colors.dart';
import 'package:endless/helprs/location_helper.dart';
import 'package:endless/presentation/widgets/place_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:uuid/uuid.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  List<dynamic> places = [];

  FloatingSearchBarController controller = FloatingSearchBarController();

  static Position? position;
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    getMyCurrentLocation();
  }

  Future<void> getMyCurrentLocation() async {
    await LocationHelper.getCurrentLocation();

    position = await Geolocator.getLastKnownPosition()
        .whenComplete(() => setState(() {}));
  }

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    target: LatLng(position!.latitude, position!.longitude),
    bearing: 0.0,
    tilt: 0.0,
    zoom: 15,
  );

  Widget buildMap() {
    return GoogleMap(
      initialCameraPosition: _myCurrentLocationCameraPosition,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      mapType: MapType.normal,
      myLocationEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
    );
  }

  Future<void> goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }

  Widget floatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return FloatingSearchBar(
      elevation: 4,
      physics: const BouncingScrollPhysics(),
      controller: controller,
      border: const BorderSide(style: BorderStyle.none),
      hint: "Find a place...",
      iconColor: MyColors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      margins: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      hintStyle: const TextStyle(fontSize: 18),
      queryStyle: const TextStyle(fontSize: 18),
      width: isPortrait ? 600 : 500,
      transitionCurve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 700),
      height: 50,
      openAxisAlignment: 0.0,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        getPlacesSuggestions(query);
      },
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: Icon(
              Icons.place,
              color: Colors.black.withOpacity(0.6),
            ),
            onPressed: () {},
          ),
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildSuggestaionsList(),
            ],
          ),
        );
      },
    );
  }

  void getPlacesSuggestions(String query){
    final sessionToken =Uuid().v4();
    BlocProvider.of<MapsCubit>(context).emitPlaceSuggestation(query, sessionToken);
  }

  Widget buildSuggestaionsList() {
    return BlocBuilder(
      builder: (context, state) {
        if (state is PlacesLoaded) {
          places =(state).places;
          if(places.length!=0){
            return buildPlacesList();
          }else{
            return Container();
          }
        }else{
          return Container();
        }
      },
    );
  }

  Widget buildPlacesList() {
    return ListView.builder(
      itemBuilder: (context,index){
        return InkWell(
          onTap: (){
            controller.close();
          },
          child: PlacesItem(
            suggestion: places[index],
          ),
        );
      },
      itemCount: places.length,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
    );
  }

  @override
  Widget build( context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          position != null
              ? buildMap()
              : const Center(
                  child: CircularProgressIndicator(
                    color: MyColors.blue,
                  ),
                ),
          floatingSearchBar(),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
          backgroundColor: MyColors.blue,
          onPressed: goToMyCurrentLocation,
          child: const Icon(
            Icons.place,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
