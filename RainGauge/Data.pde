class Data{
  
  String[] rows;
  String[] cells;
  String[][] data;
  
  Data(String fileLocation){
   
    rows = loadStrings(fileLocation);
    cells = split(rows[0], ",");
    data = new String[rows.length][cells.length];
    
    for (int i = 0; i < rows.length; i++){
      cells = split(rows[i], ",");
      data[i][0] = cells[0];
      data[i][1] = cells[1];
    }
    
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
