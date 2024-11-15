import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comparativa Material vs Cupertino',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ComparisonPage(),
    );
  }
}

class ComparisonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comparativa Material vs Cupertino'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Botones
            _buildComparisonRow(
              title: 'Botones',
              materialWidget: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('Botón Material presionado');
                  },
                  child: Text('Botón Material'),
                ),
              ),
              cupertinoWidget: SizedBox(
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: CupertinoButton(
                    color: CupertinoColors.activeBlue,
                    onPressed: () {
                      print('Botón Cupertino presionado');
                    },
                    child: Text('Botón Cupertino'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            // 2. Campos de texto
            _buildComparisonRow(
              title: 'Campos de texto',
              materialWidget: TextField(
                decoration: InputDecoration(
                  labelText: 'Campo de Texto',
                  border: OutlineInputBorder(),
                ),
              ),
              cupertinoWidget: CupertinoTextField(
                placeholder: 'Campo de Texto',
                padding: EdgeInsets.all(16.0),
              ),
            ),
            SizedBox(height: 30),

            // 3. Interruptores
            _buildComparisonRow(
              title: 'Interruptores',
              materialWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Activado:', style: TextStyle(color: Colors.grey)),
                  Switch(
                    value: true,
                    onChanged: (value) {
                      print('Switch Material cambiado: $value');
                    },
                  ),
                ],
              ),
              cupertinoWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Activado:', style: TextStyle(color: Colors.grey)),
                  CupertinoSwitch(
                    value: true,
                    onChanged: (value) {
                      print('Switch Cupertino cambiado: $value');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // 4. Barras de búsqueda
            _buildComparisonRow(
              title: 'Barras de búsqueda',
              materialWidget: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              cupertinoWidget: CupertinoSearchTextField(
                placeholder: 'Buscar...',
                padding: EdgeInsets.all(12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir filas comparativas
  Widget _buildComparisonRow({
    required String title,
    required Widget materialWidget,
    required Widget cupertinoWidget,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800]),
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Material Design', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 10),
                  materialWidget,
                ],
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Cupertino Design', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 10),
                  cupertinoWidget,
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
