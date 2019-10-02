public class TestUtils {
 //Student__c,Class__c
    public static List<Class__c> createCollegeRecords(String name,Integer count,
                                                      Boolean isInsert){
        
        List<Class__c> classList = new List<Class__c>();
        for(Integer i=0;i<=count;i++){
            Class__c cls = new Class__c();
            cls.name = name + i;
            classList.add(cls);
        }
         if(isInsert){
          insert classList;
         }
         return classList;
    }
public static List<Student__c> createStudentRecords(String name,Integer count,
                                                      Boolean isInsert){
        
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i=0;i<=count;i++){
            Student__c student = new Student__c();
            student.name = name + i;
            studentList.add(student);
        }
         if(isInsert){
          insert studentList;
         }
         return studentList;
    }

}