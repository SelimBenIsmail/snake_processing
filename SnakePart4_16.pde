//constantes
final int bs_width = 960; //largeur de la fenêtre
final int bs_height = 960; //hauteur de la fenêtre
final char _up = 0b11; // le type char permet d'utiliser un switch case
final char _dwn = 0b00; 
final char _lft = 0b10;
final char _rgt = 0b01;
//variables globales
PImage imgGrass; //image de gazon
PImage imgApple; //image de la pomme
PImage imgHead; //image de la tête du serpent
PImage imgBody; //image du corps du serpent 
PImage imgRC; //image de l'angle du corps du serpent
PImage imgTail; //image de la Queue du serpent
int i; //variable d'itération 1
int j; //variable d'itération 2
int score = 0; //variable du score
boolean frame = false; //etat du framerate du serpent
//instances
ASnake mySnake = new ASnake(); //nouvelle instance de la classe snake
AItem myItem = new  AItem(); //nouvelle instance de la classe snake 
AImage myImages = new AImage(); //nouvelle instance de la classe AImage
ADisplay myDisplay = new ADisplay(); //nouvelle instance dela classe ADisplay

//initialisation
void setup() {
  size(960, 960); //taille de la fenêtre
  frameRate(10);
  imgGrass = loadImage("grass.png");
  imgApple = loadImage("s-apple.png");
  imgHead = loadImage("s-head.png");
  imgBody = loadImage("s-l-body.png");
  imgRC = loadImage("s-rc-body.png");
  imgTail = loadImage("s-tail.png");  
}// end setup

void draw (){ //boucle principale
  myImages.grassShow(); //affiche le fond 
  myItem.drawing(); //affiche la pomme
  mySnake.drawing(); //affichage du serpent
  mySnake.isBorderCollision(); //test de la collision avec la bordure
  mySnake.isHeadCollision(); //test de la collision de la tête du serpent
  mySnake.isEating(); //teste si le serpent mange
  mySnake.move(); //fait avancer le serpent
  myDisplay.score(); //affichage du score du joueur 
  myDisplay.speed(); //affichage de la vitesse du serpent 
}//end Draw

void pause (){
  frame = !frame;
}//end function pause
