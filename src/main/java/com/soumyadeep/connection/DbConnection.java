package com.soumyadeep.connection;

import java.io.InputStream;
import java.sql.Connection;
//import java.sql.DriverManager;
import java.util.Properties;

//import com.mysql.cj.jdbc.MysqlDataSource;
import oracle.jdbc.pool.OracleDataSource;

public class DbConnection
{
    static Connection con;
    
    //Oracle 21C:
    
    /*public static Connection getConnect()
    {
        try
        {
			//Class.forName("oracle.jdbc.driver.OracleDriver");
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","tiger");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return con;
    }*/
    
    public static Connection getConnect()
    {
        String jdbc_url = null, username = null, password = null;
        try
        {
            InputStream is = DbConnection.class.getResourceAsStream("db.properties");

            Properties p = new Properties();
            p.load(is);

            jdbc_url = p.getProperty("jdbc-url");
            username = p.getProperty("username");
            password = p.getProperty("password");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        try
        {
            OracleDataSource ds = new OracleDataSource();

            ds.setURL(jdbc_url);
            ds.setUser(username);
            ds.setPassword(password);

            con = ds.getConnection();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return con;
    }
    
    //MySQL 8:
    
    /*public static Connection getConnect()
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?useSSL=false","root","tiger");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return con;
    }*/
    
    /*
    public static Connection getConnect()
    {
        String jdbc_url=null, username=null, password=null;
        try
        {
            InputStream is=DbConnection.class.getResourceAsStream("db.properties");
            
            Properties p=new Properties();
            p.load(is);
            
            jdbc_url=p.getProperty("jdbc-url");
            username=p.getProperty("username");
            password=p.getProperty("password");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        try
        {
            MysqlDataSource ds=new MysqlDataSource();
            
            ds.setURL(jdbc_url);
            ds.setUser(username);
            ds.setPassword(password);
            
            con=ds.getConnection();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return con;
    }
    */
}