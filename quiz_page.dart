import 'package:flutter/material.dart';
import 'perguntas_banco_de_dados.dart';
import 'perguntas_ferramentas_digitais.dart';
import 'questionario.dart';
import 'resultado.dart';
import 'perguntas_empreendedorismo.dart';
import 'perguntas_etica_e_gestao.dart';
import 'perguntas_design_de_interface.dart'; // Importe o arquivo de perguntas para o tema Design de Interface

class QuizPage extends StatefulWidget {
  final String tipoTema;

  QuizPage({required this.tipoTema});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  List<Map<String, Object>> get perguntas {
    // Verifica o tema selecionado e retorna as perguntas correspondentes
    if (widget.tipoTema == 'Empreendedorismo') {
      return perguntasEmpreendedorismo;
    } else if (widget.tipoTema == 'Ética e Gestão') {
      return perguntasEticaEGestao;
    } else if (widget.tipoTema == 'Design de Interface') {
      return perguntasDesignDeInterface;
    } else if (widget.tipoTema == 'Ferramentas Digitais') {
      return perguntasFerramentasDigitais;
    }  else if (widget.tipoTema == 'Banco de Dados') {
      return perguntasBancoDeDados;
    } else {
      // Se nenhum tema corresponder, retorna uma lista vazia
      return [];
    }
  }

  void _responder(int pontuacao) {
    if (pontuacao == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Resultado(_pontuacaoTotal, _reiniciarQuestionario),
        ),
      );
    } else {
      setState(() {
        _pontuacaoTotal += pontuacao;
        _perguntaSelecionada++;
      });

      if (_perguntaSelecionada >= perguntas.length) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Resultado(_pontuacaoTotal, _reiniciarQuestionario),
          ),
        );
      }
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });

    Navigator.pop(context); // Voltar para a tela inicial
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
      ),
      body: _perguntaSelecionada < perguntas.length
          ? Questionario(
              perguntas: perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              quandoResponder: (int pontuacao, int pontuacaoTotal) {
                _responder(pontuacao);
              },
              pontuacaoTotal: _pontuacaoTotal,
            )
          : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
    );
  }
}
