import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
//import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
//import '../Models/Enums.dart';
import '../main.dart';
//import 'Params.dart';

enum Alerta { exclamacao, interrogacao, erro }

class Funcoes {
  String encripta(String Texto) {
    if (Texto == "") {
      return "";
    }

    String retorno = "";
    bool flag = false;
    int valor = 0;
    int y = 0;
    int Digito = 0;

    for (int x = 0; x < Texto.length; x++) {
      if (Texto[x] == "?") {
        flag = true;
      } else {
        Digito = Texto[x].codeUnits.first;

        if (Digito >= 0 && Digito <= 127) {
          valor = (Digito + 128 + x);

          if (valor > 255) {
            valor = (Digito + 128);
            retorno += String.fromCharCode(5);
          }

          retorno += String.fromCharCode(valor);
        } else if (Digito >= 128 && Digito <= 255) {
          y += 1;

          if (flag) {
            retorno += String.fromCharCode(Digito - 128);
            flag = false;
          } else {
            retorno += String.fromCharCode(Digito - 128 - y);
          }
        }
      }
    }

    return retorno;
  }

  void mensagem(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.deepPurple, //Color.fromARGB(255, 165, 41, 4),
        textColor: Colors.white,
        fontSize: 14);
  }

  String mid(String? texto, int ini, int fin) {
    if (ini > texto!.length) return "";
    if ((ini + fin) > (texto.length)) fin = ((texto.length + 1) - ini);
    String str = texto.substring((ini - 1), (ini + (fin - 1)));
    return str;
  }

  DateTime dataPadrao(strData) {
    String txtUdt = mid(strData, 7, 4);
    txtUdt += "-${mid(strData, 4, 2)}";
    txtUdt += "-${mid(strData, 1, 2)}";
    txtUdt += " ${mid(strData, 12, 8)}";
    return DateTime.parse(txtUdt);
  }

  Decoration backMenu() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blueGrey, Colors.white],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  String formataVr(dynamic valor) {
    NumberFormat formatar = NumberFormat("#,##0.00", "pt");
    return formatar.format(valor);
  }

  String formataNum(String numero, int digitos) {
    String texto = numero.replaceAll(".", ",");
    String strNumero = posVt(texto, 0, ",");
    String strZeros = "";

    for (int i = 1; i <= (digitos - strNumero.length); i++) {
      strZeros += "0";
    }

    return strZeros + strNumero;
  }

  String formataData({required DateTime data, required String mascara}) {
    var df = DateFormat(mascara, "pt");

    return df.format(data).replaceAll(".", "");
  }

  String maiuscMinusc(String texto) {
    String retorno = "";
    bool maiusc = true;

    for (int i = 0; i < texto.length; i++) {
      if (i > 0) maiusc = (texto[i - 1] == ' ' ? true : false);

      retorno += (maiusc ? texto[i].toUpperCase() : texto[i].toLowerCase());
    }

    return retorno;
  }

  String soNumero(String txt) {
    String txtRet = "";

    for (int i = 0; i < txt.length; i++) {
      try {
        int.parse(txt[i]);
        txtRet += txt[i];
      } catch (ex) {}
    }

    return txtRet;
  }

  String posVt(String texto, int pos, [String sep = '|']) {
    var vetor = texto.split(sep);
    String ret = "";

    try {
      ret = vetor[pos];
    } catch (ex) {}

    return ret;
  }

  bool eNumero(String texto) {
    bool ret = true;
    try {
      int n = int.parse(texto);
    } catch (ex) {
      ret = false;
    }

    return ret;
  }

  String sqlVal(String valor) {
    String strValor = soNumero(valor);
    double vr = double.parse(strValor) / 100;
    return vr.toString();
  }

  String removeAcentos(String vTexto) {
    int vPos;
    const vComAcento =
        "ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜàáâãäåçèéêëìíîïòóôõöùúûüºª´'`,{|<>°ºª#";
    const vSemAcento =
        "AAAAAACEEEEIIIIOOOOOUUUUaaaaaaceeeeiiiiooooouuuuoa}}}}}}}}}}}}";
    for (int i = 0; i < vTexto.length; i++) {
      vPos = vComAcento.indexOf(vTexto[i]);
      if (vPos > -1) {
        vTexto = vTexto.replaceRange(i, i + 1, vSemAcento[vPos]);
      }
      if (vTexto.codeUnitAt(i) > 125) {
        vTexto = vTexto.replaceRange(i, i + 1, " ");
      }
    }
    return vTexto.replaceAll("}", "");
  }

  abrirPagina(Widget page, [bool remover = false]) {
    if (remover) {
      Navigator.pushReplacement(
        navigatorKey.currentContext!,
        MaterialPageRoute(
          builder: ((context) => page),
        ),
      );
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //       builder: ((context) => page),
      //     ),
      //     (route) => false);
    } else {
      Navigator.push(
        navigatorKey.currentContext!,
        MaterialPageRoute(
          builder: ((context) => page),
        ),
      );
    }
  }

  Future msgbox(
      {required String texto,
      required Alerta tpAlerta,
      String titulo = "Agendei!",
      String textoBt1 = "OK",
      String textoBt2 = ''}) async {
    String pathImg = "";

    if (tpAlerta == Alerta.exclamacao) {
      pathImg = "imagens/exclamacao.png";
    } else if (tpAlerta == Alerta.interrogacao) {
      pathImg = "imagens/question.png";
    } else if (tpAlerta == Alerta.erro) {
      pathImg = "imagens/error.png";
    }

    return await showDialog<String>(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: const Color.fromARGB(255, 187, 172, 214),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(image: AssetImage(pathImg), width: 35, height: 35),
                    const SizedBox(width: 10),
                    Text(titulo)
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                          texto,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop(textoBt1);
                      },
                      child: Text(
                        textoBt1,
                        style: const TextStyle(fontSize: 11),
                      )),
                ),
                textoBt2 == "" ? const Center() : const SizedBox(width: 8),
                textoBt2 == ""
                    ? const Center()
                    : Expanded(
                        child: SizedBox(
                          width: 300,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey,
                                  foregroundColor: Colors.white,
                                  textStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                Navigator.of(context).pop(textoBt2);
                              },
                              child: Text(
                                textoBt2,
                                style: const TextStyle(
                                    fontSize: 11),
                              )),
                        ),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Future inputbox(BuildContext context, Alerta tpAlerta,
  //     {String titulo = 'Agendei!',
  //     required String txtCampo1,
  //     required TextEditingController controller1,
  //     int tamanho1 = 20,
  //     TextInputType type1 = TextInputType.text,
  //     String? strMask1,
  //     String? inputText1,
  //     String textoBt1 = 'OK',
  //     String? textoBt2}) async {
  //   var mask1 = MaskTextInputFormatter(mask: strMask1);
  //   String pathImg = "";

  //   if (tpAlerta == Alerta.exclamacao) {
  //     pathImg = "imagens/exclamacao.png";
  //   } else if (tpAlerta == Alerta.interrogacao) {
  //     pathImg = "imagens/interrogacao.png";
  //   } else {
  //     pathImg = "imagens/cancel.png";
  //   }

  //   return await showDialog<String>(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (context) => StatefulBuilder(
  //       builder: (context, setState) => SingleChildScrollView(
  //         child: AlertDialog(
  //           backgroundColor: const Color.fromARGB(255, 187, 172, 214),
  //           shape: const RoundedRectangleBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(10))),
  //           titlePadding: EdgeInsets.zero,
  //           contentPadding: EdgeInsets.zero,
  //           title: SizedBox(
  //             height: 150,
  //             child: Column(
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: [
  //                     Image(image: AssetImage(pathImg), width: 45, height: 45),
  //                     const SizedBox(width: 10),
  //                     Text(titulo)
  //                   ],
  //                 ),
  //                 const SizedBox(height: 5),
  //                 Padding(
  //                   padding: const EdgeInsets.only(
  //                       left: 12, top: 8, right: 12, bottom: 8),
  //                   child: TextFormField(
  //                     controller: controller1,
  //                     textAlign: TextAlign.center,
  //                     inputFormatters: strMask1 != null ? [mask1] : null,
  //                     autofocus: true,
  //                     enabled: true,
  //                     maxLength: tamanho1,
  //                     keyboardType: type1,
  //                     style: const TextStyle(fontSize: 22),
  //                     decoration: InputDecoration(
  //                       contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
  //                       label: Text(txtCampo1),
  //                       border: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(6),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           actions: [
  //             Center(
  //               child: ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                       backgroundColor: Colors.blueGrey),
  //                   onPressed: () {
  //                     String ret = "$textoBt1|${controller1.text}";

  //                     controller1.text = "";
  //                     Navigator.of(context).pop(ret);
  //                   },
  //                   child: Text(textoBt1)),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Future inputData({required BuildContext context}) async {
    String pathImg = "imagens/horario.png";
    String hora = "07";
    String minutos = "00";

    final opcoesHora = [];
    final opcoesMinutos = [];

    for (int i = 7; i <= 22; i++) {
      String ln = formataNum(i.toString(), 2);
      opcoesHora.add(ln);
    }

    for (int i = 0; i < 60; i += 5) {
      String ln = formataNum(i.toString(), 2);
      opcoesMinutos.add(ln);
    }

    opcoesMinutos.add("59");

    return await showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: const Color.fromARGB(255, 187, 172, 214),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image(image: AssetImage(pathImg), width: 45, height: 45),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text("Hora e Minuto",
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: Colors.white)),
                ],
              )),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 90,
                  height: 70,
                  child: DropdownButtonFormField(
                      value: hora,
                      items: opcoesHora
                          .map((elemento) => DropdownMenuItem(
                                value: elemento,
                                child: Text(
                                  elemento,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                          .toList(),
                      dropdownColor: Colors.deepPurple.shade50,
                      decoration: const InputDecoration(
                        label: Text(
                          "Hora",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          hora = value.toString();
                        });
                      }),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: SizedBox(
                    width: 90,
                    height: 70,
                    child: DropdownButtonFormField(
                        value: minutos,
                        items: opcoesMinutos
                            .map((elemento) => DropdownMenuItem(
                                  value: elemento,
                                  child: Text(
                                    elemento,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))
                            .toList(),
                        dropdownColor: Colors.deepPurple.shade50,
                        decoration: const InputDecoration(
                          label: Text(
                            "Minutos",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            minutos = value.toString();
                          });
                        }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 100,
                height: 40,
                alignment: Alignment.center,
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.blueGrey,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      textStyle:
                          const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    onPressed: () {
                      String hs = "$hora:$minutos";
                      Navigator.of(context).pop(hs);
                    },
                    child: const Text("OK")),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> geraDV(String texto) async {
    final units = texto.codeUnits;
    int soma = 0;

    for (int i = 0; i < units.length; i++) {
      soma += (units[i] + i);
    }

    String ret = soma.toString();
    ret = ret.substring(ret.length - 2);

    return ret;
  }

  Future<String> geraCodigo(String texto) async {
    final units = texto.codeUnits;
    int soma = 0;

    for (int i = 0; i < units.length; i++) {
      soma += (units[i] + i);
    }

    String ret = soma.toString();

    return ret;
  }

  // Future<String> readQrCode() async {
  //   String txtCode = "";
  //   try {
  //     txtCode = await FlutterBarcodeScanner.scanBarcode(
  //         "#FF0000", "CANCELAR", false, ScanMode.QR);

  //     if (txtCode == "-1") {
  //       txtCode = "";
  //     }
  //   } catch (ex) {
  //     mensagem(ex.toString());
  //   }

  //   return txtCode;
  // }

  Future<void> pause({required int segundos}) async {
    await Future.delayed(Duration(seconds: segundos));
  }
}
