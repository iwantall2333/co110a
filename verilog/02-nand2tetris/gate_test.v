`include "gate.v"   //導入你設計的
//下面是測試程式
module main;
reg a, b;
wire abNand, aNot, abAnd, abOr, abXor;

Not  g1(a, aNot);
Nand g2(a, b, abNand);
And  g3(a, b, abAnd);
Or   g4(a, b, abOr);
Xor  g5(a, b, abXor);

initial
begin
  $monitor("%4dns b=%d a=%d aNot=%d abNand=%d abAnd=%d abOr=%d abXor=%d", $stime, b, a, aNot, abNand, abAnd, abOr, abXor);
  a  = 0;
  b  = 0;
end

always #50 begin
  a = a+1;    //a僅1位元 1+1=0 0+1=1 
end

always #100 begin
  b = b+1;
end
          //
initial #500 $finish;   

endmodule