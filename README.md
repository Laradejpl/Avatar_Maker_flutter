Avatar Maker
Avatar Maker est une application Flutter permettant de créer et personnaliser des avatars à partir de personnages de base. L'utilisateur peut choisir un personnage, modifier son apparence (tête, haut, bas) et sauvegarder ses préférences.

Fonctionnalités principales
Sélection d'un personnage de base parmi plusieurs options (Rappeur, Boxeur, Emir).
Personnalisation des avatars avec différents accessoires :
Tête : Changer l'apparence du visage.
Haut : Modifier les vêtements supérieurs.
Bas : Modifier les vêtements inférieurs.
Sauvegarde des préférences d'avatar (pseudo, accessoires, couleur d'arrière-plan).
Splash Screen animé à l'ouverture de l'application.
Prérequis
Avant de lancer ce projet, assurez-vous d'avoir installé les outils suivants :

Flutter SDK
Dart SDK
Un éditeur comme Android Studio ou VS Code.
Installation
Clonez ce dépôt sur votre machine locale :

bash
Copier le code
git clone https://github.com/votre-repo/avatar-maker.git
Accédez au répertoire du projet :

bash
Copier le code
cd avatar-maker
Installez les dépendances Flutter :

bash
Copier le code
flutter pub get
Ajoutez vos images d'assets :

Placez les images dans le dossier assets/characters/ :
rappeur.png
boxeur.png
emir.png
Déclarez les dans pubspec.yaml :
yaml
Copier le code
flutter:
  assets:
    - assets/characters/
Lancez l'application sur un émulateur ou un appareil physique :

bash
Copier le code
flutter run
Structure du Projet
Fichiers principaux
main.dart : Point d'entrée de l'application.
splash_screen.dart : Écran d'accueil temporaire (splash screen).
character_selection_screen.dart : Écran de sélection des personnages de base.
avatar_customization_screen.dart : Écran pour personnaliser les avatars.
Répertoires
assets/ : Contient les images utilisées dans l'application.
assets/characters/ : Images des personnages de base.
assets/head/ : Accessoires pour la tête.
assets/top/ : Vêtements supérieurs.
assets/bottom/ : Vêtements inférieurs.
Comment Utiliser l'Application
Splash Screen :

Au démarrage, un écran d'accueil apparaît pendant 3 secondes avec le logo de l'application.
Sélection de personnage :

L'utilisateur choisit un personnage de base (par exemple, Rappeur).
Personnalisation :

Modifiez les éléments suivants à partir des options disponibles :
Tête
Haut
Bas
Entrez un pseudo pour l'avatar.
Sauvegardez votre avatar.
Sauvegarde :

Les préférences de l'avatar (accessoires, pseudo, etc.) sont sauvegardées dans le stockage local grâce à SharedPreferences.
Technologies utilisées
Flutter : Framework principal.
Dart : Langage de programmation.
SharedPreferences : Stockage des préférences utilisateur.
Assets : Gestion des images pour les accessoires.
Améliorations futures
Ajouter une fonctionnalité pour partager l'avatar créé via les réseaux sociaux.
Intégrer une fonctionnalité d'exportation des avatars sous forme d'images.
Ajouter plus de personnages et d'accessoires personnalisables.
Permettre la modification en temps réel avec des transitions animées.
Contributeurs
Votre Nom - Larade jean-philippe
Licence
Ce projet est sous licence MIT. Consultez le fichier LICENSE pour plus de détails.

