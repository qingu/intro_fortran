#include <stdio.h>

void swap(int x,int y){
    int tmp;

    tmp = x;
    x   = y;
    y   = tmp;
}
    
void swap_p(int *x,int *y){
    int tmp;

    tmp = *x;
    *x   = *y;
    *y   = tmp;
}

void swap_r(int &x,int &y){
    int tmp;

    tmp = x;
    x   = y;
    y   = tmp;
}

int main(){
    int a,b;

    a = 3; b= 4;
    swap(a,b);
    printf("a=%d,b=%d\n",a,b);

    swap_p(&a,&b);
    printf("a=%d,b=%d\n",a,b);

    swap_r(a,b);
    printf("a=%d,b=%d\n",a,b);
}
        
