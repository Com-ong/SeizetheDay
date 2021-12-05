package JavaBeans;

import java.sql.*;
import java.util.Properties;
import java.util.Vector;

public class DBConnectionMgr {
	private Vector connections = new Vector(10);
	private String DRIVER = "org.gjt.mm.mysql.Driver",
			URL = "jdbc:mysql://127.0.0.1:3306/seize_the_day?useUnicode=true&characterEncoding=EUC-KR",
			USER = "root",
			PASSWORD = "dkqhzkeh193@";
	private boolean TRACEON = false;
	private boolean initialized = false;
	private int _openConnections = 10;
	private static DBConnectionMgr instance = null;
	public DBConnectionMgr() { }
	
	public static DBConnectionMgr getInstance() {
		if(instance == null)
		{	synchronized (DBConnectionMgr.class)
			{	
				if(instance == null)
					instance = new DBConnectionMgr();
			}
		}
		return instance;
	}
	
	public void setOpenConnectionCount(int count)
	{
		_openConnections = count;
	}
	
	public void setEnableTrace(boolean enable)
	{
		TRACEON = enable;
	}
	
	public synchronized void setInitOpenConnections(int count) throws SQLException
	{
		Connection c = null;
		ConnectionObject co = null;
		
		for(int i=0; i<count; i++)
		{
			c = createConnection();
			co = new ConnectionObject(c, false);
			connections.addElement(co);
			trace("ConnectionPoolManager: Adding new DB connection to pool (" + connections.size() + ")");
		}
	}
	
	public int getConnectionCount()
	{
		return connections.size();
	}
	
	public synchronized Connection getConnection() throws Exception
	{
		if(!initialized)
		{
			Class c = Class.forName(DRIVER);
			DriverManager.registerDriver((Driver) c.newInstance());
			initialized = true;
		}
		Connection c = null;
		ConnectionObject co = null;
		boolean badConnection = false;
		
		for(int i=0; i<connections.size(); i++)
		{
			co = (ConnectionObject) connections.get(i);
			if(!co.inUse)
			{
				try {
					badConnection = co.connection.isClosed();
					if(!badConnection)
						badConnection = (co.connection.getWarnings() != null);
				} catch (Exception e) {
					badConnection = true;
					e.printStackTrace();
				}
				
				if(badConnection) {
					connections.removeElementAt(i);
					trace("ConnectionPoolManager: Remove disconnected DB connection #" + i);
					continue;
				}
				c = co.connection;
				co.inUse = true;
				trace("ConnectionPoolManager: Using existing DB connection #" + (i+1));
				break;
			}
		}
		 if (c == null) {
		    	c = createConnection();
		        co = new ConnectionObject(c, true);
		        connections.addElement(co);
		        trace("ConnectionPoolManager: Creating new DB connection #" + connections.size());
		    }
		    return c;
	}
	public synchronized void freeConnection(Connection c) {
		if (c == null)
	    	return;

		ConnectionObject co = null;

		for (int i = 0; i < connections.size(); i++) {
	    	co = (ConnectionObject) connections.get(i);
	        if (c == co.connection) {
	        	co.inUse = false;
	        	break;
	        }
		}

	    for (int i = 0; i < connections.size(); i++) {
	    	co = (ConnectionObject) connections.get(i);
	        if ((i + 1) > _openConnections && !co.inUse)
	        	removeConnection(co.connection);
	    }
	}

	public void freeConnection(Connection c, PreparedStatement p, ResultSet r) {
		try {
	    	if (r != null) r.close();
	        if (p != null) p.close();
	        freeConnection(c);
		} catch (SQLException e) {
	    	e.printStackTrace();
		}
	}

	public void freeConnection(Connection c, Statement s, ResultSet r) {
		try {
	    	if (r != null) r.close();
	        if (s != null) s.close();
	        freeConnection(c);
		} catch (SQLException e) {
	    	e.printStackTrace();
		}
	}

	public void freeConnection(Connection c, PreparedStatement p) {
		try {
	    	if (p != null) p.close();
	        freeConnection(c);
		} catch (SQLException e) {
	    	e.printStackTrace();
		}
	}

	public void freeConnection(Connection c, Statement s) {
		try {
	    	if (s != null) s.close();
	        freeConnection(c);
		} catch (SQLException e) {
	    	e.printStackTrace();
		}
	}

	/** Marks a flag in the ConnectionObject to indicate this connection is no longer in use */
	public synchronized void removeConnection(Connection c) {
		if (c == null)
	    	return;

		ConnectionObject co = null;
	    for (int i = 0; i < connections.size(); i++) {
	    	co = (ConnectionObject) connections.get(i);
	        if (c == co.connection) {
	        	try {
	            	c.close();
	                connections.removeElementAt(i);
	                trace("Removed " + c.toString());
	        	} catch (Exception e) {
	            	e.printStackTrace();
	        	}
	            break;
	        }
	    }
	}

	private Connection createConnection()
		throws SQLException {
	    Connection con = null;
	        
	    try {
	    	if (USER == null)
	        	USER = "";
	    	if (PASSWORD == null)
	        	PASSWORD = "";

	    	Properties props = new Properties();
	        props.put("user", USER);
	        props.put("password", PASSWORD);

	        con = DriverManager.getConnection(URL, props);
	    } catch (Throwable t) {
	    	throw new SQLException(t.getMessage());
	    }
	    return con;
	}

	/** Closes all connections and clears out the connection pool */
	public void releaseFreeConnections() {
		trace("ConnectionPoolManager.releaseFreeConnections()");

		Connection c = null;
		ConnectionObject co = null;

	    for (int i = 0; i < connections.size(); i++) {
	    	co = (ConnectionObject) connections.get(i);
	        if (!co.inUse)
	        	removeConnection(co.connection);
	    }
	}

	/** Closes all connections and clears out the connection pool */
	public void finalize() {
		trace("ConnectionPoolManager.finalize()");

	    Connection c = null;
	    ConnectionObject co = null;

	    for (int i = 0; i < connections.size(); i++) {
	    	co = (ConnectionObject) connections.get(i);
	        try {
	        	co.connection.close();
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }
	        co = null;
	    }
	    connections.removeAllElements();
	}

	private void trace(String s) {
		if (TRACEON)
	    	System.err.println(s);
	}
}

class ConnectionObject {
	public java.sql.Connection connection = null;
	public boolean inUse = false;

	public ConnectionObject(Connection c, boolean useFlag) {
		connection = c;
	    inUse = useFlag;
	}
}
