import 'package:flutter/material.dart';
import 'package:projeto1_responda/resultado.dart';
import 'package:projeto1_responda/questionario.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _pergunta = const [
    {
      'texto': 'Qual é a sua cor preferida?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 4},
        {'texto': 'Vermelho', 'pontuacao': 1},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 2},
      ],
    },
    {
      'texto': 'Qual o seu animal preferido?',
      'resposta': [
        {'texto': 'Leão', 'pontuacao': 10},
        {'texto': 'Coelho', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Cobra', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu estilo de musica preferido?',
      'resposta': [
        {'texto': 'Sertanejo', 'pontuacao': 8},
        {'texto': 'Pagode', 'pontuacao': 10},
        {'texto': 'Rock', 'pontuacao': 9},
        {'texto': 'Forró', 'pontuacao': 7},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _pergunta.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                pergunta: _pergunta,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
