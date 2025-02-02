import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/presentation/bloc/car_bloc.dart';
import 'package:myproject/presentation/bloc/car_state.dart';
import 'package:myproject/presentation/widgets/car_card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "CHOOSE YOUR CAR",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0), // Adds spacing
          child: BlocBuilder<CarBloc, CarState>(
            builder: (context, state) {
              if (state is CarsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CarsLoaded) {
                // List of three different images
                List<String> carImages = [
                  "assets/homepage_car.jpg",
                  "assets/redcar.jpg",
                  "assets/whitecar2.jpg",
                ];

                return ListView.builder(
                  itemCount: state.cars.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0), // Adds spacing between cards
                      child: CarCard(
                        car: state.cars[index],
                        imageUrl: carImages[index % carImages.length],
                      ),
                    );
                  },
                );
              } else if (state is CarsError) {
                return Center(
                  child: Text('ERROR: ${state.message}'),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}