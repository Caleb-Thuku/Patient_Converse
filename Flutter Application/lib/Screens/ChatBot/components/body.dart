import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:http/http.dart' as http;

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Internal Medicine',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: new HomePageDialogflow(),
    );
  }
}

class HomePageDialogflow extends StatefulWidget {
  HomePageDialogflow({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageDialogflow createState() => new _HomePageDialogflow();
}

class Response {
  //final int sender;
  final String message;
  //final String body;

  const Response(
     //this.sender,
      this.message,
      );
  factory Response.fromMap(Map<String, dynamic> json){
    return Response(
     // json['sender'],
      json['message'],);
  }
  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
     //json['sender'],
      json['message'],
    );
  }
}
class _HomePageDialogflow extends State<HomePageDialogflow> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  String name;

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            //Revisit to wrap with Flexible
          new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                new InputDecoration.collapsed(hintText: "Send a message"),
              ),
    ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

 /* void Response(query) async {
    _textController.clear();
    AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/JSON/credentials2.json").build();
    Dialogflow dialogflow =Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(query);
    print(response.getMessage());
    ChatMessage message = new ChatMessage(
      text: response.getMessage() ??
          new CardDialogflow(response.getListMessage()[0]).title,
      name: "Bot",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }
*/

  Future<Map<dynamic, dynamic>> getBotResponse(String message) async {
    final response= await http.post(
      Uri.parse('http://192.168.50.23:5005/webhooks/rest/webhook'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
       // 'sender': 'Caleb',
        'message': message
      }),
    );
        if(response.statusCode == 200) {

        print(response.body);
       final reply = jsonDecode(response.body)as List<dynamic>;
         //Response({this.message});
        print(reply[0]);
     //return Map<String, dynamic>.from(reply[0]);
      print(Response.fromJson(reply[0]));
     // print(reply.map((e) => Response.fromJson(e)).toList());
    var map = Map.from(reply[0]);
       // print(map['text']);
        _textController.clear();
        ChatMessage message = new ChatMessage(
          text: map['text'],
          name: "Joe",
          type: false,
        );
        setState(() {
          _messages.insert(0, message);
        });
       return map;

      }
        else{
          throw Exception('FAILED');
        }
  }
/*
void printBotResponse(String text){
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: response.getMessage() ??
          new CardDialogflow(response.getListMessage()[0]).title,
      name: "Bot",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });

}
*/
  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: "Caleb",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    getBotResponse(text);
  }

  @override
  Widget build(BuildContext context) {
    //var device data = MediaQuery.removePadding(context: context, child: child)
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Internal Medicine"),
      ),

    body:  new Column(children: <Widget>[
        new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            )),
        new Divider(height: 1.0),
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),

          child: _buildTextComposer(),
        ),
      ]),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: new CircleAvatar(child: new Text('J')),
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(this.name,
                style: new TextStyle(fontWeight: FontWeight.bold)),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(text),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Text(this.name, style: Theme.of(context).textTheme.bodyText1),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(text),
            ),
          ],
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: new CircleAvatar(
            child: new Text(
              this.name[0],
              style: new TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}