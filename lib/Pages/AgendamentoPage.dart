import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:webagenda/Pages/CartaoPage.dart';

import '../Models/Servicos.dart';
import '../Services/Funcoes.dart';

class AgendamentoPage extends StatelessWidget {
  final Servicos servico;

  const AgendamentoPage({required this.servico, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        foregroundColor: Colors.grey.shade300,
        title: const Text(
          "Ellen Bronze",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Calendario(), SizedBox(height: 10), _servico()],
      ),
    );
  }

  Widget _servico() {
    return SizedBox(
      width: 400,
      height: 200,
      child: Card(
        elevation: 5,
        child: Wrap(
          children: [
            Text("Descrição: ${servico.descricao}",
                style: TextStyle(fontSize: 20)),
            Text("Valor: ${Funcoes().formataVr(servico.preco)}",
                style: TextStyle(fontSize: 20)),
            Text("Agendar Para: ${Funcoes().formataVr(servico.preco)}",
                style: TextStyle(fontSize: 20)),    
          ],
        ),
      ),
    );
  }
}

class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  final f = Funcoes();
  final _hoje = DateTime.now();

  late DateTime _primeiroDia;
  late DateTime _ultimoDia;
  late DateTime _dtAgendamento;

  @override
  void initState() {
    super.initState();
    _primeiroDia = _hoje;
    _ultimoDia = DateTime(_hoje.year, _hoje.month + 6, _hoje.day);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 5,
          child: SizedBox(
            width: 400,
            height: 400,
            child: TableCalendar(
                focusedDay: _hoje, firstDay: _primeiroDia, lastDay: _ultimoDia),
          ),
        ),
        ElevatedButton(
          onPressed: (){
            Funcoes().abrirPagina(CartaoPage());
          }, 
          child: Text("Pagar"))
      ],
    );
  }
}
