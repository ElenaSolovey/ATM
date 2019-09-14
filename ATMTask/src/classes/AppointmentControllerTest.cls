@isTest 
private class AppointmentControllerTest {
  
   @isTest static  void ControllerTest() {
       
        ControllerAppointment controller = new ControllerAppointment();
        controller.getAppointment();
        controller.addNewAppointment();
        controller.newIndex();
        controller.previousButton();
        controller.nextButton();
    }

    @isTest static void AddAppointmentTest(){
        
          Appointment__c appointment = new Appointment__c(
            Appointment_Date__c = datetime.newInstance(10,08,2019, 12,00,00 ),
            Duration_in_minutes__c = 30,
            Doctor__c = '12jkdovmf', 
            Patient__c = '13kfjhthh');
        insert appointment; 
    
            Appointment__c appointment1 = new Appointment__c(
            Appointment_Date__c = datetime.newInstance(10,08,2019, 12,20,00 ),
            Duration_in_minutes__c = 7,
            Doctor__c = '12jkdovmf', 
            Patient__c = '13kfjhthh');
        insert appointment1; 
        
    }

    
    @isTest static void AddDoctorTest(){
        
        DoctorController controller1 = new DoctorController();
        
        Doctor__c newdoctor = new Doctor__c(
            Name = 'Pupok',
            Working_Hours_Start__c = time.newInstance(10, 00, 00, 00),
            Working_Hours_End__c = time.newInstance(20, 00, 00, 00)
        );
        insert newdoctor;
        controller1.addDoctor();
        controller1.cancel();
        
        Doctor__c newdoctor1 = new Doctor__c(
            Name = '',
            Working_Hours_Start__c = time.newInstance(10, 00, 00, 00),
            Working_Hours_End__c = time.newInstance(20, 00, 00, 00)
        );
        insert newdoctor1;
        
        Doctor__c newdoctor2 = new Doctor__c(
            Name = 'Pupok',
            Working_Hours_Start__c = null,
            Working_Hours_End__c = time.newInstance(20, 00, 00, 00)
        );
        insert newdoctor2;
        
        Doctor__c newdoctor3 = new Doctor__c(
            Name = 'Pupok',
            Working_Hours_Start__c = time.newInstance(10, 00, 00, 00),
            Working_Hours_End__c = null
        ); 
        insert newdoctor3;
        
        Doctor__c newdoctor4 = new Doctor__c(
            Name = 'Pupok',
            Working_Hours_Start__c = time.newInstance(10, 00, 00, 00),
            Working_Hours_End__c = time.newInstance(10, 00, 00, 00)
        ); 
        insert newdoctor4;
    }
    
    @isTest static void AddPatientTest(){
        
        PatientController controller2 = new PatientController();
        
         Patient__c newPatient = new Patient__c(
            Name = 'Patient Pupok' 
        );
        insert newPatient;
        controller2.addPatient();
        controller2.cancel();
        
        Patient__c newPatient1 = new Patient__c(
            Name = '' 
        );
        insert newPatient1;
        
        Patient__c newPatient3 = new Patient__c(
            Name = 'mjflfdukspsujflsyjfn' 
        );
        insert newPatient3;
    }
    
    
   
     
}