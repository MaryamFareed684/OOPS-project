

import 'package:myproject/data/data_module/car.dart';
import 'package:myproject/data/datasources/firebase_car_data_source.dart';
import 'package:myproject/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }
}
