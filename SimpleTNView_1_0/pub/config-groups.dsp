<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Expires" content="-1">
		<title>Web Manager Configurations - Group</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
		<base target="_self">
		<script language="JavaScript">

			function submitGroup()
			{
				// omit i=0 place holder
				for( var i = 1; i < document.groupForm.groupSelector.length; i++ ) {
					if( document.groupForm.groupSelector.options[i].selected == true ) {
						//alert( "var i is " + i );
						document.groupForm.groupNameToConfig.value = document.groupForm.groupSelector.options[i].value;
						document.groupForm.group.value = document.groupForm.groupSelector.options[i].value;
						//alert( "groupNameToConfig is " + document.groupForm.groupNameToConfig.value );
					}
				}
				document.groupForm.submit();
			}
		</script>
	</head>

	<body class="main">

		<!-- Page Title -->
		<table width="100%">
			<tr>
				<td class="menusection-Server" colspan=2>Web Manager &gt; Configuration &gt; Group &nbsp;</td>
			</tr>

			<tr>
				<td valign="top">
					<ul>
						<li><a href="config-general.dsp">Return to Configuration</a></li>
					</ul>
				</td>
			</tr>

			<tr>
				<td>
					<table>
					<form name="groupForm" action="config-groupDetail.dsp" method="get">
						<tr>
							<td class="heading" colspan=2>Available groups</td>
						</tr>

						%invoke wm.tnweb.configSvc:getTNGroups%
							%ifvar userSpecifiedGroups%
								<tr>
									<td class="oddrow">Group name &nbsp;
									</td>
									<td class="oddrowdata-l">
										<select name="groupSelector" width=150>
											<option value="notSelected"></option>
											%loop userSpecifiedGroups%
												<option value="%value userSpecifiedGroups%">%value userSpecifiedGroups%</option> 
											%endloop%
										</select>
									</td>
								</tr>
								<tr>
									<td class="action" colspan=2>
										<input type="submit" value="Select Group" onclick="submitGroup();">
										<input type="hidden" name="groupNameToConfig">
										<input type="hidden" name="group">
									</td> 
								</tr>
							%else%
								<tr><td class="oddrow" colspan=2>No user specified groups to choose from</td></tr>
							%endif userSpecifiedGroups%
						%endinvoke%
					</form>
				</table>
			</td>
		</tr>
	
		</table>
	</body>
</html>
