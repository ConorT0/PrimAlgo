
Graph g;
prim p;

void setup(){
  size(640,360);
  g = new Graph(20);
  p = new prim(g);
  
}

void draw(){
  
  p.show();
  delay(300);
  p.step();
}
