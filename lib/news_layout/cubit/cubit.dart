
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/modules/business.dart';
import 'package:new_app/modules/science.dart';
import 'package:new_app/modules/settings.dart';
import 'package:new_app/modules/sorts.dart';
import 'package:new_app/news_layout/cubit/states.dart';
import 'package:new_app/shared/cache_helper.dart';
import 'package:new_app/shared/network/dio_helper.dart';

class appCubit extends Cubit<appStates>
{
  appCubit():super(initialState());

  static appCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;

  List<Widget> screen=[
    businessScreen(),
    sportsScreen(),
    scienceScreen(),
    settingsScreen(),
  ];

  bool dark = false;

  void changeBottomNavBar(int index)
  {
    emit(appChangeBottomNavState());

    if(index==1)
      getSports();
    if(index==2)
      getScience();

    currentIndex=index;
  }



  void changeAppMode({bool?fromShared})
  {
    if(fromShared!=null)
      {
        dark=fromShared;
        emit(appChangeModeState());
      }
    else
    {
      dark=!dark;
      cacheHelper.putBoolean(key: 'isDark', value: dark).then((value) {
        emit(appChangeModeState());
      });
    }

  }


  List<dynamic> business=[];
  void getBusiness()
  {
    emit(appLoadingGetBusinessState());

    dioHelper.getData(
        url: '/v2/top-headlines',
        query: {
      'country':'eg',
      'category':'business',
      'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'
        }
    ).then((value) {
      business=value.data['articles'];
     // print(business[0]['title'].toString());
      emit(appGetBusinessState());
    }).catchError((onError){
      print(onError.toString());
      emit(appGetBusinessErrorState());
    });

  }


  List<dynamic> sports=[];
  void getSports()
  {
    emit(appLoadingGetSportsState());

    if(sports.length==0)
      {
        dioHelper.getData(
            url: '/v2/top-headlines',
            query: {
              'country':'eg',
              'category':'sports',
              'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'
            }
        ).then((value) {
          sports=value.data['articles'];
          // print(business[0]['title'].toString());
          emit(appGetSportsState());
        }).catchError((onError){
          print(onError.toString());
          emit(appGetSportsErrorState());
        });
      }
    else
      {
        emit(appGetSportsState());
      }

  }

  List<dynamic> science=[];
  void getScience()
  {
    emit(appLoadingGetScienceState());

    if(science.length==0)
    {
      dioHelper.getData(url: '/v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
      }).then((value) {
        science = value.data['articles'];
        // print(business[0]['title'].toString());
        emit(appGetScienceState());
      }).catchError((onError) {
        print(onError.toString());
        emit(appGetScienceErrorState());
      });
    }
    else
      {
        emit(appGetScienceState());
      }
  }





  List<dynamic> search=[];
  void getSearch({required String value})
  {
    emit(appLoadingGetSearchState());
    //search=[];

    dioHelper.getData(url: '/v2/everything', query: {
      'q': '$value',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      search = value.data['articles'];
      emit(appGetSearchState());
    }).catchError((onError) {
      print(onError.toString());
      emit(appGetSearchErrorState());
    });
  }



}
