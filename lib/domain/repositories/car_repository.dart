



import 'package:myproject/data/data_module/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}