import processing.sound.*;

//All 6 music files
SoundFile[] music = new SoundFile[6]; 

//Icons for the music files
PImage musicIcon[] = new PImage[6]; 

//Icons for the music names
PImage musicName[] = new PImage[6]; 

//Icons for the music authors and the literal word "author"
PImage musicAuthor[] = new PImage[6]; 
PImage author;

//Boolean for which screen is selectebubbleScale
boolean startingSc = true;
boolean menuSc = false; 

//Initiate image variables
PImage titleImage;
PImage startButtonImage;

//Properties for the bubble backgrounbubbleScale in starting screen
int bubbles = 40; 

float[] bubbleScale = new float[bubbles];
float[] bubblesX = new float[bubbles];

float[] bubbleVelY = new float[bubbles];

//All the stats for both current song and other songs
int[] clear = new int[6]; 
int currentClear = 0; 

int[] accuracy = new int[6];
int currentAcc = 0; 

int[] perfect = new int[6]; 
int currentPerfect = 0; 

int[] great = new int[6]; 
int currentGreat = 0; 

int[] ok = new int[6]; 
int currentOk = 0; 

int[] miss = new int[6]; 
int currentMiss = 0; 

//Select Songs
boolean[] songSelected = new boolean[6]; 

//Properties for the start button location
float startButtonX = 310; 
float startButtonY = 438; 
float startButtonW = 183; 
float startButtonH = 100; 

//Properties for the start song button
float playSongX = 60;
float playSongY = 520; 
float playSongW = 320; 
float playSongH = 60; 

//Properties for the 7 select song buttons
//First button
float selectSongX1 = 460;
float selectSongY1 = 130;
float selectSongW1 = 280;
float selectSongH1 = 50;

//Second button
float selectSongX2 = 460;
float selectSongY2 = 200;
float selectSongW2 = 280;
float selectSongH2 = 50;

//Third button
float selectSongX3 = 460;
float selectSongY3 = 270;
float selectSongW3 = 280;
float selectSongH3 = 50;

//Fourth button
float selectSongX4 = 460;
float selectSongY4 = 480;
float selectSongW4 = 280;
float selectSongH4 = 50;

//Fifth button
float selectSongX5 = 460;
float selectSongY5 = 550;
float selectSongW5 = 280;
float selectSongH5 = 50;
ArrayList<Note> notes = new ArrayList<Note>(); 

int[] colorOfBox = new int[4];

boolean dpressed = false;
boolean fpressed = false;
boolean jpressed = false;
boolean kpressed = false;

//Sixth button
float selectSongX6 = 460;
float selectSongY6 = 620;
float selectSongW6 = 280;
float selectSongH6 = 50;
boolean released = false; 

//X: 300 (First Row) 
//X: 350 (Second Row) 
//X: 400 (Third Row)
//X: 450 (Fourth Row) 
  
