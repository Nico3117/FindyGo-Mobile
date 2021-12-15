# __FindyGo-Mobile__
![Image](./cli2.jpg "Title")
__ __
## Introduction
Introcution
>Dans la suite de cette documentation, il vous est expliqué comment installer, utiliser l application.
__ __
## Getting started
### Installation :

Le site officiel [FindyGo](https://www.findygo.fr/)

Exemple: Installer les dépendances :
```sh
npm i -g
```

__ __
## API

Un fichier ... :


| Command | Action | Description | Exemple d'utilisation
| ------ | ------ | ------ | ------ |
| ppft new | Initier un nouveau projet | Créé l'arborescence projet avec un fichier de configuration vierge, et éventuellement un template de filter de type hello world. | ppft new mon_super_projet : créé un nouveau projet appelé “mon_super_projet” |
| ppft add_filter | Ajouter un filtre | Créé un nouveau filter dans un projet existant | ppft add_filter capitalize créé un nouveau filter de nom “capitalize”
| ppft _del_filter | Supprimer un filtre | Supprimer un filter existant. ⚠ La suppression ne doit être possible qu’à condition qu’il ne soit pas utilisé dans le fichier de configuration. | ppft del_filter capitalize supprimer le filter de nom “capitalize”
| ppft add_step | Ajouter une step au fichier de configuration | Ajoute une step au fichier de configuration. Cette commande prend les paramètres suivants : - id de step unique. - nom de filter - id step suivante (si nécessaire)| ppft add_step 10 capitalize 15 ajoute une step avec l’id « 10 » avec le filter « capitalize » et la « next step 15 »
| ppft del_step | Supprimer une step au fichier de configuration | Supprime  une step du fichier de configuration. Cette commande prend les paramètres suivants : - id de step unique. | ppft del_step 10 Supprime la step d’id 10 Les steps “orphelines” seront à gérer manuellement par le développeur

__ __
#### Error

>Les erreurs ...
Chaque message d erreur ...
>>
>>Pour de plus amples détails ... : [Documentation officiel: gestion des erreurs](https://nodejs.org/)

__ __
## Tools
### Exemple d utilisation pour ... :
Vous pouvez créer ...
__ __
Dans l exemple ...:
- ...
- ...
- ...
- ...
---
Ouvrir ... :
```sh
cd 'nomDuDossierProjet'
```

## License

**Licence Creative ...**
E=MC<sup>2</sup>

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - )

[dill]: <https://github.com/joemccann/dillinger>
[git-repo-url]: <https://github.com/joemccann/dillinger.git>
[john gruber]: <http://daringfireball.net>
[df1]: <http://daringfireball.net/projects/markdown/>
[markdown-it]: <https://github.com/markdown-it/markdown-it>
[Ace Editor]: <http://ace.ajax.org>
[node.js]: <http://nodejs.org>
[Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
[jQuery]: <http://jquery.com>
[@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
[express]: <http://expressjs.com>
[AngularJS]: <http://angularjs.org>
[Gulp]: <http://gulpjs.com>

[PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
[PlGh]: <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
[PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
[PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
[PlMe]: <https://github.com/joemccann/dillinger/tree/master/plugins/medium/README.md>
[PlGa]: <https://github.com/RahulHP/dillinger/blob/master/plugins/googleanalytics/README.md>


