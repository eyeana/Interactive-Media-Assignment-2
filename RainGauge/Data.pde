class Data{
  
  String[] rows;
  String[] cells;
  String[][] data;
  String firstDate = "2020-1-1";
  float highestValue = 0.0;
  float avgSum = 0.0;
  float avgCount = 0.0;
  
  Data(String fileLocation, String filter){
   
    rows = loadStrings(fileLocation);
    cells = split(rows[0], ",");
    data = new String[rows.length][cells.length];
    
    int c = 0;
    for (int i = 0; i < rows.length; i++){
      cells = split(rows[i], ",");
      String[] date = split(cells[0], " ");
      if (filter.equals("max")){
        if (uniqueMax(date[0],Float.parseFloat(cells[1]))){
          data[c][0] = date[0];
          data[c][1] = String.valueOf(highestValue);
          highestValue = 0.0;
          c++;
        }
      }else if (filter.equals("avg")){
        if (uniqueAvg(date[0],Float.parseFloat(cells[1]))){
          data[c][0] = date[0];
          data[c][1] = String.valueOf(avgSum/avgCount);
          avgSum = 0.0;
          avgCount = 0.0f;
          c++;
        }
      }else if (filter.equals("all")){
        data[c][0] = date[0];
        data[c][1] = cells[1];
        c++;
      }
    }    
  }
  
  boolean uniqueAvg(String date, float data){
    
    boolean unique = false;
    if (!date.equals(firstDate)){
      firstDate = date;
      unique = true;     
      avgSum += data; 
      avgCount += 1.0;
    }
    
    return unique;
  }
  
  boolean uniqueMax(String date, float data){
    
    boolean unique = false;
    if (!date.equals(firstDate)){
      firstDate = date;
      unique = true;
    }else if (highestValue < data){      
        highestValue = data; 
    }
    
    return unique;
  }
  
  String[][] getData(){
     return data; 
  }
  
  void setData(String fileLocation){
   
    rows = loadStrings(fileLocation);
    
    for (int i = 0; i < rows.length; i++){
      data[i] = split(rows[i], ",");
    }
    
  }
  
}
