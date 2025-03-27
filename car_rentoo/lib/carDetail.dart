import 'package:car_rentoo/car_card.dart';
import 'package:car_rentoo/data/model/Car.dart';
import 'package:car_rentoo/map.dart';
import 'package:car_rentoo/moreCard.dart';
import 'package:flutter/material.dart';

class Cardetail extends StatefulWidget {
  const Cardetail({super.key});

  @override
  State<Cardetail> createState() => _CardetailState();
}

class _CardetailState extends State<Cardetail> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  @override
  void initState() {
    // TODO: implement initState
    _controller=AnimationController(vsync: this,
    duration: const Duration(seconds: 3));
    _animation=Tween<double>(begin: 1.0,end: 1.5).animate(_controller!)..addListener((){setState(() {

    });});
    _controller!.forward();
    super.initState();
  }
  @override
  void dispose(){
    _controller!.forward();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline,color: Colors.white,),
            Text("Information",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(car: Car(model: "XUV300", distance: 900, fuelCapacity: 50, pricePerHour: 45)),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 5
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(radius: 40,backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295399_640.png"),),
                        SizedBox(height: 10,),
                        Text("Yamraj",style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("Rs 4352",style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                GestureDetector(
                  onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>MapDetail()));},
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 5
                          )
                        ]
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Transform.scale(
                        scale: _animation!.value,
                        alignment: Alignment.center,
                        child: Image.network("https://img.freepik.com/premium-vector/navigation-gps-map_163786-35.jpg",fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Morecard(car: Car(model: "XUV300", distance: 900, fuelCapacity: 50, pricePerHour: 45)),
                SizedBox(height: 5,),
                Morecard(car: Car(model: "XUV300", distance: 900, fuelCapacity: 50, pricePerHour: 45)),
                SizedBox(height: 5,),
                Morecard(car: Car(model: "XUV300", distance: 900, fuelCapacity: 50, pricePerHour: 45)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
