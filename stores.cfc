/**
*
* @rest true
* @restpath /stores
* @produces application/json
* @accessors true
*/
component {
    PageEncoding "utf-8";

    // import models.Store;

    Stores = new services.Store();

    // /**
    // * @httpmethod GET
    // */
    // remote array function index() {
    //     return Stores.findAll();
    // }

    // /**
    // * @httpmethod GET
    // * @restpath {id}
    // * @id.restargsource path
    // */
    // remote Store function show( numeric id ) {
    //     var store = Stores.find( arguments.id );

    //     return store;
    // }

    // /**
    // * @httpmethod POST
    // *
    // * @name.restargsource form
    // * @latitude.restargsource form
    // * @longitude.restargsource form
    // */
    // remote void function create() {
    //     var store = Stores.create( arguments );

    //     // if( not Stores.save( store ) ) {
    //     //     AppHelper.throwValidationError( Stores, store );
    //     // }
    // }

    // /**
    // * @httpmethod PUT
    // * @restpath {id}
    // *
    // * @id.restargsource path
    // * @name.restargsource form
    // * @latitude.restargsource form
    // * @longitude.restargsource form
    // */
    // remote void function update() {
    //     var store = Stores.find( arguments.id );

    //     // if( isNull( store ) ) AppHelper.throw404( Stores );

    //     // Stores.populate( store, arguments );

    //     // if( not Stores.save( store ) ) {
    //     //     AppHelper.throwValidationError( Stores, store );
    //     // }
    // }
}
