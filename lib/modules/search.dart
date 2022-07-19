
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/news_layout/cubit/cubit.dart';
import 'package:new_app/news_layout/cubit/states.dart';
import 'package:new_app/shared/components.dart';

var searchController=TextEditingController();

class searchScreen extends StatelessWidget
{


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit,appStates>(
      listener: (context, state) {},
      builder:(context, state) {

        var cubit=appCubit.get(context);
        return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                onChanged: (String value){
                  cubit.getSearch(value: value);
                },

              ),
            ),
            cubit.search.length>0?  Expanded(
              child: ListView.builder(
              itemBuilder: (context, index) =>itemBuilder(cubit.search[index], context),
              itemCount: cubit.search.length,
              ),
            ):Center(child: Text('No results')),
          ],
        ),
      );
      },
    );
  }
}
