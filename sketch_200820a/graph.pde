


class Graph{
  int[][] locations;
  public Graph(int numLocations){
    locations = new int[numLocations] [2];
    for(int i =0; i <numLocations; i++){
      locations[i][0] = (int) random(0,width+1);
      locations[i][1] = (int) random(0,height+1);
    }
  }
  public void show(){
    for(int i = 0; i <locations.length; i++){
      circle(locations[i][0], locations[i][1], 10);
    }
  }
  public int length(){
    return locations.length;
  }
  
  //calculate euclidan distances between two nodes.
  public double getDistance(int nodeA, int nodeB){
    return Math.sqrt( Math.pow( locations[nodeA][0] - locations[nodeB][0], 2) + Math.pow(locations[nodeA][1] - locations[nodeB][1], 2) );
  }
}
