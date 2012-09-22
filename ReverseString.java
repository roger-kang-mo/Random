import java.util.*;

class ReverseString {
	
	public ReverseString(String input){
		System.out.println(straightReverse(input));
		System.out.println(reverseOrder(input));
		System.out.println(recursively(input));
	}

	private String straightReverse(String input){
		StringBuilder str = new StringBuilder();

		for(int i = input.length()-1; i >= 0; i--){
			str.append(input.charAt(i));
		}

		return str.toString();
	}

	private String reverseOrder(String input){
		String retVal = "";
		StringBuilder str = new StringBuilder();

		for(int i = 0; i < input.length(); i++){
			if(input.charAt(i) != ' '){
				str.append(input.charAt(i));
				if(i + 1 == input.length()){
					retVal = str.toString() + " " + retVal;
				}
			}else if(input.charAt(i) == ' '){
				retVal = str.toString() + " " + retVal;
				str.setLength(0);
			}
		}

		return retVal;
	}

	private String recursively(String input){
		if (input.length() < 2)
			return input;
		else
			return recursively(input.substring(1)) + input.charAt(0);
	}

	public static void main(String[] args){
		if(args.length > 0)
			new ReverseString(args[0]);
		else
			new ReverseString("This is a test sentence");
	}

}