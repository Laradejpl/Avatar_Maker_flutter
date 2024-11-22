import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_screen.dart'; // Importer le splash screen

void main() {
  runApp(AvatarMakerApp());
}

class AvatarMakerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Avatar Maker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Écran initial
    );
  }
}

class CharacterSelectionScreen extends StatelessWidget {
  // Fonction pour sauvegarder le personnage de base sélectionné
  Future<void> saveBaseCharacter(String character, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('baseCharacter', character); // Sauvegarde le personnage
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AvatarCustomizationScreen(baseCharacter: character),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choisir un personnage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choisissez votre personnage de base',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => saveBaseCharacter('rappeur', context),
                  child: Column(
                    children: [
                      Image.asset('assets/characters/rappeur.png', height: 150),
                      const Text('Rappeur'),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => saveBaseCharacter('boxeur', context),
                  child: Column(
                    children: [
                      Image.asset('assets/characters/boxeur.png', height: 150),
                      const Text('Boxeur'),
                    ],
                  ),
                ),
                 GestureDetector(
                  onTap: () => saveBaseCharacter('emir', context),
                  child: Column(
                    children: [
                      Image.asset('assets/characters/emir.png', height: 150),
                      const Text('Emir'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarCustomizationScreen extends StatefulWidget {
  final String baseCharacter;

  AvatarCustomizationScreen({required this.baseCharacter});

  @override
  _AvatarCustomizationScreenState createState() =>
      _AvatarCustomizationScreenState();
}

class _AvatarCustomizationScreenState
    extends State<AvatarCustomizationScreen> {
  String currentHead = '';
  String currentTop = '';
  String currentBottom = '';
  late String headPath;
  late String topPath;
  late String bottomPath;

  Color backgroundColor = Colors.white;
  String pseudo = '';

  @override
  void initState() {
    super.initState();
    loadBaseCharacter(widget.baseCharacter);
  }

  // Charger les ressources en fonction du personnage
  void loadBaseCharacter(String baseCharacter) {
    if (baseCharacter == 'rappeur') {
      headPath = 'assets/head/';
      topPath = 'assets/top/';
      bottomPath = 'assets/bottom/';
    } else if (baseCharacter == 'boxeur') {
      headPath = 'assets/headbt/';
      topPath = 'assets/topbt/';
      bottomPath = 'assets/bottombt/';
    } else if (baseCharacter == 'emir') {
      headPath = 'assets/headdubai/';
      topPath = 'assets/topdubai/';
      bottomPath = 'assets/bottomdubai/';
    }

    setState(() {
      currentHead = 'head1.png'; // Tête par défaut
      currentTop = 'top1.png'; // Haut par défaut
      currentBottom = 'bottom1.png'; // Bas par défaut
    });
  }

  // Sauvegarder les préférences
  Future<void> saveAvatarPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('head', currentHead);
    await prefs.setString('top', currentTop);
    await prefs.setString('bottom', currentBottom);
    await prefs.setInt('backgroundColor', backgroundColor.value);
    await prefs.setString('pseudo', pseudo);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Avatar sauvegardé avec succès !')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customiser l\'Avatar'),
      ),
      body: Column(
        children: [
          // Affichage de l'avatar
          Expanded(
            child: Container(
              color: backgroundColor,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('$headPath$currentHead'),
                    Image.asset('$topPath$currentTop'),
                    Image.asset('$bottomPath$currentBottom'),
                  ],
                ),
              ),
            ),
          ),

          // Zone de sélection des options avec scroll horizontal
          Expanded(
            flex: 0,
            child: Container(
              color: Colors.grey[200],
              height: 300,
              child: ListView(
                children: [
                  buildSection(
                    title: 'Changer la Tête',
                    options: List.generate(6, (index) => 'head${index + 1}.png'),
                    onSelect: (value) {
                      setState(() {
                        currentHead = value;
                      });
                    },
                    currentSelection: currentHead,
                    assetPath: headPath,
                  ),
                  buildSection(
                    title: 'Changer le Haut',
                    options: List.generate(4, (index) => 'top${index + 1}.png'),
                    onSelect: (value) {
                      setState(() {
                        currentTop = value;
                      });
                    },
                    currentSelection: currentTop,
                    assetPath: topPath,
                  ),
                  buildSection(
                    title: 'Changer le Bas',
                    options: List.generate(4, (index) => 'bottom${index + 1}.png'),
                    onSelect: (value) {
                      setState(() {
                        currentBottom = value;
                      });
                    },
                    currentSelection: currentBottom,
                    assetPath: bottomPath,
                  ),
                ],
              ),
            ),
          ),

          // Champs de pseudo et bouton de sauvegarde
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    pseudo = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Entrez votre pseudo',
                    border: OutlineInputBorder(),
                    hintText: pseudo.isEmpty ? 'Pseudo...' : pseudo,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: saveAvatarPreferences,
                  child: Text('Sauvegarder'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget de construction pour les options
  Widget buildSection({
    required String title,
    required List<String> options,
    required void Function(String) onSelect,
    required String currentSelection,
    required String assetPath,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 100,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: options.map((option) {
                final isSelected = currentSelection == option;
                return GestureDetector(
                  onTap: () => onSelect(option),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey,
                        width: isSelected ? 3 : 1,
                      ),
                    ),
                    child: Image.asset(
                      '$assetPath$option',
                      height: 80,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
