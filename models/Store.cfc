/**
* @output false
* @persistent true
*/
component {

	/**
    * @fieldtype id
    * @generator increment
    */
    property name="id";

    /**
    * @ormtype string
    * @notnull true
    */
    property name="name";

    /**
    * @ormtype double
    * @notnull true
    */
    property name="latitude";

    /**
    * @ormtype double
    * @notnull true
    */
    property name="longitude";

    /**
    * @ormtype timestamp
    * @notnull true
    * @update false
    */
    property name="dateCreated";
}
