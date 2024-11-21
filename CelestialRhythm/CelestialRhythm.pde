ArrayList<Note> notes = new ArrayList<Note>(); 

//X: 300 (First Row) 
//X: 350 (Second Row) 
//X: 400 (Third Row)
//X: 450 (Fourth Row) 
  
void setup() {
  
  size(800, 800); 
  
  notes.add(new Note(1, 1.0)); 
  notes.add(new Note(2, 1.5)); 
  notes.add(new Note(3, 2.0)); 
  notes.add(new Note(4, 2.5)); 

  notes.get(0).setSpeed(0.5); 
  notes.get(1).setSpeed(0.5); 
  notes.get(2).setSpeed(0.5); 
  notes.get(3).setSpeed(0.5); 

}

void draw() {
  
  background(255); 
  
  //Draw the notes
  for (int i = 0; i < notes.size(); i++) {
    
    notes.get(i).drawNote();    
    
  }
  
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
