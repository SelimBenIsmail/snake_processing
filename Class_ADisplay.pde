class ADisplay{ //classe qui gère l'affichage du
   ADisplay(){//constructeur de la classe ADisplay
   }//end constructor ADisplay
   
  void score(){// function qui affiche le score du joueur
    fill(255);
    pushMatrix();
    scale(2);
    text("score: "+score,10,height/80);
    popMatrix();
  }//end method score
  
  void speed(){// function qui affiche la vitesse du serpent
    fill(255);
    pushMatrix();
    scale(2);
    text("speed: "+mySnake.speed,420, height/80);
    popMatrix();
  }//end method speed
  
  void pauseMess(){// function qui affiche la vitesse du serpent
    fill(255);
    pushMatrix();
    scale(3);
    text("Pause",140, 120);
    scale(0.5);
    text("Press the spacebar to continue",240, 255);  
    popMatrix();
  }//end method pauseMess
  
  void deathMess(){// function qui affiche la vitesse du serpent
    fill(255,0,0);
    pushMatrix();
    scale(3);
    text("Game over",130, 120);
    popMatrix();
  }//end method pauseMess
}//end class ADisplay
