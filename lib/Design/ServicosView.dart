import 'package:flutter/material.dart';
import 'package:webagenda/Design/Servicos01View.dart';
import 'package:webagenda/Services/Funcoes.dart';

import '../Models/Servicos.dart';
import '../main.dart';

class ServicosView extends StatefulWidget {
  const ServicosView({super.key});

  @override
  State<ServicosView> createState() => _ServicosViewState();
}

class _ServicosViewState extends State<ServicosView> {
  List<Servicos> _lstServices = [];
  final f = Funcoes();

  Future _carregaItens() async {
    var item = Servicos();
    item.index = 1;
    item.codigo = 1;
    item.titulo = "Banho de Lua Após Bronze (Não pinica)";
    item.descricao =
        "O banho de lua é um procedimento estético que consiste em clarear os pelos do corpo e deixar a pele mais macia e hidratada. É um método popular no verão, quando as pessoas querem realçar o bronze.";
    item.preco = 20;
    item.img = "banho_de_lua_bronze.jpg";
    _lstServices.add(item);

    item = Servicos();
    item.index = 2;
    item.codigo = 2;
    item.titulo = "Banho de Lua (Não pinica)";
    item.descricao =
        "Banho de lua, também conhecido como banho dourado, é um procedimento estético com o objetivo de clarear os pelos, tornando-os menos visíveis a olho nu. Além disso, esse procedimento tem o poder de hidratação da pele";
    item.preco = 35;
    item.img = "banho_de_lua.jpg";
    _lstServices.add(item);

    item = Servicos();
    item.index = 3;
    item.codigo = 3;
    item.titulo = "Bronzeamento Natural (Sol)";
    item.descricao =
        "Feito somente no período da manhã, o bronzeamento no sol é um procedimento ideal para quem quer relaxar e gosta da pele com aspecto dourado.";
    item.preco = 90;
    item.img = "bronzeamento_natural.jpg";
    _lstServices.add(item);

    item = Servicos();
    item.index = 4;
    item.codigo = 4;
    item.titulo = "Bronzeamento (paredão)";
    item.descricao =
        "O bronzeamento artificial no paredão é uma excelente alternativa. Dependendo do seu tipo de pele, poucas sessões já deixam a marquinha daquele jeito que a gente gosta. Esse procedimento pode demorar de 50min a 60min";
    item.preco = 110;
    item.img = "bronze_paredao.jpg";
    _lstServices.add(item);

    item = Servicos();
    item.index = 5;
    item.codigo = 5;
    item.titulo = "Bronze Turbo Promoção R\$ 149,99 com banho de lua";
    item.descricao =
        "Bronze turbo e a junção do bronze no paredão com o bronze no sol. Ideal para quem quer um resultado mais intenso. Esse procedimento demora cerca de 3 horas";
    item.preco = 149.99;
    item.img = "bronze_turbo.jpg";
    _lstServices.add(item);

    item = Servicos();
    item.index = 5;
    item.codigo = 5;
    item.titulo = "Esfoliação corporal";
    item.descricao =
        "A esfoliação corporal é um procedimento estético que remove as células mortas da pele, deixando-a mais macia, lisa e saudável. Além disso, a esfoliação ajuda a estimular a produção de colágeno";
    item.preco = 25;
    item.img = "esfoliacao.jpg";
    _lstServices.add(item);

    item = Servicos();
    item.index = 5;
    item.codigo = 5;
    item.titulo = "Intensificador neon para marca mais forte";
    item.descricao =
        "O efeito neon é uma maquiagem que você pode fazer após seu bronze para deixar sua marquinha mais forte, conseguimos entregar um resultado de até 3 sessões em uma aplicação durabilidade de ate 15 dias";
    item.preco = 35;
    item.img = "intensificador_neon.jpg";
    _lstServices.add(item);
  }

  @override
  void initState() {
    super.initState();
    _carregaItens();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _lstServices.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey.shade100,
          elevation: 1,
          margin: const EdgeInsets.symmetric(vertical: 3),
          child: InkWell(
            onTap: () {
              setState(() {
                _lstServices[index].selected = !_lstServices[index].selected;
              });
              
              // final altEvento = await Navigator.push(
              //     navigatorKey.currentContext!,
              //     MaterialPageRoute(
              //       builder: ((context) => Servicos01View(
              //             servico: Servicos(),
              //           )),
              //     ));
            },
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(
                      color: Colors.deepOrangeAccent,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image(
                    image: AssetImage("imagens/${_lstServices[index].img!}"),
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    //leading:
                    title: Text(
                      _lstServices[index].titulo!,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    trailing: Column(
                      children: [
                        Text(
                          "R\$ ${f.formataVr(_lstServices[index].preco)}",
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Visibility(
                          visible: _lstServices[index].selected,
                          child: Expanded(child: const Icon(Icons.verified, color: Colors.green, size: 30))) 
                      ],
                    ),
                    subtitle: Text(_lstServices[index].descricao!),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
