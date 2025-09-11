# SCP-Roleplay  
SCP Roleplay Scripting Non-offical documentation  
## Documentation en Français 🇫🇷  
### Introduction  
**SCP:Roleplay, Son histoire**  
[SCP:Roleplay](https://www.roblox.com/games/5041144419/SCP-Roleplay) est un jeu Roblox edité et développé par [MetaMethod](https://discord.gg/kyf2ydR26R) avec comme date de création du projet étant le 5/16/2020. MethaMethod avait produit d'autres jeux tournants principalement autour des sujets comme la SCP:Fondation et La [Nova Corporation](http://nova-corporation.wikidot.com), un dérivé de la fondation SCP. Pour une liste exhatustive de leur mises à jour voir leur [trello](https://trello.com/b/eISyRVVN/scp-roleplay-roadmap)
**Nous contacter**  
Si vous avez des questions, besoin d'aide, que vous voulez proposer un script ou appliquer une correction/ajout au repository vous pouvez nous contacter avec ces moyens :  
- Si vous avez des questions à propos de la documentation ou besoin d'aide ➤ Notre discord  
- Si vous avez un correctif à appliquer à la documentation ou que vous voulez ajouter votre propre script au repository ➤ contactez `vacarme_emporte.` via discord.  
> [!CAUTION]
> Merci d'être poli, personne n'est obligé de vous répondre alors soyez agréable pour que les gens acceptent de vous aider. Et puis c'est toujours plus agréable de recevoir un "Bonjour, pourrais tu m'aider..." qu'un "Jé ce problaime éde moa".
> 
**Des requirement pour développer des add-ons ?**
Malheuresment oui, vous devez maîtriser les bases de la programmation (de préférence maîtriser en plus le luau). Sans ça vous serez comme un enfant attardé face à un problème quantique. Si vous ne maitrisez pas encore le luau mais que vous avez de certaines bases en programmation et que vous avez un bon apprentissage vous devriez pouvoir vous débrouiller par déduction (mais bonne chance, le chemin risque d'être épinneux, je peux vous l'affirmer d'experience)  

**Disclaimer : Ceci n'est pas une documentation pour apprendre le lua mais seulement un complément de la [documentation d'origine](https://scproleplay.com/docs/server-addons/#api-display) qui, pour être franc, est tout sauf claire et agréable à lire...** 

**Syntaxe**    
Lors de votre périple durant cette ✨Magnifique✨ documentation vous pourrez observer que les variables (et tout ce qui s'y apparente) seront entourés/formatés de différentes  manière afin de signifer le type de l'objet.
| Name     | Character |
| ---      | ---       |
| String | characteres entourés par des guillimets ("texte")     |
| Bool     | TRUE pour vrai, FALSE pour faux     |
| Int     |   <ins>Nombres soulignés</ins>   |
| Table     |   **En gras**   |
| Nil (par ce que pourquoi pas     |   ***En gras Italique***   |

### Interactions avec la map
 | Commande | Description Brève| Illustration |
| --- | --- | --- |
| f("Nom de la part") |la fonction ``f()`` permet de récupérer une part dans la map grâce à son nom. Elle est l'équivalent SCP:Roleplay de workspace:WaitForChild("")|![imageexemple](https://github.com/user-attachments/assets/abc311f1-939a-40d3-a0d0-9e67a70c2c8e)|


Pour modifier le nom d'une part, selectionnez la Part et rendez vous sur l'onglet Move (raccourcie `w`). Vous pouvez ensuite y insérer un nom à votre part !
```lua
local Part = f("Part Charismatique")
Part.Name = "Part Transluscide"
Part.Anchored = true
Part.CanCollide = false
```
> [!WARNING]
> Il est important de mettre des noms exhaustif et précis à vos parts : c'est comme les variables ! (par exemple evitez les `Part n°12` ou les `Part Charismatique`, ne faites donc pas comme ce très mauvais exemple plus haut)
>
## Fonctions des Joueurs

| Fonction                                            | Description                                                                                                              |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `kill(name: string)`                                | **Tue** le joueur spécifié                                                                                                |
| `damage(name: string, amount: number)`             | **Inflige des dégâts** au joueur spécifié selon la quantité donnée                                                       |
| `heal(name: string)`                                | **Restaure la santé** du joueur au maximum                                                                               |
| `getPlayers()`                                      | **Te donne la liste** des noms de tous les joueurs sur le serveur                                                       |
| `getPlayerHealth(name: string)`                     | **Te donne la santé actuelle** du joueur.<br>Exemple : `-1` si le joueur n’est pas présent                               |
| `setPlayerHealth(name: string, amount: number)`    | **Définit la santé** du joueur                                                                                           |
| `getPlayerMaxHealth(name: string)`                 | **Te donne la santé maximale** du joueur.<br>Exemple : `-1` si le joueur n’est pas présent                               |
| `setPlayerMaxHealth(name: string, amount: number)` | **Définit la santé maximale** du joueur                                                                                  |
| `getPlayerScore(name: string)`                      | **Te donne le score** du joueur                                                                                          |
| `setPlayerScore(name: string, score: number = 0)`  | **Définit le score** du joueur                                                                                           |
| `getPlayerPosition(name: string)`                   | **Te donne la position** du joueur (`Vector3` / `CFrame`)                                                               |
| `setPlayerPosition(name: string, position: Vector3)` | **Définit la position** du joueur (`Vector3` / `CFrame`)                                                                |
| `getPlayerKeycard(name: string)`                   | **Te donne le niveau de badge** (keycard) du joueur (ex. : "L4")                                                        |
| `getTools(name: string)`                            | **Te donne la liste des outils** dans l’inventaire du joueur                                                            |
| `giveTool(name: string, tool: string)`             | **Donne un outil** au joueur.<br>Supporte aussi un objet Tool pour les outils personnalisés (décochage de `Handle`)   |
| `removeTool(name: string, tool: string)`           | **Retire un outil** du joueur                                                                                             |
| `getUserId(name: string)`                           | **Te donne l’ID utilisateur** (UserId) du joueur                                                                        |
| `ownsGamepass(name: string, id: number)`           | **Te donne si le joueur possède** le gamepass spécifié                                                                  |
| `ownsAsset(name: string, id: number)`              | **Te donne si le joueur possède** l’asset spécifié                                                                      |
| `playEmote(target: string \| Instance, id: number, loop: boolean = false)` | **Joue une émote ou animation** sur le joueur.<br>Te donne deux fonctions : arrêter l’animation et ajuster sa vitesse |
| `hasTool(name: string, tool: string)`              | **Te donne si le joueur possède** l’outil spécifié                                                                      |
| `getPlayerCurrentTool(name: string)`               | **Te donne l’outil actuel** que le joueur utilise, ou `nil` si aucun                                                   |
| `getPlayerIsInGroup(name: string, id: number)`     | **Te donne si le joueur est dans** le groupe spécifié                                                                   |
| `getPlayerRankInGroup(name: string, id: number)`   | **Te donne le rang** du joueur dans le groupe (0–255)                                                                  |
| `getPlayerRoleInGroup(name: string, id: number)`   | **Te donne le rôle** du joueur dans le groupe                                                                           |

### Fonctions d’Équipe
| Fonction                                            | Description                                                                                                              |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `getTeams()`                                        | Affiche **toutes les équipes** du jeu.<br>Exemple : `team[1]` = **nom de l’équipe**, `team[2]` = **couleur de l’équipe** |
| `getTeamMembers(team: string \| BrickColor)`        | Affiche **tous les joueurs** d’une équipe.<br>Vous pouvez donner **le nom** ou **la couleur** de l’équipe                |
| `getTeam(name: string)`                             | Affiche **le nom** et **la couleur** de l’équipe d’un joueur.<br>Exemple : `local nom, couleur = getTeam("NomDuJoueur")` |
| `setTeam(name: string, team: string \| BrickColor)` | **Change l’équipe** d’un joueur.<br>Vous pouvez utiliser **le nom** ou **la couleur** de l’équipe                        |
