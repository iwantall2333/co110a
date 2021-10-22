@17     //0     R0輸入
D=A     //1
@0     //2
M=D     //3
@5     //4         R1輸入
D=A     //5
@1     //6
M=D     //7

@0     //8                                                                                                     
D=M     //9                                                                                
@11     //10    //R0存到M[11]                                                                      
M=D     //11
@1     //12
D=M     //13   
@33         //r1為0要直接@2 D=M  //14
D;JEQ       //15
@22         //16//R1存到M[22]
M=D                                 //17    
                             
@31     //Bfinish///@FINISH                           //18                          
D;JEQ       //由R1--來算迴圈次數 //R1==0直接finish結束迴圈 (R0相加R1次)                            //19
@11     //Count                                                  //20     
D=M                                                             //21
@0                                                         //22
D=D+M       //D=D+D不是乘法的遞增                                                     //23         
@11                                                                  //24
M=D    //計算完成儲存結果                                               //25
@1    //扣迴圈次數                                                  //26 
M=M-1                                                                               //27      
D=M-1                                                                       //28
@18    //@Bfinish                                              //29
0;JMP                                                               //30
@11     //FINISH 把答案存到R2                                               //31
D=M                                                                 //32
@2                                           //33
M=D                                     //34
@34                                             //35
0;JMP                                       //36



// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.