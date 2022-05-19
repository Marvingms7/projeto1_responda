import 'package:flutter/material.dart';
import 'package:projeto1_responda/questao.dart';
import 'package:projeto1_responda/resposta.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _pergunta = const [
    {
      'texto': 'Qual é a sua cor preferida?',
      'resposta': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual o seu animal preferido?',
      'resposta': ['Leão', 'Coelho', 'Elefante', 'Cobra'],
    },
    {
      'texto': 'Qual é o seu estilo de musica preferido?',
      'resposta': ['Sertanejo', 'Pagode', 'Rock', 'Forró'],
    }
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _pergunta.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> resposta = temPerguntaSelecionada
        ? _pergunta[_perguntaSelecionada].cast()['resposta']
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: <Widget>[
                  Questao(_pergunta[_perguntaSelecionada]['texto'].toString()),
                  ...resposta.map((t) => Resposta(t, _responder)).toList(),
                ],
              )
            : Center(
                child: Text(
                  'Parabéns!',
                  style: TextStyle(fontSize: 28),
                ),
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
