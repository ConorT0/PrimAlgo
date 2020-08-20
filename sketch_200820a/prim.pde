import java.util.Set;
import java.util.HashSet;
import java.util.PriorityQueue;
//plan for prim's algo:
//1. make two sets, visited and unvisited. add random node to visited.
//2. calculate euclidan distances for that random node to all unvisted. 
//  add these to minheap
//3. Pop from minheap. If both nodes are in visited set, then discard and pop again. 
//  if one node is not visited, add node to visited and go to step two with that node.
class prim {
  Graph target;
  Set<Integer> visited;
  Set<Integer> unvisited;
  PriorityQueue<edge> fringe;
  Set<edge> finalEdges;
  public prim(Graph target) {
    this.target = target;
    this.visited = new HashSet();
    this.unvisited = new HashSet();
    this.finalEdges= new HashSet();
    this.fringe = new PriorityQueue();
    //add all the nodes.
    for(int i =0; i<target.length(); i++){
      this.unvisited.add(i);
    }
    
    //visit a random node
    this.visit((int)random(this.target.length()));
    

  }
  //Given a newly visited node, add all of the unexplored neighbors to the heap and mark it as visited.
  private void visit(int node) {
    this.visited.add(node);
    this.unvisited.remove(node);
    for(int i : this.unvisited){
      //For every unvisited node, add an edge in to the PriorityQueue going from the newly visited node to that unvisited node. 
      this.fringe.add(new edge(node, i, this.target.getDistance(node,i)));
    }
  }
  
  public void step(){
    //check if there are any more nodes to connect.
    if(this.unvisited.size()>0){
      //first find the smallest edge that bridges across the cut.
      edge smallest = this.fringe.poll();
      while(this.visited.contains(smallest.potentialUnvisited)){
        smallest = this.fringe.poll();
    }
    this.finalEdges.add(smallest);
    visit(smallest.potentialUnvisited);
    }
  }
  
  public void show(){
    //draw edges
    stroke(255,254,1);
    for(edge e: this.finalEdges){
      int startnode = e.visited;
      int endnode = e.potentialUnvisited;
      line(this.target.getX(startnode), this.target.getY(startnode), this.target.getX(endnode), this.target.getY(endnode));
    }
    stroke(12,12,12);
    //draw visited nodes
    //
    fill(255,200,11);
    for(int i: this.visited){
      circle(this.target.getX(i), this.target.getY(i), 10);
    }
    
    //draw unvisited nodes
    //
    fill(168,0,168);
    for(int i: this.unvisited){
      circle(this.target.getX(i), this.target.getY(i), 10);
    }
  }
}

class edge implements Comparable<edge> {
  int visited;
  int potentialUnvisited;
  double dist;
  public edge(int visited, int potentialUnvisited, double dist) {
    this.visited = visited;
    this.potentialUnvisited = potentialUnvisited;
    this.dist=dist;
  }
  public int compareTo(edge other) {
    if (this.dist == other.getDist()) {
      return 0;
    } else if ( this.dist < other.getDist()) {
      return -1;
    }
    return 1;
  }
  public double getDist() {
    return this.dist;
  }
  public String toString(){
    return ""+ this.dist + ", " + this.visited + ", " + this.potentialUnvisited;
  }
}
