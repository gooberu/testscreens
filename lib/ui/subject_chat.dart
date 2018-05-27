import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'platform_adaptive.dart';

class SubjectChat extends StatefulWidget {
  @override
  _SubjectChatState createState() => new _SubjectChatState();
}

class _SubjectChatState extends State<SubjectChat> with TickerProviderStateMixin {
  List<ChatMessage> _messages = [];
  //SubjectApi _api;
  //NetworkImage _profileImage;

  TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;
  GoogleSignIn _googleSignIn = new GoogleSignIn();
  
  @override
  void initState() {
    super.initState();
//    _googleSignIn.signInSilently();
//    FirebaseAuth.instance.signInAnonymously().then((user) {
//      _messagesReference.onChildAdded.listen((Event event) {
//        var val = event.snapshot.value;
//        _addMessage(
//            name: val['sender']['name'],
//            senderImageUrl: val['sender']['imageUrl'],
//            text: val['text'],
//            imageUrl: val['imageUrl'],
//            textOverlay: val['textOverlay']);
//      });
//    });
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  void _handleMessageChanged(String text) {
    setState(() {
      _isComposing = text.length > 0;
    });
  }

  // Begin: Add _handleSubmitted function
  void _handleSubmitted(String text) {
    _textController.clear();
    _googleSignIn.signIn().then((user) {
      var message = {
        'sender': {'name': user.displayName, 'imageUrl': user.photoUrl},
        'text': text,
      };
      _addMessage(name: user.displayName, text: text, senderImageUrl: user.photoUrl);
//      _messagesReference.push().set(message);
    });
 // END: Add _handleSubmitted function
  }


  void _addMessage(
      {String name,
      String text,
      String imageUrl,
      String textOverlay,
      String senderImageUrl}) {
//    var animationController;
    // Begin: initialize animationController
    var animationController = new AnimationController(
      duration: new Duration(milliseconds: 700),
      vsync: this,
    ); // End: initialize animationController
    var sender = new ChatUser(name: name, imageUrl: senderImageUrl);
    var message = new ChatMessage(
        sender: sender,
        text: text,
        imageUrl: imageUrl,
        textOverlay: textOverlay,
        animationController: animationController);
    // Begin: Insert message
    setState(() {
      _messages.insert(0, message);
    }); //End: Insert message
    if (imageUrl != null) {
      NetworkImage image = new NetworkImage(imageUrl);
      image
          .resolve(createLocalImageConfiguration(context))
          .addListener((_, __) {
        animationController?.forward();
      });
    } else {
      animationController?.forward();
    }
  }


  Future<Null> _handlePhotoButtonPressed() async {
    // TODO: Fill out this function
//    var account = await _googleSignIn.signIn();
//    var imageFile = await ImagePicker.pickImage();
//    var random = new Random().nextInt(10000);
//    var ref = FirebaseStorage.instance.ref().child('image_$random.jpg');
//    var uploadTask = ref.put(imageFile);
//    var textOverlay = await Navigator.push(context, new TypeMemeRoute(imageFile));
//    if (textOverlay == null) return;
//    var downloadUrl = (await uploadTask.future).downloadUrl;
//    var message = {
//      'sender': {'name': account.displayName, 'imageUrl': account.photoUrl},
//      'imageUrl': downloadUrl.toString(),
//      'textOverlay': textOverlay,
//    };
//    _messagesReference.push().set(message);
  }

  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new PlatformAdaptiveContainer(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(children: [
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                // TODO: Add photo icon button
//                child: new IconButton(
//                  icon: new Icon(Icons.photo),
//                  onPressed: _handlePhotoButtonPressed,
//                ),
              ),
              // Begin: Add TextField
              new Flexible(
                child: new TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  onChanged: _handleMessageChanged,
                  decoration:
                      new InputDecoration.collapsed(hintText: 'Send a message'),
                ),
              ),
              // END: Add TextField
              new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 4.0),
                  child: new PlatformAdaptiveButton(
                    icon: new Icon(Icons.send),
                    onPressed: _isComposing
                        ? () => _handleSubmitted(_textController.text)
                        : null,
                    child: new Text('Send'),
                  )),
            ])));
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new PlatformAdaptiveAppBar(
          title: new Text('GooberU testchat'),
          platform: Theme.of(context).platform,
        ),
        body: new Column(children: [
          new Flexible(
              child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) =>
                new ChatMessageListItem(_messages[index]),
            itemCount: _messages.length,
          )),
          new Divider(height: 1.0),
          new Container(
              decoration: new BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer()),
        ]));
  }
}

class ChatUser {
  ChatUser({this.name, this.imageUrl});
  final String name;
  final String imageUrl;
}

class ChatMessage {
  ChatMessage(
      {this.sender,
      this.text,
      this.imageUrl,
      this.textOverlay,
      this.animationController});
  final ChatUser sender;
  final String text;
  final String imageUrl;
  final String textOverlay;
  final AnimationController animationController;
}

class ChatMessageListItem extends StatelessWidget {
  ChatMessageListItem(this.message);

  final ChatMessage message;

  Widget build(BuildContext context) {
//    return new Container(
      // Begin: Add SizeTransition
    return new SizeTransition(
        sizeFactor: new CurvedAnimation(
            parent: message.animationController, curve: Curves.easeOut),
        axisAlignment: 0.0,
        child: new Container( // End: Add SizeTransition
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(), // TODO: Replace with GoogleUserCircleAvatar
//              child: new GoogleUserCircleAvatar(message.sender.imageUrl),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text(message.sender.name,
                  style: Theme.of(context).textTheme.subhead),
              new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new ChatMessageContent(message)),
            ],
          ),
        ],
      ),
        ) // EndClose: Add SizeTransition
    );
  }
}

class ChatMessageContent extends StatelessWidget {
  ChatMessageContent(this.message);

  final ChatMessage message;

  Widget build(BuildContext context) {
    if (message.imageUrl != null) {
      var image = new Image.network(message.imageUrl, width: 200.0);
      if (message.textOverlay == null) {
        return image;
      } else {
        return new Stack(
          alignment: FractionalOffset.topCenter,
          children: [
            image,
            new Container(
                alignment: FractionalOffset.topCenter,
                width: 200.0,
                child: new Text(message.textOverlay,
                    style:
                        const TextStyle(fontFamily: 'Anton', fontSize: 16.0),
                    softWrap: true,
                    textAlign: TextAlign.center)),
          ],
        );
      }
    } else
      return new Text(message.text);
  }
}