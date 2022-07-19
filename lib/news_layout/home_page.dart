
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/modules/search.dart';
import 'package:new_app/news_layout/cubit/cubit.dart';
import 'package:new_app/news_layout/cubit/states.dart';
import 'package:new_app/shared/network/dio_helper.dart';

class homePage extends StatelessWidget
{
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit,appStates>(
        listener: (context, state) {},
        builder: (context, state) {

          var cubit=appCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => searchScreen(),));
                }, icon: Icon(Icons.search)),
                IconButton(
                    onPressed: (){
                      cubit.changeAppMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined),
                ),
              ],
            ),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar:BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
                BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sorts'),
                BottomNavigationBarItem(icon: Icon(Icons.science_outlined),label: 'Science'),
                BottomNavigationBarItem(icon: Icon(Icons.settings_rounded),label: 'Settings'),

              ],
              currentIndex:cubit.currentIndex,
              onTap: (index){
                appCubit.get(context).changeBottomNavBar(index);
              },
            ) ,
          );
        }

      )
    ;
  }
}

//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
