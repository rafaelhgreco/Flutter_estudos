import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
    const HomePage({super.key});

    @override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Página Inicial'),
    ),
    drawer: const CustomDrawer(),
    body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
                padding: const EdgeInsets.all(16),
                color: Colors.blueAccent,
                child: const Text(
                'Olá, Flutter!',
                style: TextStyle(color: Colors.white, fontSize: 20),
                ),
            ),
            const SizedBox(height: 20),
            const Text('Aprendendo Flutter com organização.'),
            Container(
                padding: const EdgeInsets.all(16),
                color: Colors.greenAccent,
                child: Column(
                children: const [
                    Text(
                    'Aprendendo Flutter com organização.',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text('Essa é uma segunda linha de texto.'),
                ],
                )
            ),
            ],
        ),
    ),
);
    }
}
