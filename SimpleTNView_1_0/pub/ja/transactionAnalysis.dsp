<html>

	<head>
		<title>TNドキュメント検索</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
		<script language="JavaScript">

			function setDocTypeName() 
			{
				for( var i1 = 0 ; i1 < document.SearchForm.DocType.length; i1++ ) {
					if( document.SearchForm.DocType.options[i1].selected == true ) {
						document.SearchForm.DocTypeName.value = document.SearchForm.DocType.options[i1].text;
					}
				}
			}
			function setSenderName() 
			{
				for( var i2 = 0 ; i2 < document.SearchForm.SenderID.length; i2++ ) {
					if( document.SearchForm.SenderID.options[i2].selected == true ) {
						document.SearchForm.SenderName.value = document.SearchForm.SenderID.options[i2].text;
					}
				}
			}
			function setReceiverName() 
			{
				for( var i3 = 0 ; i3 < document.SearchForm.ReceiverID.length; i3++ ) {
					if( document.SearchForm.ReceiverID.options[i3].selected == true ) {
						document.SearchForm.ReceiverName.value = document.SearchForm.ReceiverID.options[i3].text;
					}
				}
			}

			function setSortCriteria() 
			{
				for( var i4 = 0 ; i4 < document.SearchForm.SortBy.length; i4++ ) {
					if( document.SearchForm.SortBy.options[i4].selected == true ) {
						document.SearchForm.SortCriteria.value = document.SearchForm.SortBy.options[i4].text;
					}
				}
			}
			
			var today = new Date();
			var	thisMonth = today.getMonth(); 
			var thisYear = today.getFullYear();
			var thisDate = today.getDate();
			var thisHour = today.getHours();
			var thisMinute = today.getMinutes();
			var thisSecond = today.getSeconds();
			var thisRealMonth = thisMonth+1;
			if( thisRealMonth < 10 ) {
				thisRealMonth = "0" + thisRealMonth;
			}
			if( thisDate < 10 ) {
				thisDate = "0" + thisDate;
			}
			if( thisHour < 10 ) {
				thisHour = "0" + thisHour;
			}
			if( thisMinute < 10 ) {
				thisMinute = "0" + thisMinute;
			}
			if( thisSecond < 10 ) {
				thisSecond = "0" + thisSecond;
			}
			var timeNow = thisYear+"-"+thisRealMonth+"-"+thisDate+" "+thisHour+":"+thisMinute+":"+thisSecond;
			//alert( "time now is "+timeNow );

			function openCalendar( which ) 
			{
				window.open( "calendar.dsp?month="+thisMonth+"&year="+thisYear+"&date="+thisDate+"&which="+escape(which), "calendar", "width=600,height=350,resizable=yes" );
			}

			function checkDate( from, to ) 
			{
				date1 = parseDate( from );
				if( date1 == null || date1 == "NaN" ) {
					return -1;
				}
				date2 = parseDate( to );
				if( date2 == null || date2 == "NaN" ) {
					return -1;
				}
				if( date2 - date1 <= 0 ) {
					alert( "Invalid date range: To Date (" + to + ") must be after From Date (" + from + ")\n" +
						"Please re-enter." );
					return -1;
				}
				return 0;
			}
			
			function parseDate( d ) 
			{
				i = d.indexOf( " " );
				if( i == -1 ) { return null; }
			
				d1 = d.substring( 0, i );
				i = d.lastIndexOf( " " );
				d2 = d.substring( i+1, d.length );
				ymd = d1.split( "-" );
				hms = d2.split( ":" );
				if( ymd.length!=3 || hms.length!=3 || ymd[0]=="" || ymd[1]=="" ||
					ymd[2]=="" || hms[0]=="" || hms[1]=="" || hms[2]=="" ||
					ymd[1]>12 || ymd[2]>31 ||
					hms[0]<0 || hms[0]>59 || 
					hms[1]<0 || hms[1]>59 || 
					hms[2]<0 || hms[2]>59 ) 
				{
					return null;
				}
				//alert("y: (" + ymd[0] + ")");
				//alert("m: (" + ymd[1] + ")");
				//alert("d: (" + ymd[2] + ")");
				//alert("h: (" + hms[0] + ")");
				//alert("m: (" + hms[1] + ")");
				//alert("s: (" + hms[2] + ")");
			
				dt = new Date(ymd[0], ymd[1], ymd[2], hms[0], hms[1], hms[2]);
				return dt;
			}

