import 'package:LifeInColorado/classes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

const double _PageMaxWidth = 500.0;

final ThemeData _themeData = new ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  accentColor: Colors.blue,
);

class AnimalStyle extends TextStyle {
  const AnimalStyle({
    double fontSize: 12.0,
    FontWeight fontWeight,
    Color color: Colors.white,
    double letterSpacing,
    double height,
  }) : super(
    inherit: false,
    color: color,
    fontFamily: 'Raleway',
    fontSize: fontSize,
    fontWeight: fontWeight,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: letterSpacing,
    height: height,
  );
}


//======================================================================== MyApp
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var _routes = <String, WidgetBuilder>{
      "/mammals": (BuildContext context) =>
      new MammalsPage(mammalList: mammals),
      "/birds": (BuildContext context) =>
      new BirdsPage(birdList: birds),
      "/reptiles": (BuildContext context) =>
      new ReptilesPage(reptileList: reptiles),
    };
    return new MaterialApp(
      title: "Life In Colorado",
      theme: _themeData,
      home: new HomePage(),
      routes: _routes,
    );
  }
}


//==================================================================== Home Page
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Life In Colorado"),
      ),
      body: new ListView(
        children: [
          new Image.asset('images/ram.jpg',
              width: 600.0,
              height: 300.0,
              fit: BoxFit.cover),
          new Padding(padding: const EdgeInsets.all(16.0),),
          new RaisedButton(
              child: new Text("Mammals", textScaleFactor: 2.0),
              onPressed: _onPressedMammals),
          new Padding(padding: const EdgeInsets.all(16.0),),
          new RaisedButton(
              child: new Text("Birds", textScaleFactor: 2.0),
              onPressed: _onPressedBirds),
          new Padding(padding: const EdgeInsets.all(16.0),),
          new RaisedButton(
              child:
              new Text("Reptiles", textScaleFactor: 2.0),
              onPressed: _onPressedReptiles),
        ],
      ),
    );
  }

  void _onPressedMammals() {
    Navigator.of(context).pushNamed("/mammals");
  }

  void _onPressedBirds() {
    Navigator.of(context).pushNamed("/birds");
  }

  void _onPressedReptiles() {
    Navigator.of(context).pushNamed("/reptiles");
  }
}


//========================================================= List of Mammals Page
class MammalsPage extends StatefulWidget {
  const MammalsPage({Key key, this.mammalList}) : super(key: key);
  final List<Mammal> mammalList;

  @override
  _MammalsPageState createState() => new _MammalsPageState();
}

class _MammalsPageState extends State<MammalsPage> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    return new Scaffold(
      appBar: new AppBar(title: new Text("Mammals")),
      body: new CustomScrollView(
        slivers: <Widget>[
          _buildBody(context, statusBarHeight),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, double statusBarHeight) {
    final EdgeInsets padding = const EdgeInsets.all(8.0);
    return new SliverPadding(
      padding: padding,
      sliver: new SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _PageMaxWidth,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            final Mammal mammal = widget.mammalList[index];
            return new AnimalCard(
              animal: mammal,
              onTap: () {
                showMammalPage(context, mammal);
              },
            );
          },
          childCount: widget.mammalList.length,
        ),
      ),
    );
  }

  void showMammalPage(BuildContext context, Animal animal) {
    Navigator.push(context, new MaterialPageRoute<Null>(
      settings: const RouteSettings(name: "/Mammals/mammal"),
      builder: (BuildContext context) {
        return new Theme(
          data: _themeData.copyWith(platform: Theme
              .of(context)
              .platform),
          child: new MammalPage(mammal: animal),
        );
      },
    ));
  }
}


//=========================================================== List of Birds Page
class BirdsPage extends StatefulWidget {
  const BirdsPage({Key key, this.birdList}) : super(key: key);
  final List<Bird> birdList;

  @override
  _BirdsPageState createState() => new _BirdsPageState();
}

class _BirdsPageState extends State<BirdsPage> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    return new Scaffold(
      appBar: new AppBar(title: new Text("Birds")),
      body: new CustomScrollView(
        slivers: <Widget>[
          _buildBody(context, statusBarHeight),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, double statusBarHeight) {
    final EdgeInsets padding = const EdgeInsets.all(8.0);
    return new SliverPadding(
      padding: padding,
      sliver: new SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _PageMaxWidth,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            final Bird bird = widget.birdList[index];
            return new AnimalCard(
              animal: bird,
              onTap: () {
                showBirdPage(context, bird);
              },
            );
          },
          childCount: widget.birdList.length,
        ),
      ),
    );
  }

  void showBirdPage(BuildContext context, Animal animal) {
    Navigator.push(context, new MaterialPageRoute<Null>(
      settings: const RouteSettings(name: "/Birds/bird"),
      builder: (BuildContext context) {
        return new Theme(
          data: _themeData.copyWith(platform: Theme
              .of(context)
              .platform),
          child: new BirdPage(bird: animal),
        );
      },
    ));
  }
}


