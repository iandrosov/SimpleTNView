

	<head>
		<title>Task Analysis</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
		<script language="JavaScript">

			function setPartner() 
			{
				// skip partner not selected, i.e. partnerId empty
				for( var i = 1 ; i < document.SearchForm.partnerId.length; i++ ) {
					if( document.SearchForm.partnerId.options[i].selected == true ) {
						document.SearchForm.partnerName.value = document.SearchForm.partnerId.options[i].text;
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
				document.SearchForm.submit();
			}

			function openCalendar( which ) 
			{
				window.open( "calendar.dsp?month="+thisMonth+"&year="+thisYear+"&date="+thisDate+"&which="+escape(which), "calendar", "width=600,height=350,resizable=yes" );
			}

		</script>
	</head>

	<body >
		<table width=100% >
			<tr>
				<td class="menusection-Logs" colspan=2>Analysis &gt; Tasks&nbsp;</td>
			</tr>

			<tr><td>&nbsp;</td></tr>
			<tr><td>&nbsp;</td></tr>

			<!--- Search Criteria --->
			<tr>
				<td>
					<table>
						<tr>
							<td class="heading" colspan="2">Set search criteria
							</td>
						</tr>

			<form name="SearchForm" method="post" action="taskQueryDetail.dsp" align="left">
				<input type="hidden" name="partnerName" value="">

						<tr>
							<td class="evenrow">Task Created</td>
							<td class="evenrow-l"><input name="FromDate" onFocus="blur();"><a href="javascript:openCalendar('From Date');">From Date</a></td>
						</tr>
						<tr>
							<td class="evenrow">&nbsp;</td>
							<td class="evenrow-l"><input name="ToDate" onFocus="blur();"><a href="javascript:openCalendar('To Date');">To Date</a></td>
						</tr>

						<tr>
							<td class="evenrow">Task Type</td>
							<td class="evenrow-l">
									<select name="taskType">
										<option name="taskType" value="" selected></option>
										<option name="taskType" value="Delivery">Delivery</option>
										<option name="taskType" value="Service execution">Service execution</option>
									</select>
								</td>
						</tr>

						<tr>
							<td class="evenrow">Task Status</td>
							<td class="evenrow-l">
								<select name="taskStatus">
									<option name="taskStatus" value="" selected></option>
									<option name="taskStatus" value="NEW">New</option>
									<option name="taskStatus" value="PENDING">Pending</option>
									<option name="taskStatus" value="DONE">Done</option>
									<option name="taskStatus" value="FAILED">Failed</option>
									<option name="taskStatus" value="STOPPED">Stopped</option>
									<option name="taskStatus" value="QUEUED">Queued</option>
									<option name="taskStatus" value="DELIVERING">Delivering</option>
								</select>
							</td>
						</tr>

						<tr>
							<td class="evenrow">Delivery Method</td>
							<td class="evenrow-l">
								<select name="deliveryMethod" size="1">
									<option name="deliveryMethod" value="" selected></option>
									<option name="deliveryMethod" value="Queue for polling">Queue for polling</option>
									<option name="deliveryMethod" value="Primary E-mail">Primary E-mail</option>
									<option name="deliveryMethod" value="Primary FTP">Primary FTP</option>
									<option name="deliveryMethod" value="Primary HTTP">Primary HTTP</option>
									<option name="deliveryMethod" value="Primary HTTPS">Primary HTTPS</option>
									<option name="deliveryMethod" value="Secondary E-mail">Secondary E-mail</option>
									<option name="deliveryMethod" value="Secondary FTP">Secondary FTP</option>
									<option name="deliveryMethod" value="Secondary HTTP">Secondary HTTP</option>
									<option name="deliveryMethod" value="Secondary HTTPS">Secondary HTTPS</option>
									<option name="deliveryMethod" value="Batch FTP">Batch FTP</option>
								</select>
							</td>
						</tr>

						<tr>
							%invoke wm.tnweb.querySvc:getPartnerNameAndID%
							<td class="evenrow">Receiver</td>
							<td class="evenrow-l">
								<select name="partnerId" size="1" onChange="setPartner();">
									<option name="partnerId" value="" selected></option>
									%loop partners%
									<option name="partnerId" value="%value partnerId%">%value name%</option>
									%endloop profiles%
								</select>
							</td>
							%endinvoke getPartnerNameAndID%
						</tr>

						<tr>
							<td colspan=2 class="action" align="center" width="100%"><input type="button" value="Search" name="search" onclick="submitQuery();">
							</td>
						</tr>
					</table>
					</form>
				</td>
			</tr>
		</table>
	
	</body>
</html>
