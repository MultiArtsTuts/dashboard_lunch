import 'dart:ui';
import 'dart:math' as math;

import 'package:dashboard_lunch/components/shadowed_text.dart';
import 'package:flutter/material.dart';

const double positionTop = 350;

class SaladDetail extends StatefulWidget {
  @override
  _SaladDetailState createState() => _SaladDetailState();
}

class _SaladDetailState extends State<SaladDetail> with SingleTickerProviderStateMixin {

  
  
  double get maxTop => 100;
  AnimationController _animationController;
  double lerp(double min, double max) => lerpDouble(min, max, _animationController.value);

  void _handleDragUpdate(DragUpdateDetails details) {
    _animationController.value -= details.primaryDelta / maxTop; //<-- Update the _animationController.value by the movement done by user.
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_animationController.isAnimating ||
        _animationController.status == AnimationStatus.completed) return;

    final double flingVelocity = details.velocity.pixelsPerSecond.dy / maxTop; //<-- calculate the velocity of the gesture
    if (flingVelocity < 0.0)
      _animationController.fling(velocity: math.max(2.0, -flingVelocity)); //<-- either continue it upwards
    else if (flingVelocity > 0.0)
      _animationController.fling(velocity: math.min(-2.0, -flingVelocity)); //<-- or continue it downwards
    else
      _animationController.fling(velocity: _animationController.value < 0.5 ? -2.0 : 2.0); //<-- or just continue to whichever edge is closer
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000)
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<String> _ingredients = [
    '500g de feijão cavalo',
    '2L de àgua',
    '2 colheres (sopa) de óleo',
    '2 colheres (sopa) de sal',
    '2 tomates'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F7FD),
      body: Stack(
        children: <Widget>[
          // Image background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 400,
              decoration: BoxDecoration(                
                image: DecorationImage(
                  image: AssetImage('assets/images/salada.jpg'),
                  fit: BoxFit.cover
                ),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                  colors: [Colors.black54, Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                ),
                ),
              ),
            ),
          ),
          
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, snapshot) {
              return Positioned(
                top: lerp(positionTop, maxTop),
                left: 0,
                right: 0,
                child: GestureDetector(
                  onVerticalDragUpdate: _handleDragUpdate,  //<-- Add verticalDragUpdate callback
                  onVerticalDragEnd: _handleDragEnd,
                  child: Container(
                    padding: EdgeInsets.only(top:40),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Color(0xFFF9F7FD),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      )
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: ShadowedText(
                            text: 'Breakfast High Protein Berry Smooth Salad Time!',
                            color: Colors.pink[700],
                            fontSize: 28,
                            offset: Offset(1.5, 1.5),
                            shadowOpacity: .3,
                            fontWeight: FontWeight.w400,
                          )
                        ),
                        
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .75,
                          child: ListView(
                            children: <Widget>[
                              SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            '15 min, 650 calories per serving',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Wrap(
                          alignment: WrapAlignment.center,
                          runSpacing: -15, // Space vertical
                          spacing: -5,
                          children: <Widget>[
                            _customChips(
                              title: 'Calories: 322'
                            ),
                            _customChips(
                              title: 'Fat: 322'
                            ),
                            _customChips(
                              title: 'Protein: 16.5'
                            ),
                            _customChips(
                                title: 'Carbohydrate: 60'
                              ),
                            _customChips(
                              title: 'Cholesterol: 35'
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ShadowedText(
                                text: 'Ingredients',
                                color: Colors.black54,
                                fontSize: 28,
                                offset: Offset(1.5, 1.5),
                                shadowOpacity: .3,
                                shadowColor: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 100,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: _ingredients.length,
                                  itemBuilder: (context, i){
                                    var item = _ingredients[i];
                                    return Row(
                                      children: <Widget>[
                                        Icon(Icons.brightness_1, size: 8, color: Colors.grey,),
                                        Text(
                                        ' ' + item,
                                        style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Relacionados',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.only(left: 8, bottom: 20),
                          width: double.infinity,
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              _listContent(
                                assetImg: 'assets/images/salad4.jpg',
                              ),
                              _listContent(
                                assetImg: 'assets/images/salad1.jpg',
                              ),
                              _listContent(
                                assetImg: 'assets/images/salad3.jpg',
                              ),
                              _listContent(
                                assetImg: 'assets/images/salad2.jpg',
                              )
                            ],
                          ),
                        )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          ),
          
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: (){
                      Navigator.of(context).pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.bookmark_border),
                    color: Colors.white,
                    onPressed: (){},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _customChips({String title}){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        label: Text(title, style: TextStyle(color: Colors.grey),),
        elevation: 6,
        shadowColor: Colors.black26,
        backgroundColor: Colors.white,
      ),
    );
  }

  _listContent({String assetImg}) {
    return Row(
      children: <Widget>[
        Container(
          height: 160,
          width: 130,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(assetImg),
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(12)
          ),          
        ),
        SizedBox(width: 20,)
      ],
    );
  }
}