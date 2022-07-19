import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/news_layout/cubit/cubit.dart';
import 'package:new_app/news_layout/cubit/states.dart';
import 'package:new_app/shared/components.dart';

class scienceScreen extends StatelessWidget
{
  const scienceScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit,appStates>(
      listener: (context, state) {
      },
      builder:  (context, state) {
        var cubit =appCubit.get(context);
        return cubit.science.length>0? ListView.builder(
          itemBuilder: (context, index) => itemBuilder(cubit.science[index],context),
          itemCount: cubit.science.length,
          physics:BouncingScrollPhysics() ,
        ): Center(child: CircularProgressIndicator());
      },
    );
  }
}
