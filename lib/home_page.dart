import 'package:flutter/material.dart';

class AcertijoWidget extends StatefulWidget {
  @override
  _AcertijoWidgetState createState() => _AcertijoWidgetState();
}

class _AcertijoWidgetState extends State<AcertijoWidget> {
  int ubicacionBarco = 1;
  List<String> orilla1 = ['lobo', 'oveja', 'lechuga'];
  List<String> orilla2 = [];
  List<String> orilla3 = [];

  void _moverElemento(String elemento, int orilla) {
    setState(() {
      // Solo movemos el elemento si el barco está en la misma orilla que el elemento
      if (orilla == 1) {
        orilla1.remove(elemento);
        orilla2.add(elemento);
      } else if (orilla == 2) {
        orilla2.remove(elemento);
        orilla3.add(elemento);
      } else if (orilla == 3) {
        orilla3.remove(elemento);
        orilla2.add(elemento);
      }
    });
  }

  void _resolverAcertijo() {
    if ((orilla2.contains('lobo') && orilla2.contains('oveja')) ||
        (orilla3.contains('lobo') && orilla3.contains('oveja')) &&
            orilla3.contains('lechuga') != orilla3.contains('lechuga')) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('El lobo se comió a la oveja.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );
    } else if ((orilla2.contains('oveja') && orilla2.contains('lechuga')) ||
        (orilla3.contains('oveja') &&
            orilla3.contains('lechuga') &&
            orilla3.contains('lobo') != orilla3.contains('lobo'))) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('La oveja se comió la lechuga.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );
    } else if (orilla3.contains('oveja') &&
        orilla3.contains('lechuga') &&
        orilla3.contains('lobo')) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('¡Felicidades!'),
            content: Text('Has resuelto el acertijo.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Orilla 1',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: orilla1.map((elemento) {
              return ElevatedButton(
                onPressed: () {
                  _moverElemento(elemento, 1);
                },
                child: Image.asset(
                  'assets/$elemento.png',
                  width: 50,
                  height: 50,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Text(
            'Barco',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: orilla2.map((elemento) {
              return ElevatedButton(
                onPressed: () {
                  _moverElemento(elemento, 2);
                },
                child: Image.asset(
                  'assets/$elemento.png',
                  width: 50,
                  height: 50,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Text(
            'Orilla 3',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: orilla3.map((elemento) {
              return ElevatedButton(
                onPressed: () {
                  _moverElemento(elemento, 3);
                },
                child: Image.asset(
                  'assets/$elemento.png',
                  width: 50,
                  height: 50,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _resolverAcertijo,
            child: Text('Resolver'),
          ),
        ],
      ),
    );
  }
}
