import 'package:car_rentoo/carDetail.dart';
import 'package:flutter/material.dart';
import 'package:car_rentoo/data/model/Car.dart';

class CarCard extends StatelessWidget {
  final Car car;
  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardetail()));},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white70,
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
            Image(image: NetworkImage('https://mda.spinny.com/sp-file-system/public/2025-01-20/0c1dcf56848e48a180e793b0828efb19/raw/file.JPG')),
            Text(car.model,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children:[ Row(
                    children: [
                      Icon(Icons.arrow_circle_right,color: Colors.black,),
                      Text('${car.distance.toStringAsFixed(0)}km')
                    ],
                  ),
                SizedBox(width: 5,),
                Row(
                  children: [
                    Icon(Icons.energy_savings_leaf_outlined,color: Colors.black,),
                    Text('${car.fuelCapacity.toStringAsFixed(0)}L')
                  ],
                )]
                ),
                Text("Rs ${car.pricePerHour.toString()}/h",style:TextStyle(fontSize: 16,color: Colors.black) ,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
