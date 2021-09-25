class Data{
  
  String[] rows;
  String[] cells;
  String[][] data;
  String firstDate = "2020-1-0";
  
  Data(String fileLocation){
   
    rows = loadStrings(fileLocation);
    cells = split(rows[0], ",");
    data = new String[rows.length][cells.length];
    
    int c = 0;
    for (int i = 0; i < rows.length; i++){
      cells = split(rows[i], ",");
      String[] date = split(cells[0], " ");
      if (uniqueDate(date[0])){
        data[c][0] = date[0];
        data[c][1] = cells[1];
        c++;
      }
    }
    
  }
  
  boolean uniqueDate(String date){
    
    boolean unique = false;
    if (!date.equals(firstDate)){
      firstDate = date;
      unique = true;
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
