pragma circom 2.1.4;

// Input 3 values using 'a'(array of length 3) and check if they all are equal.
// Return using signal 'c'.


template IsZero() {
    signal input in;
    signal output {binary} out;
    signal inv;
    inv <-- in!=0 ? 1/in : 0;
    out <== -in*inv +1;
    in*out === 0;
}


template Equality() {
   // Your Code Here..
   signal input a[3];

   signal output c;

   signal temp1 <== a[0] - a[1];
   signal temp2 <== a[1] - a[2];

   component iszero1 = IsZero();
   component iszero2 = IsZero();
   iszero1.in <== temp1;
   iszero2.in <== temp2;

   c <== iszero1.out * iszero2.out;
}

component main = Equality();


/*
INPUT = {"a":[2,2,3]}
*/