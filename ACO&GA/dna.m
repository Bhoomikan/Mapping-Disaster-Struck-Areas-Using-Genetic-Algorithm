functionDNA(genes){
//Recieves genes and create a dna object if(genes){
this.genes=genes;
}

//If no genes just create random dna
else{
this.genes=[];
for(vari=0;i<lifespan;i++){
//Gives random vectors
this.genes[i]=p5.Vector.random2D();
//Sets maximum force of vector to be applied to a rocket
this.genes[i].setMag(maxforce);
}
}
//Performs across over with another member of the species
this.crossover=function(partner){
varnewgenes=[];
//Picks random midpoint
varmid=floor(random(this.genes.length));
for(vari=0;i<this.genes.length;i++){
//If i is greater than mid the newgene should come from this partner
if(i>mid){
newgenes[i]=this.genes[i];
}
//If i<midnewgene should come from other partners gene's
else{
newgenes[i]=partner.genes[i];
}
}
//Gives DNA object an array
returnnewDNA(newgenes);
};
//Adds random mutation to the genes to add variance.
this.mutation=function(){
for(vari=0;i<this.genes.length;i++){
//if random number less than 0.01, newgene is then random vector
if(random(1)<0.01){
this.genes[i]=p5.Vector.random2D();
this.genes[i].setMag(maxforce);
}
}
};
}