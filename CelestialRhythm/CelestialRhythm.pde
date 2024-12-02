import processing.sound.*;

//All 6 music files
SoundFile[] music = new SoundFile[6]; 

//Sound effect for a beat
SoundFile beat; 

//Background for gameplay
PImage gameBack[] = new PImage[6];

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
boolean gameSc = false; 

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

//Points system
int[] points = new int[6]; 
int currentPoints = 0; 

int[] combo = new int[6]; 
int currentCombo = 0; 

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

//Variable to restart time when song plays
float reTime = 0; 

//File reader for the notes in a song
BufferedReader noteReader; 

//File reader for storing progress
BufferedReader saveReader; 

//Total notes played
int totalNotesPlayed = 0; 

//Variable to check whether or not note pressed is a long note or a single note
boolean noteLongCheck[] = new boolean[4]; 

//Object for storing all the data
DataStorage statData; 

void setup() {
  
  size(800, 800); 
  
  //Initialize the variable for checking if each pressed note is a long or not
  for (int i = 0; i < 4; i++) {
    
    noteLongCheck[i] = false; 
    
  }
  
  //Initial color of the finish line boxes
  for (int i = 0; i < 4; i++) {
    
    colorOfBox[i] = 255;  
    
  }
  
  //Initiate data storage
  statData = new DataStorage(clear, accuracy, perfect, great, ok, miss, points, combo); 
  
  //Read data from data storage
  statData.loadData(); 
  
  //Initialize all the stats based on saved data
  clear = statData.getClear();
  accuracy = statData.getAcc();
  perfect = statData.getPerfect();
  great = statData.getGreat();
  ok = statData.getOk();
  miss = statData.getMiss();
   
  //Initialize sound effect for a button press
  beat = new SoundFile(this, "MusicFolder/finger-snap-179180.mp3"); 
  
  //Setup all the background images for each music game
  gameBack[0] = loadImage("Assets/hangzhou-8398789_1280.jpg"); 
  gameBack[1] = loadImage("Assets/beach-6517214_1280.jpg"); 
  gameBack[2] = loadImage("Assets/city-7458934_1280.jpg"); 
  gameBack[3] = loadImage("Assets/demon-6374444_1280.jpg"); 
  gameBack[4] = loadImage("Assets/background-6782458_1280.jpg"); 
  gameBack[5] = loadImage("Assets/woman-1820868_1280.jpg"); 

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
  
  //Set the original speed of the notes
  for (int i = 0; i < notes.size(); i++) {
    
    notes.get(i).setSpeed(0.5); 
    
  }
  
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
  
  //Initialize the notes
  readNoteFile(); 
}

void draw() {
    
  //draws the starting screen
  if (startingSc == true) {
   
    drawStartScreen(); 
    
  }
  
  //draws the menu screen
  else if (menuSc == true) {
    
    drawMenuScreen(); 
    
  }
  
  //draws the gameplay screen
  else if (gameSc == true) {
    
    drawGameScreen(); 
    
  }
  
}

