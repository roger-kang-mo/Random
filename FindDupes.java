import java.util.*;

// In an array 1-100 many numbers are duplicates, how do you find it?

class FindDupes{
	
	public static void main(String _[]){
		int[] nums = new int[100];
		Random rand = new Random();

		StringBuilder dupes = new StringBuilder("The dupes are at: ");
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>(100);

		int current = 0, count = 0;

		for(int i = 0; i < nums.length; i++){
			current = rand.nextInt(100);
			count = map.get(current) != null ? Integer.valueOf(map.get(current)) : 0;

			map.put(current, count+1);

			if(Integer.valueOf(map.get(current)) > 1){
				dupes.append("index: " + i + "\tvalue: " + current + "\n");
			}

		}

		System.out.println(dupes.toString());
	}
}