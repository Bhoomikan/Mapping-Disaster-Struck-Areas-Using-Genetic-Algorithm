functionPopulation(){
//Arrayofrovers
this.rovers=[];
//Amountofrovers
this.popsize=25;
//Amountparentroverpartners
this.matingpool=[];

//Associatesarovertoanarrayindex
for(vari=0;i<this.popsize;i++){
this.rovers[i]=newrover();
}

this.evaluate=function(){
varmaxfit=0;
//Iteratethroughallroversandcalcultestheirfitness
for(vari=0;i<this.popsize;i++){
//Calculatesfitness
this.rovers[i].calcFitness();
//Ifcurrentfitnessisgreaterthanmax,thenmakemaxequalto
current
if(this.rovers[i].fitness>maxfit){
maxfit=this.rovers[i].fitness;
}
}

//Normalisesfitnesses
for(vari=0;i<this.popsize;i++){
this.rovers[i].fitness/=maxfit;
}

this.matingpool=[];
//Takeroversfitnessmakeintoscaleof1to100
//Aroverwithhighfitnesswillhighlylikelywillbeinthematingpool
for(vari=0;i<this.popsize;i++){
varn=this.rovers[i].fitness♥100;
for(varj=0;j<n;j++){
this.matingpool.push(this.rovers[i]);
}
}
};
//Selectsappropriategenesforchild
this.selection=function(){
varnewrovers=[];
for(vari=0;i<this.rovers.length;i++){
//Picksrandomdna
varparentA=random(this.matingpool).dna;
varparentB=random(this.matingpool).dna;
//Createschildbyusingcrossoverfunction
varchild=parentA.crossover(parentB);
child.mutation();
//Createsnewroverwithchilddna
newrovers[i]=newrover(child);
}
//Thisinstanceofroversarethenewrovers
this.rovers=newrovers;
};

//Callsforupdateandshowfunctions
this.run=function(){
for(vari=0;i<this.popsize;i++){
this.rovers[i].update();
//Displaysroverstoscreen
this.rovers[i].show();
}
};
}