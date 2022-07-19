import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:new_app/news_layout/cubit/cubit.dart';
import 'package:new_app/news_layout/cubit/states.dart';
import 'package:new_app/news_layout/home_page.dart';
import 'package:new_app/shared/cache_helper.dart';
import 'package:new_app/shared/network/dio_helper.dart';

void main()async {

  /// TO ENSURE THAT EVERYTHING IS COMPILED THEN OPEN THE APP

  WidgetsFlutterBinding.ensureInitialized();

  dioHelper.init();

  await cacheHelper.init();

  bool isDark=cacheHelper.getBoolean(key: 'isDark')==null?false:cacheHelper.getBoolean(key: 'isDark');
  runApp( MyApp(isDark: isDark,));
}

class MyApp extends StatelessWidget
{

 late bool isDark;

 MyApp({required this.isDark});



  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
        create: (context) => appCubit()..getBusiness()..changeAppMode(fromShared: isDark),
        child:BlocConsumer<appCubit,appStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Colors.deepOrange,
            appBarTheme: AppBarTheme(
              titleSpacing: 10.0,
              backgroundColor: Colors.white,
              elevation: 0,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
              actionsIconTheme: IconThemeData(
                color: Colors.black,
                size: 30,
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              backgroundColor: Colors.white,
              elevation: 20.0,
            ),
            textTheme: TextTheme(
              bodyText1: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

          ),
          darkTheme:ThemeData(
            scaffoldBackgroundColor: HexColor('333739'),
            primarySwatch: Colors.deepOrange,
            appBarTheme: AppBarTheme(
              titleSpacing: 10.0,
              backgroundColor:HexColor('333739'),
              elevation: 0,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: HexColor('333739'),
                statusBarIconBrightness: Brightness.light,
              ),
              actionsIconTheme: IconThemeData(
                color: Colors.white,
                size: 30,
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.white,
              backgroundColor: HexColor('333739'),
              elevation: 20.0,
            ),
            textTheme: TextTheme(
              bodyText1: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              button: TextStyle(
                color: Colors.red,
              ),
                bodyText2: TextStyle(
                  color: Colors.green,
                ),

              subtitle2: TextStyle(
                color: Colors.white,
              ),

            ),
          ),
          themeMode: appCubit.get(context).dark? ThemeMode.dark:ThemeMode.light,

          home: const homePage(),
          debugShowCheckedModeBanner: false,
        );
       },
    ),);
  }
}


