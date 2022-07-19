import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/news_layout/cubit/cubit.dart';
import 'package:new_app/news_layout/cubit/states.dart';
import 'package:new_app/shared/components.dart';

class businessScreen extends StatelessWidget
{
  const businessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit,appStates>(
      listener: (context, state) {},
      builder:  (context, state) {
        var cubit =appCubit.get(context);

        return cubit.business.length>0? ListView.builder(
          itemBuilder: (context, index) => itemBuilder(cubit.business[index],context),
          itemCount: cubit.business.length,
          physics:BouncingScrollPhysics() ,
        ): Center(child: CircularProgressIndicator());
      },
    );
  }
}
