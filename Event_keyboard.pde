void keyPressed(){ 
  if (key == 'i') myItem.spawItem();
  else if(key == 's') mySnake.addABody();
  else if (key ==' ') pause();
  if(frame){
    if(keyCode == UP) mySnake.setDirection(_up) ;
    else if(keyCode == DOWN) mySnake.setDirection(_dwn);   
    else if(keyCode == LEFT) mySnake.setDirection(_lft); 
    else if(keyCode == RIGHT) mySnake.setDirection(_rgt); 
  }//end if(frame)
}//end function keyPressed
