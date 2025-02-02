import 'package:flutter/material.dart';

Widget FeaturesIcons (){
return  Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    featuresIcons(Icons.local_gas_station,'Diseal','Common_Rail'),
    
    featuresIcons(Icons.speed,'Acceleration',' 1 - 100 km/s'),
    
    featuresIcons(Icons.ac_unit_outlined,'Cold','Temp Control'),
  ],
);
}

 Widget   featuresIcons (IconData icon,String title,String Subtitle){
  return Container(
  width: 100,
  height: 100,
  padding:const  EdgeInsets.all(5),
  decoration:BoxDecoration(
 borderRadius: BorderRadius.circular(10),
 border: Border.all(color: Colors.grey,width: 1),
  ),
  child: Column(
     children: [
      Icon(icon,size: 28,),
      const Text("title"),
      const Text("Subtitle",style: TextStyle(
        color: Colors.grey,
        fontSize: 10,
      ),
      ),
     ],
  ),
  );
 }