import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final Function(int, int) quandoResponder; // Corrigido para aceitar dois parâmetros
  final int pontuacaoTotal;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
    required this.pontuacaoTotal,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? (perguntas[perguntaSelecionada]['respostas'] as List<Map<String, Object>>)
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'] as String,
            () {
              int pontuacao = resp['pontuacao'] as int;
              // Chama a função quandoResponder com a pontuação da resposta e a pontuação total
              quandoResponder(pontuacao, pontuacaoTotal);
            },
          );
        }).toList(),
        SizedBox(height: 20),
        Text('Pontuação Total: $pontuacaoTotal'),
      ],
    );
  }
}
