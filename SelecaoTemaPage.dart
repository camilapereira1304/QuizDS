import 'package:flutter/material.dart';
import 'quiz_page.dart';

class SelecaoTemaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Escolha uma Disciplina para Revisar')), // Centraliza o texto
      ),
      body: Center( // Centraliza os botões
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage(tipoTema: 'Empreendedorismo')),
                );
              },
              child: Text('Empreendedorismo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage(tipoTema: 'Ética e Gestão')),
                );
              },
              child: Text('Ética e Gestão'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage(tipoTema: 'Design de Interface')),
                );
              },
              child: Text('Design de Interface'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage(tipoTema: 'Ferramentas Digitais')),
                );
              },
              child: Text('Ferramentas Digitais'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage(tipoTema: 'Banco de Dados')),
                );
              },
              child: Text('Banco de Dados'),
            ),
          ],
        ),
      ),
    );
  }
}
