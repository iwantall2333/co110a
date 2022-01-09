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