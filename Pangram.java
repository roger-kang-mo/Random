/**
 *  This program determines whether or not a sentence is a pangram. If it is not,
 *  the missing letters will print out in alphabetical order.
 * */
public class Pangram {

   public static void main(String[] args) {
      String sentence = "A quick brown fox jumps over the lazy dog";

      System.out.println("Sentence: " + sentence);
      System.out.println("Missing Letters: " +new Pangram().getMissingLetters(sentence)+"\n");
   
      sentence = "A slow yellow fox crawls under the proactive dog";
      System.out.println("Sentence: " + sentence);
      System.out.println("Missing Letters: " +new Pangram().getMissingLetters(sentence)+"\n");

      sentence = "Lions, tigers, and bears, oh my!";
      System.out.println("Sentence: " + sentence);
      System.out.println("Missing Letters: " +new Pangram().getMissingLetters(sentence)+"\n");

      sentence = "";
      System.out.println("Sentence: " + sentence);
      System.out.println("Missing Letters: " +new Pangram().getMissingLetters(sentence));
   }
   
   public String getMissingLetters(String sentence) {
      boolean[] notMissing = new boolean[26];
      StringBuilder missingLetters = new StringBuilder();


      for(int i = 0; i < sentence.length(); i++) {
         char c = Character.toLowerCase(sentence.charAt(i));

         // Flaggin which letter positions (a == 0, b == 1, c == 3) are present
         if(c >= 'a' && c <= 'z') {
            int index = c - 'a';
            notMissing[index] = true;
         }
      }

      for(int i = 0; i < notMissing.length; i++) {
         if(!notMissing[i]){
            // 1 + 'a' returns 'b', 2 + 'a' returns 'c' and so on...
            missingLetters.append((char)(i + 'a'));
         }
      }
      return missingLetters.toString();
   }
}