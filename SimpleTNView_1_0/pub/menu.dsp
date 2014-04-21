<html>
    <head>
        <title>Trading Networks Contents</title>
        <link rel="stylesheet" type="text/css" href="webMethods.css">
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <script src="menu.js.txt"></script>
        <style>
            body { border-top: 1px solid #97A6CB; }
        </style>
    </head>

%ifvar tnadmin%
    %invoke wm.tnweb.helper:getUserRights%
        %ifvar Rights equals('TNAdministrators')%
            <form name="urlsaver">
                <input type="hidden" name="helpURL" value="../WmTN/doc/onlineHelp/TNproperties.html">
            </form>    
            <body class="menu" onload="initMenu('settings-tnProperties.dsp');">            
        %else%
            <form name="urlsaver">
                <input type="hidden" name="helpURL" value="doc/onlineHelp/AdminHelp.htm">
            </form>    
            <body class="menu" onload="initMenu('welcome_main.html');">
        %endif%
    %endinvoke%
%else%
    <form name="urlsaver">
        <input type="hidden" name="helpURL" value="doc/onlineHelp/AdminHelp.htm">
    </form> 
    <body class="menu" onload="initMenu('welcome_main.html');">
%endif%
        <P>
        %invoke wm.tnweb.configFlow:loadMenu%
        <table WIDTH="100%" cellspacing=0 cellpadding=1 border=0>

            <!-- Subtitle: Web Manager -->
            <tr>
                <td class="menusection-Server"><img src="images/blank.gif" width="4" height="1" border="0">
                    Web Manager
                </td>
            </tr>

            <!-- Web Manager: Welcome -->
            <tr>
                <td id="iwelcome_main.html" class="menuitem" onmouseover="menuMouseOver(this, 'welcome_main.html');" onmouseout="menuMouseOut(this);" onclick="document.all['awelcome_main.html'].click();"><nobr><img valign="middle" src="images/blank.gif" width="4" height="1" border="0"><image valign="middle" id="welcome_main.html" name="welcome_main.html" src="images/blank.gif" height="8" width="8" border="0">
                    <A id="awelcome_main.html" href="welcome_main.html" onclick="setHelpMenuClick('welcome_main.html', 'doc/onlineHelp/AdminHelp.htm'); return true;" target="main"><span class="menuitemspan">Welcome</span></a></nobr>&nbsp;&nbsp;%value username%
                </td>
            </tr>

            <!-- Web Manager: Configuration -->
            <tr>
                <td id="iconfig-general.dsp" class="menuitem" onmouseover="menuMouseOver(this, 'config-general.dsp');" onmouseout="menuMouseOut(this);" onclick="document.all['aconfig-general.dsp'].click();"><nobr><img valign="middle" src="images/blank.gif" width="4" height="1" border="0"><image valign="middle" id="config-general.dsp" name="config-general.dsp" src="images/blank.gif" height="8" width="8" border="0">
                    <A id="aconfig-general.dsp" href="config-general.dsp" onclick="setHelpMenuClick('config-general.dsp', 'doc/onlineHelp/AdminHelp.htm'); return true;" target="main"><span class="menuitemspan">Configuration</span></a></nobr>
                </td>
            </tr>


        %scope Display%
            <!-- Web Manager: Document_Submission -->
            %ifvar DocSubmission%
            <tr>
                <td id="isendDoc.dsp" class="menuitem" onmouseover="menuMouseOver(this, 'sendDoc.dsp');" onmouseout="menuMouseOut(this);" onclick="document.all['asendDoc.dsp'].click();"><nobr><img valign="middle" src="images/blank.gif" width="4" height="1" border="0"><image valign="middle" id="sendDoc.dsp" name="sendDoc.dsp" src="images/blank.gif" height="8" width="8" border="0">
                    <A id="asendDoc.dsp" href="sendDoc.dsp" onclick="setHelpMenuClick('sendDoc.dsp', 'doc/onlineHelp/AdminHelp.htm'); return true;" target="main"><span class="menuitemspan">Document_Submission</span></a></nobr>
                </td>
            </tr>
            %endif DocSubmission%

            <!-- Web Manager: Profile_Viewer -->
            %ifvar ProfileView%
            <tr>
                <td id="iselectProfile.dsp" class="menuitem" onmouseover="menuMouseOver(this, 'selectProfile.dsp');" onmouseout="menuMouseOut(this);" onclick="document.all['aselectProfile.dsp'].click();"><nobr><img valign="middle" src="images/blank.gif" width="4" height="1" border="0"><image valign="middle" id="selectProfile.dsp" name="selectProfile.dsp" src="images/blank.gif" height="8" width="8" border="0">
                    <A id="aselectProfile.dsp" href="selectProfile.dsp" onclick="setHelpMenuClick('selectProfile.dsp', 'doc/onlineHelp/AdminHelp.htm'); return true;" target="main"><span class="menuitemspan">Profile_Viewer</span></a></nobr>
                </td>
            </tr>
            %endif ProfileView%

            <!-- menu separator -->
            <tr><td class="menuseparator"><img src="images/blank.gif" width="3" height="3" border="0"></td></tr>

            <!-- Subtitle: Analysis -->
            <tr>
                <td class="menusection-Logs"><img src="images/blank.gif" width="4" height="1" border="0">
                    Analysis
                </td>
            </tr>

            <!-- Analysis: Transactions -->
            %ifvar DocSearch%
            <tr>
                <td id="itransactionAnalysis.dsp" class="menuitem" onmouseover="menuMouseOver(this, 'transactionAnalysis.dsp');" onmouseout="menuMouseOut(this);" onclick="document.all['atransactionAnalysis.dsp'].click();"><nobr><img valign="middle" src="images/blank.gif" width="4" height="1" border="0"><image valign="middle" id="transactionAnalysis.dsp" name="transactionAnalysis.dsp" src="images/blank.gif" height="8" width="8" border="0">
                    <A id="atransactionAnalysis.dsp" href="transactionAnalysis.dsp" onclick="setHelpMenuClick('transactionAnalysis.dsp', 'doc/onlineHelp/AdminHelp.htm'); return true;" target="main"><span class="menuitemspan">Transactions</span></a></nobr>
                </td>
            </tr>
            %endif DocSearch%

            <!-- Analysis: Tasks -->
            %ifvar TaskQuery%
            <tr>
                <td id="itaskQuery.dsp" class="menuitem" onmouseover="menuMouseOver(this, 'taskQuery.dsp');" onmouseout="menuMouseOut(this);" onclick="document.all['ataskQuery.dsp'].click();"><nobr><img valign="middle" src="images/blank.gif" width="4" height="1" border="0"><image valign="middle" id="taskQuery.dsp" name="taskQuery.dsp" src="images/blank.gif" height="8" width="8" border="0">
                    <A id="ataskQuery.dsp" href="taskQuery.dsp" onclick="setHelpMenuClick('taskQuery.dsp', 'doc/onlineHelp/AdminHelp.htm'); return true;" target="main"><span class="menuitemspan">Tasks</span></a></nobr>
                </td>
            </tr>
            %endif TaskQuery%

            <!--- Subtitle: Custom --->
            %ifvar CreateDoc%
            <!-- menu separator -->
            <tr><td class="menuseparator"><img src="images/blank.gif" width="3" height="3" border="0"></td></tr>
            <tr>
                <td class="menusection-Packages"><img src="images/blank.gif" width="4" height="1" border="0">
                    Custom
                </td>
            </tr>

            %loop CreateDoc%
            <tr>
                <td id="i%value dspPage%" class="menuitem" onmouseover="menuMouseOver(this, '%value dspPage%');" onmouseout="menuMouseOut(this);" onclick="document.all['a%value dspPage%'].click();"><nobr><img valign="middle" src="images/blank.gif" width="4" height="1" border="0"><image valign="middle" id="%value dspPage%" name="%value dspPage%" src="images/blank.gif" height="8" width="8" border="0">
                    <A id="a%value dspPage%" href="%value dspPage%" onclick="setHelpMenuClick('%value dspPage%', 'doc/onlineHelp/AdminHelp.htm'); return true;" target="main"><span class="menuitemspan">%value Caption%</span></a></nobr>
                </td>
            </tr>
            %endloop CreateDoc%
            %endif CreateDoc%

            <!-- Subtitle: Alerts -->
            %ifvar /Alerts%
            <!-- menu separator -->
            <tr><td class="menuseparator"><img src="images/blank.gif" width="3" height="3" border="0"></td></tr>
            <tr>
                <td class="menusection-Adapters"><img src="images/blank.gif" width="4" height="1" border="0">
                    Alerts
                </td>
            </tr>

        %scope /Alerts% 
            <!-- Group Alerts part -->
            %loop Group%
            %loop GroupAlerts%

            <!-- group name -->
            <tr>
                <td id="inone" class="menuitem-unclickable"><nobr><img valign="middle" src="images/blank.gif" width="4" height="1" border="0"><img valign="middle" id="none" name="none" src="images/blank.gif" height="8" width="8" border="0">Group: %value group%</nobr>
                </td>
            </tr>

            <!--- view group alerts --->
            <tr>
                <td id="i%value -urlencode View/StartView%.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%&search=true" class="menuitem" onmouseover="menuMouseOver(this, '%value -urlencode View/StartView%.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%&search=true');" onmouseout="menuMouseOut(this);" onclick="document.all['a%value -urlencode View/StartView%.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%&search=true'].click();"><nobr><img valign="middle" src="images/blank.gif" width="4" height="1" border="0"><image valign="middle" id="%value -urlencode View/StartView%.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%&search=true" name="%value -urlencode View/StartView%.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%&search=true" src="images/blank.gif" height="8" width="8" border="0">
                &nbsp;<A id="a%value -urlencode View/StartView%.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%&search=true" href="%value -urlencode View/StartView%.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%&search=true" onclick="menuMove('%value -urlencode View/StartView%.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%&search=true', 'main'); return true;" target="main"><span class="menuitemspan">%value alertName%</span></a></nobr>
                </td>
            </tr>

            <!--- remove group alerts --->
            <tr>
                <td id="iRemoveAlert.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%" class="menuitem" onmouseover="menuMouseOver(this, 'RemoveAlert.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%');" onmouseout="menuMouseOut(this);" onclick="document.all['aRemoveAlert.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%'].click();"><nobr><img valign="middle" src="images/blank.gif" width="4" height="1" border="0"><image valign="middle" id="RemoveAlert.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%" name="RemoveAlert.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%" src="images/blank.gif" height="8" width="8" border="0">
                    &nbsp;<A id="aRemoveAlert.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%" href="RemoveAlert.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%" onclick="menuMove('RemoveAlert.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%', 'main'); location.reload(); return true;" target="main"><span class="menuitemspan">remove alert</span></a></nobr>
                </td>
            </tr>
            %endloop GroupAlerts%
            %endloop Group%

            <!-- User Alerts Part -->
            %loop UserAlerts%
            <!-- user name -->
            <tr>
                <td id="inone" class="menuitem-unclickable"><nobr><img valign="middle" src="images/blank.gif" width="4" height="1" border="0"><img valign="middle" id="none" name="none" src="images/blank.gif" height="8" width="8" border="0">User: %value /username%</nobr>
                </td>
            </tr>

            <!--- view user alerts --->
            <tr>
                <td id="i%value -urlencode View/StartView%.dsp?alertName=%value -urlencode alertName%&alertType=user&typeValue=%value -urlencode /username%&search=true" class="menuitem" onmouseover="menuMouseOver(this, '%value -urlencode View/StartView%.dsp?alertName=%value -urlencode alertName%&alertType=user&typeValue=%value -urlencode /username%&search=true');" onmouseout="menuMouseOut(this);" onclick="document.all['a%value -urlencode View/StartView%.dsp?alertName=%value -urlencode alertName%&alertType=user&typeValue=%value -urlencode /username%&search=true'].click();"><nobr><img valign="middle" src="images/blank.gif" width="4" height="1" border="0"><image valign="middle" id="%value -urlencode View/StartView%.dsp?alertName=%value -urlencode alertName%&alertType=user&typeValue=%value -urlencode /username%&search=true" name="%value -urlencode View/StartView%.dsp?alertName=%value -urlencode alertName%&alertType=user&typeValue=%value -urlencode /username%&search=true" src="images/blank.gif" height="8" width="8" border="0">
                &nbsp;<A id="a%value -urlencode View/StartView%.dsp?alertName=%value -urlencode alertName%&alertType=user&typeValue=%value -urlencode /username%&search=true" href="%value -urlencode View/StartView%.dsp?alertName=%value -urlencode alertName%&alertType=user&typeValue=%value -urlencode /username%&search=true" onclick="menuMove('%value -urlencode View/StartView%.dsp?alertName=%value -urlencode alertName%&alertType=user&typeValue=%value -urlencode /username%&search=true', 'main'); return true;" target="main"><span class="menuitemspan">%value alertName%</span></a></nobr>
                </td>
            </tr>

            <!--- remove user alerts --->
            <tr>
                <td id="iRemoveAlert.dsp?alertName=%value -urlencode alertName%&alertType=user&typeValue=%value -urlencode /username%" class="menuitem" onmouseover="menuMouseOver(this, 'RemoveAlert.dsp?alertName=%value -urlencode alertName%&alertType=user&typeValue=%value -urlencode /username%');" onmouseout="menuMouseOut(this);" onclick="document.all['aRemoveAlert.dsp?alertName=%value -urlencode alertName%&alertType=user&typeValue=%value -urlencode /username%'].click();"><nobr><img valign="middle" src="images/blank.gif" width="4" height="1" border="0"><image valign="middle" id="RemoveAlert.dsp?alertName=%value -urlencode alertName%&alertType=user&typeValue=%value -urlencode /username%" name="RemoveAlert.dsp?alertName=%value -urlencode alertName%&alertType=user&typeValue=%value -urlencode /username%" src="images/blank.gif" height="8" width="8" border="0">
                    &nbsp;<A id="aRemoveAlert.dsp?alertName=%value -urlencode alertName%&alertType=user&typeValue=%value -urlencode /username%" href="RemoveAlert.dsp?alertName=%value -urlencode alertName%&alertType=user&typeValue=%value -urlencode /username%" onclick="menuMove('RemoveAlert.dsp?alertName=%value -urlencode alertName%&alertType=group&typeValue=%value -urlencode group%', 'main'); location.reload(); return true;" target="main"><span class="menuitemspan">remove alert</span></a></nobr>
                </td>
            </tr>
            
            %endloop UserAlerts%
        %endscope /Alerts%
            %endif Alerts%

            <!-- Subtitle: Settings -->
            <!-- menu separator -->
            <tr><td class="menuseparator"><img src="images/blank.gif" width="3" height="3" border="0"></td></tr>
            <tr>
                <td class="menusection-Settings"><img src="images/blank.gif" width="4" height="1" border="0">
                    Settings
                </td>
            </tr>
            <!-- Settings: TN Properties -->
            <tr>
                <td id="isettings-tnProperties.dsp" class="menuitem" onmouseover="menuMouseOver(this, 'settings-tnProperties.dsp');" onmouseout="menuMouseOut(this);" onclick="document.all['asettings-tnProperties.dsp'].click();"><nobr><img valign="middle" src="images/blank.gif" width="4" height="1" border="0"><image valign="middle" id="settings-tnProperties.dsp" name="settings-tnProperties.dsp" src="images/blank.gif" height="8" width="8" border="0">
                    <A id="asettings-tnProperties.dsp" href="settings-tnProperties.dsp" onclick="setHelpMenuClick('settings-tnProperties.dsp', '../WmTN/doc/onlineHelp/TNproperties.html'); return true;" target="main"><span class="menuitemspan">TN Properties</span></a></nobr>
                </td>
            </tr>

        %endscope Display%
            <!-- error handling -->
            %onerror%
            <HR>
            <tr><td>
                <P>The Server could not process your request because the following error occurred. Contact your server
administrator.
                </P>
                <TABLE WIDTH="100%" BORDER="1">
                    <TR>
                        <TD>Service</TD>
                        <TD>%value errorService%</TD>
                    </TR>
                    <TR>
                        <TD>Error</TD>
                        <TD>%value error% &nbsp; <br>%value errorMessage%</TD>
                    </TR>
                    <!-- <TR><TD><B>Error Inputs</B></TD><TD>%value errorInputs% &nbsp;  </TD></TR> <TR><TD><B>Error Outputs</B></TD><TD>%value errorOutputs% &nbsp; </TD></TR> -->
                </TABLE>
            </td></tr>

        %endinvoke%

        </table>
     </body>
</html>
