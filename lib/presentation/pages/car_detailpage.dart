import 'package:flutter/material.dart';
import 'package:myproject/presentation/pages/mapsfeatuespages.dart';
import 'package:myproject/presentation/widgets/more_car.dart';
import 'package:myproject/data/data_module/car.dart';

class CarDetailsPage extends StatefulWidget {
  final Car car;

  const CarDetailsPage({super.key, required this.car});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline,color: Colors.white,),
            SizedBox(width: 10),
            Text(
              'Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              /// Avatar & Map Section
              SizedBox(
                width: double.infinity, // Ensures the row takes full width
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Avatar Box
                    Flexible(
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xffF3F3F3),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 5,
                            )
                          ],
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('assets/avator.jpg'),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Alexander',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$ 4.255',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 10), // Add some spacing

                    /// Map Image with Animation
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapDetailsPage(car: widget.car),
                            ),
                          );
                        },
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                spreadRadius: 5,
                              )
                            ],
                          ),
                          child: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(15),
                            child: Transform.scale(
                              scale: _animation.value,
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/map.jpg',
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              /// List of More Cars
              Column(
                children: [
                  MoreCard(
                    car: Car(model: "Fortune CR", distance: "870", fuel_capacity: "50", price_per_hour: "45"),
                  ),
                  const SizedBox(height: 10),
                  MoreCard(
                    car: Car(model: "Fortune CR", distance: "870", fuel_capacity: "50", price_per_hour: "45"),
                  ),
                  const SizedBox(height: 10),
                  MoreCard(
                    car: Car(model: "Fortune CR", distance: "870", fuel_capacity: "50", price_per_hour: "45"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
