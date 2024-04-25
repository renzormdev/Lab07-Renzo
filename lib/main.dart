import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Plato {
  final String nombre;
  final double precio;
  final String imagen;

  Plato({required this.nombre, required this.precio, required this.imagen});
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

class MyApp extends StatelessWidget {
  final List<Plato> platos = [
    Plato(
      nombre: 'Lomo Saltado',
      precio: 12.99,
      imagen: 'https://ilcb.edu.pe/repositorioaps/data/1/2/2/not/el-lomo-saltado/images/LOMO-SALTADO.jpg',
    ),
    Plato(
      nombre: 'Causa Marina',
      precio: 15.99,
      imagen: 'https://example.com/pizza_margherita.jpg',
    ),
    Plato(
      nombre: 'Tallarines a lo alfredo',
      precio: 16.99,
      imagen: 'https://example.com/pasta_carbonara.jpg',
    ),
    Plato(
      nombre: 'Seco a la huachana',
      precio: 14.99,
      imagen: 'https://example.com/hamburguesa_classica.jpg',
    ),
    Plato(
      nombre: 'Crema Volteada',
      precio: 7.99,
      imagen: 'https://example.com/tiramisu.jpg',
    ),
  ];

  final List<FAQItem> faq = [
    FAQItem(
      question: 'Cual es el plato mas vendido?',
      answer: 'Lomo saltado',
    ),
    FAQItem(
      question: 'Que postre me recomienda?',
      answer: 'Crema volteada',
    ),
    FAQItem(
      question: 'Tiene algo marino?',
      answer: 'Causa Marina',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menú'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: platos.length,
                itemBuilder: (context, index) {
                  final plato = platos[index];
                  return ListTile(
                    leading: Image.network(plato.imagen, width: 100),
                    title: Text(plato.nombre),
                    trailing: Text('\$${plato.precio}'),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: faq.map((faqItem) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        faqItem.question,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        faqItem.answer,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}