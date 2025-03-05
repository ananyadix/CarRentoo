import 'package:car_rentoo/car_card.dart';
import 'package:car_rentoo/data/model/Car.dart';
import 'package:flutter/material.dart';


class AllCarScreen extends StatelessWidget {
  final List<Car> cars=[Car(model: "XUV300", distance: 900, fuelCapacity: 50, pricePerHour: 45),
    Car(model: "XUV300", distance: 900, fuelCapacity: 50, pricePerHour: 45),
    Car(model: "XUV300", distance: 900, fuelCapacity: 50, pricePerHour: 45)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true ,
        title: Text("CarRentoo",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: Colors.black54,
      ),
      body: ListView.builder(itemCount: cars.length,
          itemBuilder: (context,index){
        return CarCard(car: cars[index]);
          }),
    );
  }
}
