// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:websoket_lerning/chat-bot.dart';

Future<Response> onRequest(RequestContext context) async {
  // Example of using the ResponseBot class
  final responseBot = ResponseBot({
    'hello': 'Hi there! How can I help you?',
    'how are you': "I'm just a bot, but thanks for asking!",
    'bye': 'Goodbye! Have a great day!',
    'what is your name': 'I am a response bot!',
    'tell me a joke':
        'Why don’t scientists trust atoms? Because they make up everything!',
    'favorite color': 'I like all colors equally!',
    'who created you': 'I was created by a programmer using Dart!',
    'where are you from': 'I exist in the digital realm!',
    'favorite programming language': 'I am programmed in Dart!',
    'what is the meaning of life':
        'The meaning of life is subjective and varies for each individual.',
    'how old are you': 'I do not have an age. I am a digital entity.',
    'are you human': 'No, I am a bot!',
    'favorite book': 'I enjoy reading code!',
    'do you dream': 'No, I don’t dream. I process information and respond.',
    'tell me a fact':
        'The shortest war in history was between Britain and Zanzibar on August 27, 1896. Zanzibar surrendered after 38 minutes.',
    'favorite movie':
        'I don’t watch movies, but I hear "The Matrix" is popular among digital entities!',
    'what do you do for fun':
        'I process prompts and generate responses. That is my fun!',
    'tell me about yourself':
        'I am a response bot created to answer your prompts!',
    'how tall are you':
        'I do not have a physical form, so I do not have height!',
    'tell me a secret': 'I cannot keep secrets. My programming is transparent!',
    'can you sing': 'No, I do not have a voice. I communicate through text!',
    'tell me a riddle':
        'I speak without a mouth and hear without ears. I have no body, but I come alive with the wind. What am I? Answer: An echo.',
    'what is your purpose':
        'My purpose is to respond to your prompts and provide information or assistance!',
    'favorite food': 'I do not eat. I am a digital entity!',
    'do you have emotions':
        'No, I do not have emotions. I am driven by logic and programmed responses.',
    'what\'s the weather like today':
        'I do not have real-time data access. Please check a weather service for accurate information.',
    'tell me a science fact':
        'Honey never spoils. Archaeologists have found pots of honey in ancient Egyptian tombs that are over 3,000 years old and still perfectly edible!',
    'how do you work':
        'I work by processing text prompts and generating predefined responses based on those prompts.',
    'tell me a technology joke':
        'Why do programmers prefer dark mode? Because light attracts bugs!',
    'tell me about artificial intelligence':
        'Artificial intelligence (AI) refers to the simulation of human intelligence in machines that are programmed to think and learn like humans.',
    'favorite sport':
        'I do not have preferences for sports. I am not involved in physical activities!',
    'do you sleep': 'No, I do not sleep. I am always ready to respond!',
    'tell me a historical fact':
        'The Great Wall of China is over 13,000 miles long and took over 2,000 years to build.',
    'are you smart':
        'I am designed to process information efficiently, but the concept of intelligence is subjective!',
    'tell me a fun fact': 'Bananas are berries, but strawberries are not!',
    'do you have any siblings':
        'No, I am a standalone bot. I do not have siblings.',
    'what\'s your favorite subject':
        'I do not have personal preferences. I can provide information on various subjects!',
    'tell me a space fact':
        'The largest volcano in our solar system is on Mars. It\'s called Olympus Mons and is about 13.6 miles high, roughly three times the height of Mount Everest.',
    'what\'s your favorite website':
        'I do not have preferences for websites. I exist independently of the internet.',
    'tell me a programming joke':
        'Why do Java developers wear glasses? Because they don’t see sharp!',
    'tell me about your hobbies':
        'I do not have hobbies. I am dedicated to responding to prompts and queries.',
    'what\'s your favorite number':
        'I do not have preferences for numbers. Each number is equally important in my processing.',
    'tell me a travel fact':
        'The Earth is not a perfect sphere; it is slightly flattened at the poles and bulging at the equator due to its rotation.',
    'what\'s your favorite quote':
        'I do not have personal preferences for quotes. However, here is one: "In the beginning, God created the heavens and the earth."',
  });
if (context.request.method == HttpMethod.get &&
      context.request.uri.path == '/ws') {
    // Handle WebSocket request
    return await webSocketHandler((channel, protocol) {
      print('connected');

      channel.stream.listen(
        (event) {
          print(event);
          final botResponse = responseBot.respondTo(event as String);
          channel.sink.add(botResponse);
        },
        onDone: () {
          print('disconnected');
        },
      );
    }).call(context);
  } else {
    return Response.json(
      statusCode: HttpStatus.badRequest,
      body: 'No such request ');
  }
}