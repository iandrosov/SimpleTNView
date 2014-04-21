package SimpleTNView;

// -----( IS Java Code Template v1.2
// -----( CREATED: 2006-12-01 10:48:47.834 JST
// -----( ON-HOST: vfjpisyb48d006a.mltest

import com.wm.data.*;
import com.wm.util.Values;
import com.wm.app.b2b.server.Service;
import com.wm.app.b2b.server.ServiceException;
// --- <<IS-START-IMPORTS>> ---
import java.util.*;
import java.sql.*;
import com.wm.app.tn.db.*;
import com.wm.app.tn.doc.*;
import com.wm.app.tn.err.*;
import com.wm.app.tn.profile.*;
import com.wm.app.tn.util.*;
// --- <<IS-END-IMPORTS>> ---

public final class archive

{
	// ---( internal utility methods )---

	final static archive _instance = new archive();

	static archive _newInstance() { return new archive(); }

	static archive _cast(Object o) { return (archive)o; }

	// ---( server methods )---




	public static final void getDocContent (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getDocContent)>> ---
		// @subtype unknown
		// @sigtype java 3.5
		// [i] field:0:required docId
		// [i] field:0:required partName
		// [o] field:0:required contentString
		
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	docid = IDataUtil.getString( pipelineCursor, "docId" );
			String	partName = IDataUtil.getString( pipelineCursor, "partName" );
		pipelineCursor.destroy();
		String str_content = null;
		String sql = "SELECT * FROM ARCHIVE_BIZDOCCONTENT WHERE DOCID = '";
		try
		{
			sql += docid + "' AND PARTNAME = '"+partName+"'";
			//System.out.println(sql);
			ArrayList al = query(sql);
		
			if (al != null)
			{
				//System.out.println("Arraylist is OK size - "+Integer.toString(al.size()));
				for (int i = 0; i < al.size(); i++)
				{
				     IData d = (IData)al.get(i);
				     str_content = getDataValue(d,"CONTENT");
				}
			}
		}
		catch(Exception e)
		{
			throw new ServiceException(e);
		} 
		
