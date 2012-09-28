import java.util.ArrayList;


/**
 * This program simulates a tube with particles passing through it. Some go left, some go right.
 * A speed a specified as well as the starting positions where periods are empty spots. 
 * Each iteration will print out until the particles have completely exited the tube.
 * */
public class Animation {

   public static void main(String[] args) {
      String[] states = new Animation().animate(1,  ".R..L..R.L..");

      for(String move : states)
         System.out.println(move);

      System.out.println("total states: " + states.length);
   }
   
   public String[] animate(double speed, String init) {
      ArrayList<Particle> particles = new ArrayList<Particle>();
      int chamberSize = init.length() - 1;

      for(int i = 0; i < init.length(); i++) {
         switch(init.charAt(i)) {
            case 'L':
               particles.add(new Particle(i, false));
               break;
            case 'R':
               particles.add(new Particle(i, true));
               break;
         }
      }
      
      ArrayList<String> states = new ArrayList<String>();
      states.add(chamberToString(particles, chamberSize));
      
      int inChamber = particles.size();

      while(inChamber > 0) {
         inChamber = 0;

         for(Particle particle : particles) {
            if(particle.move(speed, chamberSize))
               inChamber++;
         }

         states.add(chamberToString(particles, chamberSize));
      }

      return states.toArray(new String[states.size()]);
   }
   
   private String chamberToString(ArrayList<Particle> particles, int chamberSize) {
      char[] chamber = new char[chamberSize + 1];

      for(int i = 0; i < chamber.length; i++) {
         chamber[i] = '.';
      }

      for(Particle particle : particles) {
         if(particle.inChamber(chamberSize))
            chamber[particle.roundPosition()] = 'X';
      }

      return new String(chamber);
   }
   
   class Particle {
   
      double position;
      boolean statesRight;
      
      public Particle(int position, boolean statesRight) {
         this.position = position;
         this.statesRight = statesRight;
      }
      
      //return whether or not Particle is still in chamber
      public boolean move(double speed, int chamberSize) {
         if(position < 0 || position > chamberSize)
            return false;
            
         if(statesRight)
            position += speed;
         else
            position -= speed;

         return inChamber(chamberSize);
      }
      
      public boolean inChamber(int chamberSize) {
         return position >= 0 && position <= chamberSize;

      }
      
      public double getPosition() {
         return position;
      }
      
      // Returns nearest key position
      public int roundPosition() {
         double right = Math.ceil(position);
         double left = Math.floor(position);
         double distanceRight = right - position;
         double distanceLeft = position - left;

         if(distanceRight == distanceLeft || distanceLeft < distanceRight)
            return (int) left;
         else
            return (int) right;
      }
   
   }

}