//======================================================== List of Reptiles Page
class ReptilesPage extends StatefulWidget {
  const ReptilesPage({Key key, this.reptileList}) : super(key: key);
  final List<Reptile> reptileList;

  @override
  _ReptilesPageState createState() => new _ReptilesPageState();
}

class _ReptilesPageState extends State<ReptilesPage> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    return new Scaffold(
      appBar: new AppBar(title: new Text("Reptiles")),
      body: new CustomScrollView(
        slivers: <Widget>[
          _buildBody(context, statusBarHeight),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, double statusBarHeight) {
    final EdgeInsets padding = const EdgeInsets.all(8.0);
    return new SliverPadding(
      padding: padding,
      sliver: new SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _PageMaxWidth,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            final Reptile reptile = widget.reptileList[index];
            return new AnimalCard(
              animal: reptile,
              onTap: () {
                showReptilePage(context, reptile);
              },
            );
          },
          childCount: widget.reptileList.length,
        ),
      ),
    );
  }

  void showReptilePage(BuildContext context, Animal animal) {
    Navigator.push(context, new MaterialPageRoute<Null>(
      settings: const RouteSettings(name: "/Reptiles/reptile"),
      builder: (BuildContext context) {
        return new Theme(
          data: _themeData.copyWith(platform: Theme
              .of(context)
              .platform),
          child: new ReptilePage(reptile: animal),
        );
      },
    ));
  }
}


//================================================================== Animal Card
class AnimalCard extends StatelessWidget {
  final TextStyle titleStyle = const AnimalStyle(
      fontSize: 24.0, fontWeight: FontWeight.w600);
  final TextStyle habitatStyle = const AnimalStyle(
      fontWeight: FontWeight.w500, color: Colors.white70);

  const AnimalCard({ Key key, this.animal, this.onTap }) : super(key: key);

