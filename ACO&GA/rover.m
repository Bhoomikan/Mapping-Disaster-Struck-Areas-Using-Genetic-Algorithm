functionrover(dna){
//Physics of rover at current instance
this.pos=createVector(width/2,height);
this.vel=createVector();
this.acc=createVector();
//Checkes rover has reached target
this.completed=false;
//Checks if rover had crashed
this.crashed=false;
//Gives a rover dna
if(dna){
this.dna=dna;
}else{
this.dna=newDNA();
}
this.fitness=0;

//Object can recieve force and add to acceleration
this.applyForce=function(force){
this.acc.add(force);
};
//Calulates fitness of rover
this.calcFitness=function(){
//Takes distance to target
vard=dist(this.pos.x,this.pos.y,target.x,target.y);

//Maps range of fitness
this.fitness=map(d,0,width,width,0);
//If rover gets to target increase fitness of rover
if(this.completed){
this.fitness=10;
}
//If rover does not get to target decrease fitness
if(this.crashed){
this.fitness/=10;
}
};
//Updates state of rover
this.update=function(){
//Checks distance from rover to target
vard=dist(this.pos.x,this.pos.y,target.x,target.y);
//If distance less than 10pixels,then it has reached target
if(d<10){
this.completed=true;
this.pos=target.copy();
}
//rover hit the barrier
if(
this.pos.x>rx&&
this.pos.x<rx+rw&&
this.pos.y>ry&&
this.pos.y<ry+rh
){
this.crashed=true;
}
//rover has hit left or right of window
if(this.pos.x>width||this.pos.x<0){
this.crashed=true;
}
//rover has hit top or bottom of window
if(this.pos.y>height||this.pos.y<0){
this.crashed=true;
}

//applies the random vectors defined in dna to consecutive frames of rover
this.applyForce(this.dna.genes[count]);
//if rover has not got to goal and not crashed then update physics engine
if(!this.completed&&!this.crashed){
this.vel.add(this.acc);
this.pos.add(this.vel);
this.acc.mult(0);
this.vel.limit(4);
}
};
//displays rover to window
this.show=function(){
//push and pop all allow's rotating and translation not to affect other objects
push();
//color customization of rovers
noStroke();
fill(255,150);
//translate to the postion of rover
translate(this.pos.x,this.pos.y);
//rotatates to the angle the rover is pointing
rotate(this.vel.heading());
//creates a rectangle shape for rover
rectMode(CENTER);
rect(0,0,25,5);
pop();
};
}