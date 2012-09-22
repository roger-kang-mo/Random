import java.util.*;

/** 
* There were some questions on linked lists. 
* Finding the middle, 
**/

class MyLinkedList {
	private Node head;
	private String[] fruits;
	private final int SIZE = 20; 

	public MyLinkedList(){
		head = new Node("Plantain");

		initializeFruits();
		printList();
		createRandomList(head, SIZE);

		System.out.println("Ths middle value is: " + getMiddleTwoPass().value);
		System.out.println("The middle value is: " + getMiddleOnePass().value);
		
		// Making a loop in the list.
		getTail().next = head;

		System.out.println("Is there a loop: " + isLoop());
	}

	private Node getMiddleOnePass(){
		Node current = head;
		Node doubleNode = head;

		while(doubleNode.next != null && doubleNode.next.next != null){
			doubleNode = doubleNode.next.next;
			current = current.next;
		}

		return current;
	}

	private boolean isLoop(){
		boolean retVal = false;
		Node current = head, doubleNode = head;

		while(doubleNode.next != null && doubleNode.next.next != null){
			doubleNode = doubleNode.next.next;
			current = current.next;

			if(doubleNode == current){
				System.out.println("Loop found! Damn you, " + current.value + "s.");
				retVal = true;
				break;
			}
		}


		return retVal;
	}

	private Node getMiddleTwoPass(){
		Node current = head;
		int counter = 0;

		while(current.next != null){
			current = current.next;
			counter++;
		}

		counter = (counter/2);
		current = head;

		for(int i = 0; i < counter; i++){
			current = current.next;	
		}

		return current;
	}

	private Node getTail(){
		Node current = head;

		while(current.next != null){
			current = current.next;
		}

		return current;
	}

	private void printList(){
		Node current = head;
		if(head != null){
			do{
				System.out.println(current.value);
			}while((current = current.next) != null);
		}
		
	}

	private void createRandomList(Node head, int size){
		Random rand = new Random();
		Node current = head;
		for(int i = 0; i < size-1; i++){
			current.next = new Node(fruits[rand.nextInt(fruits.length)]);
			current = current.next;
		}
	}

	private void initializeFruits(){
		fruits = new String[]{"Apple", "Banana", "Kiwi", "Lemon", "Lime", "Orange", "Pineapple", "Watermelon", "Canteloupe", 
					"Dragonfruit", "Peach", "Plum","Honeydew", "Mango", "Durian", "Lychee", "Nectarine"};
	}

	public static void main(String[] args){
		new MyLinkedList();
	}

	public class Node{
		
		public Node next;
		public String value;

		public Node(String val){
			value = val;
			next = null;
		}
	}

}