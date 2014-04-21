<HTML>
<HEAD>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="Expires" CONTENT="-1">


  <TITLE>Trading Networks Properties Settings</TITLE>
  <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
  <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
</HEAD>

%ifvar mode equals('edit')%
<BODY onLoad="setNavigation('settings-tnProperties.dsp', 'doc/OnlineHelp/WmRoot.htm#CS_Settings_Extended.htm', 'foo');">
%else%
<BODY onLoad="setNavigation('settings-tnProperties.dsp', 'doc/OnlineHelp/WmRoot.htm#CS_Settings_Extended.htm', 'foo');">
%endif%
  <TABLE WIDTH="100%">
    <TR>
      <TD class="menusection-Settings" colspan="4">
        Settings &gt;
        TN Properties </TD>
    </TR>
    <TR>

%ifvar action equals('change')%
  %invoke wm.tnweb.wrapper:setTNProperties%
    %ifvar message%
      <tr><td colspan="4">&nbsp;</td></tr>
      <TR><TD class="message" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message%</TD></TR>
    %endif%
  %endinvoke wm.tnweb.wrapper:setTNProperties%
%endif%

    <TR>
      <TD colspan=2>
        <UL>
          %ifvar mode equals('edit')%
          <LI><A HREF="settings-tnProperties.dsp">Return to TN Properties Settings</A></LI>
          %else%
          <LI><A HREF="settings-tnProperties.dsp?mode=edit">Edit TN Properties Settings</A></LI>
          %endif%
        </UL>
    </TR>
    <TR>
      <TD><IMG SRC="images/blank.gif" height=10 width=10 border=0></TD>
      <TD>
          <FORM action="settings-tnProperties.dsp" method="POST">
          <INPUT type="hidden" name="action" value="change">

        <TABLE class="tableForm" %ifvar mode equals('edit')%width="100%"%endif% >
%invoke wm.tnweb.wrapper:getTNProperties%

          <TR>
            <TD class="heading">TN Properties Settings</TD>
          </TR>

          <TR>
            <TD class="oddcol-l">Key=Value</TD>
          </TR>

          <TR>
            <TD class="evenrow-l">
              %ifvar mode equals('edit')%
              <TEXTAREA style="width:100%" wrap="off" rows=15 cols=40 name="changes">%loop -struct sortedProps%%value $key% = %value% 
%endloop%</TEXTAREA>
              %else%
              <TABLE width=100%>
                <TR>
                  <TD><PRE class="fixedwidth">%loop -struct sortedProps%%value $key% = %value%<br>%endloop%







</PRE>
                  </TD>
                </TR>
              </TABLE>
              %endif%
            </TD>
          </TR>
          %ifvar mode equals('edit')%
          <TR>
            <TD class="action">
              <INPUT type="submit" name="submit" value="Save Changes">
            </TD>
          </TR>
          %endif%
          </FORM>
          <TR>
%ifvar mode equals('edit')%
            <TD class="oddrow-l">TN Properties settings are typically provided by webMethods Technical Support</TD>
%else%
            <TD class="oddrow-l">TN Properties settings are typically provided by webMethods Technical Support</TD>
%end if%
          </TR>

%endinvoke wm.tnweb.wrapper:getTNProperties%
        </TABLE>
      </TD>
    </TR>
  </TABLE>
</BODY>


%endbundle%