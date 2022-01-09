# 請寫出自己的 C 語言標準函式庫_我不是原創
## 參考資料
1. [austin362667的程式碼](https://github.com/austin362667/c-tricks)  
我的memcpy是看他的程式碼學的，結果來說抄95%  
過程中把整個程式碼看懂之後自己又想了想怎麼改寫才能不限定處理字串，  
最後查到這裡 : [https://github.com/gcc-mirror/gcc/blob/master/libgcc/memcpy.c](https://github.com/gcc-mirror/gcc/blob/master/libgcc/memcpy.c)，
左思右想他的方法不可行，結果繞了一大圈還是學長寫的最好，寫得更好的我已經看不懂了。 
2. [memcpy() - C語言庫函數](http://tw.gitbook.net/c_standard_library/c_function_memcpy.html)
3. [【不在混淆的C】指標函式、函式指標、回撥函式| IT人](https://iter01.com/587360.html)
4. [size_t_百度百科](https://baike.baidu.hk/item/size_t/8101179)
5. [C 库函数– snprintf() | 菜鸟教程](https://www.runoob.com/cprogramming/c-function-snprintf.html)  
6. [C語言: ++*p, *p++和*++p的不同](https://tclin914.github.io/e9206a47/)  
關於標頭檔 : 
1. [[轉]#ifndef, #define, #endif的用法(整理) @ H's 手札](https://huenlil.pixnet.net/blog/post/24339151)
2. [[C 語言] 程式設計教學：如何撰寫C 函式庫(Library) | 開源技術教學文件網](https://opensourcedoc.com/c-programming/library/)

# code
hw.h
```c
    //include guard
    #ifndef _HW_H_
    #define _HW_H_

    #include<stdio.h>
    //str1:目標 str2:來源 n:長度
    void memcpy2(void *str1, const void *str2, size_t n){  //*str 傳入地址的內容
        //C僅有char沒有string
        char* a = (char*)str1;          //傳內容的地址
        char* b = (char*)str2;
        for(int i=0;i<n;i++){
            a[i]=b[i];
        }
    }
    //這是snprintf的屍體 : 
    //#include<string.h>
    /*int snprintf2 ( char *str2, size_t n, const char format, void *str1 ){

        char* a = (char*)str1;          //傳內容的地址
        char b[strlen(format)+1];
        for(int i=0;i<strlen(format);i++){
            if(format[i]=="%" && format[i+1]="c"){
                strcat(b,)
            }
            str2[i]=a[i];
        }
        
        if(format[1]=="c"){
            str2;   
        }
        if(format[1]=="d"){
            check=2;
        }
        if(format[1]=="s"){
            check=3;
        }

        }
    }*/
    /*assert 其他人的寫法我沒有一個字是看得懂的，就原地放棄了*/
    #endif
```
hw.c
```c
#include"hw.h"
void main(){
    char a[] = "idnotdoitall";
    char b[80];
    memcpy2(b,a,4);
    printf("%s",b);
}
/*
D:\課程\計算機結構\co110a\hw\try>gcc -o exe hw.c

D:\課程\計算機結構\co110a\hw\try>exe.exe
idno
*/
```
## 編譯筆記
1. C函式庫 :  
C 函式庫 = 標頭檔 (.h) + 二進位檔(函式庫)  
      (靜態函式庫： .a, .lib ，動態函式庫： .so, .dylib, .dll)  
標頭檔 :   
	存有該套件的公開界面，包括型別、函式、巨集等項目的宣告  
	編譯用  
二進位檔 :  
	編譯後的套件實作內容。  

動態函式庫會在執行時才去呼叫，靜態函式庫會直接將程式碼包進主程式中  

連結用  

2. 大型專案中開發者會需要指定許多額外的標頭檔與函式庫位置 (-I、-L)  

3. 編譯 :  
文字形式原始碼譯為機器語言，編譯器需要許多*.h 檔案（標頭檔）來編譯原始碼  
4. 連結 :  
把目標檔案、作業系統的啟動程式碼和用到的庫檔案進行組織形成最終生成可執行程式碼的過程。  
會需要一些函式庫（*.a、*.so 等）才能進行連結  

## 標頭檔筆記
# include guard 手法
標頭檔為 : stdio.h，則規則一般是
```
#ifndef _STDIO_H_
#define _STDIO_H_
     ...剩餘的所有程式碼
#endif
```
* 頭文件名全大寫，前後加_，並把「.」也變成_
* 若是在algo資料夾下的stdio (algo/stdio)，可以這樣命名 : ALGO_STDIO_H_
* 解釋 :  
為了避免重覆 include 時引發錯誤。  
比如你有兩個C文件，這兩個C文件都include了同一個頭文件。而編譯時，這兩個C文件要一同編譯成一個可運行文件，於是問題來了，大量的聲明衝突。  
* 原理 :  
    include guard 本身是一段條件編譯的敘述，  
    當第一次引入此標頭檔時，_STDIO_H_ 是未定義的，所以會讀完整個標頭檔。  
    而在第二次後再度引入此標頭檔時，_STDIO_H_是已定義的，這時候不會再讀一次此標頭檔，藉此避開重覆宣告的問題。  











