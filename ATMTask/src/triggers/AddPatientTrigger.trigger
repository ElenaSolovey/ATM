trigger AddPatientTrigger on Patient__c (before insert) {
 
    for(Patient__c patient : Trigger.new ){
        if(patient.Name == null){  
            patient.Name.addError('Please enter а Name');
        }  else if(patient.Name.length() > 15) {
            patient.Name.addError('Name is too long . Please do not use more then 15 symbols');
        }
    }
}