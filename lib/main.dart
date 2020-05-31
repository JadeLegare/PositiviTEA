import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'posativiTEA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class OptionsPage extends StatelessWidget {
 @override 
 Widget build (BuildContext context){
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Options page 1"),
     ),
     body: 
     Center (
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
            GestureDetector(
              child: Container(
              margin: const EdgeInsets.all(5.0),              
              width: 375,
              height: 175,
              decoration: BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                  image: AssetImage("assets/images/distract.png"),
                  fit: BoxFit.cover
                ),
              ),
              ),
              onTap: (){
                Navigator.push(
                  context, 
                  new MaterialPageRoute(builder: (context) => new DistractPage()),
                );
              },
            ),
            GestureDetector(
              child: Container(
              margin: const EdgeInsets.all(5.0),              
              width: 375,
              height: 175,
              decoration: BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                  image: AssetImage("assets/images/soothe.png"),
                  fit: BoxFit.cover
                ),
              ),
              ),
              onTap: (){
                Navigator.push(
                  context, 
                  new MaterialPageRoute(builder: (context) => new SoothePage()),
                );
              },
            ),
            GestureDetector(
              child: Container(
              margin: const EdgeInsets.all(5.0),              
              width: 375,
              height: 175,
              decoration: BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                  image: AssetImage("assets/images/improve.png"),
                  fit: BoxFit.cover
                ),
              ),
              ),
              onTap: (){
                Navigator.push(
                  context, 
                  new MaterialPageRoute(builder: (context) => new ImprovePage()),
                );
              },
            ),
          ],
      ),
     ),
   );
 }
}

class DistractPage extends StatefulWidget{
  const DistractPage({Key key}) : super(key : key);
  @override 
  _DistractPageState createState() => _DistractPageState();
}

class _DistractPageState extends State<DistractPage>{
  Map<String, bool> masterDistractValues = {
    'Clean a room in your house': false, 
    'Bake/cook a favourite food': false,
    'Listen to music': false,
    'Build something': false,
    'Help a friend or family member': false, 
    'Make something nice for someone else': false,
    'Watch an emotional TV show': false, 
    'Listen to emotion music': false,
    'Leave the situation for awhile': false, 
    'Dont think about the painful situation' : false,
    'Repeat songs in your mind': false,
    'Watch TV or read': false,
  };
  Map<String, bool> activitiesValues = {
    'Clean a room in your house': false, 
    'Bake/cook a favourite food': false,
    'Listen to music': false,
    'Build something': false,
  };
  Map<String, bool> emotionValues = {
    'Help a friend or family member': false, 
    'Make something nice for someone else': false,
    'Watch an emotional TV show': false, 
    'Listen to emotion music': false,
  };
  Map<String, bool> thoughtValues = {
    'Leave the situation for awhile': false, 
    'Dont think about the painful situation' : false,
    'Repeat songs in your mind': false,
    'Watch TV or read': false,
  };

  @override 
 Widget build (BuildContext context){
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Distract"),
     ),
     body: Column(
       children: <Widget>[
         Container(
           height: 175,
           width: MediaQuery.of(context).size.width,
           child: Row(
             children: <Widget>[
              Container(
              child: new Image.asset(
                'assets/images/distract.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                ),
              ),
             ],
             ),
         ),
        /*
        //ACTIVITES HEADING
         Container(
           padding: EdgeInsets.all(4.0),
           color: Color.fromRGBO(124, 102, 123, .7),
           width: MediaQuery.of(context).size.width,
           alignment: Alignment(0.0, 0.0),
            child: Text(
                  "Activities",
                  style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
         ),
         */
         Expanded(
           child: ListView(

            children: masterDistractValues.keys.map((String key){
          
              return new CheckboxListTile(
                title: new Text(key),
                value: masterDistractValues[key],
                onChanged: (bool value){
                  setState(() {
                    //TODO: update home screen values and animations with checked tasks
                    masterDistractValues[key] = value;
                    if(value){
                      //TODO: add pop up screen to say "you completed _BLANK_. click to return to home screen"
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                  });
                },
              );
            },
            ).toList(),
           )
         ),
        /*
        // CONTRIBUTIONS AND EMOTIONS
         Container(
           padding: EdgeInsets.all(4.0),
           color: Color.fromRGBO(196, 143, 145, .7),
           width: MediaQuery.of(context).size.width,
           alignment: Alignment(0.0, 0.0),
            child: Text(
                  "Contributions & Emotions",
                  style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
         ),
         
         Expanded(
           child: ListView(
            children: emotionValues.keys.map((String key){
          
              return new CheckboxListTile(
                title: new Text(key),
                value: emotionValues[key],
                onChanged: (bool value){
                  setState(() {
                    emotionValues[key] = value;
                  });
                },
              );
              
            }).toList(),
           )
         ),
         */

        /*
        //PUSHING AWAY AND THOUGHTS
         Container(
           padding: EdgeInsets.all(4.0),
           color: Color.fromRGBO(245, 195, 171, .7),
           width: MediaQuery.of(context).size.width,
           alignment: Alignment(0.0, 0.0),
            child: Text(
                  "Pushing Away & Thoughts",
                  style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),
                ),
         ),
         
         Expanded(
           child: ListView(
            children: thoughtValues.keys.map((String key){
          
              return new CheckboxListTile(
                title: new Text(key),
                value: thoughtValues[key],
                onChanged: (bool value){
                  setState(() {
                    thoughtValues[key] = value;
                  });
                },
              );
            }).toList(),
           )
         ),
         */
       ],
     ),
       
      

      /*child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
            Container(
              child: new Image.asset(
                'assets/images/distract.png',
                fit: BoxFit.cover,
                height: 200,
                width: 460,
              ),
            ),

          ],
      ), */
   );
 }
}

