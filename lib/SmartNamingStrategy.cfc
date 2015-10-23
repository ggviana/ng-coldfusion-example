component implements="CFIDE.orm.INamingStrategy" {
 
    public string function getTableName(String tableName){
        return "tbl_" & toSnakeCase(tableName);
    }
    
    public string function getColumnName(String columnName){
        return toSnakeCase(columnName);
    }

    private string function toSnakeCase(required string text) {
        text = rereplace(text, "([A-Z])", "_\1","all");
        text = rereplace(text, "\s+", "_", "all");
        text = rereplace(text, "^_(\w)", "\1");
        return text.lcase();
    }
}