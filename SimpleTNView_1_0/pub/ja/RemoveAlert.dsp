<html>

<head>
	<title>Remove Alert</title>
	<LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
</head>

<body>
	<TABLE WIDTH="100%">
		<TR>
			<TD class="menusection-Adapters" colspan=2>Alerts &gt; Remove </TD>
		</TR>

		<tr>
			<td>

%invoke wm.tnweb.alerts:removeAlert% 
<br><br>
<p>Your alert has %ifvar result equals('false')% not%end%  been removed %ifvar result equals('true')% successfully %end%.  Note, this only removes the alert from your web browser.  It did not result in any alteration to the current state of the document or partner.</p>
 %onerror%
<P><FONT COLOR="#FF0000">The Server could not process your request
because the following error occurred. Contact your server
administrator.</FONT></P>
<TABLE WIDTH="30%" BORDER="1">
<TR><TD><B>Service</B></TD><TD>%value errorService%</TD></TR>
<TR><TD><B>Error</B></TD><TD>%value error% &nbsp; %value errorMessage%</TD></TR>
<TR><TD><B>Error Inputs</B></TD><TD>%value errorInputs% &nbsp;  </TD></TR>
<TR><TD><B>Error Outputs</B></TD><TD>%value errorOutputs% &nbsp; </TD></TR> 
</TABLE>
%endinvoke%
			</td>
		</tr>
	</table>
</body>

</html>
