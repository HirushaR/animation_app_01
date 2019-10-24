import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        title: Text('ANIMATIOn'),
        
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go'),
          onPressed: (){
            Navigator.of(context).push(_createRoute());
          },
        ),
        
      ),
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Icon(Icons.search),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('page2'),
              onTap: (){
                 Navigator.of(context).push(_createRoute());
              },
            )
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
  var begin = Offset(0.0, 1.0); 
  var end = Offset.zero;
  var curve = Curves.ease;
  
  var tween = Tween(begin: begin, end: end);
  var curvedAnimation = CurvedAnimation(
   parent: animation,
   curve: curve,
  );

  return SlideTransition(
   position: tween.animate(curvedAnimation),
   child: child,
  );
},
  );
}

class Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SnackBarPage(),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: (){
          final SnackBar = prefix0.SnackBar(
            content: Text('Yey'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: (){},
            ),
          );
          Scaffold.of(context).showSnackBar(SnackBar);
        },
        child: Text('show Snackbar'),
      ),
    
        
    );
  }
}


