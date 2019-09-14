public class DoctorController {
    
    public Doctor__c doctor {get; set;}
    
    public DoctorController(){
        doctor = new Doctor__c(); 
    }
    
    public  PageReference addDoctor(){
        try{
            INSERT doctor; 
            PageReference appPage = new PageReference('/apex/Appointment');
            appPage.setRedirect(true);
            return appPage; 
        }
        catch(Exception ex){}
        return null;   
        
    }
    
    public PageReference cancel(){
        PageReference pageRef = new PageReference('/apex/Appointment');
        return pageRef;
    }
    
    
}