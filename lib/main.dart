import 'package:dashboard_lunch/components/shadowed_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'components/gradiente.cirular.progress.indicator.dart';
import 'pages/salad.detail.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F7FD),
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),),
        backgroundColor: Color(0xFFF9F7FD),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 35,
              height: 35,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage('https://avatars0.githubusercontent.com/u/17994738?s=40&v=4'),
                  fit: BoxFit.cover
                )
              ),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(15),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: RichText(
                text: TextSpan(
                  text: 'Welcome back, ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w400
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'João',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400
                      )
                    )
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(2.5, -1.5),
            child: Container(
              // color: Colors.red,
              height: 250,
              child: Image.asset('assets/images/bg_salad.png', fit: BoxFit.cover,),
            ),
          ),
          Align(
            alignment: Alignment(-2.5, 1),
            child: Container(
              // color: Colors.red,
              height: 250,
              child: Image.asset('assets/images/bg_salad.png', fit: BoxFit.cover,),
            ),
          ),
          ListView(
            children: <Widget>[
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  color: Colors.white60,
                  padding: EdgeInsets.symmetric(vertical:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Todays Meals',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        'Track Food >',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 8, bottom: 20),
                width: double.infinity,
                height: 200,
                // color: Colors.pinkAccent,
                child: ListView(
                  padding: EdgeInsets.only(bottom: 8),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _listContent(
                      assetImg: 'assets/images/salad4.jpg',
                      title: 'Feijão cavalo',
                      rating: 3.7
                    ),
                    _listContent(
                      assetImg: 'assets/images/salada.jpg',
                      title: 'Salada reserva',
                      rating: 4.5
                    ),
                    _listContent(
                      assetImg: 'assets/images/salad1.jpg',
                      title: 'Breakfast',
                      rating: 4.5
                    ),
                    _listContent(
                      assetImg: 'assets/images/salad3.jpg',
                      title: 'Lunch',
                      rating: 4.5
                    ),
                    _listContent(
                      assetImg: 'assets/images/salad2.jpg',
                      title: 'Dinner',
                      rating: 4.5
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Progress Last Weeks',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      'Current >',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .70,
                child: GridView(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  physics: NeverScrollableScrollPhysics(),
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .75,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18
                  ),
                  children: <Widget>[
                    Material(
                      elevation: 8,
                      color: Colors.white.withOpacity(.86),
                      shadowColor: Colors.black38,
                      borderOnForeground: true,
                      borderRadius: BorderRadius.circular(12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SaladDetail()
                            )
                          );
                        },
                        child: Container(
                          // width: 180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Calories'
                                    ),
                                    Icon(Icons.apps)
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                width: 160,
                                height: 190,
                                // color: Colors.orange,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    GradientCircularProgressIndicator(
                                      colors: [Color(0xFF7FED96), Colors.lightGreen, Color(0xFF7FED96)],
                                      radius: 55,
                                      stokeWidth: 8,
                                      strokeCapRound: true,
                                      value: .65,
                                      totalAngle: 7,
                                      backgroundColor: Colors.green[50],
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Kcal\n',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w700
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '75%',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400
                                            )
                                          )
                                        ]
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    Material(
                      elevation: 8,
                      color: Colors.white.withOpacity(.86),
                      shadowColor: Colors.black38,
                      borderOnForeground: true,
                      borderRadius: BorderRadius.circular(12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SaladDetail()
                            )
                          );
                        },
                        child: Container(
                          width: 180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Fats'
                                    ),
                                    Icon(Icons.apps)
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                width: 160,
                                height: 190,
                                // color: Colors.orange,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    GradientCircularProgressIndicator(
                                      colors: [Colors.pink[700], Colors.pink[200]],
                                      radius: 55,
                                      stokeWidth: 8,
                                      strokeCapRound: true,
                                      value: .23,
                                      totalAngle: 7,
                                      backgroundColor: Colors.pink[50],
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Fats\n',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.pink[700],
                                          fontWeight: FontWeight.w700
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '25%',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400
                                            )
                                          )
                                        ]
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  
                    Material(
                      elevation: 8,
                      color: Colors.white.withOpacity(.86),
                      shadowColor: Colors.black38,
                      borderOnForeground: true,
                      borderRadius: BorderRadius.circular(12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SaladDetail()
                            )
                          );
                        },
                        child: Container(
                          width: 180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Carbs'
                                    ),
                                    Icon(Icons.apps)
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                width: 160,
                                height: 190,
                                // color: Colors.orange,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    GradientCircularProgressIndicator(
                                      colors: [Colors.brown[700], Colors.brown[200]],
                                      radius: 55,
                                      stokeWidth: 8,
                                      strokeCapRound: true,
                                      value: .63,
                                      totalAngle: 7,
                                      backgroundColor: Colors.brown[100],
                                    ),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: 'Carbs\n',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.brown[700],
                                          fontWeight: FontWeight.w700
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '63%',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ]
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    Material(
                      elevation: 8,
                      shadowColor: Colors.black38,
                      color: Colors.white.withOpacity(.86),
                      borderOnForeground: true,
                      borderRadius: BorderRadius.circular(12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SaladDetail()
                            )
                          );
                        },
                        child: Container(
                          width: 180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Carbs'
                                    ),
                                    Icon(Icons.apps)
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                width: 160,
                                height: 190,
                                // color: Colors.orange,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    GradientCircularProgressIndicator(
                                      colors: [Colors.cyan[700], Colors.cyan[200]],
                                      radius: 55,
                                      stokeWidth: 8,
                                      strokeCapRound: true,
                                      value: .41,
                                      totalAngle: 7,
                                      backgroundColor: Colors.cyan[50],
                                    ),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: 'Protein\n',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.cyan[700],
                                          fontWeight: FontWeight.w700
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '41%',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ]
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        elevation: 5,
        child: BottomNavigationBar(          
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Planner')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              title: Text('Saved')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text('Menu')
            ),
          ],
          
          selectedItemColor: Colors.blueGrey,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          currentIndex: 0,
          onTap: (index) {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: (){},
        foregroundColor: Colors.white,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightBlueAccent[100],
                Colors.blue[700]
              ]
            ),
            shape: BoxShape.circle
          ),
          child: Icon(Icons.add),
        )
      ),
    );
  }

  _listContent({String assetImg, String title, double rating}) {
    return Row(
      children: <Widget>[
        Material(
          elevation: 5,
          shadowColor: Colors.black26,
          borderOnForeground: true,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 160,
            width: 130,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              // color: Colors.pink,
              image: DecorationImage(
                image: AssetImage(assetImg),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Container(
                width: double.infinity,
                height: 40,
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  )
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    ShadowedText(
                      text: title,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[900],
                      shadowColor: Colors.black26,
                      shadowOpacity: .2,
                      offset: Offset(1.5, 1.5),
                      letterSpacing: .6,
                    ),
                    Transform.translate(
                      offset: Offset(80, 20),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.star, size: 16, color: Colors.amber,),
                          SizedBox(width: 2,),
                          Text(
                          '$rating',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .6
                          ),
                    ),
                        ],
                      ),
                    )
                  ],
                )
              ),
            ),
          ),
        ),
        SizedBox(width: 20,)
      ],
    );
  }
}