		// pipeline
		IDataCursor pipelineCursor_1 = pipeline.getCursor();
		IDataUtil.put( pipelineCursor_1, "contentString", str_content );
		pipelineCursor_1.destroy();
		// --- <<IS-END>> ---

                
	}



	public static final void getDocContentParts (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getDocContentParts)>> ---
		// @subtype unknown
		// @sigtype java 3.5
		// [i] field:0:required internalId
		// [o] field:0:required resultCount
		// [o] field:0:optional relatedDocCount
		// [o] record:1:optional relatedDocs
		// [o] record:1:required contentParts
		// [o] - field:0:required name
		// [o] - field:0:required length
		// [o] - field:0:required type
		// [o] - field:0:required storageType
		// [o] - field:0:required storageReference
		// [o] field:0:required partsLength
		IDataCursor idatacursor = null;
		try
		{
			idatacursor = pipeline.getCursor();
		        String internalId = null;
		        if (idatacursor.first("internalId"))
		            internalId = (String)idatacursor.getValue();
		        if (internalId == null || internalId.length() == 0)
		            throw EXMLException.fromResource("TRNSERV.000018.000018", new String[] {"internalId"}, null);
		
			String sql = "SELECT * FROM ARCHIVE_BIZDOCCONTENT WHERE DOCID='" + internalId + "'";
		
			ArrayList al = query(sql);
			if (al != null)
			{
			    /*********	
		        	idatacursor.insertAfter("docId", internalId);
		        	runTaskQuery(pipeline);
		            idatacursor.insertAfter("getRelated", "true");
		            Service.doInvoke("wm.tn.doc", "view", pipeline);
		            BizDocEnvelope bizdocenvelope = BizDocStore.getDocument(internalId, true);
		            BizDocContentPart abizdoccontentpart[] = bizdocenvelope.getContentParts();
		            if(bizdocenvelope == null)
		                throw EXMLException.fromResource("TRNSERV.000018.000067", new String[] {internalId}, null);
		            if(abizdoccontentpart == null || abizdoccontentpart.length == 0)
		                throw EXMLException.fromResource("TRNSERV.000018.000068", new String[] {internalId}, null);
				IData aidata[] = new IData[abizdoccontentpart.length];
			    ************/
		
		            IData aidata[] = new IData[al.size()];
		            for(int i = 0; i < al.size(); i++)
		            {
				IData temp = (IData)al.get(i);
		                aidata[i] = IDataFactory.create();
		                IDataCursor idatacursor1 = aidata[i].getCursor();
		                String s1 = getDataValue(temp, "STORAGETYPE"); //abizdoccontentpart[i].getStorageType();
		                Object obj = (Object)getDataValue(temp, "STORAGEREF"); //abizdoccontentpart[i].getStorageRef();
		                idatacursor1.insertAfter("name", getDataValue(temp, "PARTNAME")); //abizdoccontentpart[i].getPartName());
		                idatacursor1.insertAfter("length", String.valueOf(getDataValue(temp, "CONTENTLENGTH"))); //String.valueOf(abizdoccontentpart[i].getLength()));
		                idatacursor1.insertAfter("type", getDataValue(temp, "MIMETYPE")); //abizdoccontentpart[i].getMimeType());
		                idatacursor1.insertAfter("storageType", s1 != null ? ((Object) (s1)) : "");
		                idatacursor1.insertAfter("storageReference", obj != null ? ((Object) (obj.toString())) : "");
		                idatacursor1.destroy();
		            }
			    ///////////////////////////////////////////////////////////////
			    // Build bizdoc record here and fill with data
			    IData bizdoc = IDataFactory.create();
			    // Build SQL here
			    String sql1 = "SELECT d.DocID, d.DocTimestamp, t.TypeName, s.CorporationName AS SenderCorp, ";
			    sql1 += "s.OrgUnitName AS SenderUnit, r.CorporationName AS ReceiverCorp, ";
			    sql1 += "r.OrgUnitName AS ReceiverUnit, d.RoutingStatus, d.UserStatus, d.ConversationID ";
			    sql1 += "FROM BizDocTypeDef t, Partner s, Partner r, ARCHIVE_BizDoc d ";
			    sql1 += "WHERE d.DocTypeID = t.TypeID AND d.SenderID = s.PartnerID AND d.ReceiverID = r.PartnerID ";
			    sql1 += "AND d.DocID = '" + internalId + "'";
			    ArrayList al_bizdoc = query(sql1);
			    if (al_bizdoc != null)
			    {
				IData bizdata = (IData)al_bizdoc.get(0);
				IDataCursor idc_bizdoc = bizdoc.getCursor();
				idc_bizdoc.insertAfter("DocTimestamp", getDataValue(bizdata, "DOCTIMESTAMP"));
				idc_bizdoc.insertAfter("TypeName", getDataValue(bizdata, "TYPENAME"));
				idc_bizdoc.insertAfter("DocumentID", getDataValue(bizdata, "DOCUMENTID"));
				idc_bizdoc.insertAfter("SystemStatus", getDataValue(bizdata, "ROUTINGSTATUS"));
				idc_bizdoc.insertAfter("UserStatus", getDataValue(bizdata, "USERSTATUS"));
				idc_bizdoc.destroy();
			    }	    
		            ///////////////////////////////////////////////////////////////
			    idatacursor.insertAfter("resultCount", "0");
		            idatacursor.insertAfter("contentParts", aidata);
		            idatacursor.insertAfter("partsLength", String.valueOf(al.size()));
			    idatacursor.insertAfter("bizdoc", bizdoc);
			}
		}
		catch(Throwable throwable)
		{
		      throw EXMLException.fromResource("TRNSERV.000018.000066", null, throwable);
		}
		finally
		{
		      if(idatacursor != null)
		         idatacursor.destroy();
		}
		// --- <<IS-END>> ---

                
	}



	public static final void getDocuments (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getDocuments)>> ---
		// @subtype unknown
		// @sigtype java 3.5
		// [i] field:0:optional Restriction
		// [i] field:0:optional ToDate
		// [i] field:0:optional FromDate
		// [i] field:0:optional DaysAgo
		// [i] field:0:optional Status
		// [i] field:0:optional ProcessingStatus
		// [i] field:0:optional PartnerID
		// [i] field:0:optional SenderID
		// [i] field:0:optional ReceiverID
		// [i] field:0:optional NativeDocID
		// [i] field:0:optional ConversationID
		// [i] field:0:optional DocType
		// [i] field:0:optional DocTypeName
		// [i] field:0:required SortBy {"TypeName","DocTimestamp","SenderCorp","ReceiverCorp"}
		// [i] field:0:optional MaxReturned
		// [o] record:1:required Docs
		// [o] - field:0:required DocID
		// [o] - field:0:required DocTimestamp
		// [o] - field:0:required TypeName
		// [o] - field:0:required SenderCorp
		// [o] - field:0:required SenderUnit
		// [o] - field:0:required ReceiverCorp
		// [o] - field:0:required ReceiverUnit
		// [o] - field:0:required SenderName
		// [o] - field:0:required ReceiverName
		// [o] - field:0:required RoutingStatus
		// [o] - field:0:required UserStatus
		// [o] - field:0:required ConversationID
		// [o] record:1:required toDocs
		// [o] - field:0:required DocID
		// [o] - field:0:required DocTimestamp
		// [o] - field:0:required TypeName
		// [o] - field:0:required SenderCorp
		// [o] - field:0:required SenderName
		// [o] - field:0:required ReceiverCorp
		// [o] - field:0:required ReceiverName
		// [o] - field:0:required RoutingStatus
		// [o] record:1:required fromDocs
		// [o] - field:0:required DocID
		// [o] - field:0:required DocTimestamp
		// [o] - field:0:required TypeName
		// [o] - field:0:required SenderCorp
		// [o] - field:0:required SenderName
		// [o] - field:0:required ReceiverCorp
		// [o] - field:0:required ReceiverName
		// [o] - field:0:required RoutingStatus
		// [o] object:0:required NumDocs
		// [o] object:0:required NumSent
		// [o] object:0:required NumReceived
		
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	Restriction = IDataUtil.getString( pipelineCursor, "Restriction" );
			String	ToDate = IDataUtil.getString( pipelineCursor, "ToDate" );
			String	FromDate = IDataUtil.getString( pipelineCursor, "FromDate" );
			String	DaysAgo = IDataUtil.getString( pipelineCursor, "DaysAgo" );
			String	Status = IDataUtil.getString( pipelineCursor, "Status" );
			String	ProcessingStatus = IDataUtil.getString( pipelineCursor, "ProcessingStatus" );
			String	PartnerID = IDataUtil.getString( pipelineCursor, "PartnerID" );
			String	SenderID = IDataUtil.getString( pipelineCursor, "SenderID" );
			String	ReceiverID = IDataUtil.getString( pipelineCursor, "ReceiverID" );
			String	NativeDocID = IDataUtil.getString( pipelineCursor, "NativeDocID" );
			String	ConversationID = IDataUtil.getString( pipelineCursor, "ConversationID" );
			String	DocType = IDataUtil.getString( pipelineCursor, "DocType" );
			String	DocTypeName = IDataUtil.getString( pipelineCursor, "DocTypeName" );
			String	SortBy = IDataUtil.getString( pipelineCursor, "SortBy" );
			String	MaxReturned = IDataUtil.getString( pipelineCursor, "MaxReturned" );
		
		            int max_returned = 100;
		            if (pipelineCursor.first("MaxReturned"))
		                max_returned = IDataUtil.getInt(pipelineCursor, 100);
		
		pipelineCursor.destroy();
		
		IData[]	Docs = null;
		
		// Build SQL here
		String sql = "SELECT ";
		sql += "d.DocID, d.DocTimestamp, t.TypeName, s.CorporationName AS SenderCorp, ";
		sql += "s.OrgUnitName AS SenderUnit, r.CorporationName AS ReceiverCorp, ";
		sql += "r.OrgUnitName AS ReceiverUnit, d.RoutingStatus, d.UserStatus, d.ConversationID ";
		sql += "FROM BizDocTypeDef t, Partner s, Partner r, ARCHIVE_BizDoc d ";
		sql += "WHERE d.DocTypeID = t.TypeID AND d.SenderID = s.PartnerID AND d.ReceiverID = r.PartnerID ";
		
		if (SenderID != null && SenderID.length() > 0)
			sql += "AND d.SenderID = '" + SenderID + "' ";
		if (ReceiverID != null && ReceiverID.length() > 0)
			sql += "AND d.ReceiverID = '" + ReceiverID + "' ";
		if (FromDate != null && FromDate.length() > 0)
			sql += "AND d.DocTimestamp >= TO_DATE('" + FromDate + "','YYYY-MM-DD HH24:MI:SS') ";
		
		if (ToDate != null && ToDate.length() > 0)
			sql += "AND d.DocTimestamp <= TO_DATE('" + ToDate + "','YYYY-MM-DD HH24:MI:SS') ";
		
		sql += "ORDER BY " + getSortByValue(SortBy) + " DESC";
		//sql += "ORDER BY d.DocTimestamp DESC";
		String num_docs = "0";
		try
		{
			int data_size = 0;
			ArrayList al = query(sql);
			if (al != null)
			{
			    data_size = al.size();
			    if (data_size > max_returned)
				data_size = max_returned;		
		
			    Docs = new IData[data_size];
			    for (int i = 0; i < data_size; i++)
			    {
				IData doc_data = (IData)al.get(i); 
		
				// Set Docs records data
				Docs[i] = IDataFactory.create();
				IDataCursor DocsCursor = Docs[i].getCursor();
				IDataUtil.put( DocsCursor, "DocID", getDataValue(doc_data,"DOCID") );
				IDataUtil.put( DocsCursor, "DocTimestamp", getDataValue(doc_data,"DOCTIMESTAMP") );
			
				String sender_corpName = getDataValue(doc_data,"SENDERCORP");
				String sender_unitName = getDataValue(doc_data,"SENDERUNIT");
				String receiv_corpName = getDataValue(doc_data,"RECEIVERCORP");
				String receiv_unitName = getDataValue(doc_data,"RECEIVERUNIT");
				IDataUtil.put( DocsCursor, "TypeName", getDataValue(doc_data,"TYPENAME") );
				IDataUtil.put( DocsCursor, "SenderCorp", sender_corpName);
				IDataUtil.put( DocsCursor, "SenderUnit", sender_unitName);
				IDataUtil.put( DocsCursor, "ReceiverCorp", receiv_corpName );
				IDataUtil.put( DocsCursor, "ReceiverUnit", receiv_unitName );
				IDataUtil.put( DocsCursor, "SenderName", getPartnerDisplayName(sender_corpName, sender_unitName) );
				IDataUtil.put( DocsCursor, "ReceiverName", getPartnerDisplayName(receiv_corpName, receiv_unitName) );
				IDataUtil.put( DocsCursor, "RoutingStatus", getDataValue(doc_data,"ROUTINGSTATUS") );
				IDataUtil.put( DocsCursor, "UserStatus", getDataValue(doc_data,"USERSTATUS") );
				IDataUtil.put( DocsCursor, "NativeID", getDataValue(doc_data,"NATIVEID") );
				IDataUtil.put( DocsCursor, "GroupID", getDataValue(doc_data,"GROUPID") );
				IDataUtil.put( DocsCursor, "ConversationID", getDataValue(doc_data,"CONVERSATIONID") );
				DocsCursor.destroy();
			    }
			    num_docs = Integer.toString(data_size);
			}	
		}
		catch(Exception e)
		{
			throw new ServiceException(e);
		} 
		
		// pipeline
		IDataCursor pipelineCursor1 = pipeline.getCursor();
		
		// Docs
		IDataUtil.put( pipelineCursor1, "Docs", Docs );
		IDataUtil.put( pipelineCursor1, "NumDocs", num_docs );
		IDataUtil.put( pipelineCursor1, "MaxReturned", String.valueOf(max_returned));
		
		IDataUtil.put( pipelineCursor1, "groupDocCount", "0" );
		IDataUtil.put( pipelineCursor1, "relatedDocCount", "0" );
		pipelineCursor1.destroy();
		
		// --- <<IS-END>> ---

                
	}



	public static final void getEvents (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getEvents)>> ---
		// @subtype unknown
		// @sigtype java 3.5
		// [i] field:0:required internalId
		// [i] field:0:optional errorsOnly {"false","true"}
		// [o] field:0:required eventCount
		// [o] field:0:required errorCount
		
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	internalId = IDataUtil.getString( pipelineCursor, "internalId" );
			String	errorsOnly = IDataUtil.getString( pipelineCursor, "errorsOnly" );
		pipelineCursor.destroy();
		
		String sql = "SELECT * from ARCHIVE_ACTIVITYLOG WHERE RELATEDDOCID = '" + internalId + "'";
		try
		{
			ArrayList al = query(sql);
			if (al != null)
			{
			    // events
			    IData[] events = new IData[al.size()];
			    for (int i=0; i < al.size(); i++)
			    {
				IData er = (IData)al.get(i);
				events[i] = IDataFactory.create();
				IDataCursor eventsCursor = events[i].getCursor();
				IDataUtil.put( eventsCursor, "EntryTimestamp", getDataValue(er,"ENTRYTIMESTAMP") );
				IDataUtil.put( eventsCursor, "EntryType", getDataValue(er,"ENTRYTYPE") );
				IDataUtil.put( eventsCursor, "EntryClass", getDataValue(er,"ENTRYCLASS") );
				IDataUtil.put( eventsCursor, "BriefMessage", getDataValue(er,"BRIEFMESSAGE") );
				IDataUtil.put( eventsCursor, "FullMessage", getDataValue(er,"FULLMESSAGE") );
				IDataUtil.put( eventsCursor, "RelatedDocID", getDataValue(er,"RELATEDDOCID") );
				IDataUtil.put( eventsCursor, "RelatedPartnerID", getDataValue(er,"RELATEDPARTNERID") );
				IDataUtil.put( eventsCursor, "RelatedConversationID", getDataValue(er,"RELATEDCONVERSATIONID") );
				IDataUtil.put( eventsCursor, "RelatedStepID", getDataValue(er,"RELATEDSTEPID") );
				IDataUtil.put( eventsCursor, "B2BUser", getDataValue(er,"B2BUSER") );
				eventsCursor.destroy();
			    }
				// pipeline
				IDataCursor pipelineCursor_1 = pipeline.getCursor();
				IDataUtil.put( pipelineCursor_1, "eventCount", Integer.toString(al.size()) );
				IDataUtil.put( pipelineCursor_1, "errorCount", "0" );
				IDataUtil.put( pipelineCursor_1, "events", events );
				pipelineCursor_1.destroy();
			}
		}
		catch(Exception e)
		{
			throw new ServiceException(e);
		}
		// --- <<IS-END>> ---

                
	}



	public static final void getQueryRestriction (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getQueryRestriction)>> ---
		// @subtype unknown
		// @sigtype java 3.5
		// [i] field:0:required docid
		// [o] field:0:required senderDisplayName
		// [o] field:0:required receiverDisplayName
		// [o] field:0:required senderB2BName
		// [o] field:0:required receiverB2BName
		// [o] field:0:required isAllowed
		IDataCursor idatacursor = null;
		String docid = null;
		try
		{
			idatacursor = pipeline.getCursor();
		        String user_name = Service.getUser().getName();
		        Vector vector = Service.getUser().membershipNames();
		        String sender_display_name = null;
		        String receiver_display_name = null;
		        String sender_ext_id = null;
		        String receiver_ext_id = null;
		        
			if(idatacursor.first("docid"))
		           docid = (String)idatacursor.getValue();
		        else
		           throw new ServiceException(SystemLog2.format("TRNSERV.000018.000001", "docid"));
		        if(docid == null || docid.length() == 0)
		           throw new ServiceException(SystemLog2.format("TRNSERV.000018.000018", "docid"));
		 /*
		        idatacursor.insertAfter("internalId", docid);
		        idatacursor.insertAfter("getContent", "true");
		        Service.doInvoke("wm.tn.doc", "view", pipeline);
		
		        BizDocEnvelope bizdocenvelope = null;
		        if(idatacursor.first("bizdoc"))
		        {
		*/
			String sql = "SELECT * FROM ARCHIVE_BIZDOC WHERE DOCID='" + docid + "'";
		
			ArrayList al = query(sql);
			if (al != null)
			{
		           ProfileStore profilestore = ProfileStore.getProfileStore();
			   	
		           // bizdocenvelope = (BizDocEnvelope)idatacursor.getValue();
		
			   IData bizdoc_data = (IData)al.get(0);
		           String sender_id = getDataValue(bizdoc_data, "SENDERID"); //"us6gkg000211bvup0000000a"; //bizdocenvelope.getSenderId();
		           sender_display_name = profilestore.getProfileSummary(sender_id).getDisplayName();
		           sender_ext_id = profilestore.getRequiredExternalID(sender_id);
		
		           String receiver_id = getDataValue(bizdoc_data, "RECEIVERID"); //"us6gkg000211mbgd0000000h"; //bizdocenvelope.getReceiverId();
		           receiver_display_name = profilestore.getProfileSummary(receiver_id).getDisplayName();
		           receiver_ext_id = profilestore.getRequiredExternalID(receiver_id);
		        }
		
		       // if (bizdocenvelope == null)
		       //     throw EXMLException.fromResource("TRNSERV.000018.000067", new String[] {docid}, null);
		 
		        idatacursor.insertAfter("senderDisplayName", sender_display_name);
		        idatacursor.insertAfter("receiverDisplayName", receiver_display_name);
		        idatacursor.insertAfter("senderB2BName", sender_ext_id);
		        idatacursor.insertAfter("receiverB2BName", receiver_ext_id);
		        if(vector.contains("TNAdministrators"))
		           idatacursor.insertAfter("isAllowed", "true");
		        else if (vector.contains("TNPartners"))
		        {
		                if(I18NUtil.isEqual(user_name, sender_ext_id) || I18NUtil.isEqual(user_name, receiver_ext_id))
		                    idatacursor.insertAfter("isAllowed", "true");
		                else
		                    idatacursor.insertAfter("isAllowed", "false");
		        } 
			else
		        {
		                throw new ServiceException(SystemLog2.format("TRNSERV.000018.000051"));
		        }
		}
		catch(Throwable throwable)
		{
		      throw EXMLException.fromResource("TRNSERV.000018.000025", new String[] {docid}, throwable);
		}
		finally
		{
		      if(idatacursor != null)
		         idatacursor.destroy();
		}
		// --- <<IS-END>> ---

                
	}



	public static final void printQry (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(printQry)>> ---
		// @subtype unknown
		// @sigtype java 3.5
		// [i] object:0:required query
		// [o] field:0:required sql
		
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			ComplexDocQuery query = (ComplexDocQuery)IDataUtil.get( pipelineCursor, "query" );
		pipelineCursor.destroy();
		String sql = null;
		String temp = query.toSql(false);
		sql = temp.replaceAll("BizDoc d","ARCHIVE_BizDoc d");
		System.out.println("### SQL - "+sql);
		
		// pipeline
		IDataCursor pipelineCursor1 = pipeline.getCursor();
		IDataUtil.put( pipelineCursor1, "sql", sql );
		pipelineCursor1.destroy();
		// --- <<IS-END>> ---

                
	}



	public static final void updQry (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(updQry)>> ---
		// @subtype unknown
		// @sigtype java 3.5
		// [i] object:0:required query
		// [o] field:0:required sql
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			ComplexDocQuery query = (ComplexDocQuery)IDataUtil.get( pipelineCursor, "query" );
		pipelineCursor.destroy();
		
		String sql = null;
		String temp = query.toSql(false);
		sql = temp.replaceAll("BizDoc d","ARCHIVE_BizDoc d");
		
		// pipeline
		IDataCursor pipelineCursor1 = pipeline.getCursor();
		IDataUtil.put( pipelineCursor1, "sql", sql );
		pipelineCursor1.destroy();
		// --- <<IS-END>> ---

                
	}

	// --- <<IS-START-SHARED>> ---
	private static Hashtable partner = null;
	private static Hashtable doctype = null;
	
	private static ArrayList query(String qry) throws Exception
	{
		Connection conn = null;
		ArrayList al = null;
		try
		{
	        if (qry != null)
	        {	    	
	            conn = Datastore.getConnection();
	            Statement stmt = conn.createStatement();
	            //System.err.println(qry);
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
	      		
					//System.out.println("#### count - "+Integer.toString(cnt));
					al = new ArrayList();
			
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
					    		strValue = new String(b_cont,"Shift_JIS");
							}
							else
	          					strValue = set.getString(i);
					
							IDataUtil.put( idc, strName, strValue );
	          				//System.out.println(strName + " = " + strValue);
	        			}		
						idc.destroy();
						al.add(res);
					}
	                set.close();
	            } 
		    	else
	            {
	                System.err.println("Update count: " + stmt.getUpdateCount());
	            }
	            //System.err.println("Query took " + (end - start) + " ms");
	            stmt.close();
	            //conn.close();
	        }
	        Datastore.releaseConnection(conn);
		}
		catch (Exception e)
		{
			Datastore.releaseConnection(conn);
	 		throw new Exception(e); 
		}
	
	return al;
	}
	private static void setDataValue(IData id, String name, String val)
	{
		IDataCursor idc = id.getCursor();
		IDataUtil.put(idc, name, val);
		idc.destroy();
	}
	
	private static String getDataValue(IData id, String name)
	{
		IDataCursor idc = id.getCursor();
		String str =  IDataUtil.getString(idc,name);
		idc.destroy();
		return str;
	}
	/**
	 * return partner display name
	 */
	private static String getPartnerDisplayName(String corpName, String unitName) throws Exception
	{
		String displayName = null;
		IData in = IDataFactory.create();
		IDataCursor idc = in.getCursor();
		IDataUtil.put( idc, "corpName", corpName);
		IDataUtil.put( idc, "unitName", unitName);
		idc.destroy();
		IData out = Service.doInvoke("wm.tnweb.helper","getPartnerDisplayName",in);
		if (out != null)
		{	
			idc = out.getCursor();
			displayName = IDataUtil.getString( idc, "displayName" );
			idc.destroy();
		}
		return displayName;
	}
	
	private static String getSortByValue(String in)
	{
		String res = "d.DocTimestamp";
		if (in == null)
			return res;
		if (in.equals("SenderID"))
		    res = "SenderCorp";
		if (in.equals("DocTypeID"))
			res = "t.TypeName";
		if (in.equals("ReceiverID"))
			res = "ReceiverCorp";
	
		return res;
	}
	// --- <<IS-END-SHARED>> ---
}

