Ce programme permet de créer des potins  et de les modifiers.
  Avec Sinatra, nous avons lier une page html avec un base de données CSV.
    Celle-ci récupère le potin et son auteur et permet qu'on y accèdes depuis le lien qui lui correspond.

A venir, nous pourrons également ajouter des commentaires à ceux-ci.

gossip.rb : Contient les méthode de création, de stockage et d'update des gossips
controller.rb : Permets le lien entre notre html et nos méthode à l'aide de get et de post en sinatra

Dans le dossier View :
  index.erb : Page d'acceuil avec les liens de chaques potins
  new_gossip : page html ou l'on peut créer le commentaire
  edit.erb : Page html qui permet de modifier un gossip


  Le config.ru permets simplement de lancer le tout.