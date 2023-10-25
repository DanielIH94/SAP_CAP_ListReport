using {sap.capire.incidents as db} from '../db/schema';

service ProcessorService {
    entity Incidents as projection on db.Incidents;

    @readonly
    entity Customers as projection on db.Customers;
}

annotate ProcessorService.Incidents with @odata.draft.enabled;
annotate ProcessorService with @(requires: 'support');


extend projection ProcessorService.Customers with {
    firstName || ' ' || lastName as name: String
}