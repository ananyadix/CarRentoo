import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:car_rentoo/data/model/Car.dart';

class MapDetail extends StatelessWidget {
  const MapDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Navigate", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle:true ,
        backgroundColor: Colors.black54,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: FlutterMap(
              options: const MapOptions(
                initialCenter: LatLng(51.0, -0.09),
                initialZoom: 13,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: carDetailCard(Car(model: "XUV300", distance: 900, fuelCapacity: 50, pricePerHour: 40))),

        ],
      ),
    );
  }
}


Widget carDetailCard(Car car){
  return SizedBox(
    height: 365,
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
            boxShadow: [BoxShadow(
              color: Colors.black38,spreadRadius: 0,blurRadius: 10
            )]
          ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text('${car.model}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.directions_car,color: Colors.black54,size: 16,),
                  SizedBox(width: 5,),
                  Text('> ${car.distance} km',style: TextStyle(color: Colors.black54,fontSize: 16),),
                  SizedBox(width: 10,),
                  Icon(Icons.battery_full,color: Colors.black54,size: 16,),
                  SizedBox(width: 5,),
                  Text('${car.fuelCapacity.toString()}',style: TextStyle(color: Colors.black54,fontSize: 16),),
                ],
              )
            ],
          ),
        ),
        Positioned(bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.only(topRight: Radius.circular(30),
            topLeft: Radius.circular(30))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Features",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
              featureIcons(),
              SizedBox(height: 20,),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Rs ${car.pricePerHour}/day",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(width: 100,),
                      ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.white70), child: Text("Book Now",style: TextStyle(color: Colors.grey),))
                    ],
                  )
                ],
              )
            ],
          ),
        ),)
      ],
    ),
  );
}

Widget featureIcons(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      featureIcon(Icons.local_gas_station,'Diesel','Common Rail'),
      featureIcon(Icons.speed,'Accelerate','0-100km/sec'),
      featureIcon(Icons.severe_cold,'Cold','Temp Control')
    ],
  );
}

Widget featureIcon(IconData icon,String title,String subtitle){
  return Container(
    width: 100,
    height: 100,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey,width: 1)
    ),
    child: Column(
      children: [
        Icon(icon,size: 28,),
        Text(title),
        Text(subtitle,style: TextStyle(color: Colors.grey,fontSize: 10),)
      ],
    ),
  );
}
