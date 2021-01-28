import 'package:flutter/material.dart';
import 'package:telegram/chatScreen.dart';
import 'package:telegram/switch.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final username = 'Anumodh K J';
    final lastseen = 'last seen recently';
    final imgurl = 'assets/user.png';

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: Color.fromRGBO(41, 118, 186, 100),
            leadingWidth: 25.0,
            leading: BackButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ChatScreen();
                  }),
                );
              },
            ),
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: MediaQuery.of(context).size.height * .45,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 25, bottom: 7),
              title: ListTile(
                title: Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Text(
                    username,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                subtitle: Text(lastseen,
                    style: TextStyle(fontSize: 10, color: Colors.white70)),
              ),
              background: Image.asset(
                imgurl,
                fit: BoxFit.fill,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.videocam),
                onPressed: () {
                  print('Video Call');
                },
              ),
              IconButton(
                icon: Icon(Icons.call),
                onPressed: () {
                  print('Voice Call');
                },
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  print('Menu Button');
                },
              ),
            ],
          ),

          //CONTENT

          SliverFillRemaining(
            child: Column(children: [
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .284,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Info',
                            style: TextStyle(
                                color: Colors.blue[400], fontSize: 18),
                          ),
                          FloatingActionButton(
                            elevation: 1,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.message_outlined,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return ChatScreen();
                                }),
                              );
                            },
                          ),
                        ]),
                  
                    Text('7034153111'),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                    ),
                    Text(
                      'Mobile',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Notifications'),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                            ),
                            Text(
                              'Off',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        SwitchScreen()
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 13,
                width: double.infinity,
                color: Colors.grey[200],
              ),
              Card(
                margin: EdgeInsets.all(0),
                elevation: 0,
                child: Container(
                  height: 35,
             
                  child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.blue[300],
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Colors.blue[300],
                      tabs: [
                        Text('Media'),
                        Text('Files'),
                        Text('Links'),
                        Text('Groups'),
                      ]),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
