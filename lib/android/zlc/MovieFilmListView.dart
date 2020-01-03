
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:convert/convert.dart';
import 'dart:convert'as Convert ;

import 'package:flutter/painting.dart';
class MovieFilmListView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListViewWidget();
  }

}
class ListViewWidget extends State<MovieFilmListView>{
  var subjects=[];
  var url="https://douban.uieee.com/v2/movie/top250?start=25&count=1";
  getList()async{
   var httpClient=HttpClient();
   var uri=Uri.http("douban.uieee.com", "/v2/movie/top250",{"start":"25","count":"50" });
   var request=await httpClient.getUrl(uri);
   var resonse=await request.close();
   var responsebody =await resonse.transform(Convert.utf8.decoder).join();
   Map data=Convert.json.decode(responsebody);
   setState(() {
     subjects=data["subjects"];
   });
  }
   @override
  void initState() {
    super.initState();
    getList();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue,title: Text("电影排行榜"),centerTitle: true,),
      body: Container(
        child: getListView(),
      ),

    ),);
  }
   getListView(){
    return  ListView.builder(
        addAutomaticKeepAlives: true,
        scrollDirection: Axis.vertical,
        itemCount: subjects.length,
        itemBuilder: (BuildContext context,int index){
           return  GestureDetector(
             onTap: (){
//               showDialog(context: context,builder:(_)=>Padding(padding: EdgeInsets.only(left: 50,right: 50,top: 50,bottom: 50),
//                 child: Text("我是個匯總嗲你阿薩",style: TextStyle(color: Colors.black),),),barrierDismissible: false);
             },
             behavior: HitTestBehavior.opaque,
             child:  Column(
               textDirection: TextDirection.ltr,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 getTopNumber(index+1),
                 getCenterR0m( subjects[index]),
                 Container(
                   height: 10,
                   color: Color.fromARGB(255, 234, 233, 234),
                 )
               ],
             ),
           );
        });
  }
  //上边no.号码
  getTopNumber(var nomber){
    return Container(
      decoration: BoxDecoration(color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: Text("No.${nomber}",style: TextStyle(color: Colors.white),),
      padding: EdgeInsets.fromLTRB(8,8,8,8),
      margin: EdgeInsets.only(left: 10,top: 10),
    );
  }
  //图片
 getCenterR0m(var subjects){
 var imageUrl=  subjects["images"]["medium"];
    return Row(
      children: <Widget>[
      Container(
     decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.fill),
      borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
        margin: EdgeInsets.only(left: 8, top: 3, right: 8, bottom: 3),
        height: 150,
        width: 100,
      ),
      getTitle(subjects)
      ],

    );
 }
getTitle(var subjects){
    var title=subjects["title"];
    var year=subjects["year"];
    var name=subjects["casts"][0]["name"];
   return Container(alignment: Alignment.topLeft,
     height: 150,
     child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       Container(
         color: Colors.lightBlueAccent,
         child: Row(children: <Widget>[
           Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),)
           ,Text("(${year})",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),)
         ],),
       ),
      Container(
        child:  Text(name),
      )

     ],
   ),);
}


}



