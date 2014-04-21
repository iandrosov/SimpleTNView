<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Expires" content="-1">
		<title>Web Manager Configurations - User</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
		<base target="_self">
		<script language="JavaScript">
			function submitUser()
			{
				// omit i=0 place holder
				for( var i = 1; i < document.userForm.userSelector.length; i++ ) {
					if( document.userForm.userSelector.options[i].selected == true ) {
						//alert( "var i is " + i );
						document.userForm.userNameToConfig.value = document.userForm.userSelector.options[i].value;
						document.userForm.user.value = document.userForm.userSelector.options[i].value;
						//alert( "userNameToConfig is " + document.userForm.userNameToConfig.value );
					}
				}
				document.userForm.submit();
			}
		</script>
	</head>

	<body class="main">

		<!-- Page Title -->
		<table width="100%">
			<tr>
				<td class="menusection-Server" colspan=2>Web Manager &gt; Configuration &gt; User &nbsp;</td>
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
					<form name="userForm" action="config-userDetail.dsp" method="get">
						<tr>
							<td class="heading" colspan=2>Available users</td>
						</tr>

						%invoke wm.tnweb.configSvc:getTNUsers%
							%ifvar users%
								<tr>
									<td class="oddrow">User name &nbsp; 
									</td>
									<td class="oddrowdata-l">
										<select name="userSelector" width=150> 
											<option value="notSelected"></option>
											%loop users%
												<option value="%value users%">%value users%</option> 
											%endloop%
										</select>
									</td>
								</tr>
								<tr>
									<td class="action" colspan=2>
										<input type="submit" value="Select User" onclick="submitUser();">
										<input type="hidden" name="userNameToConfig">
										<input type="hidden" name="user">
									</td> 
								</tr>
							%else%
								<tr><td class="oddrow" colspan=2>No Trading Networks users to choose from</td></tr>
							%endif users%
						%endinvoke%
					</form>
				</table>
			</td>
		</tr>
	
		</table>
	</body>
</html>
