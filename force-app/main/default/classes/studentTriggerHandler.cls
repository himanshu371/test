public class studentTriggerHandler {
    
    public static void updateCount(list<Student_My_TestApp_01__c> newlist,Map<id,Student_My_TestApp_01__c> oldMap){
        set<id> classIdSet = new set<id>();
        map<id,integer> classIdToStudentCountMap = new Map<id,integer>();
        list<class__c> updateClassList = new list<class__c>();
        
        if(newList != null){
            
            for(Student_My_TestApp_01__c student : newlist){
                if(oldMap == null 
                   || student.Class__c != oldMap.get(student.id).Class__c){
                       // insert condition... and undelete is same as insert
                       if(student.Class__c != null){
                           classIdSet.add(student.Class__c);
                       }
                       //update condition...
                       if(oldMap!=null && oldMap.get(student.id).Class__c != null){
                           classIdSet.add(oldMap.get(student.id).Class__c);
                       }
                   }
            }
            for(Id classId : classIdSet){
                classIdToStudentCountMap.put(classId,0);
            }
            
            for(Student_My_TestApp_01__c student : [select id,class__c
                                                   from Student_My_TestApp_01__c
                                                   where class__c in : classIdSet]){
           			if(!classIdToStudentCountMap.containsKey(student.class__c)){
                             classIdToStudentCountMap.put(student.class__c,0);
                                                                  
            Integer count =classIdToStudentCountMap.get(student.class__c);
            count++;
            classIdToStudentCountMap.put(student.class__c,count);
                                                   } 
        }
    }
}
}