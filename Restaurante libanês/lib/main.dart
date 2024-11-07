import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardápio Libanês',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _showMenu = false;

  final List<Map<String, String>> _lebaneseDishes = [
    {
      'name': 'Hummus',
      'description':
          'Um purê de grão-de-bico misturado com tahine, alho, limão e azeite de oliva.',
      'image':
          'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2022/08/Hummus-main-1.jpg'
    },
    {
      'name': 'Tabbouleh',
      'description':
          'Uma salada refrescante feita com salsinha, tomate, cebola, bulgur (trigo partido), hortelã e temperada com limão e azeite de oliva.',
      'image':
          'https://mojo.generalmills.com/api/public/content/GSLIrqyu60uykPOJEtNhmg_webp_base.webp?v=6754de40&t=e724eca7b3c24a8aaa6e089ed9e611fd'
    },
    {
      'name': 'Falafel',
      'description':
          'Almôndegas fritas feitas de grão-de-bico ou favas, geralmente servidas em pão pita com vegetais e molhos.',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3ifs9JkvcDwpxywlUQRUSZGqKpLbZnd4-Uw&s'
    },
    {
      'name': 'Shawarma',
      'description':
          'Carne marinada (geralmente frango, cordeiro ou carne de vaca) cozida em um espeto vertical e servida em pão pita com vegetais e molhos.',
      'image':
          'https://media-cdn.tripadvisor.com/media/photo-s/06/24/66/b6/shawarma.jpg'
    },
    {
      'name': 'Kibbeh',
      'description':
          'Um prato à base de carne de cordeiro ou carne de vaca misturada com bulgur, cebola e especiarias, que pode ser frita, assada ou crua.',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShlOilq8loqpd7-H2ESU6TIsljePcJUyF4pg&s'
    },
    {
      'name': 'Fattoush',
      'description':
          'Uma salada que inclui vegetais frescos e pedaços de pão pita crocante, temperada com sumac e uma mistura de especiarias.',
      'image': 'https://zeinas.se/wp-content/uploads/2020/06/Fatousch_low.jpg'
    },
    {
      'name': 'Baba Ghanoush',
      'description':
          'Um purê de berinjela assada misturado com tahine, alho, limão e azeite de oliva.',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuZuCGPKBd0m5uaMCFiWE9AjrjxAy8hG-Dig&s'
    },
    {
      'name': 'Mujadara',
      'description':
          'Um prato de lentilhas e arroz com cebola frita, frequentemente temperado com cominho e outras especiarias.',
      'image':
          'https://images.food52.com/201bke4hMIvGqi8X1gSrQWcyZS8=/1200x675/559cb128-06d6-4099-a2bd-cfcd3e898915--Mujadara_with_fork_POST.jpg'
    },
    {
      'name': 'Manakish',
      'description':
          'Pão plano coberto com za\'atar (mistura de especiarias) e azeite de oliva, às vezes recheado com queijo ou carne.',
      'image':
          'https://media.istockphoto.com/id/1473859115/pt/foto/manakeesh-zaatar-arabic-flat-bread.jpg?s=612x612&w=0&k=20&c=Q7X6oGpo_O55bDWLmdPWmp0uvL0WGZ89W9fb7bETy3w='
    },
    {
      'name': 'Warak Enab',
      'description':
          'Folhas de parra recheadas com arroz, carne e especiarias, cozidas lentamente em um molho de tomate.',
      'image':
          'https://cardamomandtea.com/wp-content/uploads/2021/09/IMG_1320-min.jpg'
    }
  ];

  void _handleSubmit() {
    setState(() {
      _showMenu = true;
    });
  }

  void _handleClear() {
    setState(() {
      _controller.clear();
      _showMenu = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio Akybaba🐪'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Digite um prato',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: _handleSubmit,
                  child: Text('Buscar'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _handleClear,
                  child: Text('Limpar'),
                ),
              ],
            ),
            SizedBox(height: 20),
            _showMenu
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _lebaneseDishes.length,
                      itemBuilder: (context, index) {
                        final dish = _lebaneseDishes[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  dish['name']!,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  dish['description']!,
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8.0),
                                Image.network(
                                  dish['image']!,
                                  fit: BoxFit.cover,
                                  height: 200,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Text(
                    'Embarque em uma jornada culinária pelo Líbano com nosso cardápio especialmente elaborado com a rica tradição e dos sabores vibrantes que definem a cultura gastronômica libanêsa!',
                    style: TextStyle(fontSize: 18),
                  ),
          ],
        ),
      ),
    );
  }
}
