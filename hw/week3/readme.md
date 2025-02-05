# HA
```hdl
CHIP HalfAdder {
    IN a, b;    // 1-bit inputs
    OUT sum,    // Right bit of a + b 
        carry;  // Left bit of a + b

    PARTS:
    // Put you code here:
    Xor(a=a,b=b,out=sum);
    And(a=a,b=b,out=carry);
}
```
![HA](./picture/HA.jpg)
# FA
```hdl
CHIP FullAdder {
    IN a, b, c;  // 1-bit inputs
    OUT sum,     // Right bit of a + b + c
        carry;   // Left bit of a + b + c

    PARTS:
    // Put you code here:
    Xor(a=a,b=b,out=ab);
    Xor(a=ab,b=c,out=sum);
    And(a=a,b=c,out=A);
    And(a=b,b=c,out=B);
    And(a=a,b=b,out=C);
    Or(a=A,b=B,out=AB);
    Or(a=AB,b=C,out=carry);
}
```
![FA](./picture/FA.jpg)
# Add16
The most significant carry bit is ignored. : 2's complement
```hdl
CHIP Add16 {
    IN a[16], b[16];
    OUT out[16];

    PARTS:
   // Put you code here:
    HalfAdder(a=a[0],b=b[0],sum=out[0],carry=d);
	FullAdder(a=a[1],b=b[1],c=d,sum=out[1],carry=e);
	FullAdder(a=a[2],b=b[2],c=e,sum=out[2],carry=f);
	FullAdder(a=a[3],b=b[3],c=f,sum=out[3],carry=g);
	FullAdder(a=a[4],b=b[4],c=g,sum=out[4],carry=h);
	FullAdder(a=a[5],b=b[5],c=h,sum=out[5],carry=i);
	FullAdder(a=a[6],b=b[6],c=i,sum=out[6],carry=j);
	FullAdder(a=a[7],b=b[7],c=j,sum=out[7],carry=k);
	FullAdder(a=a[8],b=b[8],c=k,sum=out[8],carry=l);
	FullAdder(a=a[9],b=b[9],c=l,sum=out[9],carry=m);
	FullAdder(a=a[10],b=b[10],c=m,sum=out[10],carry=n);
	FullAdder(a=a[11],b=b[11],c=n,sum=out[11],carry=o);
	FullAdder(a=a[12],b=b[12],c=o,sum=out[12],carry=p);
	FullAdder(a=a[13],b=b[13],c=p,sum=out[13],carry=q);
	FullAdder(a=a[14],b=b[14],c=q,sum=out[14],carry=r);
   	FullAdder(a=a[15],b=b[15],c=r,sum=out[15],carry=discard);
}
```
![add16](./picture/add16.jpg)
# Inc16
```hdl
CHIP Inc16 {
    IN in[16];
    OUT out[16];

    PARTS:
   // Put you code here:
   Add16(a=in,b[0]=true,out=out);
}
```
![inc16](./picture/inc16.jpg)