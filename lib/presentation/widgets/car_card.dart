import 'package:flutter/material.dart';
import 'package:myproject/data/data_module/car.dart';
import 'package:myproject/presentation/pages/car_detailpage.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final String imageUrl; // Accept image URL as a parameter

  const CarCard({super.key, required this.car, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailsPage(car: car),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // ✅ Allows the container to resize dynamically
          children: [
            /// ✅ `Flexible` allows the image to scale without overflow
            Flexible(
              child: Image.asset(
                imageUrl,
                width: 300,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 10),

            /// ✅ `Text` will expand if needed
            Text(
              car.model,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10.0),

            /// ✅ `Row` with flexible spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('${car.distance} km', style: const TextStyle(color: Colors.white)),
                Text('${car.fuel_capacity} L', style: const TextStyle(color: Colors.white)),
                Text(
                  '${car.price_per_hour} per hour',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}