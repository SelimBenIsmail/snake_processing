class AItem { 
  int body; // taille de l'item en px (32/32)
  int x;
  int y;
  int colorItem ;
  
  AItem() { //constructeur de la classe AItem
    body           = 32;
    x              = int(random(0,bs_width/32))*32;
    y              = int(random(0,bs_height/32))*32;
    colorItem      = color(255,0,0); //rouge  
  }//end constructor
  
  void drawing() { //méthode d'affichage de l'item
    myImages.appleShow(x,y);
  }//end method drawing 
  
  void spawItem(){
    x = int(random(0,bs_width/32))*32;
    y = int(random(0,bs_height/32))*32;
    drawing();
    if(mySnake.isCollisionWith(x,y)) spawItem();
  }//end method spawItem
}//end class AItem
