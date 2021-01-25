import 'package:flutter/material.dart'; 
 class Delegate extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return  SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(

                    labelColor: Colors.blue[400],
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: "Media"),
                      Tab(text: "Files"),
                      Tab(text: "Links"),
                      Tab(text: "Groups"),
                    ],
                  ),
                ),
                pinned: true,
  
            
         
          
       

    );
  }
}
  


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
