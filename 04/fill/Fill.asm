// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@24576  //FIRST 確認鍵盤是否按下
D=M
@CLEAR      //沒有按下就螢幕全亮
D;JEQ

@16384      //第一步
D=A

A=D     //rrr更新位置
M=-1    
D=D+1
@2
M=D     //存取D值
@24575
D=D-A
@FIRST   //跑滿螢幕後重新執行偵測鍵盤
D;JEQ

@2      //讀取D值
D=M
@rrr     //重新執行
0;JMP


//CLEAR
@16384      //第一步
D=A

A=D     //RRR更新位置
M=0    
D=D+1
@2
M=D     //存取D值
@24575
D=D-A
@FIRST   //跑滿螢幕後重新執行偵測鍵盤
D;JEQ

@2      //讀取D值
D=M
@RRR     //重新執行
0;JMP



