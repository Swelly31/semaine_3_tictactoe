require "pry"

# définition du BOARD

grille = ["","","","","","","","",""]  #grille vide
valeurs = ["1","2","3","4","5","6","7","8","9"] # grille avec les 9 données

# on part du principe que le jeu démarre avec zéro victoire, soit win = 0
win=0


# choix du signe pour les joueurs
puts "Choisissez votre signe"
signe = gets.chomp

# affichage des 3 arrays extraites des valeurs
puts valeurs[0..2].to_s
puts valeurs[3..5].to_s
puts valeurs[6..8].to_s

# choix des signes si la saisie n'est pas égale à X ou O
while (signe!="X" && signe!="O")
  puts "Choisissez X ou O"
  signe = gets.chomp
end

# tant que la grille présente des zones vides
while ((grille[0]=="" || grille[1]=="" || grille[2]=="" || grille[3]=="" || grille[4]=="" || grille[5]=="" || grille[6]=="" || grille[7]=="" || grille[8]=="") && win==0)
  
# choix de la case à remplir qui doit être vide
  puts "Quelle case voulez vous remplir ?"
  x = gets.chomp.to_i - 1
  while grille[x]!=""
    puts "Choisissez une autre case"
    x = gets.chomp.to_i - 1
  end

# récupération du signe x et affichage dans la zone souhaitée
  grille[x]=signe
  valeurs[x]=signe
  puts valeurs[0..2].to_s
  puts valeurs[3..5].to_s
  puts valeurs[6..8].to_s

# passage alternativement du signe X au signe O
  if (signe=="X")
    signe="O"
  else
    signe="X"
  end

# grille de résultat qui passe win en 1 et sonne donc la fin du jeu
  if (grille[0]==grille[1] && grille[0]==grille[2] && grille[0]!="" || grille[3]==grille[4] && grille[3]==grille[5] && grille[3]!="" || grille[6]==grille[7] && grille[6]==grille[8] && grille[6]!="" || grille[0]==grille[3] && grille[0]==grille[6] && grille[0]!="" || grille[1]==grille[4] && grille[1]==grille[7] && grille[1]!="" || grille[2]==grille[5] && grille[2]==grille[8] && grille[2]!="" || grille[0]==grille[4] && grille[0]==grille[8] && grille[0]!="" || grille[2]==grille[4] && grille[2]==grille[6] && grille[2]!="")
    win=1
  end
end

# le jeu est fini 
if win==1
  if (signe=="X")
    puts "fin de partie, O a gagné"
  else
    puts "fin de partie, X a gagné"
  end
else
  puts "fin de partie, match nul"
end
