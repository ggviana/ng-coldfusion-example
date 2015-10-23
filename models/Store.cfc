/**
* @output false
* @persistent true
*/
component {

    property name="id"           fieldtype="id"     generator="increment";
    property name="name"         ormtype="string";
    property name="latitude"     ormtype="double";
    property name="longitude"    ormtype="double";
    property name="dateCreated"  ormtype="timestamp";
}
