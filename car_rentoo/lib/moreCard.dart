import 'package:car_rentoo/data/model/Car.dart';
import 'package:flutter/material.dart';

class Morecard extends StatelessWidget {
  final Car car;
  const Morecard({super.key,required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(
          color: Colors.grey,
          blurRadius: 8,
          offset: Offset(0, 4)
        )]
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                car.model,
                style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.directions_car,color: Colors.black,size: 16,),
                  SizedBox(width: 5,),
                  Text("> ${car.distance} km",style: TextStyle(
                    color: Colors.black,
                    fontSize: 14
                  ),),
                  SizedBox(width: 10,),
                  Icon(Icons.battery_full,color: Colors.black,size: 16,),
                  SizedBox(width: 5,),
                  Text("${car.fuelCapacity.toString()}",style: TextStyle(
                      color: Colors.black,
                      fontSize: 14
                  ),)
                ],
              )
            ],
          ),
          Icon(Icons.arrow_forward_ios,color: Colors.black,size: 24,)
        ],
      ),
    );
  }
}
