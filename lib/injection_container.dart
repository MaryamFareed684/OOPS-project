import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:myproject/data/datasources/firebase_car_data_source.dart';
import 'package:myproject/data/repositories/car_repository_impl.dart';
import 'package:myproject/domain/repositories/car_repository.dart';
import 'package:myproject/domain/usecases/get_cars.dart';
import 'package:myproject/presentation/bloc/car_bloc.dart';
GetIt getIt=GetIt.instance;
void initInjection(){
try{
  getIt.registerLazySingleton<FirebaseFirestore>(()=>FirebaseFirestore.instance);
getIt.registerLazySingleton<FirebaseCarDataSource>(
  ()=>FirebaseCarDataSource(firestore:getIt<FirebaseFirestore>()));
getIt.registerLazySingleton<CarRepository>(
  ()=>CarRepositoryImpl(getIt<FirebaseCarDataSource>()));
  getIt.registerLazySingleton<GetCars>(
  ()=>GetCars(getIt<CarRepository>()));
getIt.registerFactory(()=>CarBloc(getCars: getIt<GetCars>()));
  

}

catch(e){
throw e;
}

}