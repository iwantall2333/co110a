#include"hw.h"
#define R_ASSERT(EXP, RET)/

    if (!(EXP)){/

UB_LOG_WARNING("R_ASSERT(%s) failed! file:%s, line:%d.", #EXP, __FILE__, __LINE__);/

return RET;/

    }
void main(){
    char a[] = "idnotdoitall";
    char b[80];
    memcpy2(b,a,4);
    int n=10;
    R_ASSERT(n!=10,RET);
}
/*
D:\課程\計算機結構\co110a\hw\try>gcc -o exe hw.c

D:\課程\計算機結構\co110a\hw\try>exe.exe
idno
*/