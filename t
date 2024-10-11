    public void insertKeyValueMap(String tableName, Map<String, Object> keyValueMap) {
        StringBuilder sql = new StringBuilder("INSERT INTO " + tableName + " (");
        
        // Build the SQL query for the columns
        String columns = String.join(", ", keyValueMap.keySet());
        sql.append(columns).append(") VALUES (");
        
        // Create placeholders for values
        String placeholders = String.join(", ", keyValueMap.keySet().stream().map(k -> "?").toArray(String[]::new));
        sql.append(placeholders).append(")");
        
        // Execute the update with the values from the map
        jdbcTemplate.update(sql.toString(), keyValueMap.values().toArray());
    }
}