package SimpleTNView;

// -----( IS Java Code Template v1.2
// -----( CREATED: 2006-12-04 18:20:03.095 JST
// -----( ON-HOST: vfjpisyb48d006a.mltest

import com.wm.data.*;
import com.wm.util.Values;
import com.wm.app.b2b.server.Service;
import com.wm.app.b2b.server.ServiceException;
// --- <<IS-START-IMPORTS>> ---
import java.util.*;
import java.util.regex.*;
import com.wm.app.tn.db.*;
import  java.sql.*;
import java.io.*;
// --- <<IS-END-IMPORTS>> ---

public final class util

{
	// ---( internal utility methods )---

	final static util _instance = new util();

	static util _newInstance() { return new util(); }

	static util _cast(Object o) { return (util)o; }

	// ---( server methods )---




	public static final void qry (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(qry)>> ---
		// @subtype unknown
		// @sigtype java 3.5
		// [i] field:0:required sql
		// [o] record:1:required results
		// [o] field:0:required resultCount
		
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	qry = IDataUtil.getString( pipelineCursor, "sql" );
		pipelineCursor.destroy();
		
		// pipeline
		int result_count = 0;
		IData[]	results = null;
		Connection conn = null;
		try
		{
		        if (qry != null)
		        {
			    ArrayList al = new ArrayList();
		            conn = Datastore.getConnection();
		            Statement stmt = conn.createStatement();
		            System.err.println(qry);
		            long start = System.currentTimeMillis();
		            boolean rp = stmt.execute(qry);
		            long end = System.currentTimeMillis();
		            if (rp)
		            {
		                ResultSet set = stmt.getResultSet();
		      		ResultSetMetaData rsmd;
		      		int columnCount = 0;
		      		String strName = "";
		      		String strValue = "";	
				
		      		while (set.next()) 
				{
		        		rsmd = set.getMetaData();
		        		columnCount = rsmd.getColumnCount();
					IData res = IDataFactory.create();
					IDataCursor idc = res.getCursor();
		        		for (int i = 1; i <= columnCount; i++) 
					{
		          			strName = rsmd.getColumnName(i);
						if (strName.equals("CONTENT"))
						{
						    int size = set.getInt("CONTENTLENGTH");
						    Blob blb = set.getBlob(i);
						    byte[] b_cont = blb.getBytes(1,size);
						    strValue = new String(b_cont);
						}
						else
		          				strValue = set.getString(i);
						IDataUtil.put( idc, strName, strValue );
		        		}
					
					idc.destroy();
					al.add(res);
				}
				results = new IData[al.size()];
				for (int j = 0; j < al.size(); j++)
				{
					results[j] = (IData)al.get(j);
					result_count++;
				}
		               set.close();
		            } 
			    else
		            {
		                System.err.println("Update count: " + stmt.getUpdateCount());
		            }
		            stmt.close();
			    //////////////////////////////////////////////////////////////
			    // Do not close connection it must be relesed to pool to reuse	
		            //conn.close();
		        }
		        Datastore.releaseConnection(conn);
		}
		catch (Exception e)
		{
			Datastore.releaseConnection(conn);
			throw new ServiceException(e); 
		}
		// pipeline
		IDataCursor pipelineCursor1 = pipeline.getCursor();
		
		// results
		IDataUtil.put( pipelineCursor1, "results", results );
		IDataUtil.put( pipelineCursor1, "resultCount", Integer.toString(result_count) );
		
		pipelineCursor1.destroy();
		// --- <<IS-END>> ---

                
	}
}

