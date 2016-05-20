import java.util.*;

public class Main {

    public static void main(String[] args) {
        Random random = new Random();
        generateVotes(random);
//        generateClassifications(random);
    }

    private static void generateVotes(Random random) {
        Set<String> votes = new HashSet<>();
        Integer voterID;
        Integer postID;
        Integer upRandom;
        Boolean up;
        String vote;
        int i = 0;
        while (i < 20000) {
            voterID = random.nextInt(2005) + 1;
            postID = random.nextInt(1000) + 1;
            upRandom = random.nextInt(5);
            up = upRandom != 0;
            vote = voterID + " " + postID;
            if (votes.add(vote)) {
                if (up) System.out.println("(" + voterID +", " + postID + ", TRUE),");
                else System.out.println("(" + voterID +", " + postID + ", FALSE),");;
                i++;
            }
        }
    }

    private static void generateClassifications(Random random) {
        Set<String> classifications = new HashSet<>();
        Integer tagID;
        Integer questionID;
        String classification;
        int i = 0;
        while (i < 2000) {
            tagID = random.nextInt(256) + 1;
            questionID = random.nextInt(500) + 1;
            classification = tagID + " " + questionID;
            if (classifications.add(classification)) {
                System.out.println("(" + tagID +", " + questionID + "),");
                i++;
            }
        }
    }

}