  final Animal animal;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onTap,
      child: new Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Hero(
                tag: animal.image,
                child: new Image.asset(animal.image, fit: BoxFit.contain)
            ),
            new Expanded(
              child: new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(16.0),
                  ),
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(animal.name, style: titleStyle,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis),
                        new Text(animal.habitat, style: habitatStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//========================================================== Mammal Display Page
class MammalPage extends StatefulWidget {
  const MammalPage({ Key key, this.mammal }) : super(key: key);

  final Mammal mammal;

  @override
  _MammalPageState createState() => new _MammalPageState();
}

class _MammalPageState extends State<MammalPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextStyle animalStyle = const AnimalStyle(
      fontSize: 15.0, color: Colors.black54, height: 24.0 / 15.0);

  double _getAppBarHeight(BuildContext context) =>
      MediaQuery
          .of(context)
          .size
          .height * 0.3;

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = _getAppBarHeight(context);
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    final bool fullWidth = (screenSize.width < _PageMaxWidth);
    return new Scaffold(
      key: _scaffoldKey,
      body: new Stack(
        children: <Widget>[
          new Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height: appBarHeight + 28.0,
            child: new Hero(
              tag: widget.mammal.image,
              child: new Image.asset(
                widget.mammal.image,
                fit: fullWidth ? BoxFit.fitWidth : BoxFit.cover,
              ),
            ),
          ),
          new CustomScrollView(
            slivers: <Widget>[
              new SliverAppBar(
                expandedHeight: appBarHeight - 28.0,
                backgroundColor: Colors.transparent,
                flexibleSpace: new FlexibleSpaceBar(
                  background: new DecoratedBox(
                    decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                        begin: const FractionalOffset(0.5, 0.0),
                        end: const FractionalOffset(0.5, 0.40),
                        colors: <Color>[
                          const Color(0x60000000), const Color(0x00000000)],
                      ),
                    ),
                  ),
                ),
              ),
              new SliverToBoxAdapter(
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(top: 28.0),
                      width: fullWidth ? null : _PageMaxWidth,
                      child: new MammalSheet(mammal: widget.mammal),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MammalSheet extends StatelessWidget {
  final TextStyle titleStyle = const AnimalStyle(fontSize: 45.0);
  final TextStyle descriptionStyle = const AnimalStyle(
      fontSize: 15.0, color: Colors.black54, height: 24.0 / 15.0);
  final TextStyle itemStyle = const AnimalStyle(
      fontSize: 20.0, height: 24.0 / 15.0);
  final TextStyle itemTitleStyle = new AnimalStyle(
      fontSize: 20.0, color: _themeData.accentColor, height: 24.0 / 15.0);
  final TextStyle headingStyle = const AnimalStyle(
      fontSize: 16.0, fontWeight: FontWeight.bold, height: 24.0 / 15.0);

  MammalSheet({ Key key, this.mammal }) : super(key: key);


  final Mammal mammal;

  @override
  Widget build(BuildContext context) {
    const double topPadding = 30.0;
    return new Material(
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: new Table(
            columnWidths: <int, TableColumnWidth>{
              0: const FixedColumnWidth(100.0)
            },
            children: <TableRow>[
              new TableRow(
                  children: <Widget>[
                    new TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: new Text("Name:", style: itemTitleStyle)
                    ),
                    new TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: new Text(mammal.name, style: titleStyle)
                    ),
                  ]
              ),
              new TableRow(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text("Habitat:", style: itemTitleStyle)
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text(mammal.habitat, style: itemStyle)
                    ),
                  ]
              ),
              new TableRow(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text("Weight:", style: itemTitleStyle)
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text(mammal.weight.toString() + " lbs (" +
                            mammal.lbstokg(mammal.weight).toString() + " kg)", style: itemStyle)
                    ),
                  ]
              ),
              new TableRow(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text("Gestation:", style: itemTitleStyle)
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text(mammal.gestationPeriod, style: itemStyle)
                    ),
                  ]
              ),
              new TableRow(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text("Hair Color:", style: itemTitleStyle)
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text(mammal.hairColor, style: itemStyle)
                    ),
                  ]
              ),
              new TableRow(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text("Lays \nEggs?:", style: itemTitleStyle)
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text(mammal.laysEggs.egg(), style: itemStyle)
                    ),
                  ]
              ),
            ]
        ),
      ),
    );
  }
}


//============================================================ Bird Display Page
class BirdPage extends StatefulWidget {
  const BirdPage({ Key key, this.bird }) : super(key: key);

  final Bird bird;

  @override
  _BirdPageState createState() => new _BirdPageState();
}

class _BirdPageState extends State<BirdPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextStyle animalStyle = const AnimalStyle(
      fontSize: 15.0, color: Colors.black54, height: 24.0 / 15.0);

  double _getAppBarHeight(BuildContext context) =>
      MediaQuery
          .of(context)
          .size
          .height * 0.3;

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = _getAppBarHeight(context);
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    final bool fullWidth = (screenSize.width < _PageMaxWidth);
    return new Scaffold(
      key: _scaffoldKey,
      body: new Stack(
        children: <Widget>[
          new Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height: appBarHeight + 28.0,
            child: new Hero(
              tag: widget.bird.image,
              child: new Image.asset(
                widget.bird.image,
                fit: fullWidth ? BoxFit.fitWidth : BoxFit.cover,
              ),
            ),
          ),
          new CustomScrollView(
            slivers: <Widget>[
              new SliverAppBar(
                expandedHeight: appBarHeight - 28.0,
                backgroundColor: Colors.transparent,
                flexibleSpace: new FlexibleSpaceBar(
                  background: new DecoratedBox(
                    decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                        begin: const FractionalOffset(0.5, 0.0),
                        end: const FractionalOffset(0.5, 0.40),
                        colors: <Color>[
                          const Color(0x60000000), const Color(0x00000000)],
                      ),
                    ),
                  ),
                ),
              ),
              new SliverToBoxAdapter(
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(top: 28.0),
                      width: fullWidth ? null : _PageMaxWidth,
                      child: new BirdSheet(bird: widget.bird),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BirdSheet extends StatelessWidget {
  final TextStyle titleStyle = const AnimalStyle(fontSize: 45.0);
  final TextStyle descriptionStyle = const AnimalStyle(
      fontSize: 15.0, color: Colors.black54, height: 24.0 / 15.0);
  final TextStyle itemStyle = const AnimalStyle(
      fontSize: 20.0, height: 24.0 / 15.0);
  final TextStyle itemTitleStyle = new AnimalStyle(
      fontSize: 20.0, color: _themeData.accentColor, height: 24.0 / 15.0);
  final TextStyle headingStyle = const AnimalStyle(
      fontSize: 16.0, fontWeight: FontWeight.bold, height: 24.0 / 15.0);

  BirdSheet({ Key key, this.bird }) : super(key: key);

  final Bird bird;

  @override
  Widget build(BuildContext context) {
    const double topPadding = 30.0;
    return new Material(
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: new Table(
            columnWidths: <int, TableColumnWidth>{
              0: const FixedColumnWidth(100.0)
            },
            children: <TableRow>[
              new TableRow(
                  children: <Widget>[
                    new TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: new Text("Name:", style: itemTitleStyle)
                    ),
                    new TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: new Text(bird.name, style: titleStyle)
                    ),
                  ]
              ),
              new TableRow(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text("Habitat:", style: itemTitleStyle)
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text(bird.habitat, style: itemStyle)
                    ),
                  ]
              ),
              new TableRow(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text("Weight:", style: itemTitleStyle)
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text(bird.lbstoOz(bird.weight).toString() + " oz (" +
                            bird.lbstograms(bird.weight).toString() + " g)", style: itemStyle)
                    ),
                  ]
              ),
              new TableRow(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text("Flight Speed:", style: itemTitleStyle)
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text(bird.flightSpeed.toString() + " mph (" +
                            bird.mphtokpm(bird.flightSpeed).toString() + " kph)", style: itemStyle)
                    ),
                  ]
              ),
              new TableRow(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text("Beak \nType:", style: itemTitleStyle)
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text(bird.beakType, style: itemStyle)
                    ),
                  ]
              ),
              new TableRow(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text("Lays \nEggs?:", style: itemTitleStyle)
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text(bird.laysEggs.egg(), style: itemStyle)
                    ),
                  ]
              ),
            ]
        ),
      ),
    );
  }
}



