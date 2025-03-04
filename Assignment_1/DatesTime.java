
// Assignment 1 Submitted to Mr. Hem Bhatt

/**
 * @author Bhashkar_Fulara
 * @version 23
 * @since 2025-03-04
 */


public class DatesTime {


// EXERCISE 1 - To work or not to work


    public static String checkDay(int n) {

        if (n == 7) {
            return "rest";
        } else if (1 <= n && n < 7) {
            return "work";
        } else {
            return "Invalid Day";
        }
    }


// Exercise 2 - The months of the year

    public static String nameOfMonth(int m) {
        switch (m) {
            case 1:
                return "January";
            case 2:
                return "February";
            case 3:
                return "March";
            case 4:
                return "Aprail";
            case 5:
                return "May";
            case 6:
                return "June";
            case 7:
                return "July";
            case 8:
                return "August";
            case 9:
                return "September";
            case 10:
                return "October";
            case 11:
                return "November";
            case 12:
                return "December";
            default:
                return "Invalid Number";
        }
    }


// Exercise 3 - From numbers to words (Ordinal Suffix)

/* Explanation -> For 11 to 13 if condition is required otherwise Switch will work
               like for 31 */


    public static String strWithSuffix(int n) {
        int rem = n % 10;
        int rem100 = n % 100;


        if (rem100 >= 11 && rem100 <= 13) {
            return n + "th";
        }

        switch (rem) {
            case 1:
                return n + "st";
            case 2:
                return n + "nd";
            case 3:
                return n + "rd";
            default:
                return n + "th";
        }
    }


// Exercise 4 - Leap Years

    public static boolean isLeapYear(int y) {

        return ((y % 4 == 0 && y % 100 != 0) || y % 400 == 0) ? true : false;

    }


// Exercise 5 - How many days are there in a month


    public static int numberOfDays(int m, int y) {
        switch (m) {
            case 1:
                return 31;
            case 2:
                return isLeapYear(y) ? 29 : 28;
            case 3:
                return 31;
            case 4:
                return 30;
            case 5:
                return 31;
            case 6:
                return 30;
            case 7:
                return 31;
            case 8:
                return 31;
            case 9:
                return 30;
            case 10:
                return 31;
            case 11:
                return 30;
            case 12:
                return 31;
            default:
                System.out.println("*** Invalid Number Enter the Right No ***");
                return 0;
        }
    }


// Exercise 6 - Constructing Dates

/* Explanation -> Here 3 Functions that i built previously required isLeapYear() nameofMonth() & strWithSuffix ()
			strWithSuffix(d) adds the correct suffix to the day
			nameOfMonth(m) returns the full name of the month
	          Using ternay Operator first line checks if date is valid after second line is for Handling February specific
			code and Leap Year.......
*/

    public static String dateString(int d, int m, int y) {

        if (0 < d && d <= 31 && 0 < m && m <= 12 && y > 0) {


            return (m == 2 && ((!isLeapYear(y) && d > 28) || (isLeapYear(y) && d > 29)) ? "Non-Existent Date" : "The " + strWithSuffix(d) + " of " + nameOfMonth(m) + "," + y);
        } else {

            return "Non-Existent Date";

        }
    }


// Exercise 7 - Breaking down times

    public static String timeString(int n) {

        return (n / 86400) + "days," + ((n / 3600) - ((n / 86400) * 24)) + "hours," + ((n / 60) - ((n / 3600) * 60)) + "minutes," + (n - ((n / 60) * 60)) + "seconds";

    }
    // Main method

    public static void main(String[] args) {

// Calling all Function's One by One

// OUTPUT of Exercise 1
        System.out.println("***Exercise 1 OUTPUT***" + "\n" + checkDay(1) + "\n" + checkDay(7) + "\n" + checkDay(8) + "\n");

// OUTPUT of Exercise 2
        System.out.println("***Exercise 2 OUTPUT***" + "\n" + nameOfMonth(1) + "\n" + nameOfMonth(5) + "\n" + nameOfMonth(10) + "\n");

// OUTPUT of Exercise 3
        System.out.println("***Exercise 3 OUTPUT***" + "\n" + strWithSuffix(31) + "\n" + strWithSuffix(11) + "\n" + strWithSuffix(2) + "\n");

//OUTPUT of Exercise 4
        System.out.println("***Exercise 4 OUTPUT***" + "\n" + isLeapYear(1800) + "\n" + isLeapYear(2000) + "\n");

// OUTPUT of Exercise 5
        System.out.println("***Exercise 5 OUTPUT***" + "\n" + numberOfDays(2, 1800) + "\n" + numberOfDays(2, 2000) + "\n");

// OUTPUT of Exercise 6
        System.out.println("***Exercise 6 OUTPUT***" + "\n" + dateString(28, 2, 1800) + "\n" + dateString(29, 2, 1800) + "\n");

// OUTPUT of Exercise 6
        System.out.println("***Exercise 7 OUTPUT***" + "\n" + timeString(86400) + "\n" + timeString(1000000) + "\n");

    }

}


/* ************************************* ASSIGNMENT COMPLETED **************************************** */