function clearForm()
{
	document.SearchForm.FromDate.value = "";
	document.SearchForm.ToDate.value = "";
	document.SearchForm.msn.value = "";
	document.SearchForm.reservation_number.value = "";
	document.SearchForm.record_number.value = "";
	document.SearchForm.MaxReturned.value = "100";
	document.SearchForm.SortBy.selectedIndex = 0;
	document.SearchForm.status.value = "";
}

			function submitQuery()
			{
				// check if valid date
				if( document.SearchForm.FromDate.value != "" ) {
					fromDate = parseDate( document.SearchForm.FromDate.value );
					if( fromDate == null || fromDate == "NaN" ) {
						alert( "Invalid From Date: " + document.SearchForm.FromDate.value );
						return false;
					}
				}
				if( document.SearchForm.ToDate.value != "" ) {
					toDate = parseDate( document.SearchForm.ToDate.value );
					if( toDate == null || toDate == "NaN" ) {
						alert( "Invalid To Date: " + document.SearchForm.ToDate.value );
						return false;
					}
				}
					
				// populate to/from date if not both defined
				if( document.SearchForm.FromDate.value != "" && document.SearchForm.ToDate.value == "" ) {
					if( !confirm( "Would you like to set To Date to \"" + timeNow +"\"?")) {
						return false;
					} else {
						document.SearchForm.ToDate.value = timeNow;
					}
				} else if( document.SearchForm.ToDate.value != "" && document.SearchForm.FromDate.value == "" ) {
					if( !confirm( "Would you like to set From Date to \"1970-01-01 00:00:00\"?") ) {
						return false;
					} else {
						document.SearchForm.FromDate.value = "1970-01-01 00:00:00";	
					}
				}

				var start = document.SearchForm.FromDate.value;
				var end = document.SearchForm.ToDate.value;
				if( start != "" || end != "" )
				{
					// check if valid date range
					status = checkDate( document.SearchForm.FromDate.value, document.SearchForm.ToDate.value );
					if( status == -1 ) {
						return false;
					}	 
				}
				setSortCriteria();

				//document.SearchForm.target = "parent.main";
				document.SearchForm.submit();
			}

		</script>
	</head>

	<body >
		<table width=100% >
			<tr>
				<td class="heading" colspan="2">MNP データ検索
				</td>
			</tr>
			<tr>
				<td class="menusection-Logs" colspan=2>TNドキュメント検索&nbsp;</td>
			</tr>

<td class="evenrow-l"><a href="archive_transactionAnalysis.dsp">アーカイブデータの検索</a> &nbsp;</td>

			<!--- Search Criteria --->
			<tr>
				<td>
					<table>
						<tr>
							<td class="heading" colspan="2">Set search criteria
							</td>
						</tr>
			<form name="SearchForm" method="post" action="ViewDocs.dsp?search=true" target="main">
				<input type="hidden" name="search" value="true">
				<input type="hidden" name="SenderName">
				<input type="hidden" name="ReceiverName">
				<input type="hidden" name="DocTypeName">
				<input type="hidden" name="SortCriteria">
							%ifvar Queries%
								<tr> 
									<td class="evenrow" nowrap> Saved Queries </td>
									<td class="evenrow-l">
										<select name="Query" size="1">
											<option name="service" value="" selected></option>
											%loop Queries%
											<option name="service" value="%value name%">%value name%</option>
											%endloop Queries%
										</select> 
									</td>
								</tr>
							%endif Queries% 
								<tr>
									<td class="evenrow">受信日時</td>
									<td class="evenrow-l"><input name="FromDate"><a href="javascript:openCalendar('From Date');">開始日</a>&nbsp;&nbsp;&nbsp;<input name="ToDate"><a href="javascript:openCalendar('To Date');">終了日</a></td>
<!--
									<td class="evenrow-l"><input name="FromDate" onFocus="blur();"><a href="javascript:openCalendar('From Date');">開始日</a></td>
								</tr>
								<tr>
									<td class="evenrow">&nbsp;</td>
									<td class="evenrow-l"><input name="ToDate" onFocus="blur();"><a href="javascript:openCalendar('To Date');">終了日</a></td>
