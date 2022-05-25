import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var imageApp = const AssetImage('images/padrao.png');
  var mensagem = 'Escolha uma opção abaixo:';

  void opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];

    //debugPrint('App: $escolhaApp');
    //debugPrint('Usuário: $escolhaUsuario');

    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          imageApp = const AssetImage('images/pedra.png');
        });
        break;
      case 'papel':
        setState(() {
          imageApp = const AssetImage('images/papel.png');
        });
        break;
      case 'tesoura':
        setState(() {
          imageApp = const AssetImage('images/tesoura.png');
        });
        break;
      default:
    }

    if ((escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel')) {
      setState(() {
        mensagem = 'Parabéns!!! Você ganhou :)';
      });
    } else if ((escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
        (escolhaApp == 'papel' && escolhaUsuario == 'pedra') ||
        (escolhaApp == 'tesoura' && escolhaUsuario == 'papel')) {
      setState(() {
        mensagem = 'Você perdeu :(';
      });
    } else {
      setState(() {
        mensagem = 'Empate...';
      });
    }
  }

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
          //Image.asset('images/padrao.png'),
          Image(image: imageApp),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => opcaoSelecionada("pedra"),
                child: Image.asset(
                  'images/pedra.png',
                  height: 95,
                ),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada("papel"),
                child: Image.asset(
                  'images/papel.png',
                  height: 95,
                ),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada("tesoura"),
                child: Image.asset(
                  'images/tesoura.png',
                  height: 95,
                ),
              ),
              /*Image.asset(
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
              ),*/
            ],
          )
        ],
      ),
    );
  }
}
