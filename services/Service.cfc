/**
 * Service.cfc
 **/
component {

	public any function populate(any model, struct data, string fields) {
        
        for(var field in fields) {
            var setterMethodName = "set#field#";

            if(structKeyExists(data, field) and structKeyExists(model, setterMethodName)) {
                evaluate("model.#setterMethodName#(data[field])");
            }
        }
        
        return model;
    }

    public boolean function valid(any model) {
        return arrayLen(errors(model)) eq 0;
    }

    public array function errors(any model) {
        var errors = [];
        return errors;
    }
	
}