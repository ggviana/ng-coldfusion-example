/**
 * Stores.cfc
 **/
component {

    import models.Store;

    public function init() {
        variables.fields = 'id,name,latitude,longitude';
        return this;
    }

    public array function findAll() {
        return entityLoad("store");
    }

    public array function find(any data = {}) {
        var example = populate(new Store(), data);

        return entityLoadByExample(example);
    }

    public any function findOne(any data = {}) {
        var example = populate(new Store(), data);
        
        return entityLoadByExample(example, true);
    }

    public any function findById(numeric id) {
        return entityLoadByPK("store", id);
    }

    public Store function create(any data = {}) {
        var store = populate(new Store(), data);
        store.setDateCreated(now());

        return store;
    }

    public Store function populate(any model, struct data) {
        
        for(var field in variables.fields) {
            var setterMethodName = "set#field#";

            if(structKeyExists(data, field) and structKeyExists(model, setterMethodName)) {
                evaluate("model.#setterMethodName#(data[field])");
            }
        }
        
        return model;
    }

    public boolean function save(Store store) {
        if(not valid(store)) return false;

        try {
            entitySave(store);
            return true;
        } catch(Exception e) {
            return false;
        }
    }

    public boolean function valid(Store store) {
        return arrayLen(errors(store)) eq 0;
    }

    public array function errors(Store store) {
        var errors = [];

        return errors;
    }
}
