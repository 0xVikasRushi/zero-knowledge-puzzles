pragma circom 2.1.8;

// Create a circuit that takes an array of signals `in[n]` and
// a signal k. The circuit should return 1 if `k` is in the list
// and 0 otherwise. This circuit should work for an arbitrary
// length of `in`.

template HasAtLeastOne(n) {
    signal input in[n];
    signal input k;
    signal output out;
 
    signal equal;
    for(var i=0;i<n;i++) { 
       equal <-- (in[i] == k);
    }
    out <== equal;

}

component main = HasAtLeastOne(4);
