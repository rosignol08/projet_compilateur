# Mini Rapport du Compilateur

## **Auteur :** Chaffray Romaric

---

## **Fonctionnalités Implémentées :**

### Types de base :
- **int** : Gestion des nombres entiers.
- **string** : Gestion des chaînes de caractères.
- **bool** : Support pour les valeurs booléennes (`true`, `false`).

---

### Opérations prises en charge :
- **Opérations arithmétiques :**
  - Addition (`+`), soustraction (`-`), multiplication (`*`), division (`/`), modulo (`%`).

- **Opérations logiques :**
  - **ET** logique (`&&`), **OU** logique (`||`), **XOR** logique (`^`), négation logique (`not`).

- **Opérations de comparaison :**
  - Moins que (`<`), plus grand que (`>`), moins ou égal (`<=`), plus ou égal (`>=`), égalité (`==`), inégalité (`!=`).

---

### Structures de contrôle :
- **Boucle While** :
  ```c
  while (condition) {
      // Bloc de code
  }
  ```
- **Condition If-Else** :
    ```c
    if condition {
            // Bloc de code si la condition est vraie
    } else {
            // Bloc de code si la condition est fausse
    }
    ```
- **Affichage** :
    ```c
    print(a); //a peut être un int, un string ou un bool, peu importe
    ```
- **Fonction** :
    ```c
    def int main(){
        // Block de la fonction
    }
    ```
    Le programme doit avoir au moins une fonction `main` pour être accepté.
### Build du projet :

- Pour construire le compilateur, exécutez :
    ```bash
    dune build main.exe
    ```

### Compilation d'un programme :
-Pour compiler un programme source :

    ./main.exe tests/add.test
    
Ensuite, copiez-collez l'affichage du terminal (de `.text` à `.data`) dans le fichier `e.s` et chargez-le dans SPIM.