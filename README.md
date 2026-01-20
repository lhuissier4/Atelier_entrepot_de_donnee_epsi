# Atelier_entrepot_de_donnee_epsi
## Équipe
- Prénom N.
- Prénom N.
- Prénom N.

## Étape 1 : Jeu de données
* **Jeu :** Counter-Strike: Global Offensive (CS:GO)
* **Source :** [CS:GO Professional Matches sur Kaggle](https://www.kaggle.com/datasets/mateusdmachado/csgo-professional-matches)
* **Description :** Ce dataset contient des statistiques détaillées sur les matchs professionnels (résultats, économie des rounds, performances des joueurs). Il dépasse les 10 000 parties et inclut des données précises comme l'ADR (Average Damage per Round).

## Étape 2 : Stack Technique (Sans Backend)
* **Interface :** Notebook [Observable ou Google Colab]
* **Stockage :** DuckDB
* **Architecture :** Utilisation de DuckDB-Wasm (ou version Python) pour interroger directement les fichiers CSV sans serveur de base de données externe.
