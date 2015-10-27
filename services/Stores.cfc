/**
 * Store.cfc
 **/
component {

    import models.Store;

    public function init() {
        variables.fields = 'name,latitude,longitude';
        return this;
    }

    public array function findAll() {
        return entityLoad("store");
    }

    public array function find(any data) {
        var example = populate(new Store(), data);

        return entityLoadByExample("store", example);
    }

    public array function findOne(any data) {
        var example = populate(new Store(), data);

        return entityLoadByExample("store", example, true);
    }

    public Store function findById(numeric id) {
        return entityLoadByPK("store", id);
    }

    public Store function create(struct data) {
        var store = populate(entityNew("store"), data);
        store.dateCreated = now();

        return store;
    }

    public Store function populate(Store store, struct data) {

        for(var field in variables.fields) {
            if(isDefined("data.#field#")) {
                store[field] = data[field];
            }
        }

        return store;
    }

    public boolean function save(Store store) {
        try {
            entitySave(store);
            return true;
        } catch(Exception e) {
            return false;
        }
    }
}
