<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Expires" content="-1">
		<title>Web Manager Configurations - User Status</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
		<base target="_self">
		<style>
			.listbox  { width: 100%; }
		</style>
		
		<script language="JavaScript">
			%ifvar newStatus%
			%invoke wm.tnweb.configFlow:setSearchableUserStatus%	
				alert( "Searchable user status setting has been updated" );
			%endinvoke%
			%endif%

			function populateLists() 
			{
				var ai = 0;
				%invoke wm.tnweb.configSvc:getAvailableStatus%
					%ifvar availableStatus%
						%loop availableStatus%
							document.statusForm.availableStatus.options[ai] = 
								new Option("%value availableStatus%", "%value availableStatus%"); 
							ai++;
						%endloop%
					%endif%
				%endinvoke%

				var si = 0;
				%invoke wm.tnweb.configFlow:getSelectedStatus%
					%ifvar selectedStatus%
						%loop selectedStatus%
							document.statusForm.selectedStatus.options[si] = 
								new Option("%value selectedStatus%", "%value selectedStatus%"); 
							si++;
						%endloop%
					%endif%
				%endinvoke%
			}

			function moveStatus( fromSelect, toSelect ) 
			{
				// do nothing if no status is selected
				if( fromSelect.selectedIndex < 0 )
					return false;

				// unselect target select list
				toSelect.selectedIndex = -1;

				while( fromSelect.selectedIndex >= 0 )
				{
					var currentIndex = fromSelect.selectedIndex;
					var rightSize = toSelect.length;
					var movingStatus = fromSelect.options[ currentIndex ].text;
					toSelect.options[ rightSize ] = 
						new Option( movingStatus, movingStatus, false, true );
					fromSelect.options[ currentIndex ] = null;
				}
				return;
			}

			function submitStatus()
			{
				var newSelectedSize = document.statusForm.selectedStatus.length;
				var oneBigStatus = "";
				var del = "|~~|";
				for( var a = 0; a < newSelectedSize; a++ ) 
				{
					oneBigStatus += document.statusForm.selectedStatus.options[a].text + del;  		
				}
				//alert( "delim = " + del + "\noneBigSelected = (" + oneBigStatus + ")" );
				document.saveForm.delim.value = del;
				document.saveForm.newStatus.value = oneBigStatus;
				document.saveForm.submit();
			}

			function loadStatusPage() 
			{
				populateLists();
			}
		</script>
	</head>

	<body class="main" onLoad="loadStatusPage();parent.contents.location.reload();">
		<table width=100% >
			<tr>
				<td class="menusection-Server" colspan=2>Web Manager &gt; Configuration &gt; User Status&nbsp;</td>
			</tr>

			<tr>
				<td valign="top">
					<ul>
						<li><a href="config-general.dsp">Return to Configuration</a></li>
					</ul>
				</td>
			</tr>

			<!-- title bar -->
			<tr>
				<td class="heading" colspan=2>Set user status for transaction analysis
				</td>
			</tr>

			<tr>
				<td class="oddrowdata">
					<div align="center">
						<table width="100%">
							<form name="statusForm">
							<tr>
								<td class="grouping-positive" valign="bottom" align="center">
									Available User Status
									<br>
									<select class="listbox" onchange="" size="10" id="availableStatus" name="availableStatus" width="100%" multiple>
										<option></option>
									</select>
								</td>
								<td>
									<table width="100%">
										<tr>
											<td align="center">
												<input onclick="moveStatus(document.statusForm.availableStatus, document.statusForm.selectedStatus);"  type="button" value="-&gt;" name="addToSelect" class="widebuttons" >
											</td>
										</tr>	
										<tr>
											<td align="center">
												<input onclick="moveStatus(document.statusForm.selectedStatus, document.statusForm.availableStatus);;" type="button" value="&lt;-" name="moveLeft" class="widebuttons" >
											</td>
										</tr>	
									</table>
								</td>
								<td class="grouping-neutral" valign="bottom" align="center">
									Selected User Status
									<br>
									<select class="listbox" onchange="" id="selectedStatus" size="10" name="selectedStatus" width="100%" multiple>
										<option></option>
									</select>
								</td>
							</tr>

							</form>
						</table>
					</div>
				</td>
			</tr>

			<tr>
			<form name="saveForm" action="config-userStatus.dsp" method="post">
				<td colspan=2 class="action" align="center" width="100%"><input type="submit" onclick="submitStatus();"  value="Save Changes" name="save">
				<input type="hidden" name="delim">
				<input type="hidden" name="newStatus">
				</td>
			</form>
			</tr>
		</table>
	</body>
</html>
