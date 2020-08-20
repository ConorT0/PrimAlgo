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
  public prim(Graph target) {
    this.target = target;
    this.visited = new HashSet();
    this.unvisited = new HashSet();
    this.fringe = new PriorityQueue();
    //add all the nodes.
    for(int i =0; i<target.length(); i++){
      this.unvisited.add(i);
    }
    
    //visit a random node
    this.visit((int)random(this.target.length()));
    while(fringe.size()>0){
      print(fringe.poll());
      print("\n");
    }
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