class SoothePage extends StatefulWidget{
  const SoothePage({Key key}) : super(key : key);
  @override 
  _SoothePageState createState() => _SoothePageState();
}

class _SoothePageState extends State<SoothePage>{
  Map<String, bool> visionValues = {
    'Clean a room in your house': false, 
    'Bake/cook a favourite food': false,
    'Listen to music': false,
    'Build something': false,
  };
  Map<String, bool> smellValues = {
    'Help a friend or family member': false, 
    'Make something nice for someone else': false,
    'Watch an emotional TV show': false, 
    'Listen to emotion music': false,
  };
  Map<String, bool> hearingValues = {
    'Leave the situation for awhile': false, 
    'Dont think about the painful situation' : false,
    'Repeat songs in your mind': false,
    'Watch TV or read': false,
  };
  Map<String, bool> touchValues = {
    'Leave the situation for awhile': false, 
    'Dont think about the painful situation' : false,
    'Repeat songs in your mind': false,
    'Watch TV or read': false,
  };
  Map<String, bool> tasteValues = {
    'Leave the situation for awhile': false, 
    'Dont think about the painful situation' : false,
    'Repeat songs in your mind': false,
    'Watch TV or read': false,
  };

  @override 
 Widget build (BuildContext context){
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Self-Soothe"),
     ),
     body: Column(
       children: <Widget>[
         Container(
           height: 175,
           width: MediaQuery.of(context).size.width,
           child: Row(
             children: <Widget>[
              Container(
              child: new Image.asset(
                'assets/images/soothe.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                ),
              ),
             ],
             ),
         ),
        
         Container(
           padding: EdgeInsets.all(4.0),
           color: Color.fromRGBO(124, 102, 123, .7),
           width: MediaQuery.of(context).size.width,
           alignment: Alignment(0.0, 0.0),
            child: Text(
                  "Vision",
                  style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
         ),
         
         Expanded(
           child: ListView(
            children: visionValues.keys.map((String key){
          
              return new CheckboxListTile(
                title: new Text(key),
                value: visionValues[key],
                onChanged: (bool value){
                  setState(() {
                    visionValues[key] = value;
                  });
                },
              );
            }).toList(),
           )
         ),

         Container(
           padding: EdgeInsets.all(4.0),
           color: Color.fromRGBO(196, 143, 145, .7),
           width: MediaQuery.of(context).size.width,
           alignment: Alignment(0.0, 0.0),
            child: Text(
                  "Smell",
                  style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
         ),
         
         Expanded(
           child: ListView(
            children: smellValues.keys.map((String key){
          
              return new CheckboxListTile(
                title: new Text(key),
                value: smellValues[key],
                onChanged: (bool value){
                  setState(() {
                    smellValues[key] = value;
                  });
                },
              );
            }).toList(),
           )
         ),

         Container(
           padding: EdgeInsets.all(4.0),
           color: Color.fromRGBO(245, 195, 171, .7),
           width: MediaQuery.of(context).size.width,
           alignment: Alignment(0.0, 0.0),
            child: Text(
                  "Hearing",
                  style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),
                ),
         ),
         
         Expanded(
           child: ListView(
            children: hearingValues.keys.map((String key){
          
              return new CheckboxListTile(
                title: new Text(key),
                value: hearingValues[key],
                onChanged: (bool value){
                  setState(() {
                    hearingValues[key] = value;
                  });
                },
              );
            }).toList(),
           )
         ),

         Container(
           padding: EdgeInsets.all(4.0),
           color: Color.fromRGBO(245, 195, 171, .7),
           width: MediaQuery.of(context).size.width,
           alignment: Alignment(0.0, 0.0),
            child: Text(
                  "Touch",
                  style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),
                ),
         ),
         
         Expanded(
           child: ListView(
            children: touchValues.keys.map((String key){
          
              return new CheckboxListTile(
                title: new Text(key),
                value: touchValues[key],
                onChanged: (bool value){
                  setState(() {
                    touchValues[key] = value;
                  });
                },
              );
            }).toList(),
           )
         ),

         Container(
           padding: EdgeInsets.all(4.0),
           color: Color.fromRGBO(245, 195, 171, .7),
           width: MediaQuery.of(context).size.width,
           alignment: Alignment(0.0, 0.0),
            child: Text(
                  "Taste",
                  style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),
                ),
         ),
         
         Expanded(
           child: ListView(
            children: tasteValues.keys.map((String key){
          
              return new CheckboxListTile(
                title: new Text(key),
                value: tasteValues[key],
                onChanged: (bool value){
                  setState(() {
                    tasteValues[key] = value;
                  });
                },
              );
            }).toList(),
           )
         ),

       ],
     ),
   );
 }
}
/*
class SoothePage extends StatelessWidget{
  @override 
 Widget build (BuildContext context){
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Self-Soothe"),
     ),
     body: 
     Center (
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
            Container(
              child: new Image.asset(
                'assets/images/soothe.png',
                fit: BoxFit.cover,
                height: 200,
                width: 460,
              ),
            ),
          ],
      ),
     ),
   );
 }
}
*/

