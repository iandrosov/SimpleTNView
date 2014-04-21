<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Expires" content="-1">
		<title>Web Manager Configurations - Custom Pages</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
		<base target="_self">
		<style>
			.listbox  { width: 100%; }
		</style>
		
		<script language="JavaScript">
			%ifvar addPages%
				%invoke wm.tnweb.configFlow:setCustomPages%
					%ifvar newPageExists equals('true')%
						alert( "New custom pages have been added");
					%else%
						alert( "No new custom pages added");
					%end ifvar%
				%endinvoke%
			%endif addPages%

			%ifvar allDeletePages%
				%invoke wm.tnweb.configFlow:setCustomPages%
					%ifvar clearAll equals('true')%
						alert( "All custom pages are removed" );
					%else%
						%ifvar deletePageExists equals('true')%
							alert( "Selected custom pages have been removed" );
						%else%
							alert( "No custom pages have been removed" );
						%end ifvar%
					%end ifvar%
				%endinvoke%
			%endif allDeletePages%

			function populateList()
			{
				%invoke wm.tnweb.configFlow:getCustomPages%
					var oi = 0;
					%ifvar pages%
						%loop pages%
							document.removeDataForm.existPages.options[oi] = 
									new Option("%value pages%", "%value pages%")
							oi++;
						%endloop%
					%endif pages%
				%endinvoke%
			}

			function submitAddPages()
			{
				if( document.addDataForm.newDocs.value == null ||
					document.addDataForm.newDocs.value == "" )
				{
					return;
				} else {
					document.addDataForm.addPages.value = document.addDataForm.newDocs.value;
					document.removeDataForm.allDeletePages.value = null;
					document.removeDataForm.removeDelim.value = null;
					document.addDataForm.newPageExists.value="true";
					document.addDataForm.submit();
				}
			}

			function submitRemovePages() 
			{
				var oneL = "";
				var myDelim = "|~~|";
				var existSize = document.removeDataForm.existPages.length;
				var currentPage = 0;
				var ei = 0;
				while( document.removeDataForm.existPages.selectedIndex > -1 )
				{
					if( document.removeDataForm.existPages.options[ei].selected )
					{
						oneL += document.removeDataForm.existPages.options[ei].text + myDelim;		
						document.removeDataForm.existPages.options[ei] = null;
						document.removeDataForm.deletePageExists.value = "true";
					} else {
						ei++;
					}
				}
				document.removeDataForm.removeDelim.value = myDelim;
				document.removeDataForm.allDeletePages.value = oneL;
				document.removeDataForm.submit();
			}
			
			function removeAllPages()
			{
				document.removeDataForm.clearAll.value = "true";
				document.removeDataForm.submit();
			}
		</script>
	</head>

	<body class="main" onLoad="populateList();parent.contents.location.reload();">
		<table width="100%">
			<tr>
				<td class="menusection-Server" colspan=2>Web Manager &gt; Configuration &gt; Custom Pages&nbsp;</td>
			</tr>

			<tr>
				<td valign="top">
					<ul>
						<li><a href="config-general.dsp">Return to Configuration</a></li>
					</ul>
				</td>
			</tr>

			<tr><td><table>
			<!-- title bar -->
			<tr>
				<td class="heading" colspan=2>Add custom pages 
				</td>
			</tr>

			<form name="addDataForm" action="config-customPages.dsp" method="post">
			<tr>
				<td class="oddrowdata">
					<table>
						<tr>
							<td nowrap align="left" class="oddrow-l">
								Specify one custom page per line with no white space.<br>
								Use this format: <i>title</i>;filename<br>
								For example: "CreateOrder;Order.dsp"
							</td>
						</tr>
						<tr>
							<td>
								<textarea style="width:70%;" wrap="off" rows="5" name="newDocs" id="newDocs" cols="50"></textarea>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td colspan=2 class="action" align="center" width="100%"><input type="submit" onclick="submitAddPages();"  value="Add Custom Pages" name="add">
				<input type="hidden" name="addDelim">
				<input type="hidden" name="addPages">
				<input type="hidden" name="newPageExists">
				</td>
			</tr>
			</form>

			<tr><td>&nbsp;</td></tr>

			<!-- title bar -->
			<tr>
				<td class="heading" colspan=2>Remove custom pages 
				</td>
			</tr>

			<form name="removeDataForm" action="config-customPages.dsp" method="post">
			<tr>
				<td class="oddrowdata">
					<table width="100%">
						<tr>
							<td nowrap align="left" class="oddrow-l">
								Select custom pages to delete.
							</td>
						</tr>
						<tr>
							<td width="70%">
								<select class="listbox" onchange="" size="10" id="existPages" name="existPages" width="100%" multiple>
										<option></option>
									</select>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td class="action" align="center" width="100%">
					<input type="submit" onclick="submitRemovePages();"  value="Remove Custom Pages" name="remove">
					<input type="hidden" name="removeDelim">
					<input type="hidden" name="allDeletePages">
					<input type="submit" onclick="removeAllPages();"  value="Clear All Pages" name="clear">
					<input type="hidden" name="clearAll">
					<input type="hidden" name="deletePageExists">
				</td>
			</form>
			</tr>

			</table></td></tr>

		</table>
	</body>
</html>
