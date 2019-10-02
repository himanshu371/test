public class VFDemo3Extension {
    //public VFDemo3Extension(ApexPages.StandardController stdController){
       // Message='Enter Values';
        //Account acc= new Account();
         //  }
   // public PageReference customCancel(){
    //    PageReference ref=new PageReference('/apex/VFDemo');
     //   return ref;
//    }
    String param;
    Account acc = new Account();
    public String message{get; set;}
    public VFDemo3Extension(ApexPages.StandardController stdController){
        //it provides standard controller functionality
        message = 'Enter values';
        acc = (Account)stdController.getRecord();
        if(acc.Name != null){
            message = 'Welcome '+acc.Name;
        }
        param=apexpages.currentPage().getparameters().get('retURL');
    }
    
    //method for cancel functionality
    public PageReference customCancel() {
        PageReference ref = new PageReference('/apex/VFDemo');
        return ref;
    }
    public PageReference URLReturn(){
        if(param==null){
        PageReference ref = new PageReference('/apex/VFdemo2?retURL=001/o');
        ref.setRedirect(true);
            return ref;
        }
        return null;
    }

}