//========================================================= Reptile Display Page
class ReptilePage extends StatefulWidget {
  const ReptilePage({ Key key, this.reptile }) : super(key: key);

  final Reptile reptile;

  @override
  _ReptilePageState createState() => new _ReptilePageState();
}

class _ReptilePageState extends State<ReptilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextStyle animalStyle = const AnimalStyle(
      fontSize: 15.0, color: Colors.black54, height: 24.0 / 15.0);

  double _getAppBarHeight(BuildContext context) =>
      MediaQuery
          .of(context)
          .size
          .height * 0.3;

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = _getAppBarHeight(context);
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    final bool fullWidth = (screenSize.width < _PageMaxWidth);
    return new Scaffold(
      key: _scaffoldKey,
      body: new Stack(
        children: <Widget>[
          new Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height: appBarHeight + 28.0,
            child: new Hero(
              tag: widget.reptile.image,
              child: new Image.asset(
                widget.reptile.image,
                fit: fullWidth ? BoxFit.fitWidth : BoxFit.cover,
              ),
            ),
          ),
          new CustomScrollView(
            slivers: <Widget>[
              new SliverAppBar(
                expandedHeight: appBarHeight - 28.0,
                backgroundColor: Colors.transparent,
                flexibleSpace: new FlexibleSpaceBar(
                  background: new DecoratedBox(
                    decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                        begin: const FractionalOffset(0.5, 0.0),
                        end: const FractionalOffset(0.5, 0.40),
                        colors: <Color>[
                          const Color(0x60000000), const Color(0x00000000)],
                      ),
                    ),
                  ),
                ),
              ),
              new SliverToBoxAdapter(
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(top: 28.0),
                      width: fullWidth ? null : _PageMaxWidth,
                      child: new ReptileSheet(reptile: widget.reptile),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ReptileSheet extends StatelessWidget {
  final TextStyle titleStyle = const AnimalStyle(fontSize: 45.0);
  final TextStyle descriptionStyle = const AnimalStyle(
      fontSize: 15.0, color: Colors.black54, height: 24.0 / 15.0);
  final TextStyle itemStyle = const AnimalStyle(
      fontSize: 20.0, height: 24.0 / 15.0);
  final TextStyle itemTitleStyle = new AnimalStyle(
      fontSize: 20.0, color: _themeData.accentColor, height: 24.0 / 15.0);
  final TextStyle headingStyle = const AnimalStyle(
      fontSize: 16.0, fontWeight: FontWeight.bold, height: 24.0 / 15.0);

  ReptileSheet({ Key key, this.reptile }) : super(key: key);


  final Reptile reptile;

  @override
  Widget build(BuildContext context) {
    const double topPadding = 30.0;
    return new Material(
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: new Table(
            columnWidths: <int, TableColumnWidth>{
              0: const FixedColumnWidth(100.0)
            },
            children: <TableRow>[
              new TableRow(
                  children: <Widget>[
                    new TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: new Text("Name:", style: itemTitleStyle)
                    ),
                    new TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: new Text(reptile.name, style: titleStyle)
                    ),
                  ]
              ),
              new TableRow(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text("Habitat:", style: itemTitleStyle)
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text(reptile.habitat, style: itemStyle)
                    ),
                  ]
              ),
              new TableRow(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text("Weight:", style: itemTitleStyle)
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text(reptile.lbstoOz(reptile.weight).toString() + " oz (" +
                            reptile.lbstograms(reptile.weight).toString() + " g)", style: itemStyle)
                    ),
                  ]
              ),
              new TableRow(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text("Body \nLength:", style: itemTitleStyle)
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text(reptile.length.toString() + " in (" +
                            reptile.intocm(reptile.length).toString() + " cm)", style: itemStyle)
                    ),
                  ]
              ),
              new TableRow(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text("Diet:", style: itemTitleStyle)
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text(reptile.diet, style: itemStyle)
                    ),
                  ]
              ),
              new TableRow(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text("Lays \nEggs?:", style: itemTitleStyle)
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(top: topPadding, bottom: 4.0),
                        child: new Text(reptile.laysEggs.egg(), style: itemStyle)
                    ),
                  ]
              ),
            ]
        ),
      ),
    );
  }
}


