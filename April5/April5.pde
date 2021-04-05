size(600,600);

PVector P1, P2, P3, V, B, VM;
P1 = new PVector(20, 20);//P1 is near the top left
P2 = new PVector(20, 50);// P2 is some distance below P1
P3 = new PVector(60, 40);//P3 is off to the right somewhere between the other two
V = PVector.sub(P3,P1);//vector V to go between P1 and P3

B= PVector.sub(P2, P1);
B.normalize();
VM = B.mult(V.dot(B));
print(VM);
