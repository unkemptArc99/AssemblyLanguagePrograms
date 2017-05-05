#include <stdio.h>

int main(){
    int r,c;
    printf("Enter the number of rows : \n");
    scanf("%d",&r);
    printf("Enter the number of columns : \n");
    scanf("%d",&c);

    int A[r][c],B[r][c],C[r][c];
    int i,j;

    printf("Contents of A : \n");
    for(i = 0; i < r; ++i){
        printf("Row %d : ",i+1);
        for(j = 0; j < c; ++j){
            scanf("%d",&A[i][j]);
        }
        printf("\n");
    }

    printf("Contents of B : \n");
    for(i = 0; i < r; ++i){
        printf("Row %d : ",i+1);
        for(j = 0; j < c; ++j){
            scanf("%d",&B[i][j]);
        }
        printf("\n");
    }

    for(i = 0; i < r; ++i){
        for(j = 0; j < c; ++j){
            C[i][j] = A[i][j] + B[i][j];
        }
    }

    printf("Contents of C (after adding) : \n");
    for(i = 0; i < r; ++i){
        printf("Row %d : ",i+1);
        for(j = 0; j < c; ++j){
            printf("%d ",C[i][j]);
        }
        printf("\n");
    }

    return 0;
}