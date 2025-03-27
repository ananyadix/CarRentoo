import 'package:car_rentoo/bloc/carBloc.dart';
import 'package:car_rentoo/data/datasource/firebase_car_source.dart';
import 'package:car_rentoo/data/repositories/carRepoImplement.dart';
import 'package:car_rentoo/domain/repositories/car_repo.dart';
import 'package:car_rentoo/domain/usecase/get_car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
GetIt getIt=GetIt.instance;
void initInjection(){
  try{
      getIt.registerLazySingleton<FirebaseFirestore>(()=>FirebaseFirestore.instance);
      getIt.registerLazySingleton<FirebaseCarSource>(()=>FirebaseCarSource(firestore: getIt<FirebaseFirestore>()));
      getIt.registerLazySingleton<CarRepo>(()=>CarRepoImpli(getIt<FirebaseCarSource>()));
      getIt.registerLazySingleton<GetCar>(()=>GetCar(getIt<CarRepo>()));
      getIt.registerFactory(()=>CarBloc(getCars: getIt<GetCar>()));
  }
  catch(e){
    throw e;
  }
}