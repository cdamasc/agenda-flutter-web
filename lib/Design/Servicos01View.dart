import 'package:flutter/material.dart';
import 'package:webagenda/Pages/AgendamentoPage.dart';
import 'package:webagenda/Services/Funcoes.dart';

import '../Models/Servicos.dart';

class Servicos01View extends StatelessWidget {
  final Servicos servico;

  Servicos01View({required this.servico});
  //const ServicosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _cabecalho(),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Stack(
            children: [
              _boxDescricao(), 
              _boxPreco()
            ],
          ),
        )
      ],
    );
  }

  _cabecalho() {
    return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 2))
            ],
            color: Colors.deepPurple.shade700, 
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        width: 150,
        height: 30,
        child: Text(
          "Opção ${Funcoes().formataNum(servico.index.toString(), 2)}",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ));
  }

  _boxDescricao() {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2))
            ],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        width: 150,
        height: 130,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(servico.descricao!,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      onTap: () => _agendar(),
    );
  }

  _boxPreco() {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 110, left: 30),
        decoration: BoxDecoration(
            color: Colors.deepOrange, 
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2))
            ],
            borderRadius: BorderRadius.circular(10)),
        width: 90,
        height: 40,
        child: Text(
          "R\$ ${Funcoes().formataVr(servico.preco)}",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      onTap: () => _agendar(),
    );
  }
  
  _agendar() {
    Funcoes().abrirPagina(AgendamentoPage(servico: servico));
  }
}
