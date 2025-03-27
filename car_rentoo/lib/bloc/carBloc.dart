import 'package:bloc/bloc.dart';
import 'package:car_rentoo/bloc/carEvent.dart';
import 'package:car_rentoo/bloc/carState.dart';
import 'package:car_rentoo/domain/usecase/get_car.dart';

class CarBloc extends Bloc<CarEvent,CarState>{
  final GetCar getCars;
    CarBloc({required this.getCars}) : super(CarLoading()){
      on<LoadCars>((event,emit) async{
        emit(CarLoading());
        try{
          final cars=await getCars.call();
          emit(CarLoaded(cars));
        }
        catch(e){
          emit(CarError(e.toString()));
        }
      });
    }
}