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
/*這是snprintf的屍體 : */
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
