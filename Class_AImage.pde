class AImage{ 
  AImage(){ //constructeur de la classe AImage
  } // fin du constructeur AImage
  
  void appleShow(int posX,int posY){
    image(imgApple,posX,posY);
  }//end method appleShow
  
  void headShow(){
      if(mySnake.y[0]< mySnake.y[1]&& mySnake.x[0] == mySnake.x[1] )
        rotImg(imgHead,mySnake.x[0],mySnake.y[0],0);
      else if(mySnake.x[0] < mySnake.x[1] &&  mySnake.y[0] == mySnake.y[1])
        rotImg(imgHead,mySnake.x[0],mySnake.y[0],270); 
      else if(mySnake.x[0] > mySnake.x[1] && mySnake.y[0] == mySnake.y[1])
        rotImg(imgHead,mySnake.x[0],mySnake.y[0],90); 
      else if(mySnake.y[0]> mySnake.y[1] && mySnake.x[0] == mySnake.x[1])
        rotImg(imgHead,mySnake.x[0],mySnake.y[0],180);
  }//end method headShow
  
  void bodyShow(int nBody){
    if(mySnake.y[i-1] == mySnake.y[i] && mySnake.y[i] == mySnake.y[i+1]) {//corps à l'horizontal
      rotImg(imgBody,mySnake.x[nBody],mySnake.y[nBody],90);
    }
    else if(mySnake.x[i-1] == mySnake.x[i] && mySnake.x[i] == mySnake.x[i+1]) {//corps à la vericale
      rotImg(imgBody,mySnake.x[nBody],mySnake.y[nBody],0);
    }
    
    else if(((mySnake.x[i] == mySnake.x[i+1]) && (mySnake.x[i] < mySnake.x[i-1]) && (mySnake.y[i] == mySnake.y[i-1]) && (mySnake.y[i] < mySnake.y[i+1])) 
    ||((mySnake.x[i] == mySnake.x[i-1]) && (mySnake.x[i] < mySnake.x[i+1]) && (mySnake.y[i] == mySnake.y[i+1]) && (mySnake.y[i]< mySnake.y[i-1]))) {//corps en coin
      rotImg(imgRC,mySnake.x[nBody],mySnake.y[nBody],0);
    }
    else if(((mySnake.x[i] == mySnake.x[i-1]) && (mySnake.x[i] > mySnake.x[i+1]) && (mySnake.y[i] == mySnake.y[i+1]) && (mySnake.y[i] < mySnake.y[i-1])) 
    ||  ((mySnake.x[i] == mySnake.x[i+1]) && (mySnake.x[i] > mySnake.x[i-1]) && (mySnake.y[i] == mySnake.y[i-1]) && (mySnake.y[i]< mySnake.y[i+1]))) {//corps en coin +90
       rotImg(imgRC,mySnake.x[nBody],mySnake.y[nBody],90);
    }
    else if(((mySnake.x[i] == mySnake.x[i+1]) && (mySnake.x[i] > mySnake.x[i-1]) && (mySnake.y[i] == mySnake.y[i-1]) && (mySnake.y[i] > mySnake.y[i+1])) 
    || ((mySnake.x[i] == mySnake.x[i-1]) && (mySnake.x[i] > mySnake.x[i+1]) && (mySnake.y[i] == mySnake.y[i+1]) && (mySnake.y[i] > mySnake.y[i-1]))) {//corps en coin +180
       rotImg(imgRC,mySnake.x[nBody],mySnake.y[nBody],180);
    }
    
    else if(((mySnake.x[i] == mySnake.x[i-1]) && (mySnake.x[i] < mySnake.x[i+1]) && (mySnake.y[i] == mySnake.y[i+1]) && (mySnake.y[i] > mySnake.y[i-1])) 
    ||  ((mySnake.x[i] == mySnake.x[i+1]) && (mySnake.x[i] < mySnake.x[i-1]) && (mySnake.y[i] == mySnake.y[i-1]) && (mySnake.y[i]> mySnake.y[i+1]))) {//corps en coin -90
       rotImg(imgRC,mySnake.x[nBody],mySnake.y[nBody],270);
    }
    
  }//end method bodyShow
  
  void tailShow(){
    int lgt = mySnake.tail-1;
    if(mySnake.x[lgt-1] > mySnake.x[lgt]) rotImg(imgTail,mySnake.x[lgt],mySnake.y[lgt],270);
    else if (mySnake.x[lgt-1] < mySnake.x[lgt])rotImg(imgTail,mySnake.x[lgt],mySnake.y[lgt],90);
    else if (mySnake.y[lgt-1] > mySnake.y[lgt])rotImg(imgTail,mySnake.x[lgt],mySnake.y[lgt],0);
    else if (mySnake.y[lgt-1] < mySnake.y[lgt])rotImg(imgTail,mySnake.x[lgt],mySnake.y[lgt],180);
  }//end method tailShow
  
  void rotImg(PImage img, int transX, int transY, int deg){ // fonction qui permet de faire une rotation d'une image de 32/32 sur elle même - degré en sens horlogique
    pushMatrix();
    translate(transX+mySnake.body/2,transY+mySnake.body/2);
    switch (deg){
          case 0 : rotate(0);
            break;
          case 90: rotate(PI/2.0);
            break;
          case 180 : rotate(PI);
            break;
          case 270 : rotate(-PI/2.0);    
            break; 
          default: rotate(0);
    }//end switch case
    image(img,-mySnake.body/2,-mySnake.body/2);
    popMatrix();
  }// end method rotateImg
  
  void grassShow (){ // fonction de remplissage de l'arrière plan avec l'image "grass.png"
    for(i=0;i<height/32;i++){
      for(j=0;j<width/32;j++){
        image(imgGrass,i*32,j*32);
      }//end for j
    }//end for i
  }//end method grassShow
  
}//end class AImage
