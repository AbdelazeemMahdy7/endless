import 'package:endless/contorller/maps/maps_cubit.dart';
import 'package:endless/maps_data/repository/maps_repository.dart';
import 'package:endless/maps_data/webServices/places_webServices.dart';
import 'package:endless/presentation/screens/endless_screen.dart';
import 'package:endless/presentation/screens/best_offer_screen.dart';
import 'package:endless/constant/strings.dart';
import 'package:endless/presentation/screens/login_screen.dart';
import 'package:endless/presentation/screens/notifications_screen.dart';
import 'package:endless/presentation/screens/onBoarding_screen.dart';
import 'package:endless/presentation/screens/map_screen.dart';
import 'package:endless/presentation/screens/register_screen.dart';
import 'package:endless/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/screens/favorite_screen.dart';
import 'presentation/screens/home_screen.dart';



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