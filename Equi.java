import java.util.Arrays;

/*
* This is my solution to the sample problem on codility.
* Yes, it's sort of inefficient. Will speed up at some point, maybe.
*/

class Equi {

  public Equi(){
    int[] A = new int[]{0,5,3,2,4,6,2};

    System.out.println(equi_Inefficient(A));

    A = new int[]{-7, 1, 5, 2, -4, 3, 0};

    System.out.println(equi_Inefficient(A));
  }

  public int equi_Inefficient ( int[] A ) {
    long leftSum = 0, rightSum = 0;

    if(A.length == 0) return -1;
    
    for(int i = 0, j = A.length; i < j; i++){

      for(int l = 0; l < i; l++) leftSum += A[l];
      for(int r = i+1; r < j; r++) rightSum += A[r];
      
      if(leftSum == rightSum){
        return i;
      }
      
      leftSum = 0;
      rightSum = 0;
    }
    
    return -1;
  }

  public static void main(String[] args){
    new Equi();
  }
}