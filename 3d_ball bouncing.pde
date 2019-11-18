PImage img;
PShape globe;

ArrayList<Ball> balls = new ArrayList();

boolean check = false;

void setup(){
  
  size(400,400,P3D);
  //smooth();
  //noStroke();  
  
}

void draw(){
  
  background(255);
  translate(width/2, height/2,0);
  stroke(0);  
  wall();
  translate(-width/2, -height/2, 0);
  
  if(check == true){
     mouseClicked();
  }
 
  for (Ball b: balls){
    b.run();
  }
   
}

class Ball{ 
  
  float x,y;
  float speedX = int(random(0,10));
  float speedY = int(random(0,10));
  float speedZ = int(random(-10,-5));
  int i;
  float z = 0;
  
  Ball(float fx, float fy, int ii){
    x = fx;
    y = fy;
    i = ii;
  }
  
   
  void run(){
    display();
    move();
    //gravity();
    bounce();
    
  }
  
  void display(){
    
    //ellipse(x,y,20,20);
    noStroke();
    lights();
    translate(x,y,z);
  
    String img_name = i +".JPG";
    PImage ball_img = loadImage(img_name,"JPG");
    globe = createShape(SPHERE, 20);
    globe.setTexture(ball_img);   
    shape(globe);
    
    translate(-x,-y,-z);    
    
  }
  
  void move(){
    x = x+speedX;
    y = y+speedY;
    z = z+speedZ;
    
  }
  
  void gravity(){
    speedX += 0.98;
    speedY += 0.98;
  }
  
  void bounce(){ 
    if(x>width-20 || x<10){
      speedX=-speedX;
      speedX--;
    }

    if (y>height-20) {
      speedY=-speedY;
      speedY=speedY*0.98;
      speedX=speedX*0.98;
      
    }
    if (y<10) {
      speedY=-speedY;
      speedY--;
    }
    
    if(z<-200){
      speedZ = -speedZ;
    }   
      
  }
     
}

void mouseClicked(){  
  check = true;
  if(balls.size()<10){
      balls.add(new Ball(mouseX,mouseY, int(random(1,4))));
      check = false;
  }

}


void wall(){
  
  noFill();
  beginShape(); 
  
  vertex(-200, 200, 200);
  vertex(-200, 200, -200);
  vertex(-200, -200, -200);
  vertex(200, -200, -200);
  
  
  vertex(200, 200, -200);
  vertex(200, 200, 200);
  vertex(200, -200, 200);
  vertex(200, -200, -200);
  vertex(200, 200, -200);
  vertex(-200, 200, -200);
  vertex(-200, 200, 200);
  vertex(200, 200, 200);
  vertex(200, -200, 200);
  vertex(-200, -200, 200);
  vertex(-200, -200, -200);
  
  
  vertex(200, -200, -200);
  vertex(-200, -200, -200);
  vertex(-200, -200, 200);
  vertex(200, -200, 200);
  
  vertex(200, -200, -200);
  vertex(-200, -200, -200);
  vertex(-200, 200, -200);
  vertex(200, 200, -200);
  vertex(-200, 200, -200);
  vertex(-200, -200, -200);
  vertex(-200, -200, 200);
  vertex(200, -200, 200);
  vertex(200, 200, 200);
    
  endShape(CLOSE);
  
  
}
