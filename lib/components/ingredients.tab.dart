import 'package:flutter/material.dart';

class IngredientsTab extends StatefulWidget {
  @override
  _IngredientsTabState createState() => _IngredientsTabState();
}

class _IngredientsTabState extends State<IngredientsTab>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  List<String> _ingredients = [
    '500g de feijão cavalo',
    '2L de àgua',
    '2 colheres (sopa) de óleo',
    '2 colheres (sopa) de sal',
    '2 tomates'
  ];

  List<String> _preparo = [
    'Lave o feijão. Leve ao fogo em uma panela de pressão com a água e deixe cozinhar por aproximadamente 30 minutos.',
    'Deixe perder a pressão, abra, tempere com o óleo e o sal.',
    'Escorra o feijão e reserve numa travessa e leve a geladeira.',
    'Na travessa do feijão acrescente os ingredientes, tomate, cebola, cheiro verde, azeite de oliva e o vinagre e mexa muito bem, misturando bem todos os ingredientes.',
    'Se preferir servir mais gelado, volte a geladeira por mais 30 minutos, caso não, é só servir e pronto!'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // color: Colors.yellow,
      child: Column(
        children: <Widget>[
          TabBar(
            labelColor: Colors.blueGrey,
            indicatorColor: Colors.cyan,
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                text: 'Ingredients',
              ),
              Tab(
                text: 'Modo de preparo',
              )
            ],
          ),
          Container(
            height: 200,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView.builder(
                  itemCount: _ingredients.length,
                  itemBuilder: (context, i){
                    var item = _ingredients[i];
                    return Row(
                      children: <Widget>[
                        Icon(Icons.brightness_1, size: 8, color: Colors.grey,),
                        Text(
                          ' ' + item
                        ),
                      ],
                    );
                  },
                ),

                ListView.builder(
                  itemCount: _preparo.length,
                  itemBuilder: (context, i){
                    var item = _preparo[i];
                    return Text(
                      '${i+1}. ' + item,
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      style: TextStyle(height: 1.2),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}