public class Demo17EvenControler {
    @auraEnabled
    public static String pingServer(){
        return String.valueOf(System.now());
        
    }
}