void readNoteFile() {
  
  //Reset everything in the notes store variable
  while (notes.size() > 0) {
    
    notes.remove(0); 
    
  }
  
  String noteType; 
  String[] colNotes; 
  
  char type;
  float time;
  int col; 
  int index; 
    
  if (songSelected[0] == true) {
    
    noteReader = createReader("NoteFolder/Testing.txt"); 
    
  }
  else if (songSelected[1] == true) {
    
    noteReader = createReader("NoteFolder/Testing.txt"); 
    
  }
  else if (songSelected[2] == true) {
    
    noteReader = createReader("NoteFolder/Testing.txt"); 
    
  }
  else if (songSelected[3] == true) {
    
    noteReader = createReader("NoteFolder/Testing.txt"); 
    
  }
  else if (songSelected[4] == true) {
    
    noteReader = createReader("NoteFolder/Testing.txt"); 
    
  }
  else if (songSelected[5] == true) {
    
    noteReader = createReader("NoteFolder/Testing.txt"); 
    
  }
  
  
  //Keep looping the reader until it reaches null
  while (true) {
    
    try {
      noteType = noteReader.readLine(); 
    } catch (IOException e) {
      
      noteType = null; 
    }
    
    if (noteType != null) {
      
      colNotes = split(noteType, ' '); 
      
      for (int i = 0; i < colNotes.length; i++) {
        
        if (colNotes[i].length() == 1) {
          
          continue;
          
        }
        
        boolean longOrNot = false; 
        
        type = colNotes[i].charAt(0); 
        time = float(colNotes[i].substring(1, 6));
        col = int(colNotes[i].charAt(7)); 
        index = int(colNotes[i].substring(8, 11)); 
        
        //Convert the dec version of the character to the actual integer
        if (col == 49) {
          
          col = 1; 
          
        }
        else if (col == 50) {
          
          col = 2; 
          
        }
        else if (col == 51) {
          
          col = 3; 
          
        }
        else if (col == 52) {
          
          col = 4; 
          
        }
        
        println(time); 

        //Check if the note received is a long note or single note
        if (type == 'l') {
          
          longOrNot = true; 
          
        }
        
        notes.add(new Note(col, time, longOrNot, index)); 
        
      }
      
    }
    else
      break;
  }
}

void drawGameScreen() {
  
  checkAccuracy(); 
  autoNoteRemoval(); 
  
  //Song background; 
  for (int i = 0; i < songSelected.length; i++) {
    
    if (songSelected[i] == true) {
      
      image(gameBack[i], 0, 0); 
      
    }
    
  }
  
  //Note path background
  fill(255, 255, 255, 120);
  quad(300, 0, 500, 0, 800, 800, 0, 800); 
  
  //Note Seperation 1
  stroke(1); 
  line(350, 0, 200, 800); 
  
  //Note Seperation 2
  stroke(1);
  line(400, 0, 400, 800); 
  
  //Note Seperation 3
  stroke(1); 
  line(450, 0, 600, 800); 
  
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
  
  //Perfect line
  fill(67, 67, 67, 120); 
  rect(0, 540, 800, 80); 
  
  //Start of finish line
  stroke(1); 
  line(110, 520, 690, 520); 
  
  //End of finish line
  stroke(1); 
  line(60, 640, 740, 640); 
  
  //Draw the notes
  for (int i = 0; i < notes.size(); i++) {
    
    notes.get(i).drawNote(reTime);    
    
  }
  
  //Shadow at the top
  noStroke(); 
  fill(1); 
  rect(0, 0, 800, 10); 
  
  fill(1, 1, 1, 150); 
  rect(0, 10, 800, 10); 
  
  fill(1, 1, 1, 100); 
  rect(0, 20, 800, 10); 
  
  fill(1, 1, 1, 60); 
  rect(0, 30, 800, 10); 
  
  fill(1, 1, 1, 10); 
  rect(0, 40, 800, 10); 
  
  //Draw the combo interface
  stroke(1); 
  fill(100, 255, 255); 
  ellipse(680, 140, 120, 120); 
  
  String text = ""; 
  int textX = 0;
  int textY = 0; 
  
  //Text for all interfaces combined
  for (int i = 0; i < 4; i++) {
    
    if (i == 0) {
      
      text = "Points: " + currentPoints; 
      textX = 10;
      textY = 50;
      textSize(20);

    }
    else if (i == 1) {
      
      text = "Accuracy: " + currentAcc;
      textX = 580;
      textY = 50;
      textSize(20);

    }
    else if (i == 2) {
      
      fill(1); 
      text = "" + currentCombo;
      textX = 670;
      textY = 150;
      textSize(40);

    }
    
    text(text, textX, textY);
    
  }
    
  //Draw the progress bar
  noFill();
  rect(10, 10, 780, 15); 
  
  //Music ongoing percentage
  float musicPercentage = 0; 
  
  //Progress
  for (int i = 0; i < songSelected.length; i++) {
    
    if (songSelected[i] == true) {
      
      musicPercentage = music[i].percent(); 
      
    }
    if (musicPercentage >= 99 && songSelected[i] == true) {
      
      //Return to the menu screen
      gameSc = false;
      menuSc = true; 
      
      //Store all the points and accuracy
      clear[i] += 1; 
      accuracy[i] = currentAcc; 
      miss[i] = currentMiss;
      ok[i] = currentOk; 
      great[i] = currentGreat; 
      perfect[i] = currentPerfect; 
      points[i] = currentPoints;
      combo[i] = currentCombo; 
      
      //Store data to temporary storage
      statData.tempStore(clear, accuracy, perfect, great, ok, miss, points, combo); 
      
      //Store data to file
      statData.saveData(); 
      
    }
    
  }
  
  fill(255, 0, 0); 
  rect(10, 10, map(musicPercentage, 0, 100, 0, 780), 15); 
  
}

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

