/**
*
* @rest true
* @restpath /stores
* @produces application/json
* @accessors true
*/
component {
    PageEncoding "utf-8";

    import models.Store;

    Stores = new services.Stores();
    Responder = new lib.Responder();

    /**
    * @httpmethod GET
    */
    remote array function index() {
        return Stores.findAll();
    }

    /**
    * @httpmethod GET
    * @restpath {id}
    * @id.restargsource path
    */
    remote boolean function show(numeric id) {
        var store = Stores.findById( id );

        if( isNull( store ) ) Responder.throwNotFoundError();

        return store;
    }

    /**
    * @httpmethod POST
    *
    * @name.restargsource form
    * @latitude.restargsource form
    * @longitude.restargsource form
    */
    remote void function create() {
        var store = Stores.create( arguments );

        if( not Stores.save( store ) ) {
            Responder.throwValidationError();
        }
    }

    /**
    * @httpmethod PUT
    * @restpath {id}
    *
    * @id.restargsource path
    * @name.restargsource form
    * @latitude.restargsource form
    * @longitude.restargsource form
    */
    remote void function update() {
        var store = Stores.findOne( arguments );

        if( isNull( store ) ) Responder.throwNotFoundError();

        Stores.populate( store, arguments );

        if( not Stores.save( store ) ) {
            Responder.throwValidationError();
        }
    }
}
