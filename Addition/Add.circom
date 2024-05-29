pragma circom 2.1.4;

template Add() {
<<<<<<< HEAD
   // Your code here
    signal input a [2];
    signal output c;

    c <== a[0] + a[1];
=======
    signal input in[3];

    in[0] === in[1] + in[2];
>>>>>>> c39944e8abb995a1ea79b45ae82bf8298b983e67
}

component main  = Add();
