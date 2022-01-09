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










