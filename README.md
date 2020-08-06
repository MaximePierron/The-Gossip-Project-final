## The Gossip Project final version

Pour tester le projet, il ne faudra pas oublier de faire dans l'ordre :
* `bundle install`
* `rails db:drop`
* `rails db:create`
* `rails db:migrate`
* `rails db:seed`
* `rails server`
* Puis il te suffit d'aller sur [http://localhost:3000/](http://localhost:3000/)

# Page Welcome réactive
Pour la page welcome, il te suffit d'entrer directement son URL avec votre nom. Par exemple, si vous voulez tester pour un utilisateur qui s'appelle Barnabé :  

[http://localhost:3000/welcome/Barnabé](http://localhost:3000/welcome/Barnabé)

La version présente ici a aussi les cookies, j'ai pris de l'avance sur vendredi dans l'éventualité d'avoir encore une fois à tout effacer pour tout récrire. #current_user
