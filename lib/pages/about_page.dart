import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre')),
      drawer: const CustomDrawer(),
      body: const Center(child: Text('Esta é a página Sobre.')),
    );
  }
}
