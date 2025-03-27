import 'package:car_rentoo/data/datasource/firebase_car_source.dart';
import 'package:car_rentoo/data/model/Car.dart';
import 'package:car_rentoo/domain/repositories/car_repo.dart';

class CarRepoImpli implements CarRepo{
  final FirebaseCarSource dataSource;
  CarRepoImpli(this.dataSource);
  Future<List<Car>> fetchCars(){
    return dataSource.getCar();
  }
}