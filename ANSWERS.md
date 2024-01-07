# Introduction à iOS avec UIKit

#### Answers.md

## 1. Environnement

### Exercice 1

Pour chaque élément de la liste ci-dessous, vous rédigez un paragraphe expliquant à quoi il sert.

- Les targets
    - Une target contient la configuration à employer lors du build de son "produit" (app, framework, extension...). Un projet peut avoir différentes target pour employer des environnements différents (test, prod...) ou différentes cibles (macOS, iOS...)

- Les fichiers
    - Lors de la création d'un projet les fichiers suivants sont générés :

        - AppDelegate.swift : Correspond à l'entry point. Sert à initialiser l'application, définit le view controller initial et démarre l'event loop 
        - SceneDelegate.swift : Gère certaines responsabilité de l'AppDelegate notamment celle en lien avec l'UI et les data. Il est responsable de ce qui est affiché à l'écran
        - ViewController.swift : Gère une vue "racine" qui elle même peut contenir un certain nombre de vues nestées
        - Assets.xcassets : Contient la définition des assets de notre application qui peuvent être des fonts, des couleurs, des images, des icônes ...
        - LaunchScreen.storyboard : Contient la définition de l'interface de gestion de l'écran statique de démarrage de l'application avant que celle-ci soit complétement initialisée
        - Main.storyboard : Contient la définition de l'interface de gestion des différents écrans du storyboard. Il ouvre un éditeur permettant sa omdification
        - Info.plist : Contient tous les paramètres de l'application (nom, permissions, ...)

- Les assets
    - Les assets sont les fichiers permettant de customiser le thème l'application, des images, etc.

- Ouvrir le storyboard
    - Le storyboard est l'éditeur permettant de définir le front, les vues, de son application
- Ouvrir un simulateur
    - Un simulateur permet d'émuler un périphérique afin de tester l'application sans avoir besoin de la déployer sur un appareil physique
- Lancer une application sur le simulateur
    - Lancer une application sur le simulateur permet de build et run l'application sur l'émulateur

### Exercice 2

- A quoi sert le raccourci Cmd + R ?
    - Cmd + R sert à lancer le projet (Run)
- A quoi sert le raccourci Cmd + Shift + O ?
    - Cmd + Shift + O permet d'ouvrir un fichier rapidement en écrivant son nom pour y accéder
- Trouver le raccourci pour indenter le code automatiquement
    - Ctrl + I (^I) permet d'indenter le code
- Et celui pour commenter la selection.
    - Cmd + / permet de commenter le code sélectionné

## 3. Delegate

### Exercice 1

- Expliquer l’intérêt d’une variable statique en programmation.
    - Une variable statique en programmation est accessible via le type auquel elle appartient et non pas via l'instance du type

### Exercice 2

- Expliquer pourquoi ``dequeueReusableCell`` est important pour les performances de l’application.
    - dequeueReusableCell permet d'éditer la cell existante plutôt que d'en instancier une nouvelle à chaque modification de notre TableView, ce qui, lors d'utilisation de grande liste n'est pas optimale

## 4. Navigation

### Exercice 1

- Que venont nous de faire en réalité ? Quel est le rôle du NavigationController ?
    - Nous venons de wrapper notre application autour d'un NavigationController. Son rôle est de permettre la navigation entre les différentes vues des autres controllers et de gérer leur affichage/destruction

- Est-ce que la NavigationBar est la même chose que le NavigationController ?
    - La NavigationBar est le composant qui va permettre à la vue d'afficher le titre de la page actuelle, elle est fortement lié au NavigationController mais est un composant à part entièrement

## 6. Ecran detail

### Exercice 1

- Expliquer ce qu’est un ``Segue`` et à quoi il sert.
    - Un segue définit une transition entre deux controllers dans un storyboard. L'action qui déclenche le segue peut être à peu près tout ce qu'on veut, mais il faut dans tous les cas une vue d'arrivée.

### Exercice 2

- Qu’est-ce qu’une ``constraint`` ? A quoi sert-elle ? Quel est le lien avec ``AutoLayout`` ?
    - Une contrainte est une règle qui permet à l'application de savoir où placer le composant contraint. L'AutoLayout va calculer la taille et l'emplacement des vues en se basant sur ces contraintes.
