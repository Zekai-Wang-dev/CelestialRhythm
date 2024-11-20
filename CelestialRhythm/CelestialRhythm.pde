

void setup() {
  
  size(800, 800); 
  
  
}



void draw() {
  
  background(255); 
  
  //Note path background
  fill(1, 1, 1, 100);
  quad(300, 0, 500, 0, 800, 800, 0, 800); 
  
  //Note seperation 1
  stroke(1); 
  line(350, 0, 200, 800); 
  
  //Note seperation 2
  stroke(1); 
  line(400, 0, 400, 800); 
  
  //Note seperation 3
  stroke(1); 
  line(450, 0, 600, 800); 
  
}
