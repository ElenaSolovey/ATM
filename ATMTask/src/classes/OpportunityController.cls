public with sharing class OpportunityController {
    public List<Opportunity> opportunitiesOne {get; set;}
    public List<Opportunity> opportunitiesTwo {get; set;}
    public OpportunityController(){
        opportunitiesOne = [
                SELECT Id, Name
                FROM Opportunity
                WHERE StageName = 'Closed Won'
                LIMIT 20
        ];
        opportunitiesTwo = [
                SELECT Id, Name
                FROM Opportunity
                WHERE StageName = 'Closed Lost'
                LIMIT 20
        ];
    }
}