void setup() {
  
  size(800, 800); 
  
  //Initialize all the stats
  for (int i = 0; i < 6; i++) {
    
    clear[i] = 0;
    accuracy[i] = 0; 
    perfect[i] = 0; 
    great[i] = 0; 
    ok[i] = 0;
    miss[i] = 0; 
    
  }
  //Initial color of the finish line boxes
  for (int i = 0; i < 4; i++) {
    
    colorOfBox[i] = 150;  
    
  }
  
  //Setup all the sound music
  music[0] = new SoundFile(this, "MusicFolder/creative-technology-showreel-241274.mp3"); 
  music[1] = new SoundFile(this, "MusicFolder/lazy-day-stylish-futuristic-chill-239287.mp3"); 
  music[2] = new SoundFile(this, "MusicFolder/showreel-music-promo-advertising-opener-vlog-background-intro-theme-261601.mp3"); 
  music[3] = new SoundFile(this, "MusicFolder/soulsweeper-252499.mp3"); 
  music[4] = new SoundFile(this, "MusicFolder/stylish-deep-electronic-262632.mp3"); 
  music[5] = new SoundFile(this, "MusicFolder/tell-me-the-truth-260010.mp3"); 
  
  //Setup all the music icons 
  musicIcon[0] = loadImage("Assets/CreativeTechnologyShowreel.png"); 
  musicIcon[1] = loadImage("Assets/LazyDay.png"); 
  musicIcon[2] = loadImage("Assets/ShowreelMusic.png"); 
  musicIcon[3] = loadImage("Assets/SoulSweeper.png"); 
  musicIcon[4] = loadImage("Assets/StylishDeepElectronic.png"); 
  musicIcon[5] = loadImage("Assets/TellMeTheTruth.png"); 
  
  //Setup all the music names 
  musicName[0] = loadImage("Assets/TextFont/text-CreativeTechnologyShowReel.png"); 
  musicName[1] = loadImage("Assets/TextFont/text-LazyDay.png"); 
  musicName[2] = loadImage("Assets/TextFont/text-ShowreelMusic.png"); 
  musicName[3] = loadImage("Assets/TextFont/text-SoulSweeper.png"); 
  musicName[4] = loadImage("Assets/TextFont/text-StylishDeepElectronic.png"); 
  musicName[5] = loadImage("Assets/TextFont/text-TellMeTheTruth.png"); 
  
  //Setup all the author of the music & the word "author"
  musicAuthor[0] = loadImage("Assets/TextFont/text-Pumpupthemind.png"); 
  musicAuthor[1] = loadImage("Assets/TextFont/text-penguinmusic.png"); 
  musicAuthor[2] = loadImage("Assets/TextFont/text-MFCC.png"); 
  musicAuthor[3] = loadImage("Assets/TextFont/text-ItsWatR.png"); 
  musicAuthor[4] = loadImage("Assets/TextFont/text-RoyaltyFreeMusic.png"); 
  musicAuthor[5] = loadImage("Assets/TextFont/text-Denys_Brodovskyi.png"); 
  
  author = loadImage("Assets/TextFont/text-Author.png"); 
  //Notes for testing
  notes.add(new Note(1, 1.0)); 
  notes.add(new Note(2, 1.5)); 
  notes.add(new Note(3, 2.0)); 
  notes.add(new Note(4, 2.5)); 

  //Initiate the selected song so that the selected song is not nilW
  for (int i = 0; i < songSelected.length; i++) {
    
    songSelected[i] = false; 
    
  }
  
  songSelected[0] = true; 
  music[0].loop(); 
  
  //LoabubbleScale the images into the variables for further use
  titleImage = loadImage("Assets/CelestialRhythmTitle.png"); 
  startButtonImage = loadImage("Assets/StartButton.png"); 
  
  //Sets ranbubbleScaleom bubblesX, bubbleScale, anbubbleScale velocity values for the bubbles in the backgrounbubbleScale for the starting screen
  for (int i = 0; i < bubbles; i++) {
          
    bubbleScale[i] = random(1); 
    bubblesX[i] = random(800); 
    
    bubbleVelY[i] = random(1.5); 
    
  }
  

void draw() {
    
  //bubbleScaleraws the starting screen
  if (startingSc == true) {
   
    drawStartScreen(); 
    
  }
  
  //bubbleScaleraws the menu screen
  else if (menuSc == true) {
    
    drawMenuScreen(); 
    
  }
  
}
  notes.get(0).setSpeed(0.5); 
  notes.get(1).setSpeed(0.5); 
  notes.get(2).setSpeed(0.5); 
  notes.get(3).setSpeed(0.5); 

//Starting screen methobubbleScale
void drawStartScreen() {
  
  background(251, 255, 240); 
  
  //BackgrounbubbleScale bubbles animation
  noStroke(); 
  
  for (int i = 0; i < bubbles; i++) {
    
    //Bubble backgrounbubbleScale aura
    fill(240, 255, 255, 150);
    ellipse(bubblesX[i], 900-bubbleVelY[i]*frameCount%900, bubbleScale[i]*70, bubbleScale[i]*70); 
  
    //Bubble bubbleScaleefault blue
    fill(219, 249, 255); 
    ellipse(bubblesX[i], 900-bubbleVelY[i]*frameCount%900, bubbleScale[i]*50, bubbleScale[i]*50); 
    
    //Bubble light white
    fill(255); 
    ellipse(bubblesX[i], 900-bubbleVelY[i]*frameCount%900, bubbleScale[i]*35, bubbleScale[i]*35); 
    
  }
  
  //Title image anbubbleScale startbutton image
  image(titleImage, 0, 0); 
  image(startButtonImage, -20, 200); 
  
}
}

