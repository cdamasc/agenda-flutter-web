import 'package:flutter/material.dart';
import 'package:mercadopago_transparent/mercadopago_transparent.dart'
    as mercadopago;

import '../Services/Funcoes.dart';

class CartaoPage extends StatelessWidget {
  const CartaoPage({super.key});

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
        body: Pagina());
  }
}

class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  static final String ACCESS_TOKEN =
      "TEST-2036824393905360-070414-a5d46dd5682bb00db0ade3a3645eadf0-172021075";
  static final String PUBLIC_KEY = "TEST-3bb46b93-c4c0-4d71-a3d4-f20dcf5288be";
  static final String APP_ID = "172021075";
  late final mercadopago.MercadoPago mercado;
  final f = Funcoes();

  void _startMP() {
    try {
      mercado = mercadopago.MercadoPago(
          acessToken: ACCESS_TOKEN,
          publicKey: PUBLIC_KEY,
          applicationId: APP_ID);
    } catch (ex) {
      f.mensagem("Erro ao Carregar Mercado Pago/r${ex.toString()}");
    }
  }

  @override
  void initState() {
    super.initState();
    _startMP();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
             
              
            },
            child: Text("Pagar"))
      ],
    );
  }

  
  
  
    
}
