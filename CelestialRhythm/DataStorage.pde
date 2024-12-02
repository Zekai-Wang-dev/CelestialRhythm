class DataStorage {
  
  //All stats to be saved or loaded into game
  int[] clear; 
  
  int[] accuracy;
  
  int[] perfect; 
  
  int[] great; 
  
  int[] ok; 
  
  int[] miss; 
  
  int[] points; 
  
  int[] combo; 
  
  //File writer
  PrintWriter output; 
  
  //File reader
  BufferedReader reader; 
  
  //Data
  String data; 
  
  //Index of data
  int index = 0; 
  
  public DataStorage(int[] newClear, int[] newAcc, int[] newPerfect, int[] newGreat, int[] newOk, int[] newMiss, int[] newPoints, int[] newCombo) {
    
    clear = newClear; 
    accuracy = newAcc;
    perfect = newPerfect;
    great = newGreat; 
    ok = newOk;
    miss = newMiss; 
    points = newPoints;
    combo = newCombo; 
    
  }
  
  public int[] getClear() {
    
    
    return clear; 
  }
  
  public int[] getAcc() {
    
    
    return accuracy; 
  }
  
  public int[] getPerfect() {
    
    
    return perfect; 
  }
  
  public int[] getGreat() {
    
    
    return great; 
  }
  
  public int[] getOk() {
    
    
    return ok; 
  }
  
  public int[] getMiss() {
    
    
    return miss; 
  }
  
  public int[] getPoints() {
    
    
    return points; 
  }
  
  public int[] getCombo() {
    
    
    return combo; 
  }
  
  public void tempStore(int[] newClear, int[] newAcc, int[] newPerfect, int[] newGreat, int[] newOk, int[] newMiss, int[] newPoints, int[] newCombo) {
    
    clear = newClear; 
    accuracy = newAcc;
    perfect = newPerfect;
    great = newGreat; 
    ok = newOk;
    miss = newMiss; 
    points = newPoints;
    combo = newCombo; 
    
  }
  
  public void saveData() {
    
    output = createWriter("statData.txt"); 
    
    for (int i = 0; i < 6; i++) {
      
      output.print(clear[i] + " "); 
      output.print(accuracy[i] + " "); 
      output.print(perfect[i] + " "); 
      output.print(great[i] + " "); 
      output.print(ok[i] + " "); 
      output.print(miss[i] + " "); 
      output.print(points[i] + " "); 
      output.println(combo[i]); 

    }
    output.flush(); 
    output.close(); 
    
  }
  
  public void loadData() {
    
      reader = createReader("statData.txt"); 
      
      
      for (int i = 0; i < 6; i++) {
        
        if (reader != null) {
          
          try{
            
            data = reader.readLine(); 
          } catch (IOException e) {
            
            e.printStackTrace(); 
            data = null; 
            
          }
            
          if (data != null) {
            
            String[] stats = split(data, ' '); 
            
            clear[index] = PApplet.parseInt(stats[0]); 
            accuracy[index] = PApplet.parseInt(stats[1]); 
            perfect[index] = PApplet.parseInt(stats[2]); 
            great[index] = PApplet.parseInt(stats[3]); 
            ok[index] = PApplet.parseInt(stats[4]); 
            miss[index] = PApplet.parseInt(stats[5]); 
            points[index] = PApplet.parseInt(stats[6]); 
            combo[index] = PApplet.parseInt(stats[7]); 
            
            index++; 
    
          }
          
        }
        
      }
      
  }
}
