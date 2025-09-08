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
