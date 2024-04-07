import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/service.dart';

import 'apiHelper.dart';




class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title,required this.cityName});


  final String cityName;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  WeatherApiClient weatherApiClient=WeatherApiClient();
  Weather? data;


  Future<void>getData()async{

    data =await weatherApiClient.getCurrentWeather(widget.cityName);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          backgroundColor:Colors.blueGrey,
          title:   const Text("Hey Weather"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: FutureBuilder(
                  future: getData(),
                  builder: (context,snapshot){
                    if(snapshot.connectionState==ConnectionState.done){
                      return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                      Image.network(
                                        'https:${data!.imageUrl}', // Prepend 'https:' to make it a valid URL
                                        width: 100,
                                        height: 100,
                                      ),
                                      ],),

                               Column(
                                mainAxisSize: MainAxisSize.min,
                                 children: [

                                   Text("${data!.text}",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                   Text("${data!.temp_c}°C",style: TextStyle(color: Colors.white,fontSize: 40),),
                                   Text("${widget.cityName}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                   const SizedBox(height: 30,),
                                  const Text("Have a Great Day! ",style: TextStyle(fontSize: 25,color: Colors.white),),
                              ],),

                              SizedBox(height: 40,),

                              Card(
                                 margin:EdgeInsets.symmetric(horizontal: 15),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children: [
                                        Column(children: [
                                          const Icon(Icons.wind_power),
                                          const SizedBox(height: 10,),
                                          const Text("wind_kph"),
                                          const SizedBox(height: 10,),
                                          Text("${data!.wind_kph}"),
                                        ],),
                                         Column(children: [
                                           const Icon(Icons.air),
                                           const SizedBox(height: 10,),
                                           const Text("wind_dir"),
                                           const SizedBox(height: 10,),
                                           Text("${data!.wind_dir}"),
                                         ],),
                                        Column(children: [
                                          const Icon(Icons.compress),
                                          const SizedBox(height: 10,),
                                          const Text("pressure_mb"),
                                          const SizedBox(height: 10,),
                                          Text("${data!.pressure_mb}"),
                                        ],),
                                       ],),
                                  ),
                              SizedBox(height: 40,),

                              Card(
                                margin:EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(children: [
                                      const Icon(Icons.wind_power),
                                      const SizedBox(height: 10,),
                                      const Text("wind_mph"),
                                      const SizedBox(height: 10,),
                                      Text("${data!.wind_mph}"),
                                    ],),

                                    Column(children: [
                                      const Icon(Icons.compress),
                                      const SizedBox(height: 10,),
                                      const Text("pressure_in"),
                                      const SizedBox(height: 10,),
                                      Text("${data!.pressure_in}"),
                                    ],),
                                  ],),
                              ),
                            ],
                          );
                    }else if(snapshot.connectionState==ConnectionState.waiting){
                      return const Center(
                          child: CircularProgressIndicator()
                      );
                    }
                    return Container();
                  }
              ),
        ),


    );
  }
}
