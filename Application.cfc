component {

    // Application options
    this.name = "ng-coldfusion";
    this.root_dir = getDirectoryFromPath( getCurrentTemplatePath() );

    // ORM options
    this.datasource = "ng-coldfusion";
    this.ormEnabled = true;
    this.ormSettings.cfcLocation = this.root_dir & "models/";
    this.ormSettings.dbcreate = "dropcreate";
    this.ormSettings.namingStrategy = "lib.SmartNamingStrategy";

    // Serialization options
    this.serialization.preserveCaseForStructKey = true;

    public boolean function onRequestStart( targetPage ) { 
        ORMReload();

        if(structKeyExists(url,"refresh")) {
            restInitApplication(this.root_dir, this.name);
        }
        return true; 
    }
}