//Menu screen methobubbleScale
void drawMenuScreen() {
  
  background(251, 255, 240); 
  
  //BackgrounbubbleScale bubbles animation
  noStroke(); 
  
  for (int i = 0; i < bubbles; i++) {
    
    //Bubble backgrounbubbleScale aura
    fill(240, 255, 255, 150);
    ellipse(bubblesX[i], 900-bubbleVelY[i]*frameCount%900, bubbleScale[i]*70, bubbleScale[i]*70); 
  
  //Note path background
  fill(1, 1, 1, 100);
    //Bubble bubbleScaleefault blue
    fill(219, 249, 255); 
    ellipse(bubblesX[i], 900-bubbleVelY[i]*frameCount%900, bubbleScale[i]*50, bubbleScale[i]*50); 
  //Note path background
  fill(150);
    
    //Bubble light white
    fill(255); 
    ellipse(bubblesX[i], 900-bubbleVelY[i]*frameCount%900, bubbleScale[i]*35, bubbleScale[i]*35); 
    
  }
  
  //For testing purposes (not going to be in final game)
  //Stat box
  stroke(1); 
  rect(40, 150, 360, 310); 
  
  String stat = "Clears: "; 
  
  //All the stats for the music being played
  for (int i = 0; i < songSelected.length; i++) {
    
    if (songSelected[i] == true) {

      for (int j = 0; j < songSelected.length; j++) {
        
        textSize(30); 
        fill(1); 
          
        if (j == 0) {
          
          stat = "Clear: "; 
          
        }
        else if (j == 1) {
          
          stat = "Accuracy: "; 
          
        }
        else if (j == 2) {
          
          stat = "Perfect: ";
          
        }
        else if (j == 3) {
          
          stat = "Great: ";
          
        }
        else if (j == 4) {
          
          stat = "Ok: ";
          
        }
        else if (j == 5) {
          
          stat = "Miss: ";
          
        }
        
        text(stat + clear[i], 150, 180 + 40*j); 
        noFill(); 
          
      }
    }
  }
  
  //Play song button box
  fill(255); 
  rect(playSongX, playSongY, playSongW, playSongH); 
  
  fill(1);
  textSize(40); 
  text("Play Music", playSongX + 80, playSongY + 40);
  
  //Select song buttons
  fill(210, 12, 237); 
  rect(selectSongX1, selectSongY1, selectSongW1, selectSongH1);
  fill(0, 0, 255); 
  rect(selectSongX2, selectSongY2, selectSongW2, selectSongH2);
  fill(0, 255, 0); 
  rect(selectSongX3, selectSongY3, selectSongW3, selectSongH3);
  fill(255, 255, 0); 
  rect(selectSongX4, selectSongY4, selectSongW4, selectSongH4);
  fill(255, 139, 0); 
  rect(selectSongX5, selectSongY5, selectSongW5, selectSongH5);
  fill(255, 0, 0); 
  rect(selectSongX6, selectSongY6, selectSongW6, selectSongH6);
  
  //Icons for each song
  image(musicIcon[0], selectSongX1, selectSongY1, 50, 50); 
  image(musicIcon[1], selectSongX2, selectSongY2, 50, 50); 
  image(musicIcon[2], selectSongX3, selectSongY3, 50, 50); 
  image(musicIcon[3], selectSongX4, selectSongY4, 50, 50); 
  image(musicIcon[4], selectSongX5, selectSongY5, 50, 50); 
  image(musicIcon[5], selectSongX6, selectSongY6, 50, 50); 
  
  //Name for each song
  image(musicName[0], selectSongX1 + 60, selectSongY1, 220, 30); 
  image(musicName[1], selectSongX2 + 120, selectSongY2, 60, 40); 
  image(musicName[2], selectSongX3 + 100, selectSongY3 - 10, 100, 50); 
  image(musicName[3], selectSongX4 + 100, selectSongY4 - 10, 120, 50); 
  image(musicName[4], selectSongX5 + 60, selectSongY5, 220, 30); 
  image(musicName[5], selectSongX6 + 60, selectSongY6, 220, 30); 
  
  //Current song box to place song author
  fill(255); 
  stroke(1); 
  rect(450, 350, 300, 100);
  
  //Author for each song
  image(author, 560, 350); 
  
  for (int i = 0; i < songSelected.length; i++) {
    
    if (songSelected[i] == true) {
      
      image(musicAuthor[i], 520, 380); 
      
    }
    
  }

}

