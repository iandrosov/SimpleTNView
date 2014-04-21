<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Expires" content="-1">
		<title>Web Manager Configurations - User</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
		<base target="_self">
		<script language="JavaScript">
			function submitPartner()
			{
				// omit i=0 place holder
				for( var i = 1; i < document.partnerForm.partnerSelector.length; i++ ) 
				{
					if( document.partnerForm.partnerSelector.options[i].selected == true ) 
					{
						//alert( "var i is " + i );
						document.partnerForm.b2bUserName.value = document.partnerForm.partnerSelector.options[i].value;
						//alert( "selected option value = " + document.partnerForm.partnerSelector.options[i].value );
						//alert( "b2bUserName is " + document.partnerForm.b2bUserName.value );
					}
				}
				document.partnerForm.submit();
			}
		</script>
	</head>

	<body class="main">

		<!-- Page Title -->
		<table width="100%">
			<tr>
				<td class="menusection-Server" colspan=2>Web Manager &gt; Profile Viewer&nbsp;</td>
			</tr>

			<tr>
				<td valign="top">
					<ul>
	%invoke wm.tnweb.helper:getUserRights%
	%ifvar Rights equals('TNPartners')%
							<li><a href="ViewProfile.dsp?whoseProfile=self">View self profile</a></li>
							<li><a href="ViewProfile.dsp?whoseProfile=host">View hub profile</a></li>
							</td></tr>
							%else%
							<li><a href="ViewProfile.dsp?whoseProfile=self">View hub profile</a></li>
					</ul>
				</td>
			</tr>

			%invoke wm.tnweb.configSvc:getTNPartners%
			<tr>
				<td>
					<table>
					<form name="partnerForm" action="ViewProfile.dsp" method="get">
						<tr>
							<td class="heading" colspan=2>Available partners</td>
						</tr>

								%ifvar partners%
								<tr>
									<td class="oddrow">Partner name &nbsp; 
									</td>
									<td class="oddrowdata-l">
										<select name="partnerSelector" width=150> 
											<option value="notSelected"></option>
											%loop partners%
												<option value="%value B2BName%">%value partnerName%</option> 
											%endloop%
										</select>
									</td>
								</tr>
								<tr>
									<td class="action" colspan=2>
										<input type="submit" value="Select" onclick="submitPartner();">
										<input type="hidden" name="whoseProfile" value="other">
										<input type="hidden" name="b2bUserName" value="">
									</td> 
								</tr>
							%else%
								<tr><td class="oddrow" colspan=2>No available partners.</td></tr>
							%endif partners%
					</form>
				</table>
			</td>
		</tr>
		%endinvoke getTNPartner%
	%endif Rights%
	%end invoke getUserRights%
	
		</table>
	</body>
</html>
