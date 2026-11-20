import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarrocelView extends StatefulWidget {
  const CarrocelView({super.key});

  @override
  State<CarrocelView> createState() => _CarrocelViewState();
}

class _CarrocelViewState extends State<CarrocelView> {
  List<String> imagens = [
    'imagens/logo.jpg',
    'imagens/foto01.jpg',
    'imagens/foto02.jpg',
    'imagens/foto03.jpg',
    'imagens/foto04.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CarouselSlider.builder(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        reverse: false,
        autoPlayInterval: const Duration(seconds: 3),
        aspectRatio: 0.8,
      ),
      itemCount: imagens.length,
      itemBuilder: (context, index, realIndex) {
        final pathImg = imagens[index];
        return _boxImagem(pathImg);
      },
    ));
  }

  _boxImagem(String img) => Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade500,
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 0))
          ],
          color: Colors.deepPurple.shade700,
          border: Border.all(color: Colors.deepOrangeAccent, width: 8),
          borderRadius: BorderRadius.circular(10),
        ),
        //color: Colors.grey,
        width: 350,
        height: 200,
        child: Image.asset(img, fit: BoxFit.cover),
      );
}
