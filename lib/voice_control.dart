import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter/material.dart';

class VoiceControl extends StatefulWidget {
  @override
  _VoiceControlState createState() => _VoiceControlState();
}

class _VoiceControlState extends State<VoiceControl> {
  SpeechToText _speech = SpeechToText();
  bool _isListening = false;
  String _text = '';

  @override
  void initState() {
    super.initState();
    _initializeSpeechRecognizer();
  }

  void _initializeSpeechRecognizer() {
    _speech.initialize(
      onError: (error) => print('Error: $error'),
      onStatus: (status) => print('Status: $status'),
      debugLogging: true,
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onError: (error) => print('Error: $error'),
        onStatus: (status) => print('Status: $status'),
        debugLogging: true,
      );

      if (available) {
        setState(() {
          _isListening = true;
        });

        _speech.listen(
          onResult: (result) => setState(() {
            _text = result.recognizedWords;
          }),
        );
      }
    } else {
      setState(() {
        _isListening = false;
        _speech.stop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _listen,
      child: Container(
        color: Color.fromARGB(255, 45, 97, 122),
        child: Center(
          child: Text(
            _isListening ? 'I\'m listening...' : 'Tap to speak',
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Text(
      _text,
      style: TextStyle(fontSize: 20.0),
    );
  }
}
