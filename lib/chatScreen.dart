import 'package:flutter/material.dart';
import 'package:telegram/main.dart';
import 'package:telegram/profile.dart';
import 'package:bubble/bubble.dart';
import 'package:telegram/user_model.dart';
import 'package:telegram/message_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(children: <Widget>[
        Container(
          alignment: Alignment.topRight,
          child: Bubble(
            alignment: Alignment.centerRight,
            nipWidth: 8,
            nipHeight: 4.8,
            nipRadius: .5,
            radius: Radius.circular(10.0),
            margin: BubbleEdges.only(top: 10, left: 30),
            nip: BubbleNip.rightBottom,
            color: Color.fromRGBO(229, 249, 211, 1),
            child: Column(children: [
              Text(message.text, textAlign: TextAlign.left),

              // return Column(
              //   children: <Widget>[
              //     Container(
              //       alignment: Alignment.topRight,
              //       child: Container(
              //         constraints: BoxConstraints(
              //           maxWidth: MediaQuery.of(context).size.width * 0.80,
              //         ),
              //         padding: EdgeInsets.all(10),
              //         margin: EdgeInsets.symmetric(vertical: 10),
              //         decoration: BoxDecoration(
              //           color: Theme.of(context).primaryColor,
              //           borderRadius: BorderRadius.circular(15),
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.grey.withOpacity(0.5),
              //               spreadRadius: 2,
              //               blurRadius: 5,
              //             ),
              //           ],
              //         ),
              //         child: Text(
              //           message.text,
              //           style: TextStyle(
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //     ),
              !isSameUser
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          message.time,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ):
                   Container(
                      child: null,
                    ),
            ]),
          ),
        ),
      ]);
    } else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(message.sender.imageUrl),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      message.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    }
  }

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message..',
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int prevUserId;
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(82, 125, 163, 50),
        leadingWidth: 30.0,
        leading: BackButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Protop();
              }),
            );
          },
        ),
        title: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ProfileScreen();
                }),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/user.png'),
                ),
                Padding(padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0)),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Anumodh K J',
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Colors.white),
                      ),
                      // ),
                      Text(
                        'Last seen recently',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ]),
              ],
            )),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final Message message = messages[index];
                final bool isMe = message.sender.id == currentUser.id;
                final bool isSameUser = prevUserId == message.sender.id;
                prevUserId = message.sender.id;
                return _chatBubble(message, isMe, isSameUser);
              },
            ),
          ),
          _sendMessageArea(),
        ],
      ),
    );
  }
}

class Chatscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(82, 125, 163, 50),
//         leadingWidth: 30.0,
//         leading: BackButton(
//           onPressed: () {
//             print('Back button pressed');
//           },
//         ),
//         title: TextButton(
//             onPressed: () {
//               print('Appbar Pressed');
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 CircleAvatar(
//                   backgroundImage: AssetImage('assets/ninja.png'),
//                 ),
//                 Padding(padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0)),
//                 Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Anumodh K J',
//                         textAlign: TextAlign.end,
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       // ),
//                       Text(
//                         'Last seen recently',
//                         textAlign: TextAlign.end,
//                         style: TextStyle(
//                             fontSize: 13.0,
//                             fontWeight: FontWeight.w300,
//                             color: Colors.white),
//                       ),
//                     ]),
//               ],
//             )),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 print('Menu pressed');
//               },
//               icon: Icon(
//                 Icons.more_vert,
//               ))
//         ],
//       ),

//       body: ListView.builder(
//       itemCount:20,
//       itemBuilder: (context, index) {
//             return Container(
//               width:
//               color:Colors.grey,
//               height: 50,
//             );

//           },
//     ),
//     );
//   }
// }

//BODY PART

// body: Container(
//   height: height,
//   width: width,
//   color: Color.fromRGBO(208,217,224,1),
//         // child: Image.asset('assets/backGround.png'),
//   //      decoration: BoxDecoration(
//   //   image: DecorationImage(image: AssetImage('assets/backGround.png')),
//   // ),
//   child:
//   Column(
//     children: [
//       Bubble(
//         alignment: Alignment.centerRight,
//           nipWidth: 8,
//           nipHeight: 4.8,
//           nipRadius: .5,
//           radius: Radius.circular(10.0),
//           margin: BubbleEdges.only(top: 10, left: 30),
//           nip: BubbleNip.rightBottom,
//           color: Color.fromRGBO(229, 249, 211, 1),
//           child: Column(children: [
//             Text(
//                 'Hello',
//                 textAlign: TextAlign.left),
//             Container(
//               child: Text('12.40PM ',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                     fontSize: 10.0,
//                     color: Colors.green[300],
//                   )),
//             )
//           ])),
//           Bubble(
//             alignment: Alignment.centerLeft,
//           nipWidth: 8,
//           nipHeight: 4.8,
//           nipRadius: .5,
//           radius: Radius.circular(10.0),
//           margin: BubbleEdges.only(top: 10, right: 30),
//           nip: BubbleNip.leftBottom,
//           color: Color.fromRGBO(255, 255, 255, 1),
//           child: Column(children: [
//             Text(
//                 'Hi',
//                 textAlign: TextAlign.left),
//             Container(
//               child: Text('12.40PM ',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                      fontSize: 10.0,
//                     color: Colors.green[300],
//                   )),
//             )
//           ])),
//           Bubble(
//           nipWidth: 8,
//           nipHeight: 4.8,
//           nipRadius: .5,
//           radius: Radius.circular(10.0),
//           margin: BubbleEdges.only(top: 10, left: 30),
//           nip: BubbleNip.rightBottom,
//           color: Color.fromRGBO(229, 249, 211, 1),
//           child: Column(children: [
//             Text(
//                 'Hello, Hi Jason. Sorry to bother you. I have a queston for you.',
//                 textAlign: TextAlign.left),
//             Container(
//               child: Text('12.40PM ',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                     fontSize: 10.0,
//                     color: Colors.green[300],
//                   )),
//             )
//           ])),
//           Bubble(
//           nipWidth: 8,
//           nipHeight: 4.8,
//           nipRadius: .5,
//           radius: Radius.circular(10.0),
//           margin: BubbleEdges.only(top: 10, left: 30),
//           nip: BubbleNip.rightBottom,
//           color: Color.fromRGBO(229, 249, 211, 1),
//           child: Column(children: [
//             Text(
//                 'Hello, Hi Jason. Sorry to bother you. I have a queston for you.',
//                 textAlign: TextAlign.left),
//             Container(
//               child: Text('12.40PM ',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                     fontSize: 10.0,
//                     color: Colors.green[300],
//                   )),
//             )
//           ])),
//       Bubble(
//           nipWidth: 8,
//           nipHeight: 4.8,
//           nipRadius: .5,
//           radius: Radius.circular(10.0),
//           margin: BubbleEdges.only(top: 10, right: 30),
//           nip: BubbleNip.leftBottom,
//           color: Color.fromRGBO(255, 255, 255, 1),
//           child: Column(children: [
//             Text(
//                 'Hello, Hi Jason. Sorry to bother you. I have a queston for you.',
//                 textAlign: TextAlign.left),
//             Container(
//               child: Text('12.40PM ',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                     fontSize: 10.0,
//                     color: Colors.green[300],
//                   )),
//             )
//           ])),
//            Bubble(
//           nipWidth: 8,
//           nipHeight: 4.8,
//           nipRadius: .5,
//           radius: Radius.circular(10.0),
//           margin: BubbleEdges.only(top: 10, right: 30),
//           nip: BubbleNip.leftBottom,
//           color: Color.fromRGBO(255, 255, 255, 1),
//           child: Column(children: [
//             Text(
//                 'Hello, Hi Jason. Sorry to bother you. I have a queston for you.',
//                 textAlign: TextAlign.left),
//             Container(
//               child: Text('12.40PM ',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                     fontSize: 10.0,
//                     color: Colors.green[300],
//                   )),
//             )
//           ])),
//    Bubble(
//         alignment: Alignment.centerRight,
//           nipWidth: 8,
//           nipHeight: 4.8,
//           nipRadius: .5,
//           radius: Radius.circular(10.0),
//           margin: BubbleEdges.only(top: 10, left: 30),
//           nip: BubbleNip.rightBottom,
//           color: Color.fromRGBO(229, 249, 211, 1),
//           child: Column(children: [
//             Text(
//                 'argument to getMinIntrinsicWidth was null.',
//                 textAlign: TextAlign.left),
//             Container(
//               child: Text('12.40PM ',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(

//                     fontSize: 10.0,
//                     color: Colors.green[300],
//                   )),
//             )
//           ])),

//            Bubble(
//             alignment: Alignment.centerLeft,
//           nipWidth: 8,
//           nipHeight: 4.8,
//           nipRadius: .5,
//           radius: Radius.circular(10.0),
//           margin: BubbleEdges.only(top: 10, right: 30),
//           nip: BubbleNip.leftBottom,
//           color: Color.fromRGBO(255, 255, 255, 1),
//           child: Column(children: [
//             Text(
//                 'alignment: Alignment.topRight,',
//                 textAlign: TextAlign.left),
//             Container(
//               child: Text('12.40PM ',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                      fontSize: 10.0,
//                     color: Colors.green[300],
//                   )),
//             )
//           ])),
//     ],
//   ),
// )
  }
}
