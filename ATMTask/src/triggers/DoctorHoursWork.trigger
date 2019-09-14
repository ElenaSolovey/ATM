trigger DoctorHoursWork on Doctor__c (before insert) {
    
    for(Doctor__c doctor : Trigger.new ){
        
        if(doctor.Name == null){  
            doctor.Name.addError('Please enter Name');
        }    
        else if (doctor.Working_Hours_Start__c == null) {  
            doctor.Working_Hours_Start__c.addError('Please enter time');  
        }
        else if(doctor.Working_Hours_End__c == null) { 
            doctor.Working_Hours_End__c.addError('Please enter time');  
        } 
        else if(doctor.Working_Hours_End__c == doctor.Working_Hours_Start__c) {  
            doctor.Working_Hours_End__c.addError('Invalid time of work');  
        } 
     } 
}