//============================================================== List of Mammals
List<Mammal> mammals = <Mammal>[
  new Mammal(
    'Cougar',
    'Forest and mountainous areas',
    179.3,
    '91 days',
    "Tan",
    new noEggs(),
    "images/cougar.jpg",
  ),
  new Mammal(
    'Elk',
    'Mountainous regions',
    697.8,
    '262 days',
    'Brown',
    new noEggs(),
    "images/elk.jpg",
  ),
  new Mammal(
    'White-Tailed Deer',
    'Temperate regions',
    110.0,
    '201 days',
    'Brown',
    new noEggs(),
    "images/deer.jpg",
  ),
  new Mammal(
    'Fox Squirrel',
    'Open Forests',
    1.5,
    '45 days',
    'brown-grey',
    new noEggs(),
    "images/squirrel.jpg",
  ),
];


//================================================================ List of Birds
List<Bird> birds = <Bird>[
  new Bird(
    'Red-Tailed Hawk',
    'Most of North America',
    2.1,
    120.0,
    "Raptorial",
    new yesEggs(),
    "images/redTailedHawk.jpg",
  ),
  new Bird(
    'Lark Bunting',
    'Central and western North America',
    0.016,
    22.0,
    'Grain Eating',
    new yesEggs(),
    "images/lark.jpg",
  ),
  new Bird(
    'Hooded Merganser',
    'Most of North America',
    1.6,
    32.4,
    'Sawbilled',
    new yesEggs(),
    "images/merganser.jpg",
  ),
  new Bird(
    'Gunnison Grouse',
    'Gunnison Basin region',
    4.2,
    45.6,
    'Generalist',
    new yesEggs(),
    "images/grouse.jpg",
  ),
];


//============================================================= List of Reptiles
List<Reptile> reptiles = <Reptile>[
  new Reptile(
    'Prairie Rattlesnake',
    'Western United States',
    3.6,
    39.6,
    "Generally, this species prefers small mammals, such as ground squirrels, ground nesting birds, mice, rats, small rabbits and prairie dogs.",
    new yesEggs(),
    "images/rattlesnake.jpg",
  ),
  new Reptile(
    'Common Collared Lizard',
    'South-Central United States',
    0.062,
    14.6,
    'They mostly eat insects such as grasshoppers and crickets, but they also eat other lizards.',
    new yesEggs(),
    "images/collared.jpg",
  ),
  new Reptile(
    'Greater Short-Horned Lizard',
    'Western North America',
    0.039,
    5.9,
    'They feed primarily on ants, but will also take an occasional grasshopper or beetle.',
    new yesEggs(),
    "images/horned.jpg",
  ),
  new Reptile(
    'Yellow Mud Turtle',
    'Central United States and Mexico',
    0.621,
    6.2,
    'A variety of aquatic animals and some plants are consumed, including insects, snails, crayfish, tadpoles, and dead fish.',
    new yesEggs(),
    "images/turtle.jpg",
  ),
];