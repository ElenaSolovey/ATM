trigger AppointmentTr on Appointment__c (before insert) {
    Set<Id> doctorId = new Set<Id>();
  
     for(Appointment__c item : Trigger.new){
        doctorId.add(item.Doctor__c);
    }
    
    List<Appointment__c> AppointmentDate = [
        SELECT Appointment_Date__c, Duration_in_minutes__c, Doctor__c, Patient__c
        FROM Appointment__c
        WHERE Doctor__c iN :doctorId
    ];
    
    if(AppointmentDate.isEmpty() ){
        Trigger.new[0].addError('AAAAAAAAAAAAAAAAAA');
    } 
    
    for(Appointment__c itemNew : Trigger.new){
       for(Appointment__c itemOld:AppointmentDate ){
           if(itemNew.Doctor__c == itemOld.Doctor__c && itemNew.Patient__c == itemOld.Patient__c ){
                if(Datetime.valueOf(itemNew.Appointment_Date__c) > Datetime.valueOf(itemOld.Appointment_Date__c) &&
                   Datetime.valueOf(itemNew.Appointment_Date__c) < Datetime.valueOf(itemOld.Appointment_Date__c).addMinutes(Integer.valueOf(itemOld.Duration_in_minutes__c))){
                    itemNew.addError('This time is already taken');
                   break;    
                }else 
                    if(Datetime.valueOf(itemNew.Appointment_Date__c).addMinutes(Integer.valueOf(itemNew.Duration_in_minutes__c)) > Datetime.valueOf(itemOld.Appointment_Date__c) &&
                       Datetime.valueOf(itemNew.Appointment_Date__c).addMinutes(Integer.valueOf(itemNew.Duration_in_minutes__c)) < Datetime.valueOf(itemOld.Appointment_Date__c).addMinutes(Integer.valueOf(itemOld.Duration_in_minutes__c))){
                           itemNew.addError('This time is already taken');
                           break;
                    }else 
                        if(Datetime.valueOf(itemNew.Appointment_Date__c) < Datetime.valueOf(itemOld.Appointment_Date__c) &&
                             Datetime.valueOf(itemNew.Appointment_Date__c).addMinutes(Integer.valueOf(itemNew.Duration_in_minutes__c)) > Datetime.valueOf(itemOld.Appointment_Date__c).addMinutes(Integer.valueOf(itemOld.Duration_in_minutes__c))){
                                 itemNew.addError('This time is already taken');
                                 break;
                           }
                }
       }
        
    }
      
    
}