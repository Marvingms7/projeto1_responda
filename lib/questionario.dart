import 'package:flutter/material.dart';
import 'package:projeto1_responda/questao.dart';
import 'package:projeto1_responda/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> pergunta;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    required this.pergunta,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < pergunta.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> resposta = temPerguntaSelecionada
        ? pergunta[perguntaSelecionada].cast()['resposta']
        : [];
    return Column(
      children: <Widget>[
        Questao(pergunta[perguntaSelecionada]['texto'].toString()),
        ...resposta.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => quandoResponder(int.parse(resp['pontuacao'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
