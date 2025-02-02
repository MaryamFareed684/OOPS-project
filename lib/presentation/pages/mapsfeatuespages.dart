import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:myproject/data/data_module/car.dart';
import 'package:myproject/presentation/widgets/cardetail.dart';

class MapDetailsPage extends StatelessWidget {

 final Car car;

  const MapDetailsPage({super.key, required this.car});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
        //  Navigator.push(context );
        }, icon:const Icon(Icons.arrow_back)),
      ),*/
      body:Stack(

        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(51.0, -0.09),
              initialZoom: 13,
              minZoom: 2,
              maxZoom: 19,
            ),
            children: [
           TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains:const ['a','b','c'],
            
           ),
          ]),
          
          Positioned(
            bottom: 8.0,
            left: 0,
            right: 0,
            child: cardetailiscard(car: car)),
        ],
      ),
    );
  }
}
