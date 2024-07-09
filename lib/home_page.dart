import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FlashlightApp(),
    );
  }
}

class FlashlightApp extends StatefulWidget {
  const FlashlightApp({super.key});

  @override
  _FlashlightAppState createState() => _FlashlightAppState();
}

class _FlashlightAppState extends State<FlashlightApp> {
  bool _isOn = false;

  void _toggleFlashlight() async {
    try {
      if (_isOn) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
      setState(() {
        _isOn = !_isOn;
      });
    } catch (e) {
      print('Erro: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            _isOn
                ? 'assets/images/guerreiroon.jpg'
                : 'assets/images/guerreirooff.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed: _toggleFlashlight,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    _isOn ? Icons.lens_blur : Icons.lens_blur_sharp,
                    size: 50.0,
                    color: _isOn
                        ? const Color.fromARGB(255, 233, 126, 3)
                            .withOpacity(0.7)
                        : Colors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _isOn ? 'Desligar lanterna' : 'Ligar lanterna',
                  style: GoogleFonts.bebasNeue(
                    color: _isOn
                        ? const Color.fromARGB(255, 233, 126, 3)
                            .withOpacity(0.7)
                        : Colors.white.withOpacity(0.7),
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
