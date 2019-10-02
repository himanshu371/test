public class FindMax {

    public Integer a;
    public Integer b;
    public Integer c;
    
    public FindMax(Integer n1,Integer n2){
        a = n1;
        b = n2;
    }
    public void findMaximum(){
        if(a>b){
            c=a;
        }else{
            c=b;
        }
        System.debug(c);
    }
}