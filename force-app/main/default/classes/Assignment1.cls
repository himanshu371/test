public class Assignment1 {
    public static void getRelatedContacts(Id i){
        List <Contact> con = new List <Contact>();
        con=[select id,name from contact where account.id=:i];
        for(Contact con1: con)
        {
            System.debug(con1.name);
        }
    }
}