//Menu screen menu
void drawMenuScreen() {
  
  background(251, 255, 240); 
  
  //bubbles animation
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
  
  //For testing purposes (not going to be in final game)
  //Stat box
  stroke(1); 
  rect(40, 150, 360, 310); 
  
  String stat = "Clears: "; 
  int statNum = 0; 
  
  //All the stats for the music being played
  for (int i = 0; i < songSelected.length; i++) {
    
    if (songSelected[i] == true) {

      for (int j = 0; j < 8; j++) {
        
        textSize(30); 
        fill(1); 
          
        if (j == 0) {
          
          stat = "Clear: "; 
          statNum = clear[i]; 
          
        }
        else if (j == 1) {
          
          stat = "Accuracy: "; 
          statNum = accuracy[i]; 

        }
        else if (j == 2) {
          
          stat = "Perfect: ";
          statNum = perfect[i]; 

        }
        else if (j == 3) {
          
          stat = "Great: ";
          statNum = great[i]; 

        }
        else if (j == 4) {
          
          stat = "Ok: ";
          statNum = ok[i]; 

        }
        else if (j == 5) {
          
          stat = "Miss: ";
          statNum = miss[i]; 

        }
        else if (j == 6) {
          
          stat = "Points: ";
          statNum = points[i]; 

        }
        else if (j == 7) {
          
          stat = "Combo: ";
          statNum = combo[i]; 

        }
        
        text(stat + statNum, 150, 180 + 40*j); 
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

//Removes note if it passes the 800 pixels screen
void autoNoteRemoval() {
  
  int count = 0; 
  int secondNoteIndex = 0; 
  int firstNoteIndex = 0; 

  //Out of bounds note collumn
  int outCol = 0; 
  
  //Temp store for the note
  Note tempNote; 
  
  //Removes notes and automatic miss if they pass the 800 pixels in y value
  for (int i = 0; i < notes.size(); i++) {
    
    if (notes.get(i).getY() - notes.get(i).getH()/2 > 800 + notes.get(i).getH()/2) {
      
      println(noteLongCheck[0]); 
      
      currentMiss++; 
      currentCombo = 0; 
      totalNotesPlayed++; 
      
      outCol = notes.get(i).getCol(); 
      tempNote = notes.get(i); 
      
      //Gets the index of the second note
      for (int j = 0; j < notes.size(); j++) {
        
        if (notes.get(j).getCol() == outCol) {
          
          count++; 
          
          if (count == 1) {
            
            firstNoteIndex = j; 
            
          }
          
          if (count == 2) {
            
            secondNoteIndex = j; 

          }
        }
      }
      
      //Removes the notes out of bounds
      if (notes.get(i).isLong() && noteLongCheck[outCol-1] == false) {
        
        currentMiss++; 
        notes.remove(secondNoteIndex); 
        notes.remove(i); 

      }
      else if (notes.get(i).isLong() == false && noteLongCheck[outCol-1] == false) {
        
        notes.remove(i); 

      }
      else if (notes.get(i).isLong() == false && noteLongCheck[outCol-1] == true) {
        
        notes.remove(i); 
        notes.remove(firstNoteIndex); 
        currentMiss++; 

      }
      
      //Sets back the index of each note 
      for (int j = 0; j < notes.size(); j++) {
        
        if (notes.get(j).getCol() == outCol && tempNote.isLong() == false && noteLongCheck[outCol-1] == false) {
          
          notes.get(j).setIndex(notes.get(j).getIndex() - 1); 
          
        }
        else if (notes.get(j).getCol() == outCol && tempNote.isLong() == false && noteLongCheck[outCol-1] == true) {
            
          notes.get(j).setIndex(notes.get(j).getIndex() - 2); 
          
        }
        else if (notes.get(j).getCol() == outCol && tempNote.isLong()) {
          
          notes.get(j).setIndex(notes.get(j).getIndex() - 2); 
          
        }
        
      }
      noteLongCheck[outCol-1] = false; 
         
      break; 
    }
    
  }
  
}

void checkNoteReleased(int col) {
  
  boolean notesExist = false; 
  
  int count = 0; 
  
  int indexOfFirst = 0;
  int indexOfSecond = 0;
  
  for (int i = 0; i < notes.size(); i++) {
    
    if (notes.get(i).getCol() == col) {
      
      count++;
      if (count == 1) {
        
        notesExist = true; 
        indexOfFirst = i; 
        
      }
      else if (count == 2) {
        
        indexOfSecond = i; 
        break;
        
      }
      
    }
    
  }
  
  //Checks where the note is released and determines the points you got or if you missed
  if (count == 2 && notesExist == true && noteLongCheck[col-1] == true) {
    
    Note note = notes.get(indexOfSecond); 
    float noteH = notes.get(indexOfSecond).getH(); 
    float notefY = notes.get(indexOfSecond).getPos().y + noteH/2; 
    float notebY = notes.get(indexOfSecond).getPos().y - noteH/2; 
    boolean longNote = notes.get(indexOfFirst).isLong(); 
    
    
    if (notefY <= 520 - 140) {
      
      if (longNote == true) {
        
        currentCombo = 0; 
        currentMiss++; 
        totalNotesPlayed++; 
        notes.remove(indexOfSecond); 
        notes.remove(indexOfFirst); 
        noteLongCheck[col-1] = false; 
        
        println("miss"); 
        
        //Sets back the index of each note 
        for (int i = 0; i < notes.size(); i++) {
          if (notes.get(i).getCol() == col) {
            
            notes.get(i).setIndex(notes.get(i).getIndex() - 2); 
            
          }
        }
        
      }
      
    }
    else if (notefY >= 520 - 140 && notefY <= 520 - 60) {
     
      if (longNote == true) {
        
        currentPoints += 40*currentCombo; 
        currentCombo += 1; 
        currentOk++;
        totalNotesPlayed++; 
        notes.remove(indexOfSecond); 
        notes.remove(indexOfFirst); 
        noteLongCheck[col-1] = false; 
        println("ok"); 

        //Sets back the index of each note 
        for (int i = 0; i < notes.size(); i++) {
          if (notes.get(i).getCol() == col) {
            
            notes.get(i).setIndex(notes.get(i).getIndex() - 2); 
            
          }
        }

      }
      
    }
    else if (notefY >= 520 - 60 && notefY <= 520 + 20) {
     
      
      if (longNote == true) {
        
        currentPoints += 70*currentCombo; 
        currentCombo += 1; 
        currentGreat++; 
        totalNotesPlayed++; 
        notes.remove(indexOfSecond); 
        notes.remove(indexOfFirst); 
        noteLongCheck[col-1] = false; 
        println("great"); 

        //Sets back the index of each note 
        for (int i = 0; i < notes.size(); i++) {
          if (notes.get(i).getCol() == col) {
            
            notes.get(i).setIndex(notes.get(i).getIndex() - 2); 
            
          }
        }

      }
      
    }
    else if (notefY >= 520 + 20 && notefY <= 520 + 100) {
     
      
      if (longNote == true) {
        
        currentPoints += 100*currentCombo; 
        currentCombo += 1; 
        currentPerfect++; 
        totalNotesPlayed++; 
        notes.remove(indexOfSecond); 
        notes.remove(indexOfFirst); 
        noteLongCheck[col-1] = false; 
        println("perfect"); 

        //Sets back the index of each note 
        for (int i = 0; i < notes.size(); i++) {
          if (notes.get(i).getCol() == col) {
            
            notes.get(i).setIndex(notes.get(i).getIndex() - 2); 
            
          }
        }
        
      }
      
    }
    else if (notefY >= 520 + 100 && notefY <= 520 + 180) {
     
      
      if (longNote == true) {
        
        currentPoints += 70*currentCombo; 
        currentCombo += 1; 
        currentGreat++; 
        totalNotesPlayed++; 
        notes.remove(indexOfSecond); 
        notes.remove(indexOfFirst); 
        noteLongCheck[col-1] = false; 
        println("great"); 

        //Sets back the index of each note 
        for (int i = 0; i < notes.size(); i++) {
          if (notes.get(i).getCol() == col) {
            
            notes.get(i).setIndex(notes.get(i).getIndex() - 2); 
            
          }
        }
        
      }
      
    }
    else if (notefY >= 520 + 180 && notefY <= 520 + 260) {
     
      
      if (longNote == true) {
        
        currentPoints += 40*currentCombo; 
        currentCombo += 1; 
        currentOk++; 
        totalNotesPlayed++; 
        notes.remove(indexOfSecond); 
        notes.remove(indexOfFirst); 
        noteLongCheck[col-1] = false; 
        println("ok"); 

        //Sets back the index of each note 
        for (int i = 0; i < notes.size(); i++) {
          if (notes.get(i).getCol() == col) {
            
            notes.get(i).setIndex(notes.get(i).getIndex() - 2); 
            
          }
        }
        
      }
      
    }
    else if (notefY >= 520 + 260 && notefY < 800) {
     
      
      if (longNote == true) {
        
        currentCombo = 0; 
        currentMiss++;
        totalNotesPlayed++; 
        notes.remove(indexOfSecond); 
        notes.remove(indexOfFirst); 
        noteLongCheck[col-1] = false; 
        println("miss"); 

        //Sets back the index of each note 
        for (int i = 0; i < notes.size(); i++) {
          if (notes.get(i).getCol() == col) {
            
            notes.get(i).setIndex(notes.get(i).getIndex() - 2); 
            
          }
        }

      }
      
    }
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
  
  //Checks where the note is pressed and determines the points you got or if you missed
  if (notes.size() > 0 && notesExist == true) {
        
    Note note = notes.get(indexOfClosest); 
    float noteH = notes.get(indexOfClosest).getH(); 
    float notefY = notes.get(indexOfClosest).getPos().y + noteH/2; 
    float notebY = notes.get(indexOfClosest).getPos().y - noteH/2; 
    boolean longNote = notes.get(indexOfClosest).isLong(); 
    
    if (notefY >= 520 - 220 && notefY <= 520 - 140) {
      
      
      if (longNote == false) {
        
        currentCombo = 0; 
        currentMiss++;
        totalNotesPlayed++; 
        noteLongCheck[col-1] = false;
        notes.remove(indexOfClosest); 
        println("miss"); 

        //Sets back the index of each note 
        for (int i = 0; i < notes.size(); i++) {
          if (notes.get(i).getCol() == col) {
            
            notes.get(i).setIndex(notes.get(i).getIndex() - 1); 
            
          }
        }
        
      }
      else if (longNote == true)  {
        
        currentCombo = 0; 
        notes.remove(indexOfClosest); 
        currentMiss++;
        totalNotesPlayed++; 
        noteLongCheck[col-1] = true;
        println("miss"); 

        //Sets back the index of each note 
        for (int i = 0; i < notes.size(); i++) {
          if (notes.get(i).getCol() == col) {
            
            notes.get(i).setIndex(notes.get(i).getIndex() - 1); 
            
          }
        }
        
      }
    }
    else if (notefY >= 520 - 140 && notefY <= 520 - 60) {
     
      
      if (longNote == false) {
        
        currentCombo += 1; 
        currentOk++;
        totalNotesPlayed++; 
        currentPoints += 40*currentCombo; 
        notes.remove(indexOfClosest); 
        noteLongCheck[col-1] = false;
        println("ok"); 

        //Sets back the index of each note 
        for (int i = 0; i < notes.size(); i++) {
          if (notes.get(i).getCol() == col) {
            
            notes.get(i).setIndex(notes.get(i).getIndex() - 1); 
            
          }
        }
        
      }
      else if (longNote == true)  {
        
        currentCombo += 1; 
        currentOk++;
        totalNotesPlayed++; 
        currentPoints += 40*currentCombo; 
        note.setVel(new PVector(0, 0)); 
        note.setAcc(new PVector(0, 0)); 
        note.setSizeVel(0); 
        note.setSizeAcc(0); 
        noteLongCheck[col-1] = true;
        println("ok"); 

      }
    }
    else if (notefY >= 520 - 60 && notefY <= 520 + 20) {
     
      
      if (longNote == false) {
        
        currentCombo += 1; 
        currentGreat++;
        totalNotesPlayed++; 
        currentPoints += 70*currentCombo; 
        notes.remove(indexOfClosest); 
        noteLongCheck[col-1] = false;
        println("great"); 

        //Sets back the index of each note 
        for (int i = 0; i < notes.size(); i++) {
          if (notes.get(i).getCol() == col) {
            
            notes.get(i).setIndex(notes.get(i).getIndex() - 1); 
            
          }
        }
        
      }
      else if (longNote == true)  {
        
        currentCombo += 1; 
        currentGreat++;
        totalNotesPlayed++; 
        currentPoints += 70*currentCombo;
        note.setVel(new PVector(0, 0)); 
        note.setAcc(new PVector(0, 0)); 
        note.setSizeVel(0); 
        note.setSizeAcc(0); 
        noteLongCheck[col-1] = true;
        println("great"); 

      }
    }
    else if (notefY >= 520 + 20 && notefY <= 520 + 100) {
     
      
      if (longNote == false) {
        
        currentCombo += 1; 
        currentPerfect++;
        totalNotesPlayed++; 
        currentPoints += 100*currentCombo; 
        notes.remove(indexOfClosest); 
        noteLongCheck[col-1] = false;
        println("perfect"); 

        //Sets back the index of each note 
        for (int i = 0; i < notes.size(); i++) {
          if (notes.get(i).getCol() == col) {
            
            notes.get(i).setIndex(notes.get(i).getIndex() - 1); 
            
          }
        }
        
      }
      else if (longNote == true)  {
        
        currentCombo += 1; 
        currentPerfect++;
        totalNotesPlayed++; 
        currentPoints += 100*currentCombo; 
        note.setVel(new PVector(0, 0)); 
        note.setAcc(new PVector(0, 0)); 
        note.setSizeVel(0); 
        note.setSizeAcc(0); 
        noteLongCheck[col-1] = true;
        println("perfect"); 

      }
    }
    else if (notefY >= 520 + 100 && notefY <= 520 + 180) {
     
      
      if (longNote == false) {
        
        currentCombo += 1; 
        currentPoints += 70*currentCombo; 
        totalNotesPlayed++; 
        currentGreat++;
        notes.remove(indexOfClosest); 
        noteLongCheck[col-1] = false;
        println("great"); 

        //Sets back the index of each note 
        for (int i = 0; i < notes.size(); i++) {
          if (notes.get(i).getCol() == col) {
            
            notes.get(i).setIndex(notes.get(i).getIndex() - 1); 
            
          }
        }
        
      }
      else if (longNote == true)  {
        
        currentCombo += 1; 
        currentPoints += 70*currentCombo; 
        totalNotesPlayed++; 
        currentGreat++;
        note.setVel(new PVector(0, 0)); 
        note.setAcc(new PVector(0, 0)); 
        note.setSizeVel(0); 
        note.setSizeAcc(0); 
        noteLongCheck[col-1] = true;
        println("great"); 

      }
    }
    else if (notefY >= 520 + 180 && notefY >= 520 + 260) {
     
      if (longNote == false) {
        
        currentCombo += 1; 
        currentPoints += 40*currentCombo; 
        totalNotesPlayed++; 
        currentOk++;
        notes.remove(indexOfClosest); 
        noteLongCheck[col-1] = false;
        println("ok"); 

        
        //Sets back the index of each note 
        for (int i = 0; i < notes.size(); i++) {
          if (notes.get(i).getCol() == col) {
            
            notes.get(i).setIndex(notes.get(i).getIndex() - 1); 
            
          }
        }
        
      }
      else if (longNote == true)  {
        
        currentCombo += 1; 
        currentPoints += 40*currentCombo; 
        totalNotesPlayed++; 
        currentOk++;
        note.setVel(new PVector(0, 0)); 
        note.setAcc(new PVector(0, 0)); 
        note.setSizeVel(0); 
        note.setSizeAcc(0); 
        noteLongCheck[col-1] = true;
        println("ok"); 

      }
    }
    else if (notefY >= 520 + 260 && notefY < 800) {
     
      if (longNote == false) {
        
        currentCombo = 0; 
        currentMiss++;
        totalNotesPlayed++; 
        notes.remove(indexOfClosest); 
        noteLongCheck[col-1] = false;
        println("miss"); 

        //Sets back the index of each note 
        for (int i = 0; i < notes.size(); i++) {
          if (notes.get(i).getCol() == col) {
            
            notes.get(i).setIndex(notes.get(i).getIndex() - 1); 
            
          }
        }
      }
      else if (longNote == true) {
        
        currentCombo = 0; 
        currentMiss++;
        totalNotesPlayed++; 
        notes.remove(indexOfClosest); 
        noteLongCheck[col-1] = true;
        println("miss"); 

        //Sets back the index of each note 
        for (int i = 0; i < notes.size(); i++) {
          if (notes.get(i).getCol() == col) {
            
            notes.get(i).setIndex(notes.get(i).getIndex() - 1); 
            
          }
        }
        
      }
    }
  }
}

void checkAccuracy() {
  
  currentAcc = (int)(((1.0*currentPerfect + 0.7*currentGreat + 0.4*currentOk)/totalNotesPlayed)*100); 
  
}

void mousePressed() {
  
  //Get mouse pressed to enter menu screen from title screen
  if (startingSc == true && mouseX > startButtonX && mouseX < startButtonX + startButtonW && mouseY > startButtonY && mouseY < startButtonY + startButtonH) {
        
    startingSc = false; 
    menuSc = true; 
    
  }
  
  //Begin gameplay
  if (menuSc == true && mouseX > playSongX && mouseX < playSongX + playSongW && mouseY > playSongY && mouseY < playSongY + playSongH) {
        
    reTime = millis()/1000.0; 
    
    for (int i = 0; i < songSelected.length; i++) {
      
      if (songSelected[i] == true) {
        
        Delay delay = new Delay(this); 
        
        music[i].stop();
        music[i].play();
        
        delay.process(music[i], 1.0);
        delay.time(1.0); 
        
        
      }
    }
    
    menuSc = false;
    gameSc = true; 
    
  }
  
  //Select songs
  if (menuSc == true && mouseX > selectSongX1 && mouseX < selectSongX1 + selectSongW1 && mouseY > selectSongY1 && mouseY < selectSongY1 + selectSongH1) {
        
    readNoteFile(); 
    
    for (int i = 0; i < songSelected.length; i++) {
       
       songSelected[i] = false; 
       music[i].stop(); 
       
     }
     
     songSelected[0] = true; 
     music[0].loop(); 
     
  }
  else if (menuSc == true && mouseX > selectSongX2 && mouseX < selectSongX2 + selectSongW2 && mouseY > selectSongY2 && mouseY < selectSongY2 + selectSongH2) {
     readNoteFile(); 

     for (int i = 0; i < songSelected.length; i++) {
       
       songSelected[i] = false; 
       music[i].stop(); 

     }
     
     songSelected[1] = true; 
     music[1].loop(); 

  }
  else if (menuSc == true && mouseX > selectSongX3 && mouseX < selectSongX3 + selectSongW3 && mouseY > selectSongY3 && mouseY < selectSongY3 + selectSongH3) {
     readNoteFile(); 

     for (int i = 0; i < songSelected.length; i++) {
       
       songSelected[i] = false; 
       music[i].stop(); 

     }
     
     songSelected[2] = true; 
     music[2].loop(); 

  }
  else if (menuSc == true && mouseX > selectSongX4 && mouseX < selectSongX4 + selectSongW4 && mouseY > selectSongY4 && mouseY < selectSongY4 + selectSongH4) {
     readNoteFile(); 

     for (int i = 0; i < songSelected.length; i++) {
       
       songSelected[i] = false; 
       music[i].stop(); 

     }
     
     songSelected[3] = true; 
     music[3].loop(); 

  }
  else if (menuSc == true && mouseX > selectSongX5 && mouseX < selectSongX5 + selectSongW5 && mouseY > selectSongY5 && mouseY < selectSongY5 + selectSongH5) {
     readNoteFile(); 

     for (int i = 0; i < songSelected.length; i++) {
       
       songSelected[i] = false; 
       music[i].stop(); 

     }
     
     songSelected[4] = true; 
     music[4].loop(); 

  }
  else if (menuSc == true && mouseX > selectSongX6 && mouseX < selectSongX6 + selectSongW6 && mouseY > selectSongY6 && mouseY < selectSongY6 + selectSongH6) {
     readNoteFile(); 

     for (int i = 0; i < songSelected.length; i++) {
       
       songSelected[i] = false; 
       music[i].stop(); 

     }
     
     songSelected[5] = true; 
     music[5].loop(); 

  }
  
}

void keyPressed() {
  
  //Exit music
  if (key == BACKSPACE && gameSc == true) {
    
    gameSc = false;
    menuSc = true; 
    
    //Stop the music from playing
    for (int i = 0; i < songSelected.length; i++) {
      
      if (songSelected[i] == true) {
        
        music[i].stop(); 
        music[i].loop(); 
        
      }
      
    }
    
  }
  
  if (key == 'd' && dpressed == false) {
    
    colorOfBox[0] = 180;
    checkNotePressed(1); 
    dpressed = true; 
    if (gameSc == true) {
    
      beat.play(); 
    
    }
    
  }
  
  if (key == 'f' && fpressed == false) {

    colorOfBox[1] = 180;
    checkNotePressed(2); 
    fpressed = true; 
    if (gameSc == true) {
    
      beat.play(); 
    
    }

  }
  if (key == 'j' && jpressed == false) {
    
    colorOfBox[2] = 180;
    checkNotePressed(3); 
    jpressed = true; 
    if (gameSc == true) {
    
      beat.play(); 
    
    }

  }
  if (key == 'k' && kpressed == false) {
    
    colorOfBox[3] = 180;
    checkNotePressed(4); 
    kpressed = true; 
    if (gameSc == true) {
    
      beat.play(); 
    
    }
    
  }
  
}

void keyReleased() {
  
  if (key == 'd') {
    
    colorOfBox[0] = 255;
    checkNoteReleased(1); 
    dpressed = false; 

  }
  if (key == 'f') {
    
    colorOfBox[1] = 255;
    checkNoteReleased(2); 
    fpressed = false; 

  }
  if (key == 'j') {
    
    colorOfBox[2] = 255;
    checkNoteReleased(3); 
    jpressed = false; 

  }
  if (key == 'k') {
    
    colorOfBox[3] = 255;
    checkNoteReleased(4); 
    kpressed = false; 

  }
  
}
