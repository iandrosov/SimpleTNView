<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Expires" content="-1">
		<title>Web Manager Configurations - Group Detail</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
		<base target="_self">
		<script language="JavaScript">


			function setDisplayData()
			{
				//alert( "1. groupNameToConfig = %value group%" );
			%ifvar profileSet%
				%invoke wm.tnweb.configFlow:setGroupConfig%
					alert( "%value /group% configuration has been updated");
					//alert( "1.5. /group = %value /group%" );
					parent.contents.location.reload();
				%endinvoke%
			%endif%


				//alert( "in setDisplayData()" );
				//alert( "2. group = %value group%" );
				%invoke wm.tnweb.configFlow:displayUserConfig%
				%scope settings%
				//alert( "inside invoke displayUserConfig" );

					%ifvar custom%
					%loop custom%
						document.dataForm.%value Caption%.checked = true;
					%endloop%
					%endif custom%

					%ifvar docSubmission equals('true')%
						document.dataForm.docSubmissionSet.checked = true;
					%endif%

					%ifvar profileView equals('true')%
						document.dataForm.profileSet.checked = true;
					%endif%

					%ifvar docSearch equals('true')%
						document.dataForm.docSearchSet.checked = true;
					%endif%

					%ifvar taskQuery equals('true')%
						document.dataForm.taskQuerySet.checked = true;
					%endif%

				//alert( "SET dataform HIDDEN DATA" );
				document.saveForm.group.value = "%value ../group%";
				//alert( "after set group" );
				document.saveForm.groupNameToConfig.value = "%value ../group%";
				//alert( "after set groupNameToConfig" );
				//alert( "group = " + document.saveForm.group.value );
				//alert( "groupNameToConfig = " + document.saveForm.groupNameToConfig.value );

				%endscope settings%
				%endinvoke displayUserConfig%
			}

			function setConfigData() 
			{
				
				//alert( "1. in setConfigData()" );
				%invoke wm.tnweb.configFlow:getAllCaptions%
					%ifvar allCustomPages%
						%loop allCustomPages%
							//alert( "2. before if" );
							if( document.dataForm.%value allCustomPages%.checked ) {
								//alert( "3. checked" );
								document.saveForm.%value allCustomPages%.value = true;
								//alert( "4. after checked" );
							} else {
								//alert( "3. not checked" );
								document.saveForm.%value allCustomPages%.value = false;
								//alert( "4. after not checked" );
							}
							//alert( "5. %value allCustomPages% is " + document.saveForm.%value allCustomPages%.value );
						%endloop%
					%endif allCustomPages%
				%endinvoke%

				if( document.dataForm.docSubmissionSet.checked ) {
					document.saveForm.docSubmissionSet.value = true;
				} else {
					document.saveForm.docSubmissionSet.value = false;
				}
				if( document.dataForm.profileSet.checked ) {
					document.saveForm.profileSet.value = true;
				} else {
					document.saveForm.profileSet.value = false;
				}
				//alert( "6. profileSet is " + document.saveForm.profileSet.value ); 

				if( document.dataForm.docSearchSet.checked ) {
					document.saveForm.docSearchSet.value = true;
					//alert( "allow doc search" );
				} else {
					document.saveForm.docSearchSet.value = false;
					//alert( "donot allow doc search" );
				}

				if( document.dataForm.taskQuerySet.checked ) {
					document.saveForm.taskQuerySet.value = true;
				} else {
					document.saveForm.docSubmissionSet.value = false;
				}
			}

			function submitGroupConfig()
			{
				setConfigData();
				//alert( "13. after setData, submit now" );
				document.saveForm.submit();
			}

		</script>
	</head>

	<body class="main" onLoad="setDisplayData();">

		<!-- Page Title -->
		<table width="100%">
			<tr>
				<td class="menusection-Server" colspan=2>Web Manager &gt; 
																								Configuration &gt; 
																								Group &gt; 
																								%value group% &nbsp;</td>
			</tr>


			<tr>
				<td valign="top">
					<ul>
						<li><a href="config-general.dsp">Return to Configuration</a></li>
						<li><a href="config-groups.dsp">Return to Group Configuration</a></li>
					</ul>
				</td>
			</tr>


			<tr>
				<td>
					<table width="100%">
	
						<!-- table title -->
						<tr>
							<td class="heading" colspan=2>Customize configuration for group %value group%
							</td>
						</tr>

						<tr>
							<td nowrap class="oddcol">Access</td>
							<td nowrap class="oddcol">Permission</td>
						</tr>

						<!-- User Config row -->
						<tr>
							<td nowrap class="evenrow">
								Setting
							</td>
							<td nowrap class="evencol-l">&nbsp;&nbsp;
								%value group%
							</td>
						</tr>
	
						<form name="dataForm">
						<!-- Document Submission -->
						<tr>
							<td nowrap class="oddrow">Document Submission</td>
							<td nowrap class="oddcol-l">&nbsp;&nbsp;
								<input type="checkbox" name="docSubmissionSet">&nbsp;&nbsp; Allow document submission
							</td>
						</tr>
	
						<!-- Profile Viewer -->
						<tr>
							<td nowrap class="evenrow">Profile Viewer</td>
							<td nowrap class="evencol-l">&nbsp;&nbsp;
								<input type="checkbox" name="profileSet">&nbsp;&nbsp; Allow view of profiles
							</td>
						</tr>
	
						<!-- Doc Search -->
						<tr>
							<td nowrap class="oddrow">Transaction Analysis</td>
							<td nowrap class="oddcol-l">
								&nbsp;&nbsp;
								<input type="checkbox" name="docSearchSet">&nbsp;&nbsp; Allow transaction analysis<BR>
							</td>
						</tr>

						<!-- Task Query -->
						<tr>
							<td nowrap class="evenrow">Task Analysis</td>
							<td nowrap class="evencol-l">&nbsp;&nbsp;
								<input type="checkbox" name="taskQuerySet">&nbsp;&nbsp; Allow task analysis
							</td>
						</tr>
	

						<!-- Custom Pages -->
						<tr>
							<td nowrap class="oddrow">Custom Pages</td>
							<td nowrap class="oddcol-l">
						%invoke wm.tnweb.configFlow:getAllCaptions%
						%ifvar allCustomPages%
							%loop allCustomPages%&nbsp;&nbsp;
								<input type="checkbox" name="%value allCustomPages%">&nbsp;&nbsp;
								%value allCustomPages% %loopsep <BR>%
							%endloop%
						%else%
							&nbsp;&nbsp;&nbsp;No Available Custom Pages
						%endif allCustomPages%
						%endinvoke%
							</td>
						</tr>
	
						</form>
						
						<form name="saveForm" action="config-groupDetail.dsp" method="post">
						<tr>
							<td colspan=2 class="action" align="center" width="100%">
								<input type="submit" onClick="submitGroupConfig();"  value="Save Changes" name="save">
							</td>
							<!--- hidden inputs --->
							%invoke wm.tnweb.configFlow:getAllCaptions%
							%ifvar allCustomPages%
								%loop allCustomPages%&nbsp;&nbsp;
									<input type="hidden" name="%value allCustomPages%">
									%value Caption% %loopsep <BR>%
								%endloop%
							%endif allCustomPages%
							%endinvoke%

							<input type="hidden" name="docSubmissionSet">
							<input type="hidden" name="profileSet">
							<input type="hidden" name="docSearchSet">
							<input type="hidden" name="taskQuerySet">
							<input type="hidden" name="group">
							<input type="hidden" name="groupNameToConfig">
						</tr>
						</form>

					</table>
				</td>
			</tr>
	
		</table>
	</body>
</html>
