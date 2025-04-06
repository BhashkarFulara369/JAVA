



import java.util.Random;
import java.util.Scanner;
import java.util.Arrays;

public class Mastermind {
    private static final String[] COLORS = {"RED", "GREEN", "BLUE", "PURPLE", "BROWN", "YELLOW"};

    // Check if the input color exists in COLORS
    public static boolean inputColor(String color) {
        for (String c : COLORS) {
            if (c.equalsIgnoreCase(color)) { // Ignore case for flexibility
                return true;
            }
        }
        return false;
    }

    // Generate a random 4-element code from COLORS
    public static String[] createCode() {
        Random rand = new Random();
        String[] code = new String[4];
        for (int i = 0; i < 4; i++) {
            code[i] = COLORS[rand.nextInt(COLORS.length)];
        }
        return code;
    }

    // Count the number of exact matches (black pins)
    public static int blackPins(String[] guess, String[] code) {
        int count = 0;
        for (int i = 0; i < 4; i++) {
            if (guess[i].equals(code[i])) {
                count++;
            }
        }
        return count;
    }

    // Count black and white pins
    public static int[] scoreGuess(String[] guess, String[] code) {
        int black = blackPins(guess, code);
        int white = 0;
        boolean[] checkedGuess = new boolean[4];
        boolean[] checkedCode = new boolean[4];

        // Mark exact matches first
        for (int i = 0; i < 4; i++) {
            if (guess[i].equals(code[i])) {
                checkedGuess[i] = true;
                checkedCode[i] = true;
            }
        }

        // Find correct colors in incorrect positions
        for (int i = 0; i < 4; i++) {
            if (!checkedGuess[i]) {
                for (int j = 0; j < 4; j++) {
                    if (!checkedCode[j] && guess[i].equals(code[j])) {
                        white++;
                        checkedCode[j] = true;
                        break;
                    }
                }
            }
        }

        return new int[]{black, white};
    }

    // Get user input for guess
    public static String[] inputGuess() {
        Scanner scanner = new Scanner(System.in);
        String[] guess = new String[4];

        System.out.println("Enter your guess:");
        for (int i = 0; i < 4; i++) {
            System.out.print((i + 1) + "st color: ");
            guess[i] = scanner.next().toUpperCase();
            while (!inputColor(guess[i])) {
                System.out.println("Invalid color. Choose from: " + String.join(", ", COLORS));
                guess[i] = scanner.next().toUpperCase();
            }
        }

        return guess;
    }

    // Play one round with explicit guess display
    public static boolean oneRound(String[] code) {
        String[] guess = inputGuess();

        // Display the guessed array before scoring
        System.out.println("Your guess: " + Arrays.toString(guess));

        int[] score = scoreGuess(guess, code);
        System.out.println("Score: " + score[0] + " black(n.o of exact matches), " + score[1] + " white(correct colors in wrong places)");

        return score[0] == 4;
    }

    // Full Mastermind game loop
    public static void playMastermind(String[] code) {
        System.out.println("Welcome to Mastermind!");
        int round = 1;

        while (!oneRound(code)) {
            round++;
            System.out.println("----------------------------------YOU LOOSE---------------------------------");
            System.out.println("Play another round");
            System.out.println("Round " + round);
        }

        System.out.println("YOU WIN!");
    }

    public static void main(String[] args) {
        String[] code = createCode();
        playMastermind(code);
    }
}
