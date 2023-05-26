import 'package:endless/data/repository/maps_repository.dart';
import 'package:endless/data/webServices/places_webServices.dart';
import 'package:endless/endless_screens/endless_screen.dart';
import 'package:endless/presentation/screens/best_offer_screen.dart';
import 'package:endless/constant/strings.dart';
import 'package:endless/login/login_screen.dart';
import 'package:endless/presentation/screens/notifications_screen.dart';
import 'package:endless/on_boarding/onBoarding_screen.dart';
import 'package:endless/presentation/screens/map_screen.dart';
import 'package:endless/register/register_screen.dart';
import 'package:endless/presentation/screens/reservation_screen.dart';
import 'package:endless/spalsh/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'buisness_logic/cubit/maps/maps_cubit.dart';
import 'endless_screens/favorite_screen.dart';
import 'endless_screens/home_screen.dart';



class AppRouter{
  Route? generateRoute(RouteSettings settings){
    switch (settings.name){
      case onBoarding:
       return MaterialPageRoute(
         builder: (_)=>OnBoardingScreen(),
       );

       case loginScreen:
       return MaterialPageRoute(
         builder: (_)=>LoginScreen(),
       );
       case splashScreen:
       return MaterialPageRoute(
         builder: (_)=>SplashScreen(),
       );

       case registerScreen:
       return MaterialPageRoute(
         builder: (_)=>RegisterScreen(),
       );
       case homeScreen:
       return MaterialPageRoute(
         builder: (_)=>HomeScreen(),
       );

       case favoriteScreen:
       return MaterialPageRoute(
         builder: (_)=>FavoriteScreen(),
       );

       case notificationsScreen:
       return MaterialPageRoute(
         builder: (_)=>NotificationScreen(),
       );

       case reservationScreen:
       return MaterialPageRoute(
         builder: (_)=>ReservationScreen(),
       );
       case bestOfferScreen:
       return MaterialPageRoute(
         builder: (_)=>BestOfferScreen(),
       );

       case endlessScreen:
       return MaterialPageRoute(
         builder: (_)=>EndlessScreen(),
       );

      case mapScreen:
        return MaterialPageRoute(
          builder: (_)=>BlocProvider(
            create: (context)=> MapsCubit(MapsRepository(PlacesWebservices())),
            child: MapScreen(),
          ),
        );
    }
    return null;
  }
}