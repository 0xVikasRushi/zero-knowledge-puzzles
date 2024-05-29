pragma circom 2.1.8;

// Create a circuit that takes an array of four signals
// `in`and a signal s and returns is satisfied if `in`
// is the binary representation of `n`. For example:
// 
// Accept:
// 0,  [0,0,0,0]
// 1,  [1,0,0,0]
// 15, [1,1,1,1]
// 
// Reject:
// 0, [3,0,0,0]
// 
// The circuit is unsatisfiable if n > 15


// ? question kinda confusing refer later
template FourBitBinary() {
    signal input in[4];
    signal input n;
    signal output out;

    var sum = 0;
    for(var i=0;i < 4;i++) { 
        var pow = 2 ** (3 - i);
        sum += in[i] * pow;
    }
    signal equal <-- (sum == n);

    log(equal);
    out <-- (n > 15) ? 0 : equal;
}


component main{public [n]} = FourBitBinary();
