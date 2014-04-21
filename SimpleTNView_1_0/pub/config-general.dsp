<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Expires" content="-1">
		<title>Web Manager Configurations</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
		<base target="_self">
		<style>
			.listbox  { width: 100%; }
		</style>
		<script src="webMethods.js.txt"></script>
	</head>

	<body class="main" onLoad="">
		<table width=100% >
			<tr>
				<td class="menusection-Server" colspan=2>Web Manager &gt; Configuration&nbsp;</td>
			</tr>
			%invoke wm.tnweb.configFlow:displayCurrentUserConfig%

			<tr><td>&nbsp;</td><tr>

			%ifvar Rights equals('TNAdministrators')%
			<tr>
				<td valign="top">
					<ul>
						<li><a href="config-userStatus.dsp">Set user status for transaction analysis</a></li>
						<li><a href="config-customPages.dsp">Set custom pages</a></li>
						<li><a href="config-tnpartners.dsp?group=TNPartners">Configure Web Manager for partners</a></li>
						<li><a href="config-groups.dsp">Customize configuration for groups</a></li>
						<li><a href="config-users.dsp">Customize configuration for specific users</a></li>
					</ul>
				</td>
			</tr>
		%endif Rights%

		%scope settings%
		<tr>
			<td>
				<table width="100%">

					<!-- title bar -->
					<tr>
						<td class="heading" colspan=2>User Configuration for %value /username%
						</td>
					</tr>

					<!-- table labels --->
					<tr>
						<td nowrap class="oddcol">Access</td>
						<td nowrap class="oddcol">Permission</td>
					</tr>

					<!-- User Config row -->
					<tr>
						<td nowrap class="evenrow">
							Setting
						</td>
						<td nowrap class="evencol-l">&nbsp;&nbsp;&nbsp;&nbsp;
						%scope whichSetting%
							%ifvar type equals('user')%
								User:&nbsp; 
							%endif%
							%ifvar type equals('group')%
								Group:&nbsp;
							%endif%
							%value name%
						%endscope whichSetting%
						</td>
					</tr>

					<!-- Doc Submission -->
					<tr>
						<td nowrap class="oddrow">Document Submission</td>
						<td nowrap class="oddcol-l">&nbsp;&nbsp;&nbsp;&nbsp;
							%ifvar docSubmission equals('true')%
							Document Submission allowed
							%else%
							Document Submission not allowed
							%endif docSubmission%
						</td>
					</tr>

					<!-- Profile Viewer -->
					<tr>
						<td nowrap class="evenrow">Profile Viewer</td>
						<td nowrap class="evencol-l">&nbsp;&nbsp;&nbsp;&nbsp;
							%ifvar profileView equals('true')%
							View of profiles allowed
							%else%
							View of profiles not allowed
							%endif profileView%
						</td>
					</tr>

					<!-- Doc Search -->
					<tr>
						<td nowrap class="oddrow">Transaction Analysis</td>
						<td nowrap class="oddcol-l">&nbsp;&nbsp;&nbsp;&nbsp;
							%ifvar docSearch equals('true')%
							Document Search allowed
							%else%
							Document Search not allowed
							%endif profileView%
						</td>
					</tr>

					<!-- Task Query -->
					<tr>
						<td nowrap class="evenrow">Task Query</td>
						<td nowrap class="evencol-l">&nbsp;&nbsp;&nbsp;&nbsp;
							%ifvar taskQuery equals('true')%
							Task Query allowed
							%else%
							Task Query not allowed
							%endif taskQuery%
						</td>
					</tr>

					<!-- Custom Pages -->
					<tr>
						<td nowrap class="oddrow">Custom Pages</td>
						<td nowrap class="oddcol-l">
					%ifvar custom%
						%loop custom%&nbsp;&nbsp;&nbsp;&nbsp;
							%value Caption%%loopsep <BR>%
						%endloop custom%
					%else%
						&nbsp;&nbsp;&nbsp;&nbsp; Not available
						</td>
					</tr>
					%endif custom%


				</table>
			</td>
		</tr>
		%endscope settings%


		%end invoke%
		</table>
	</body>
</html>
