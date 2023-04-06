// import 'package:flutter/material.dart';

// import './question.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MyAppState();
//   }
// }

// class _MyAppState extends State<MyApp> {
//   var _questionIndex = 0;
//   void _answerQuestion() {
//     setState(() {
//       _questionIndex += 1;
//     });
//     print(_questionIndex);
//   }

//   var questionsList = ["How you doin?", "You like, what you are doin?"];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text("My First App"),
//           ),
//           body: Column(
//             children: [
//               Question(questionsList[_questionIndex]),
//               ElevatedButton(
//                 child: Text("Ans 1"),
//                 onPressed: _answerQuestion,
//               ),
//               ElevatedButton(
//                 child: Text("Ans 2"),
//                 onPressed: _answerQuestion,
//               ),
//               ElevatedButton(
//                 child: Text("Ans 3"),
//                 onPressed: _answerQuestion,
//               ),
//             ],
//           )),
//     );
//   }
// }
// ----------------------------------------------------------------------------------------------
// bg video and camera code
// import 'package:flutter/material.dart';
// import 'video_player_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Full Screen Video Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Full Screen Video Demo'),
//         ),
//         body: FullScreenVideoWithButton(
//           videoUrl:
//               'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
//         ),
//       ),
//     );
//   }
// }
// ----------------------------------------------------------------------------------------------

// graphql code
// import 'package:flutter/material.dart';
// import 'graphql_screen.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'GraphQL App',
//       home: GraphQLScreen(),
//     );
//   }
// }
// ----------------------------------------------------------------------------------------------

// mqtt normal code
/* 
import 'package:flutter/material.dart';
import 'mqtt_service.dart';

void main() async {
  await MqttService.connect();
  await MqttService.publish('test/topic/ix9', 'Hello CANA');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MQTT Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('MQTT Demo')),
        body: Center(
          child: Text('Message sent'),
        ),
      ),
    );
  }
}
 */