import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var textResultado = [
    'ganhou',
    'perdeu',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joken Po'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do App:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              debugPrint('Imagem clicada!');
            },
            onDoubleTap: () {
              debugPrint('Dois cliques Imagem clicada!');
            },
            onLongPress: () {
              debugPrint('Longo clique Imagem clicada!');
            },
            child: Image.asset('images/padrao.png'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha uma opção abaixo:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'images/pedra.png',
                height: 95,
              ),
              Image.asset(
                'images/papel.png',
                height: 95,
              ),
              Image.asset(
                'images/tesoura.png',
                height: 95,
              ),
            ],
          )
        ],
      ),
    );
  }
}
