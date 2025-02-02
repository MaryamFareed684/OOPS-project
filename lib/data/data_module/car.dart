
class Car{
  final String model;
  final String distance ;
  final String fuel_capacity;
  final String price_per_hour;

  Car({
    required this.model,
    required this.distance,
    required this.fuel_capacity,
    required this.price_per_hour}){}
factory Car.fromMap(Map<String, dynamic> map){
  return Car(
 model: map['model'] ?? 'Unknown Model', // Default value if null
    distance: map['distance']?.toString() ?? '0', // Convert to string safely
    fuel_capacity: map['fuel_capacity']?.toString() ?? '0', // Convert to string safely
    price_per_hour: map['price_per_hour']?.toString() ?? '0', // Convert to string safely
  );
}
  //static fromMap(Map<String, dynamic> data) {}
  
}