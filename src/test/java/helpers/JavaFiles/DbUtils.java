package helpers.JavaFiles;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.util.List;
import java.util.Map;

public class DbUtils {

    private static final Logger logger = LoggerFactory.getLogger(DbUtils.class);

    private final JdbcTemplate jdbc;

    private static DbUtils dbUtils;

    public static DbUtils getInstance(Map<String, Object> config) {
        if (dbUtils==null) {
            dbUtils= new DbUtils(config);
        }
            return dbUtils;
    }

    private DbUtils(Map<String, Object> config) {
        String url = (String) config.get("url");
        String username = (String) config.get("username");
        String password = (String) config.get("password");
        String driver = (String) config.get("driverClassName");
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(driver);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        jdbc = new JdbcTemplate(dataSource);
        logger.info("init jdbc template: {}", url);

    }

    /**
     * Returns a specific single value from the datatable
     * @param query sql sentence that you want to execute
     * @return the concrete value 
     */
    public Object readValue(String query) {
        return jdbc.queryForObject(query, Object.class);
    }

    /**
     * Returns one row from the database
     * @param query sql sentence that you want to execute
     * @return Object that contains data result
     */
    public Map<String, Object> readRow(String query) {
        return jdbc.queryForMap(query);
    }

    /**
     * Returns multiple rows from the datatable
     * @param query sql sentence that you want to execute
     * @return list that contains the results
     */
    public List<Map<String, Object>> readRows(String query) {
        return jdbc.queryForList(query);
    }

    /**
     * Execute an 'insert into' sql sentence
     * @param sql sql sentence that you want to execute
     */
    public void insertRows(final String sql){
        jdbc.batchUpdate(new String[]{sql});
    }

}