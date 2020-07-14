class ASnake { 
  int body ; //taille du serpent en px (32/32)
  int x [] = new int [900]; 
  int y [] = new int [900];
  int tail ; //indique le nombre de carré composant le serpent
  char dir ; //direction du serpent
  int colorSnake ; //couleur du serpent (blanc)
  boolean alive; //Etat du serpent
  int speed; //vitesse du serpent
  
  
  ASnake() { //constructeur de la classe snake
    body        = 32;
    x[0]        = bs_width/2; //position des deux blocs au centre de l'écran
    y[0]        = bs_height/2;
    x[1]        = x[0]-body; 
    y[1]        = y[0];
    tail        = 2; //nombre de bloc du serpent
    dir         = _rgt; //direction du serpent, 
    alive       = true;
    speed       = 10;
  }// end constructor
  
  void drawing() { //méthode d'affichage du serpent
    myImages.headShow(); //affichage de la tête
    for(i=1;i<tail-1;i++) myImages.bodyShow(i);// affichage du corp 
    myImages.tailShow(); //affichage du bout de la queue
  }//end method drawing 
   
  void isHeadCollision (){ //méthode qui teste la collision de la tête du serpent avec une autre partie de son corps
    for(i=1;i<=tail;i++){ 
      if(x[0]==x[i] && y[0]==y[i] && alive) 
        isDead();
    }//end for
  }//end function isHeadCollision
  
  void isBorderCollision (){ //méthode qui teste la collision de la tête du serpent avec les bordures 
    for(i=1;i<=tail;i++){ 
      if( (mySnake.x[0]<0 || mySnake.x[0]> bs_width-body || mySnake.y[0]-body<0 || mySnake.y[0]>bs_height) && alive) 
        isDead();
    }//end for
  }//end function isBorderCollision
    
  boolean isCollisionWith(int posX, int posY){
    for(i=0;i<=tail;i++){ 
      if(x[i]==posX && y[i]==posY)return(true);       
    }//end for
    return(false);
  }//end function isCollisionWith
  
  void isEating(){
    if(isCollisionWith(myItem.x, myItem.y)){
      addABody();
      myItem.spawItem(); 
      score++;
      if(score%5==0)speed = speed+score/5;
      if(frameRate != speed) frameRate(speed);
    }//end if
  }//end method isEating
   
  void addABody(){ //méthode qui aggrandit le serpent d'un carré
    tail++;
    x[tail-1]=x[tail-2];
    y[tail-1]=y[tail-2];
  }//end method addABodyB
  
  int getSize(){//méthode qui retourne la longueur actuelle du serpent (en bloc de 32/32)
    return(tail) ;
  }//end method getSize
  
  void setDirection(char dir) { //méthode qui permet de diriger le serpent
    if(dir==_up && getDirection()!= _dwn)    mySnake.dir = _up;  
    else if(dir==_dwn && getDirection()!= _up)    mySnake.dir = _dwn;    
    else if(dir==_lft && getDirection()!= _rgt)    mySnake.dir = _lft;  
    else if(dir==_rgt && getDirection()!= _lft)    mySnake.dir = _rgt;  
       
  }//end method setDirection
  
  char getDirection() { //méthode qui renvoie la direction du serpent
    return(dir);
  }//end method getDirection
  
  void move(){ //méthode qui fait avancer le serpent
    if(frame){
      for(i=tail-1;i>0; i-- ) { //shift la position des carrés du serpent dans le tableau
         x[i] = x[i-1];
         y[i] = y[i-1];
      }//end for 
      switch (mySnake.dir){
        case _up : y[0] -= body;
          break;
        case _dwn : y[0] += body;
          break;
        case _rgt : x[0] += body;
          break;
        case _lft : x[0] -= body;    
          break; 
      }// end switch  direction
    }//end if
    else{
      myDisplay.pauseMess();
    }//end else
  }//end method move
  
  void isDead(){
    alive = false; 
    myDisplay.deathMess();
    frameRate(0);
    println("end");
  }//end function isDead
 
}//end class snake
