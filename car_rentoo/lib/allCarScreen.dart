import 'package:car_rentoo/bloc/carBloc.dart';
import 'package:car_rentoo/bloc/carState.dart';
import 'package:car_rentoo/car_card.dart';
import 'package:car_rentoo/data/model/Car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AllCarScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true ,
        title: Text("CarRentoo",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: Colors.black54,
      ),
      body: BlocBuilder<CarBloc,CarState>(
          builder: (context,state){
            if(state is CarLoading){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(state is CarLoaded){
              return ListView.builder(itemCount: state.cars.length,itemBuilder:(context,index){
                return CarCard(car: state.cars[index]);
              });
            }
            else if(state is CarError){
              return Center(child: Text("ERROR: ${state.message}" ),);
            }
            return Container();
      },
      )
    );
  }
}
