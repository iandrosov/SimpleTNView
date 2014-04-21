<HTML>
    <HEAD>
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
        <META HTTP-EQUIV="Expires" CONTENT="-1">
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    </HEAD>
    
    <script>
    function launchHelp()
    {
          if(parent.contents != null)
          {
             window.open(parent.contents.document.forms["urlsaver"].helpURL.value, 'help', "directories=no,location=yes,menubar=yes,scrollbars=yes,status=yes,toolbar=yes,resizable=yes", true);
          }
    }
    </script>
    
    
    <BODY  class="topbar" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">
        <table border=0 cellspacing=0 cellpadding=0 height=100% width=100%>
            <tr>
                <td>
                    <TABLE width=100% CELLSPACING=0 BORDER=0>
                        <TR>
                            <TD nowrap class="toptitle" width="100%">
                                %value $host%
                                ::
                                Integration Server
                                ::
                                Trading Networks
                            </TD>
                            <TD bgcolor="FFFFFF">
                                <IMG src="images/newlogo.gif" border=0>
                            </TD>
                        </TR>
                    </TABLE>
                </td>
            </tr>
            <tr height=100%>
                <td>
                    <TABLE width=100% height=100% CELLSPACING=0 BORDER=0>
                        <TR>
                            <TD nowrap width=100% class="topmenu">&nbsp;
                            </TD>
                            <TD nowrap valign="bottom" class="topmenu">
                                <A href="about.dsp" target="main">About</A>&nbsp;|
                                %invoke wm.tnweb.helper:getUserRights%
                                %ifvar Rights equals('TNAdministrators')%
                                <A onClick="launchHelp();return false;" href='#' target="_blank">Help</A>&nbsp;&nbsp;                                %endif%
                                %ifvar Rights equals('TNPartners')%
                                <A href="doc/onlineHelp/PartnerHelp.htm" target="_blank">Help</A>&nbsp;&nbsp;
                                %endif%
                                %endinvoke%
                            </TD>
                        </TR>
                        <TR>
                        </TR>
                    </TABLE>
                </td>
            </tr>
        </table>
    </BODY>
</HTML>
