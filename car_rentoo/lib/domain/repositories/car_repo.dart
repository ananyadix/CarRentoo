import "package:car_rentoo/data/model/Car.dart";

abstract class CarRepo{
  Future<List<Car>> fetchCars();
}