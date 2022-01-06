module xor3(input a, b, c, output abc);   //moudle是模組
wire ab;          //宣告ab這條線 wire是線 reg是佔存氣
xor g1(ab, a, b);  //a b作xor 輸出為ab
xor g2(abc, c, ab);     //後兩個作xor變第一個
endmodule

//上面是我們設計的電路
//下面是我們要測試上面的測試檔

module xor3test;     //測試程式要自己寫
reg a, b, c;      //a b c三個一位元的register
wire abc;

xor3 g(a,b,c, abc);    //閘g 有三條輸入線a b c  ,輸出是abc(是上面的wire 所以沒有佔存起來)

initial         //初始化
begin
  a = 0;      //只有register可以放在等號左邊 (只有佔存氣能塞東西進去)
  b = 0;
  c = 0;
  $monitor("%4dns monitor: a=%d b=%d c=%d a^b^c=%d", $stime, a, b, c, abc);      //$stime取得目前時間 後面的a b c abc像C語言的取得變數往前放
end    //monitor是監控 放在initial裡 代表只要abc有改變都會in

always #50 begin    //總是 在每50單位時間(現代2021電腦以奈秒為單位) 就做以下的事:
  a = a+1;
end

always #100 begin
  b = b+1;
end

always #200 begin
  c = c+1;
end

initial #2000 $finish;   //從initial開始 在2000ns成事就要停止  指令不是關鍵的東西，前面就要加$

endmodule

//這裡在做真值表

