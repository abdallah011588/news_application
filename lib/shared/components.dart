
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/modules/webview.dart';

Widget itemBuilder(map,context)
{
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => webviewScreen(url: map['url']),));
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                //image: NetworkImage('https://www.emaratalyoum.com/polopoly_fs/1.1650322.1657866625!/image/image.jpeg'),
                image: NetworkImage('${map['urlToImage']}'),
                fit: BoxFit.cover,
              ),

            ),
          ),
          SizedBox(width: 10.0,),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${map['title']}',
                      style: Theme.of(context).textTheme.bodyText1,//TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,

                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    '${map['publishedAt']}',
                    style: TextStyle(color: Colors.grey),),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}