class ImprovePage extends StatelessWidget{
  @override 
 Widget build (BuildContext context){
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Improve the Moment"),
     ),
     body: 
     Center (
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
            Container(
              child: new Image.asset(
                'assets/images/improve.png',
                fit: BoxFit.cover,
                height: 200,
                width: 460,
              ),
            ),

          ],
      ),
     ),
   );
 }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _cupsCounter = 0;
  var screenText = "No Tea";
  var _animation = "Empty";
  bool cupOne = false;
  bool cupTwo = false;
  bool cupThree = false;
  bool cupFour = false;
  bool cupFive = false;
  //TODO: Restructure counter method and class to access in other classes
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      if(_counter == 0){
        screenText = "No Tea";
        _animation = "Empty";
      }
      else if(_counter == 1){
        _animation = "oneThird_filling";
        screenText = "Great Start! Keep Going!";
        
        
      }
      else if(_counter == 2){
        screenText = "Amazing job! You're so close!";
        _animation = "twoThird_filling";

      }
      else if(_counter == 3){
        screenText = "Congrats! You accomplished your daily goal!";
        _animation = "threeThird_filling";
        _cupsCounter ++;
        if(_cupsCounter == 0){
          cupOne = false;
          cupTwo = false;
          cupThree = false;
          cupFour = false;
          cupFive = false;
        }
        if(_cupsCounter >= 1){
          cupOne = true;
        }
        if(_cupsCounter >= 2){
          cupTwo = true;
        }
        if(_cupsCounter >= 3){
          cupThree = true;
        }
        if(_cupsCounter >= 4){
          cupFour = true;
        }
        if(_cupsCounter >= 5){
          cupFive = true;
          _cupsCounter = 0;
        }
        
      }
      else if(_counter == 4){
        screenText = "No Tea";
        _animation = "Empty";
        _counter = 0;
      }
      Timer(Duration(seconds: 10), () {
        setState((){
          if(_counter == 1){
            _animation = "oneThird";
          }
          if(_counter == 2){
          _animation = "twoThird";
          }
          if(_counter == 3){
            _animation = "Full";
          }
        });
      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: 
      Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Cups of Tea: ', 
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Visibility(
                child: Icon(
                Icons.cloud_circle,
                color: Colors.pinkAccent,
                size: 30.0,
                ),
                visible: cupOne,
                ),
                Visibility(
                child: Icon(
                Icons.cloud_circle,
                color: Colors.pinkAccent,
                size: 30.0,
                ),
                visible: cupTwo,
                ),
                Visibility(
                child: Icon(
                Icons.cloud_circle,
                color: Colors.pinkAccent,
                size: 30.0,
                ),
                visible: cupThree,
                ),
                 Visibility(
                child: Icon(
                Icons.cloud_circle,
                color: Colors.pinkAccent,
                size: 30.0,
                ),
                visible: cupFour,
                ),
                 Visibility(
                child: Icon(
                Icons.cloud_circle,
                color: Colors.pinkAccent,
                size: 30.0,
                ),
                visible: cupFive,
                ),
              ],
            ),
            
            Expanded(
              child:   FlareActor(
              "assets/animations/TeaCup.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: _animation,
              ),
            ),
            Text(
              '$screenText',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
             IconButton(
              icon: Icon(Icons.view_list),
              onPressed: (){
                Navigator.push(
                  context, 
                  new MaterialPageRoute(builder: (context) => new OptionsPage()),
                );
              },
            ),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Helper{
  int helperCounter = 0;

  void incrementCounter(){
    helperCounter++;

  
  }
}