import 'package:endless/app_router.dart';
import 'package:endless/constant/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme:  BottomNavigationBarThemeData(
          selectedItemColor: MyColors.deafultColor,
          unselectedItemColor: MyColors.primaryColor,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      themeMode: ThemeMode.light,
    );
  }
}
