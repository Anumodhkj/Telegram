
import 'package:flutter/material.dart';

class drawerlist extends StatelessWidget {

   final IconData iconmake;
   final String   listname;
   final void Function() whenclick;

 drawerlist({this.iconmake, this.listname,this.whenclick});


  @override
  Widget build(BuildContext context) {
    return ListTile( 
          leading: Icon(iconmake),
          title: Text(listname),
          onTap:whenclick,
            );
          }
    
  }
