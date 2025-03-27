import 'package:car_rentoo/data/model/Car.dart';

abstract class CarState{

}

class CarLoading extends CarState{

}

class CarLoaded extends CarState{
  final List<Car> cars;
  CarLoaded(this.cars);
}

class CarError extends CarState{
  final String message;
  CarError(this.message);
}