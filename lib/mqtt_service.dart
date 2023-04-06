import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  static final MqttServerClient client = MqttServerClient('broker.emqx.io', '');

  static Future<void> connect() async {
    client.logging(on: false);
    client.keepAlivePeriod = 20;
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;
    final connMessage = MqttConnectMessage()
        .withClientIdentifier('flutter_client')
        .withWillTopic('willtopic')
        .withWillMessage('My will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMessage;
    try {
      await client.connect();
    } catch (e) {
      print('Exception: $e');
      client.disconnect();
    }
  }

  static void onConnected() {
    print('Connected');
  }

  static void onDisconnected() {
    print('Disconnected');
  }

  static void onSubscribed(String topic) {
    print('Subscribed to $topic');
  }

  static Future<void> publish(String topic, String message) async {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    final payload = builder.payload;
    if (payload != null) {
      client.publishMessage(topic, MqttQos.atLeastOnce, payload);
    } else {
      print('Error: payload is null');
    }
  }
}
