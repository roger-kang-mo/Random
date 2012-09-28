import java.util.*;
import java.io.*;

public class JuggleFest {

   public static void main(String[] args) throws Exception {
      String line;
      HashMap<String, Circuit> circuits = new HashMap<String, Circuit>();
      ArrayList<Juggler> jugglers = new ArrayList<Juggler>();

      FileInputStream fileStream = new FileInputStream("jugglefest.txt");
      BufferedReader buffReader = new BufferedReader(new InputStreamReader(fileStream));
      
      while ((line = buffReader.readLine()) != null) {
         if (line.length() == 0) continue;

         String[] parts = line.split(" ");

         switch (line.charAt(0)) {
            case 'C': {
               circuits.put(parts[1], new Circuit(parts));
               break;
            }
            case 'J': {
               jugglers.add(new Juggler(parts));
               break;
            }
         }
      }

      JuggleFest fest = new JuggleFest(circuits, jugglers);
      fest.process();
      fest.printResults();
   }
   
   private HashMap<String, Circuit> circuits;
   private ArrayList<Juggler> jugglers;
   private final int CIRCUIT_SIZE;
   
   public JuggleFest(HashMap<String, Circuit> circuits, ArrayList<Juggler> jugglers) {
      this.circuits = circuits;
      this.jugglers = jugglers;

      CIRCUIT_SIZE = jugglers.size() / circuits.size();
   }
   
   public void process() {  
      while (totalAssigned(circuits.values()) < jugglers.size() && assignJugglers() > 0);
   }
   
   public void printResults() {
      Circuit target = null;

      for (Circuit circuit : circuits.values()) {
         System.out.println(circuit);

         if(circuit.getName().equals("C1970")){
            target = circuit;
         }
      }

      int count = 0;
      for(Juggler j : target.getJugglers()){
         count+= Integer.parseInt(j.getName().trim().substring(1));
      }

      System.out.println("What we're looking for, C1970: " + count);
   }
   
   private int assignJugglers() {
      int movesMade = 0;

      for (Juggler juggler : jugglers) {
         if (juggler.addToPreferredCircuit(circuits, CIRCUIT_SIZE))
            movesMade++;
      }

      return movesMade;
   }
   
   private int totalAssigned(Collection<Circuit> circuits) {
      int count = 0;

      for(Circuit circuit : circuits)
         count += circuit.jugglers.size();

      return count;
   }
   
   private static class Circuit {
      
      private String name;
      private final int H, E, P;
      private ArrayList<Juggler> jugglers = new ArrayList<Juggler>();
      
      public Circuit(String inputs[]) {
         name = inputs[1];

         H = Integer.parseInt(inputs[2].split(":")[1]);
         E = Integer.parseInt(inputs[3].split(":")[1]);
         P = Integer.parseInt(inputs[4].split(":")[1]);
      }
      
      private void assign(Juggler juggler) {

         if (juggler.assignment != null)
            juggler.assignment.jugglers.remove(juggler);

         jugglers.add(juggler);
         juggler.assignment = this;
      }
      
      private void remove(Juggler juggler) {
         jugglers.remove(juggler);
         juggler.assignment = null;
      }
      
      public boolean add(Juggler juggler, int maxSize) {
         if (jugglers.size() == maxSize) {
            for (Juggler occupant : jugglers) {
               if (occupant.scores.get(name) < juggler.scores.get(name)) {
                  remove(occupant);
                  assign(juggler);
                  return true;
               }
            }

            return false;
         }else{
            assign(juggler);

            return true;
         }
      }

      public ArrayList<Juggler> getJugglers(){
         return jugglers;
      }


      public String getName(){
         return name;
      }
      
      public String toString() {
         StringBuilder retString = new StringBuilder("\n" + name + " ");

         for (int i = 0; i < jugglers.size(); i++) {
            retString.append(jugglers.get(i));

            if (i + 1 < jugglers.size())
               retString.append(", ");
         }

         retString.append("\n");
         
         return retString.toString();
      }
      
   }
   
   private static class Juggler {
      
      private String name;
      private final int H, E, P;
      private String[] preferences;
      
      private boolean calculated = false;
      private HashMap<String, Integer> scores = new HashMap<String, Integer>();
      private Circuit assignment = null;
      
      public Juggler(String inputs[]) {
         name = inputs[1];

         H = Integer.parseInt(inputs[2].split(":")[1]);
         E = Integer.parseInt(inputs[3].split(":")[1]);
         P = Integer.parseInt(inputs[4].split(":")[1]);

         preferences = inputs[5].split(",");
      }
      
      public boolean addToPreferredCircuit(HashMap<String, Circuit> circuits, int maxSize) {
         Circuit previousAssignment = assignment;
         
         if(!calculated) 
            calculate(circuits.values());

         for (String preference : preferences) {
            if ((assignment != null && assignment.name.equals(preference)) || circuits.get(preference).add(this, maxSize))
               return assignment != previousAssignment;
         }
         return false;
      }
      
      private void calculate(Collection<Circuit> circuits) {
         for (Circuit circuit : circuits) {
            scores.put(circuit.name, dotProduct(
               new int[] {H, E, P}, 
               new int[] {circuit.H, circuit.E, circuit.P}
            ));
         }

         calculated = true;
      }

      public String getName(){
         return name;
      }
      
      public String toString() {
         StringBuilder retString = new StringBuilder(name + " ");

         for (int i = 0; i < preferences.length; i++) {
            retString.append(preferences[i] + ":" + scores.get(preferences[i]));

            if (i + 1 < preferences.length)
               retString.append(" ");
         }

         return retString.toString();
      }
      
   }
   
   private static int dotProduct(int[] setA, int[] setB) {
      int product = 0;

      for (int i = 0; i < setA.length; i++)
         product += setA[i] * setB[i];

      return product;
   }

}