import java.io.*;
import java.util.ArrayList;

/**
* There's a triangle of numbers like so:
*			8
*  		   3 9	
*		  4 2 1
*		 2 6 7 2	
*
* How do you find the path that would yield 
* the greatest sum?
* The solution to the above would be 8 -> 9 -> 2 -> 7.
* 8+9+2+7 = 26
* 
* Program reads this in from a file called triangle.txt that's 100 lines long.
**/

class Triangle {
	int[][] triangle;

	public static void main(String[] args) throws Exception {
		int count = 99;
		int[][] triangle = new int[100][100];

		String line;
	
		FileInputStream fileStream = new FileInputStream("triangle.txt");
		BufferedReader buffReader = new BufferedReader(new InputStreamReader(fileStream));
		
		while ((line = buffReader.readLine()) != null){
			String[] parts = line.trim().split(" ");
			
			for(int i = 0; i < parts.length; i++){
				triangle[count][i] = Integer.parseInt(parts[i]);
			}

			count--;
		}

		new Triangle(triangle);
	}

	public Triangle(int[][] pTriangle){
		triangle = pTriangle;

		traverseIt(triangle);
	}

	private void traverseIt(int[][] triangle){
		int numCols = triangle.length;

		for (int i = 0; i < triangle.length-1; i++){
			for(int j = 0; j < numCols -1; j++){
				if (triangle[i][j] > triangle[i][j+1]){
					triangle[i+1][j] += triangle[i][j];
				}else{
					triangle[i+1][j] += triangle[i][j+1];
				}

				System.out.print(triangle[i][j] + " ");
			}
			numCols--;

			System.out.print(triangle[i][numCols] + "\n\n");
		}

		System.out.println(triangle[triangle.length-1][0]);
	}




}