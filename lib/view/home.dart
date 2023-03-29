import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softieones/view/detail_page.dart';

import '../controller/homecontroller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homecontroller = Get.put(Homecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<Homecontroller>(
      builder: (controller) => ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselSlider.builder(
              itemBuilder: (context, index, realIndex) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: homecontroller.products.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: NetworkImage(
                                    homecontroller.products[index].image),
                                fit: BoxFit.fill,
                              )),
                          width: double.infinity,
                        ),
                );
              },
              itemCount: homecontroller.products.length,
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                viewportFraction: 1.0,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayInterval: const Duration(seconds: 3),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemCount: homecontroller.products.length,
            itemBuilder: (BuildContext context, int index) {
              final data = homecontroller.products[index];
              return GestureDetector(
                onTap: () {
                  Get.to(
                    () => DetailPage(
                      title: data.title,
                      discription: data.description,
                      image: data.image,
                      price: data.price,
                      rating: data.rating.rate.toString(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Container(
                    height: 100,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 15.0,
                            spreadRadius: 5.0,
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                          )
                        ],
                        image: DecorationImage(
                            image: NetworkImage(
                                homecontroller.products[index].image),
                            fit: BoxFit.cover)),
                  ),
                  title: Text(
                    homecontroller.products[index].category.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    data.description,
                    maxLines: 2,
                  ),
                  trailing: Text(
                    '\$${data.price.toString()}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
          ),
        ],
      ),
    ));
  }
}
