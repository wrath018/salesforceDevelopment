public class loi {
    @AuraEnabled
    public static ServiceAppointment main(string s){
        ServiceAppointment sa=[Select subject,WorkType.Name,status from ServiceAppointment where id=:s limit 1];
        return sa;
    }
    @AuraEnabled
    public static ServiceAppointment  main2(string s){
         ServiceAppointment sa=[Select subject,WorkType.Name,status from ServiceAppointment where id=:s limit 1];
        sa.Status='Canceled';
        update sa;
        return sa;
    }
    
    @AuraEnabled
    public static ServiceAppointment main3(string io,string s,string p){
      //  datetime d=datetime.valueOf(s);
      System.debug(io);
        string [] so=s.split('');
        string [] so1=p.split('');
        for(integer i=0;i<so.size();i++){
            if(so[i].isAlpha()){
                so[i]=' ';
                so1[i]=' ';
            }
        }
        string sap=string.join(so,'');
        string sap1=string.join(so1,'');
        System.debug(sap);
  datetime d=datetime.valueOf(sap); 
        datetime dt=datetime.valueOf(sap1);
        System.debug(d);
        
         ServiceAppointment sa=[Select subject,WorkType.Name,SchedStartTime,SchedEndTime from ServiceAppointment where id=:io limit 1];
        
    //   System.debug(d);
        sa.SchedStartTime=d;
        sa.SchedEndTime=dt;
        update sa;
        return sa;
        
    }
    @AuraEnabled
    public static  list<ServiceAppointment> main4(){
        list<ServiceAppointment> sa=[Select appointmentnumber from ServiceAppointment];
        
       return  sa;
    }

}