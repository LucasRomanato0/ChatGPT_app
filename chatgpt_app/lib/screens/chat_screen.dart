import 'package:chatgpt_app/services/assets_manager.dart';
import 'package:flutter/material.dart';

class CharScreen extends StatefulWidget {
  const CharScreen({super.key});

  @override
  State<CharScreen> createState() => _CharScreenState();
}

class _CharScreenState extends State<CharScreen> {
  final bool _isTyping = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.openaiLogo),
        ),
        title: const Text('Chat GPT'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const Text('TESTE');
                },
                itemCount: 6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
