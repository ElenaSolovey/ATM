public class PatientController {
    
    public Patient__c patient {get; set;}
    
    public PatientController(){
         patient = new Patient__c(); 
    }
         
    public  PageReference addPatient(){    
       try{
            INSERT patient;
            PageReference appPage = new PageReference('/apex/AddNewPatient');
            appPage.setRedirect(true);
            return appPage; 
       }catch(Exception ex){}
       return null; 
    }
    
    public PageReference cancel(){
        PageReference pageRef = new PageReference('/apex/Appointment');
        return pageRef;
    }
      
}