component {

    // Application options
    this.name = "ng-coldfusion";
    this.root_dir = getDirectoryFromPath( getCurrentTemplatePath() );
    this.mappings[ "/controllers" ] = this.root_dir & "controllers/";
    this.mappings[ "/lib"         ] = this.root_dir & "lib/";
    this.mappings[ "/models"      ] = this.root_dir & "models/";
    this.mappings[ "/services"    ] = this.root_dir & "services/";

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
