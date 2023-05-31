import 'package:app3/listimages.dart';
import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  const MiApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      initialRoute: '/',
      theme: ThemeData(primarySwatch: Colors.red),
      routes: {
        '/': (context) => Inicio(),
        '/detalle': (context) => Detalle(),
        '/configuracion': (context) => Configuracion(),
        '/Galeria': (context) => Galeria(),
      },
    );
  }
}

bool _iconBool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

class Inicio extends StatelessWidget {
  Inicio({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondo.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text("THE BOYS"),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(100.0, 20.0, 30.0, 40.0),
          margin: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hola Usuario",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IndieFlower'),
              ),
              SizedBox(height: 35),
              ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: getColor(Colors.red, Colors.blue)),
                  onPressed: () => Navigator.pushNamed(context, '/detalle'),
                  icon: Icon(Icons.info),
                  label: Text('detalles')),
              SizedBox(height: 10),
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: getColor(Colors.red, Colors.blue)),
                onPressed: () => Navigator.pushNamed(context, '/configuracion'),
                icon: Icon(Icons.settings),
                label: Text('Configuracion'),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: getColor(Colors.red, Colors.blue)),
                onPressed: () => Navigator.pushNamed(context, '/Galeria'),
                icon: Icon(Icons.image),
                label: Text('Galeria'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Detalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondo3.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Detalle"),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Text(
            "Pantalla Detalle",
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 24, fontFamily: 'IndieFlower'),
          ),
        ),
      ),
    );
  }
}

class Configuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool click = true;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondo4.jpg'), fit: BoxFit.cover)),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // backgroundColor: (click == false) ? Colors.amber : Colors.white,
          appBar: AppBar(
            title: Text("Configuracion"),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(_iconBool ? _iconDark : _iconLight))
            ],
          ),
          body: SafeArea(
            child: Column(children: const [
              TabBar(
                labelColor: Colors.red,
                unselectedLabelColor: Colors.blue,
                tabs: [
                  Tab(
                    text: 'Audio',
                  ),
                  Tab(
                    text: 'Pantalla',
                  ),
                  Tab(
                    text: 'Letras',
                  ),
                  Tab(
                    text: 'Contraste',
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
  final getColor = (Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return colorPressed;
    } else {
      return color;
    }
  };

  return MaterialStateProperty.resolveWith(getColor);
}

class Galeria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondo2.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Galeria"),
        ),
        body: GridView.extent(
          maxCrossAxisExtent: 150.0,
          padding: const EdgeInsets.all(4.0),
          mainAxisSpacing: 5.0,
          children: _imageslist,
        ),
      ),
    );
  }

  List<Widget> get _imageslist {
    List<Widget> _listimagnes = [];

    for (var image in images) {
      _listimagnes.add(Image.network(image));
    }

    return _listimagnes;
  }
}
