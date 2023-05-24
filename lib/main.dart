import 'package:endless/app_router.dart';
import 'package:endless/constant/colors.dart';
import 'package:endless/constant/strings.dart';
import 'package:endless/contorller/app_bloc.dart';
import 'package:endless/core/di/injection.dart' as di;
import 'package:endless/core/di/injection.dart';
import 'package:endless/core/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();


  token = await sl<CacheHelper>().get('token');

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AppBloc>(),)
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
