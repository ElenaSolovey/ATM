public class ControllerAppointment {
    
    public String doctorNameId {get; set;}
    public String patientNameId {get; set;}
    public List<Doctor__c> doctorList {get; set;}  
    public List<Patient__c> patientList {get; set;}
    public List<Appointment__c> appointmentList{ get;set;}
    public List<SelectOption> doctorSelectOptionList {get; set;}
    public List<SelectOption> patientSelectOptionList {get; set;}
    public List<Appointment__c> appTableList {get; set;} 
    
    public  Appointment__c app {get; set;}
    public  Appointment__c appNew {get; set;}
    public  Doctor__c hours {get; set;} 
    
    public Integer index = 10;
    public Integer start = 0;
    public Integer count {get;set;}
    
    public Boolean next {get;set;}
    public Boolean previous {get;set;}
    
    
    
    public ControllerAppointment(){
        hours = new Doctor__c();
        app = new Appointment__c(); 
        
        previous = true; 
        next = false; 
        
        /*Select Doctors*/ 
        doctorList = [SELECT Id, Name , Working_Hours_Start__c, Working_Hours_End__c  FROM Doctor__c ORDER BY Name ASC]; 
        doctorNameId = doctorList.isEmpty() == FALSE ? doctorList[0].Id : NULL;
        doctorSelectOptionList = new List<SelectOption>();
        for(Doctor__c item: doctorList){
            doctorSelectOptionList.add(new SelectOption(item.Id, item.Name)); 
        }
        
        
        /*Select Patients*/ 
        patientList = [SELECT Id, Name FROM Patient__c ORDER BY Name ASC]; 
        patientNameId = patientList.isEmpty() == FALSE ? patientList[0].Id : NULL; 
        patientSelectOptionList = new List<SelectOption>();
        for(Patient__c item: patientList){ 
            patientSelectOptionList.add(new SelectOption(item.Id, item.Name));
        }
        
        getAppointment();
        
        
    }
    
    public void getAppointment(){
        for(Doctor__c item: doctorList){
            if( item.Id == doctorNameId ){
                hours = item;
            }
        }
        
        appointmentList = [SELECT Doctor__r.Name, Doctor__r.Working_Hours_Start__c, Doctor__r.Working_Hours_End__c,  Patient__r.Name, Appointment_Date__c, Duration_in_minutes__c  
                           FROM Appointment__c 
                           WHERE Doctor__r.Id =: doctorNameId];
        
        count = [SELECT Count() 
                 FROM Appointment__c
                 WHERE Doctor__r.Id = :doctorNameId ];
        
        List<Appointment__c> temp = new List<Appointment__c>();
        if(count< index) { 
           for(Integer i = start; i<count; i++){   
            temp.add(appointmentList.get(i));
            }   
        } else {
             for(Integer i = start; i<index; i++){   
            temp.add(appointmentList.get(i));
            } 
          }    
        appTableList = temp;
        
        
        if(count < 10){
            next = true;
        }
        
        newIndex();
        
      
        
    }
    
    public PageReference addNewDoctor(){
        PageReference pageRef = new PageReference('/apex/AddNewDoctor');
        return pageRef;
    }
    
    public PageReference addNewPatient(){
        PageReference pageRef = new PageReference('/apex/AddNewPatient');
        return pageRef; 
    }
    
    public void addNewAppointment(){
        Appointment__c  appNew = new Appointment__c( 
            Appointment_Date__c = app.Appointment_Date__c,
            Duration_in_minutes__c = app.Duration_in_minutes__c,
            Doctor__c = doctorNameId, 
            Patient__c = patientNameId);
            INSERT appNew;
            getAppointment(); 
       
    }
    
    public void newIndex (){ 
        index = 10; 
        start = 0; 
    }
    
    public void nextButton()
    {
        index = index + 10;
        start = start + 10;
        appTableList.clear();
        if(index > count)
        {
            index = Math.Mod(count,10) + start; 
            next = true;
            previous = false;
            List<Appointment__c> temp = new List<Appointment__c>();
            for(Integer i = start; i<index; i++)
            {        
                temp.add(appointmentList.get(i));
            }
            appTableList = temp;   
            
            index = start + 10;    
        }
        else
        {
            List<Appointment__c> temp = new List<Appointment__c>();
            for(Integer i = start; i<index; i++)
            {        
                temp.add(appointmentList.get(i));
            }
            appTableList = temp;     
            previous = true;
        }   
        
    }
    
    public void previousButton()
    {
        if(start > 10)
        {    
            index = index - 10;
            start = start - 10;
            List<Appointment__c> temp = new List<Appointment__c>();
            for(Integer i = start; i<index; i++)
            {        
                temp.add(appointmentList.get(i));
            }
            appointmentList = temp; 
            previous = false;
            next = false;
        }    
        else
        {
            index = index - 10;
            start = start - 10;
            List<Appointment__c> temp = new List<Appointment__c>();
            for(Integer i = start; i<index; i++)
            {        
                temp.add(appointmentList.get(i));
            }
            appTableList = temp; 
            previous = true;
            next = false;        
        } 
        
    }
    
}