void mousePressed() {
  
  //Get mouse pressed to enter menu screen from title screen
  if (startingSc == true && mouseX > startButtonX && mouseX < startButtonX + startButtonW && mouseY > startButtonY && mouseY < startButtonY + startButtonH) {
        
    startingSc = false; 
    menuSc = true; 
  
  //Finish box col 1
  stroke(1);
  fill(colorOfBox[0]); 
  quad(105, 520, 252.5, 520, 230, 640, 60, 640); 
  
  //Finish box col 2
  stroke(1);
  fill(colorOfBox[1]); 
  quad(252.5, 520, 400, 520, 400, 640, 230, 640); 
  
  //Finish box col 3
  stroke(1);
  fill(colorOfBox[2]); 
  quad(400, 520, 547.5, 520, 570, 640, 400, 640); 
  
  //Finish box col 4
  stroke(1);
  fill(colorOfBox[3]); 
  quad(547.5, 520, 695, 520, 740, 640, 570, 640); 
  
  //Start of finish line
  stroke(1); 
  line(110, 520, 690, 520); 
  
  //End of finish line
  stroke(1); 
  line(60, 640, 740, 640); 
  
  //Draw the notes
  for (int i = 0; i < notes.size(); i++) {
    
    notes.get(i).drawNote();    
    
  }
  
}

void checkNotePressed(int col) {
  
  int indexOfClosest = 0; 
  boolean notesExist = false; 
  
  //Initialize the closest note for the collumn
  for (int i = 0; i < notes.size(); i++) {
      
      if (notes.get(i).getCol() == col) {
        
        indexOfClosest = i; 
        notesExist = true; 
        break;
        
      }
      else
        notesExist = false; 
  }
     
  //Get the note that is closest so that user input only detects that note
  for (int i = 0; i < notes.size(); i++) {
    
    if (notes.get(i).getCol() == col) {
      if (520 - notes.get(i).getPos().y < 520 - notes.get(indexOfClosest).getPos().y) {
        
        indexOfClosest = i; 
        
      }
    }
  }
  
  //Checks where the note is pressed and determines the points you got or if you missed
  if (notes.size() > 0 && notesExist == true) {
        
    float noteH = notes.get(indexOfClosest).getH(); 
    float notefY = notes.get(indexOfClosest).getPos().y + noteH/2; 
    float notebY = notes.get(indexOfClosest).getPos().y - noteH/2; 

    if (notefY < 520 - noteH) {
      
      println("Miss"); 
      
    }
    else if (notefY > 520 - noteH - 15 && notefY < 520) {
     
      println("Ok"); 
      notes.remove(indexOfClosest); 
      
    }
    else if (notefY > 520 - 35 && notefY < 520) {
     
      println("Great"); 
      notes.remove(indexOfClosest); 
      
    }
    else if (notebY > 520 - 25 && notefY < 640 + 20) {
     
      println("Perfect"); 
      notes.remove(indexOfClosest); 
      
    }
    else if (notebY < 640 + 35 && notefY > 640) {
     
      println("Great"); 
      notes.remove(indexOfClosest); 
      
    }
    else if (notebY < 640 + noteH + 15 && notefY > 640) {
     
      println("Ok"); 
      notes.remove(indexOfClosest); 
      
    }
    else if (notebY > 640 + noteH) {
     
      println("Miss"); 
      
    }
    
  }
  
}

void keyPressed() {
  
  if (key == 'd' && dpressed == false) {
    
    colorOfBox[0] = 255;
    checkNotePressed(1); 
    dpressed = true; 
    
  }
  
  
  //Select songs
  if (menuSc == true && mouseX > selectSongX1 && mouseX < selectSongX1 + selectSongW1 && mouseY > selectSongY1 && mouseY < selectSongY1 + selectSongH1) {
        
    for (int i = 0; i < songSelected.length; i++) {
       
       songSelected[i] = false; 
       music[i].stop(); 
       
     }
     
     songSelected[0] = true; 
     music[0].loop(); 
  if (key == 'f' && fpressed == false) {
    
  }
  else if (menuSc == true && mouseX > selectSongX2 && mouseX < selectSongX2 + selectSongW2 && mouseY > selectSongY2 && mouseY < selectSongY2 + selectSongH2) {
    
     for (int i = 0; i < songSelected.length; i++) {
       
       songSelected[i] = false; 
       music[i].stop(); 

     }
     
     songSelected[1] = true; 
     music[1].loop(); 

  }
  else if (menuSc == true && mouseX > selectSongX3 && mouseX < selectSongX3 + selectSongW3 && mouseY > selectSongY3 && mouseY < selectSongY3 + selectSongH3) {
    
     for (int i = 0; i < songSelected.length; i++) {
       
       songSelected[i] = false; 
       music[i].stop(); 

     }
     
     songSelected[2] = true; 
     music[2].loop(); 

  }
  else if (menuSc == true && mouseX > selectSongX4 && mouseX < selectSongX4 + selectSongW4 && mouseY > selectSongY4 && mouseY < selectSongY4 + selectSongH4) {
    
     for (int i = 0; i < songSelected.length; i++) {
       
       songSelected[i] = false; 
       music[i].stop(); 

     }
     
     songSelected[3] = true; 
     music[3].loop(); 

  }
  else if (menuSc == true && mouseX > selectSongX5 && mouseX < selectSongX5 + selectSongW5 && mouseY > selectSongY5 && mouseY < selectSongY5 + selectSongH5) {
    
     for (int i = 0; i < songSelected.length; i++) {
       
       songSelected[i] = false; 
       music[i].stop(); 

     }
     
     songSelected[4] = true; 
     music[4].loop(); 

  }
  else if (menuSc == true && mouseX > selectSongX6 && mouseX < selectSongX6 + selectSongW6 && mouseY > selectSongY6 && mouseY < selectSongY6 + selectSongH6) {
    
     for (int i = 0; i < songSelected.length; i++) {
       
       songSelected[i] = false; 
       music[i].stop(); 

     }
     
     songSelected[5] = true; 
     music[5].loop(); 

  }

    colorOfBox[1] = 255;
    checkNotePressed(2); 
    fpressed = true; 

  }
  if (key == 'j' && jpressed == false) {
    
    colorOfBox[2] = 255;
    checkNotePressed(3); 
    jpressed = true; 

  }
  if (key == 'k' && kpressed == false) {
    
    colorOfBox[3] = 255;
    checkNotePressed(4); 
    kpressed = true; 
    
  }
  
  
}

void keyReleased() {
  
  if (key == 'd') {
    
    colorOfBox[0] = 150;
    checkNotePressed(1); 
    dpressed = false; 

  }
  if (key == 'f') {
    
    colorOfBox[1] = 150;
    checkNotePressed(2); 
    fpressed = false; 

  }
  if (key == 'j') {
    
    colorOfBox[2] = 150;
    checkNotePressed(3); 
    jpressed = false; 

  }
  if (key == 'k') {
    
    colorOfBox[3] = 150;
    checkNotePressed(4); 
    kpressed = false; 

  }
  
}
