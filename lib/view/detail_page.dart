import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/homecontroller.dart';

class DetailPage extends StatelessWidget {
  DetailPage(
      {super.key,
      required this.title,
      required this.discription,
      required this.image,
      required this.price,
      required this.rating});
  final String title;
  final String discription;
  final String image;
  final double price;
  final String rating;
  final homeController = Get.put(Homecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       iconTheme: const IconThemeData(
    color: Colors.black, 
  ),
        title: Text(title,style: const TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Image.network(image)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${price.toString()}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star),
                      Text(
                        rating,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(discription),
            ],
          ),
        ),
      ),
    );
  }
}
