
Graph g;
prim p;

void setup(){
  size(640,360);
  g = new Graph(10);
  p = new prim(g);
  
}

void draw(){
  
  g.show();
}
