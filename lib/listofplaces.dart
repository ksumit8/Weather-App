import "package:flutter/material.dart";
import "package:weatherapp/weatherinfopage.dart";





class Places extends StatefulWidget{
  Places({super.key});
  @override
  State<Places> createState()=>PlacesState();
}

List<String>placeLocations=[
  "Mumbai",
  "Pune",
  "Aurangabad",
  "Nagpur",
  "Kolhapur",
  "Solapur",
  "Thane",
  "Amravati",
  "Sangli",
  "Satara",
  "Ratnagiri",
  "Akola",
  "Chandrapur",
  "Latur"
];


class PlacesState extends State<Places>{
  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: ListView.builder(
                  itemCount: placeLocations.length,
                  itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>MyHomePage(title: '', cityName: placeLocations[index],)));
                },
                child:Card(
                  child: ListTile(
                     leading:  Text("${placeLocations[index]}",style:  TextStyle(color: Colors.black,fontSize: 15),)),
                ),
              );
              },

              )




    );

  }


}