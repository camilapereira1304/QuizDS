import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final VoidCallback quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario, {Key? key}) : super(key: key);

  String get fraseResultado {
    // Verifica se a pontuação é 0 (resposta errada) ou maior que 0 (resposta correta)
    if (pontuacao == 0) {
      return 'Você errou! Sua pontuação é $pontuacao.';
    } else {
      return 'Sua pontuação total é $pontuacao.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Fundo branco
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              fraseResultado,
              style: TextStyle(fontSize: 28, color: Colors.blue.shade900, decoration: TextDecoration.none), // Texto azul escuro, sem sublinhado
            ),
          ),
          TextButton(
            child: Text('Reiniciar?'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue, // Texto azul para o botão 
            ),
            onPressed: quandoReiniciarQuestionario,
          )
        ],
      ),
    );
  }
}