-->
								</tr>

								<tr>
									<td class="evenrow">Processing Status</td>
									<td class="evenrow-l">
										<select name="ProcessingStatus" size="1">
											<option name="pStatus" value="" selected></option>
											<option name="pStatus" value="NEW">NEW</option>
											<option name="pStatus" value="DONE">DONE</option>
											<option name="pStatus" value="ABORTED">ABORTED</option>
											<option name="pStatus" value="DONE W/ ERRORS">DONE W/ ERRORS</option>
											<option name="pStatus" value="POLLABLE">POLLABLE</option>
											<option name="pStatus" value="QUEUED">QUEUED</option>
											<option name="pStatus" value="DELIVERING">DELIVERING</option>
											<option name="pStatus" value="ACCEPTED">ACCEPTED</option>
											<option name="pStatus" value="ACCEPTED W/ ERRORS">ACCEPTED W/ ERRORS</option>
										</select>	
								</tr>
								<tr>
									<td class="evenrow">User Status</td>
									<td class="evenrow-l">
										<select name="Status" size="1">
											<option name="" value="" selected></option>
											%loop ByStatus%
											<option name="%value Status%"  value="%value Status%">%value Status%</option>
											%endloop%
										</select>
									</td>
								</tr>
								<tr>
									<td class="evenrow">Document Type</td>
									<td class="evenrow-l">
										<select name="DocType" size="1" onChange="setDocTypeName();">
											<option name="DocType" value="" selected></option>
											%loop DocType%
											<option name="DocType" value="%value TypeID%">%value TypeName%</option>
											%endloop%
										</select>
									</td>
								</tr>
								%scope ByPartner%
									<tr>
										<td class="evenrow">Sender</td>
										<td class="evenrow-l">
											<select name="SenderID" size="1" onChange="setSenderName();">
												<option name="SenderID" value=""></option>
												%loop profiles%
												%ifvar ProfileID%
												%ifvar OrgUnit -isnull%
												<option name="SenderID" value="%value ProfileID%">%value CorporationName%</option>
												%else%
													%ifvar OrgUnit equals('')%
													<option name="SenderID" value="%value ProfileID%">%value CorporationName%</option>
													%else%
													<option name="SenderID" value="%value ProfileID%">%value CorporationName% (%value OrgUnit%)</option>
													%endif%
												%endif OrgUnit%
												%end if ProfileID%
												%endloop profiles%
											</select>
										</td>
									</tr>
									<tr>
										<td class="evenrow">Receiver</td>
										<td class="evenrow-l">
											<select name="ReceiverID" size="1" onChange="setReceiverName();">
												<option name="ReceiverID" value=""></option>
												%loop profiles%
												%ifvar ProfileID%
												%ifvar OrgUnit -isnull%
												<option name="ReceiverID" value="%value ProfileID%">%value CorporationName%</option>
												%else%
													%ifvar OrgUnit equals('')%
													<option name="ReceiverID" value="%value ProfileID%">%value CorporationName%</option>
													%else%
													<option name="ReceiverID" value="%value ProfileID%">%value CorporationName% (%value OrgUnit%)</option>
													%endif%
												%endif OrgUnit%
												%end ifvar ProfileID%
												%endloop profiles%
											</select>
										</td> 
									</tr> 
								%end scope ByPartner% 
								<tr>
									<td class="evenrow">Document ID</td>
									<td class="evenrow-l"><input name="NativeDocID">
								</tr>
							<tr>
								<td class="evenrow">Conversation ID</td>
								<td class="evenrow-l"><input name="ConversationID">
							</tr>
							<tr>
								<td class="evenrow">並べ替え基準</td>
								<td class="evenrow-l">
									<select name="SortBy"> 
										<option name="SortBy" selected value="DocTimestamp">日付</option>
										<option name="SortBy" value="SenderID">送信者</option>
										<option name="SortBy" value="DocTypeID">ドキュメントタイプ</option>
										<option name="SortBy" value="ReceiverID">受信者</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="evenrow">検索結果の最大表示数</td>
								<td class="evenrow-l"><input name="MaxReturned" size="5" value="100"></td>
							</tr>
					
							<tr>
<td colspan=2 class="action" align="center" width="100%"><input type="button" value="検索" name="search" onclick="submitQuery();" target="main">
<input type="button" value="clear" name="clear" onclick="clearForm();" target="main">
								</td>
							</tr>

							
						</table>
						
						
					</form>
				</td>
			</tr>
		</table>
	
	</body>
</html>
