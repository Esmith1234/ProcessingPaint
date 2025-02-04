//Sk04: Draw Lines w/mouse
int sw = 5; // Stroke Weight
String[] files = {"charlton vale 3.jpg", "png/001-pencil.png", "png/002-paintbrush.png", "png/031-eyedropper.png", 
"png/016-paintbrush-1.png", "png/024-eraser.png", "png/rectangle.png", "png/circle.png", 
"png/ellipse.png","png/triangle.png" ,"png/FruitBowl.jpg", "png/spectrum.jpg"};
PImage[] images = new PImage[files.length];
PImage grayFruit, negativeFruit, img;
String fileName = "charlton vale 3.jpg";
int iconMargin = 10;
int iconOffset;
int iconXOffset;
int iconYOffset;
int offset = 190;
color c;
void setup(){
  image(img,offset,0);
  //First make a test image to debug your histograms
  //img = makeTestImage(1000, 1000, color(255, 128, 55));
  for(int i = 0; i < files.length; i++){
    images[i] = loadImage(files[i]);
    if(i >= 1){
      images[i].resize(50,50);
    }
  }
  grayFruit = images[10].copy();
  negativeFruit = images[10].copy();
  negativeFruit.filter(INVERT);
  grayFruit.filter(GRAY);
}

public void settings(){
  img = loadImage(fileName);
  println(img.height, " " , img.width);
  size(int(img.width+offset), int(img.height));
}
void draw(){
  //Draw toolbar
  rect(0,0,offset,height);
  iconXOffset = 0;
  iconYOffset = 15;
  for(int i = 1; i < images.length-2; i++){
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
  iconYOffset+= 11;
  line(0, iconYOffset, offset, iconYOffset);
  iconYOffset+= 30;
  //Filters
  image(images[10], iconMargin + iconXOffset, iconMargin+iconYOffset);

  iconXOffset += 60;
  image(grayFruit, iconMargin + iconXOffset, iconMargin+iconYOffset);
  iconXOffset += 60;
  image(negativeFruit, iconMargin + iconXOffset, iconMargin+iconYOffset);
  
  //spectrum
  images[11].resize(189,190);
  image(images[11], 1, 300);
  
  //text
  fill(0);
  textSize(18);
  text("Tools",100 , 10); 
  text("Filters",100 , 200); 
  textAlign(CENTER, CENTER);
  fill(255);
  //line after text
  line(0, 22, offset, 22);
  line(0, 215, offset, 215);
  line(0, 300, offset, 300);
  //mousepressed
  
  
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

void mousePressed(){
  //tools
   if((mouseX >= 10 && mouseX <= 60)&&(mouseY >= 25 && mouseY <= 75)) print("Pencil");
   if((mouseX >= 70 && mouseX <= 130)&&(mouseY >= 25 && mouseY <= 75)) print("Brush");
   if((mouseX >= 130 && mouseX <= 180)&&(mouseY >= 25 && mouseY <= 75)) print("Dropper");
   if((mouseX >= 10 && mouseX <= 60)&&(mouseY >= 80 && mouseY <= 130)) print("Thicc Brush");
   if((mouseX >= 70 && mouseX <= 130)&&(mouseY >= 80 && mouseY <= 130)) print("Eraser");
   if((mouseX >= 130 && mouseX <= 180)&&(mouseY >= 80 && mouseY <= 130)) print("Rectangle");
   if((mouseX >= 10 && mouseX <= 60)&&(mouseY >= 135 && mouseY <= 185)) print("Circle");
   if((mouseX >= 70 && mouseX <= 130)&&(mouseY >= 135 && mouseY <= 185)) print("Oval");
   if((mouseX >= 130 && mouseX <= 180)&&(mouseY >= 135 && mouseY <= 185)) print("Triangle");
   
   //Filters
   if((mouseX >= 10 && mouseX <= 60)&&(mouseY >= 231 && mouseY <= 281)) print("Normal");
   if((mouseX >= 70 && mouseX <= 120)&&(mouseY >= 231 && mouseY <= 281)) print("Gray");
   if((mouseX >= 130 && mouseX <= 180)&&(mouseY >= 231 && mouseY <= 281)) print("Inverse");
   
   //Colors
   if((mouseX >= 1 && mouseX <= 190)&&(mouseY >= 300 && mouseY <= 490)) print("Colors");
}

void mouseDragged(){
   //images[0].set(mouseX-190,mouseY, color(255,0,0));
   stroke(255, 255, 0);
   line(mouseX, mouseY, pmouseX, pmouseY);
}
