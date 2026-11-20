import 'package:flutter/material.dart';
import 'package:webagenda/Design/BannerView.dart';
import 'package:webagenda/Design/CarrocelView.dart';
import 'package:webagenda/Design/ContatosView.dart';
import 'package:webagenda/Design/ServicosView.dart';
import 'package:webagenda/Models/Servicos.dart';

import '../Design/Servicos01View.dart';

class ServicosPage extends StatelessWidget {
  const ServicosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        foregroundColor: Colors.grey.shade300,
        title: const Text(
          "O Sol é Para Todos Aproveite!!!",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontStyle: FontStyle.italic),
        ),
        centerTitle: false,
        elevation: 10,
        leading: Padding(
          padding: const EdgeInsets.only(top: 5, left: 1),
          child: Builder(
            builder: (BuildContext context) {
              return const Image(
                image: AssetImage('imagens/sol.png'),
              );
            },
          ),
        ),
      ),
      body: _pagina(),
    );
  }

  Widget _pagina() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BannerView(),
            const SizedBox(height: 20),
            //const CarrocelView(),
            //const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Clique Para Selecionar",
                  style: TextStyle(fontSize: 22, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Agendar"),
                )
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: 500,
              height: 500,
              margin: EdgeInsets.only(left: 10, right: 10),
              child: ServicosView(),
            ),

            //ServicosView(),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Wrap(
            //         alignment: WrapAlignment.center,
            //         spacing: 10,
            //         runSpacing: 10,
            //         children: List.generate(lstServices.length, (index){
            //           return ServicosView(servico: lstServices[index]);
            //         })
            //       ),
            //     ),
            //   ],
            // )

            //ContatosView(),
          ],
        ),
      ),
    );
  }
}
