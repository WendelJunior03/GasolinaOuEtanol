import 'package:flutter/material.dart';

void main() {
  runApp(const Calculo());
}

class Calculo extends StatefulWidget {
  const Calculo({super.key});
  @override
  State<Calculo> createState() => _CalculoState();
}

class _CalculoState extends State<Calculo> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final gasonilaController = TextEditingController();
  final etanolController = TextEditingController();

  String infoText = 'Infome o valor de cada combustivel';

  resetFields() {
    gasonilaController.text = '';
    etanolController.text = '';

    setState(() {
      infoText = 'Informe valor de cada combustivel';
      _MyHomePageState();
    });
  }

  calculo() {
    double etanol = double.parse(etanolController.text);
    double gasolina = double.parse(gasonilaController.text);
    final resultado = (etanol / gasolina);
    setState(
      () {
        if (resultado == etanol) {
          infoText = 'Favor digitar todos os valores';
        } else if (resultado <= 0.74) {
          infoText =
              'Percentual: (${resultado.toStringAsFixed(2)}) Vale a pena abastecer com Etanol';
        } else {
          infoText =
              'Percentual: (${resultado.toStringAsFixed(2)}) Vale a pena abastecer com Gasolina';
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text(
          'Gasolina ou Etanol',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              onPressed: () => resetFields(),
              icon: const Icon(Icons.refresh),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.directions_car_filled_sharp,
                size: 150,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Preço Gasolina',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.local_gas_station,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    controller: gasonilaController,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Preço Etanol',
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      icon: Icon(
                        Icons.local_gas_station,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    controller: etanolController,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () => calculo(),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: const Text(
                  'Calcular',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Text(
                infoText,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
