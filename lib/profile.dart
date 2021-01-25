import 'package:flutter/material.dart';
import 'package:telegram/chatScreen.dart';
import 'package:telegram/switch.dart';
import 'package:telegram/delegate.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColorLight: Color.fromRGBO(82, 125, 163, 50),
          primaryColorDark: Colors.black26),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final username = 'Anumodh K J';
    final lastseen = 'last seen recently';
    final imgurl = 'assets/user.png';

    return Scaffold(
    
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
    
              expandedHeight: MediaQuery.of(context).size.height * .4,
    
              flexibleSpace: FlexibleSpaceBar(
    
                 title: ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child:Text(username,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),),),
                        subtitle:Text(lastseen,
                        style:TextStyle(
                          fontSize: 10,
                          color: Colors.white70)) ,
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
    
                  height: MediaQuery.of(context).size.height * .239,
    
                  child: Column(
    
                    crossAxisAlignment: CrossAxisAlignment.start,
    
                    children: [
    
                      Text(
    
                        'Info',
    
                        style: TextStyle(color: Colors.blue[700], fontSize: 18),
    
                      ),
    
                      Padding(
    
                        padding: EdgeInsets.only(top: 18),
    
                      ),
    
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
    
                                'On',
    
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
    
                  color: Colors.grey[300],
    
                ),
     Container(child: Delegate(),),
    
              ]),
              ),
    
    //TAB BAR
    
    
    
    
   
    
    
    
    
    
            
    
          ],
  ),

    );
  }
}

//              SliverPersistentHeader(
//                 delegate: _SliverAppBarDelegate(
//                   TabBar(

//                     labelColor: Colors.blue[400],
//                     unselectedLabelColor: Colors.grey,
//                     tabs: [
//                       Tab(text: "Media"),
//                       Tab(text: "Files"),
//                       Tab(text: "Links"),
//                       Tab(text: "Groups"),
//                     ],
//                   ),
//                 ),
//                 pinned: true,
//               ),
//             ]

//     ));
//   }
// }

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate(this._tabBar);

//   final TabBar _tabBar;

//   @override
//   double get minExtent => _tabBar.preferredSize.height;
//   @override
//   double get maxExtent => _tabBar.preferredSize.height;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return DefaultTabController(length:4,
//       child: _tabBar,
//     );
//   }

//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return false;
//   }
// }

//import 'package:flutter/material.dart';
// import 'package:profile/gesture.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: Gesture(),
//     ),
//   );
// }

// NEXT PROGRAM TEST

// import 'package:flutter/material.dart';

// void main() {
//   runApp(Profile());
// }

// class Profile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//           primaryColorLight: Color.fromRGBO(82, 125, 163, 50),
//           primaryColorDark: Colors.black26),
//       home: MainCollapsingToolbar(),
//     );
//   }
// }

// class MainCollapsingToolbar extends StatefulWidget {
//   @override
//   _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
// }

// class _MainCollapsingToolbarState extends State<MainCollapsingToolbar> {
//   @override
//   Widget build(BuildContext context) {
//     final username = 'Tony Stark';
//     final lastseen = 'last seen recently';
//     final imgurl = 'assets/images/profilepic.jpeg';

//     return Scaffold(
//       body: DefaultTabController(
//         length: 2,
//         child: NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             return <Widget>[
//               SliverAppBar(
//                 automaticallyImplyLeading: true,
//                 leadingWidth: 25.0,
//                 leading: BackButton(
//                   onPressed: () {
//                     print('Back to chat screen');
//                   },
//                 ),
//                 actions: [
//                   IconButton(
//                     icon: Icon(Icons.videocam),
//                     onPressed: () {
//                       print('Video Call');
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.call),
//                     onPressed: () {
//                       print('Voice Call');
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.more_vert),
//                     onPressed: () {
//                       print('Menu Button');
//                     },
//                   ),
//                 ],
//                 expandedHeight: 300.0,
//                 floating: false,
//                 pinned: true,
//                 flexibleSpace: FlexibleSpaceBar(
//                     title: ListTile(
//                       title: Padding(
//                         padding: EdgeInsets.only(top: 30.0),
//                         child:Text(username,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18.0,
//                         ),),),
//                         subtitle:Text(lastseen,
//                         style:TextStyle(
//                           fontSize: 10,
//                           color: Colors.white70)) ,
//                       ),
//                     background: Image.asset(
//                       imgurl,
//                       fit: BoxFit.cover,
//                     )),
//               ),

//               SliverPersistentHeader(
//                 delegate: _SliverAppBarDelegate(
//                   TabBar(

//                     labelColor: Colors.blue[400],
//                     unselectedLabelColor: Colors.grey,
//                     tabs: [
//                       Tab(text: "Media"),
//                       Tab(text: "Files"),
//                       Tab(text: "Links"),
//                       Tab(text: "Groups"),
//                     ],
//                   ),
//                 ),
//                 pinned: true,
//               ),
//             ];
//           },
//           body: Center()
//           ),
//         ),

//     );
//   }
// }

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate(this._tabBar);

//   final TabBar _tabBar;

//   @override
//   double get minExtent => _tabBar.preferredSize.height;
//   @override
//   double get maxExtent => _tabBar.preferredSize.height;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return DefaultTabController(length:4,
//       child: _tabBar,
//     );
//   }

//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return false;
//   }
// }
