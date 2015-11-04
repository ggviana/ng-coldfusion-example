/**
 * Stores.cfc
 * 
 * @extends Service
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
        var example = populate(new Store(), data, variables.fields);

        return entityLoadByExample(example);
    }

    public any function findOne(any data = {}) {
        var example = populate(new Store(), data, variables.fields);
        
        return entityLoadByExample(example, true);
    }

    public any function findById(numeric id) {
        return entityLoadByPK("store", id);
    }

    public Store function create(any data = {}) {
        var store = populate(new Store(), data, variables.fields);
        store.setDateCreated(now());

        return store;
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

    public array function errors(Store store) {
        var errors = [];

        return errors;
    }
}
