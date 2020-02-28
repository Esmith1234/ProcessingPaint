//Sk04: Draw Lines w/mouse
int sw = 5; // Stroke Weight
PImage[] images = new PImage[11];
String[] files = {"charlton vale 3.jpg", "png/001-pencil.png", "png/002-paintbrush.png", "png/031-eyedropper.png", 
"png/016-paintbrush-1.png", "png/024-eraser.png", "png/rectangle.png", "png/circle.png", 
"png/ellipse.png","png/triangle.png"};
int iconMargin = 10;
int iconOffset;
int iconXOffset;
int iconYOffset;
int offset = 190;
void setup(){
  size(800, 600);
  surface.setResizable(true);
  //First make a test image to debug your histograms
  //img = makeTestImage(1000, 1000, color(255, 128, 55));
  for(int i = 0; i < files.length; i++){
    images[i] = loadImage(files[i]);
    if(i >= 1){
      images[i].resize(50,50);
    }
  }
  
  surface.setSize(images[0].width+offset,images[0].height);
  background(255);
  stroke(255,0,0);
  strokeWeight(1);
 
}
void draw(){
 if(mousePressed){
  line(mouseX, mouseY, pmouseX, pmouseY); 
 }
 stroke(0);
 image(images[0], offset, 0);
 
  //Draw toolbar
  rect(0,0,offset,height);
  iconXOffset = 0;
  iconYOffset = 0;
  for(int i = 1; i < images.length-1; i++){
    
    
    switch(i%3){
      case 0:
      image(images[i], iconMargin + iconXOffset, iconMargin+iconYOffset);
      iconYOffset += 55;
      iconXOffset = 0;
      break;
      case 1:
      image(images[i], iconMargin + iconXOffset, iconMargin+iconYOffset);
      iconXOffset += 60;
      break;
      case 2:
      image(images[i], iconMargin + iconXOffset, iconMargin+iconYOffset);
      iconXOffset += 60;
      break;
    }
   
  }
}

void keyPressed(){
 if(key == ' '){
  clear(); 
 }
 else if(key == 'r'){
  stroke(255,0,0);
 }
 else if(key == 'g'){
  stroke(0,255,0);
 } 
 else if(key == 'b'){
  stroke(0,0,255);
 }
 else if(key == CODED){
    if(keyCode == UP){
      if(sw < 50){
        sw+=1;
        strokeWeight(sw);
      }
    }
    else if(keyCode == DOWN){
      if(sw > 1){
        sw-=1;
        strokeWeight(sw);
       }  
     }
  }
}
