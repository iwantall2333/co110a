# Not
```hdl
CHIP Not {
    IN in;
    OUT out;

    PARTS:
    // Put your code here:
    Nand(a=in, b=in, out=out);
}
```
![./not.png]
# And
```hdl
CHIP And {
    IN a, b;
    OUT out;

    PARTS:
    // Put your code here:
    Nand(a=a,b=b,out=ab);
    Not(in=ab,out=out);
}
```
![./and.png]
# Or
```hdl
CHIP Or {
    IN a, b;
    OUT out;

    PARTS:
    // Put your code here:
    Not(in=a,out=pin1);
    Not(in=b,out=pin2);
    Nand(a=pin1,b=pin2,out=out);
}
```
![./or.png]
# Xor
```hdl
CHIP Xor {
    IN a, b;
    OUT out;

    PARTS:
    // Put your code here:
    Not(in=a,out=a0);
    Not(in=b,out=b0);

    And(a=a0,b=b,out=a0b);
    And(a=a,b=b0,out=ab0);
    Or(a=a0b,b=ab0,out=out);
}
```
![./XOR.png]
# Mux
```hdl
CHIP Mux {
    IN a, b, sel;
    OUT out;

    PARTS:
    // Put your code here:
    Not(in=sel,out=sel0);
    And(a=a,b=sel0,out=asel0);
    And(a=b,b=sel,out=bsel);

    Or(a=asel0,b=bsel,out=out);
}
```
![./MUX.png]
# DMux
```hdl
CHIP DMux {
    IN in, sel;
    OUT a, b;

    PARTS:
    // Put your code here:
    Not(in=sel,out=sel0);
    And(a=in,b=sel0,out=a);
    And(a=in,b=sel,out=b);
}
```
![./DEMUX.png]
