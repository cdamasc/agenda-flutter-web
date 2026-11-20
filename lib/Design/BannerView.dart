import 'package:flutter/material.dart';

class BannerView extends StatelessWidget {
  const BannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Padding(
        padding: EdgeInsets.all(5.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            CircleAvatar(
              radius: 58,
              backgroundColor: Colors.deepOrangeAccent,
              child: ClipOval(
                child: Image(
                  image: AssetImage('imagens/logo.jpg'),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 58,
              backgroundColor: Colors.deepOrangeAccent,
              child: ClipOval(
                child: Image(
                  image: AssetImage('imagens/foto01.jpg'),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 58,
              backgroundColor: Colors.deepOrangeAccent,
              child: ClipOval(
                child: Image(
                  image: AssetImage('imagens/foto02.jpg'),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 58,
              backgroundColor: Colors.deepOrangeAccent,
              child: ClipOval(
                child: Image(
                  image: AssetImage('imagens/foto03.jpg'),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 58,
              backgroundColor: Colors.deepOrangeAccent,
              child: ClipOval(
                child: Image(
                  image: AssetImage('imagens/foto04.jpg'),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
