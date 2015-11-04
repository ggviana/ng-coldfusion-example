component {

    // Application options
    this.name = "ng-coldfusion";
    this.root_dir = getDirectoryFromPath( getCurrentTemplatePath() );
    this.mappings[ "/models" ] = "#this.root_dir#models/";

    // ORM options
    this.datasource = "ng-coldfusion";
    this.ormEnabled = true;
    this.ormSettings.cfcLocation = this.root_dir & "models/";
    this.ormSettings.dbcreate = "dropcreate";
    this.ormSettings.flushAtRequestEnd = true;

    // Serialization options
    this.serialization.preserveCaseForStructKey = true;

    public boolean function onRequestStart( targetPage ) { 

        if(structKeyExists(url,"refresh")) {
            restInitApplication(this.root_dir, this.name);
            ORMReload();
        }
        return true; 
    }
}
