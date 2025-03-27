import 'package:car_rentoo/data/model/Car.dart';
import 'package:car_rentoo/domain/repositories/car_repo.dart';

class GetCar{
  final CarRepo repository;
  GetCar(this.repository);
  Future<List<Car>> call() async{
    return await repository.fetchCars();
  }
}