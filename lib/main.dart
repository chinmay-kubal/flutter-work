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

// -------------------------------------------------------------------------------
// pinch and shrink code
// workking
// import 'package:flutter/material.dart';
// import 'package:fundamental_app/voice_control.dart';
// import './pinch_and_zoom.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: PinchAndShrink(
//             child: Image.network(
//               'https://picsum.photos/400?image=10',
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// -------------------------------------------------------------------------------

// notifications and vibrations code
// notifications are seen in the emulator, permissions are taken in the phone
// vibrations are there in the actual phone.
// working..
// import 'package:flutter/material.dart';
// import 'notification_utils.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await NotificationUtils.init();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter Demo'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton(
//                 child: Text('Show Notification'),
//                 onPressed: () {
//                   NotificationUtils.showNotification(
//                       'Test Notification', 'This is a test notification');
//                 },
//               ),
//               ElevatedButton(
//                 child: Text('Vibrate'),
//                 onPressed: () {
//                   NotificationUtils.vibrate();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// -------------------------------------------------------------------------------

// bluetooth code
// dont know working or not. checked on phone but unable to understand.
// import 'package:flutter/material.dart';
// import 'bluetooth.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bluetooth Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Bluetooth Demo'),
//         ),
//         body: Center(
//           child: BluetoothWidget(),
//         ),
//       ),
//     );
//   }
// }

// ------------------------------------------------------------------------------------
// //  voice control code..
// partly working..

// import 'package:flutter/material.dart';
// import './voice_control.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Your App Name',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Your App Name'),
//         ),
//         body: Center(
//           child: VoiceControl(),
//         ),
//       ),
//     );
//   }
// }


// ------------------------------------------------------------------------------------

// qr code code
// properly working..
// import 'package:flutter/material.dart';
// import 'qr_scan_page.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter QR Scan',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: QRScanPage(),
//     );
//   }
// }
