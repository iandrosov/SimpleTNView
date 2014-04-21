<html>

	<head>
		<title>Web Manager Profile Detail</title>
		<script language="JavaScript">
			var c = 1;
		</script>
		<link rel="stylesheet" type="text/css" href="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
	</head>

	<body>
		%invoke wm.tnweb.page:viewProfilePageFlow%
			<table width="100%">
				<tr>
					<td class="menusection-Server">
						Web Manager &gt;
						Profile Viewer &gt;
						%value /ProfileRecord/partnerName%&nbsp;
					</td>
				</tr>

				%ifvar /ProfileRecord/message%
				<tr><td>No profile</td></tr>
				%else%
				<tr>
					<td valign="top">
						<ul>
							<li><a href="selectProfile.dsp">Return to Profile Viewer</a></li>
							%ifvar /ProfileRecord/profile/Corporate%
							<li><a href="#Corporate Info">Go to Corporate Information</a></li>
							%endif Corporate%
							%ifvar /ProfileRecord/profile/Contact%
							<li><a href="#Contact Info">Go to Contact Information</a></li>
							%endif Contact%
							%ifvar /ProfileRecord/profile/Delivery%
							<li><a href="#Delivery">Go to Delivery Information</a></li>
							%endif Delivery%
							%ifvar /outSecurity%
							<li><a href="#Security">Go to Security Information</a></li>
							%endif outSecurity%	
							%ifvar /isExtFldDefined equals('true')%
							<li><a href="#Custom">Go to Extended Fields</a></li>
							%endif isExtFldDefined%
						</ul>
					</td>
				</tr>

				<tr>
					<td>
						<table>
							<tr>
								<td class="heading" colspan="2"><a name="Corporate Info">Corporate Information for %value /ProfileRecord/partnerName%</a>
								</td>
							</tr>
							<tr> 
								<td class="evenrow">Corporate name </td>
								<td class="evenrow-l">%value /ProfileRecord/profile/Corporate/CorporationName% </td>
							</tr> 
							<tr> 
								<td class="evenrow">Unit name </td>
								<td class="evenrow-l">%value /ProfileRecord/profile/Corporate/OrgUnitName% </td>
							</tr>
							<tr> 
								<td class="evenrow">Partner type </td>
								<td class="evenrow-l">%value /ProfileRecord/profile/Corporate/Type% </td>
							</tr>
							<tr> 
								<td class="evenrow">TN version </td>
								<td class="evenrow-l">%value /ProfileRecord/profile/Corporate/TNVersion% </td>
							</tr>
							<tr> 
								<td class="evenrow">Status </td>
								<td class="evenrow-l">%ifvar /ProfileRecord/profile/Corporate/Status equals('Active')% 
																			Active
																			%else%
																			Inactive
																			%end ifvar%
								</td>
							</tr>
							<tr> 
								<td class="evenrow">Deleted </td>
								<td class="evenrow-l">%ifvar /ProfileRecord/profile/Corporate/Deleted/MBoolean equals('true')% 
																			Yes
																			%else%
																			No
																			%end ifvar%
																			
								</td>
							</tr>
							<tr> 
								<td class="evenrow">Self </td>
								<td class="evenrow-l">%ifvar /ProfileRecord/profile/Corporate/Self/MBoolean equals('true')% 
																			Yes
																			%else%
																			No
																			%end ifvar%
								</td>
							</tr>
							%ifvar /ProfileRecord/profile/Corporate/PreferredProtocol%
							<tr> 
								<td class="evenrow">Preferred delivery method </td>
								<td class="evenrow-l">%value /ProfileRecord/profile/Corporate/PreferredProtocol% </td>
							</tr>
							%end ifvar PreferredProtocol%
							%ifvar /ProfileRecord/profile/Corporate/PollingProtocol%
							<tr> 
								<td class="evenrow">Polling protocol </td>
								<td class="evenrow-l">%value /ProfileRecord/profile/Corporate/PollingProtocol% </td>
							</tr>
							%end ifvar PollingProtocol%
							<tr> 
								<td class="evenrow">Polling frequency </td>
								<td class="evenrow-l">%value /ProfileRecord/profile/Corporate/PollingFrequency% </td>
							</tr>
							<tr> 
								<td class="evenrow">Wait between retries </td>
								<td class="evenrow-l">%value /ProfileRecord/profile/Corporate/DeliveryRetryWait% </td>
							</tr>
							<tr> 
								<td class="evenrow">Delivery maximum retries </td>
								<td class="evenrow-l">%value /ProfileRecord/profile/Corporate/DeliveryMaxRetries% </td>
							</tr>
							<tr> 
								<td class="evenrow">Retry factor </td>
								<td class="evenrow-l">%value /ProfileRecord/profile/Corporate/RetryFactor% </td>
							</tr>
	
							<tr>
								<td class="evenrow">External ID(s)</td>
								<td class="evenrow-l">
									%ifvar /ProfileRecord/profile/ID%
										%loop /ProfileRecord/externalIDs%
											%value idType%: %value idValue% %loopsep <br>%
										%end loop /ProfileRecord/ExternalIDs%
									%end ifvar /ProfileRecord/profile/ID%
								</td>
							</tr>
									
							<tr>
								<td class="evenrow">Corporate Address(es)</td>
								<td class="evenrow-l">&nbsp;</td>
							</tr>
							%ifvar /ProfileRecord/profile/Corporate/Address%
							%loop /ProfileRecord/profile/Corporate/Address%
							<tr>
								<td class="evenrow">&nbsp;</td>
								<td class="evenrow-l">
										%ifvar AddressLine1%
											%value AddressLine1%<br>
										%end ifvar AddressLine1%
										%ifvar AddressLine2%
											%value AddressLine2%<br>
										%end ifvar AddressLine2%
										%ifvar AddressLine3%
											%value AddressLine3%<br>
										%end ifvar AddressLine3%
										%ifvar City%
											%value City%
										%end ifvar City%
										%ifvar State_Province%
											&nbsp;%value State_Province%
										%end ifvar State_Province%
										%ifvar Zip_PostalCode%
											&nbsp;%value Zip_PostalCode%<br>
										%end ifvar Zip_PostalCode%
										%ifvar Country%
											%value Country%
										%end ifvar Country%
									</td>
							</tr>
							%end loop%
							%end ifvar Address%

							%ifvar /ProfileRecord/profile/Contact%
							<tr><td>&nbsp;</td></tr>
							<tr><td class="heading" colspan="2"><a name="Contact Info">Contact Information for %value /ProfileRecord/partnerName%</a></td></tr> 
							%loop /ProfileRecord/profile/Contact% 
							<tr>
								<td class="evenrowdata-l">%value Surname%, %value GivenName%</td>
								<td class="evenrow-l">&nbsp;</td>
							</tr>
							<tr>
								<td class="evenrow">Type</td>
								<td class="evenrow-l">%value Type% </td>
							</tr>
							%ifvar Role%
							<tr>
								<td class="evenrow">Role</td>
								<td class="evenrow-l">%value Role% </td>
							</tr>
							%end ifvar Role%
							%ifvar EmailAddress%
							<tr>
								<td class="evenrow">Email</td>
								<td class="evenrow-l">%value EmailAddress% </td>
							</tr>
							%end ifvar EmailAddress%
							%ifvar TelNumber%
							<tr>
								<td class="evenrow">Telephone number</td>
								<td class="evenrow-l">%value TelNumber% </td>
							</tr>
							%end ifvar TelNumber%
							%ifvar TelExtension%
							<tr>
								<td class="evenrow">Telephone extension</td>
								<td class="evenrow-l">%value TelExtension% </td>
							</tr>
							%end ifvar TelExtension%
							%ifvar FaxNumber%
							<tr>
								<td class="evenrow">Fax number</td>
								<td class="evenrow-l">%value FaxNumber% </td>
							</tr>
							%end ifvar FaxNumber%
							%ifvar PagerNumber%
							<tr>
								<td class="evenrow">PageNumber</td>
								<td class="evenrow-l">%value PagerNumber% </td>
							</tr>
							%end ifvar PagerNumber%
							%ifvar Address%
							<tr>
								<td class="evenrow">Address</td>
								<td class="evenrow-l">
									%ifvar Address/AddressLine1%
										%value Address/AddressLine1%<br>
									%end ifvar%
									%ifvar Address/AddressLine2%
										%value Address/AddressLine2%<br>
									%end ifvar%
									%ifvar Address/AddressLine3%
										%value Address/AddressLine3%<br>
									%end ifvar%
									%ifvar Address/City%
										%value Address/City%&nbsp;
									%end ifvar%
									%ifvar Address/State_Province%
										%value Address/State_Province%&nbsp;
									%end ifvar%
									%ifvar Address/Zip_PostalCode%
										%value Address/Zip_PostalCode%&nbsp;<br>
									%end ifvar%
									%ifvar Address/Country%
										%value Address/Country%
									%end ifvar Country%
								</td>
							</tr>
							%endif Address%
							%end loop Contact%
							%endif /ProfileRecord/profile/Contact%


							%ifvar /ProfileRecord/profile/Delivery%
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td class="heading" colspan="2"><a name="Delivery">Delivery Information for %value /ProfileRecord/partnerName%</a></td>
							</tr>
							%loop /ProfileRecord/profile/Delivery%
							%ifvar PrimaryAddr/MBoolean equals('true')%
							<tr>
								<td class="evenrowdata-l">Primary %value Protocol%</td>
								<td class="evenrow-l">&nbsp;</td>
							</tr>
							%else%
							<tr>
								<td class="evenrowdata-l">Secondary %value Protocol%</td>
								<td class="evenrow-l">&nbsp;</td>
							</tr>
							%end ifvar PrimaryAddr/MBoolean%
							%ifvar Host%
							<tr>
								<td class="evenrow">Host</td>
								<td class="evenrow-l">%value Host% <td>
							</tr>
							%end ifvar Host%
							%ifvar Port%
							<tr>
								<td class="evenrow">Port</td>
								<td class="evenrow-l">%value Port% </td>
							</tr>
							%end ifvar Port%
							%ifvar Location%
							<tr>
								<td class="evenrow">Location</td>
								<td class="evenrow-l">%value Location% </td>
							</tr>
							%end ifvar Location%
							%ifvar UserName%
							<tr>
								<td class="evenrow">User name</td>
								<td class="evenrow-l">%value UserName% </td>
							</tr>
							%end ifvar UserName%
							%end loop Delivery%
							%end ifvar /ProfileRecord/profile/Delivery%

							%ifvar /outSecurity%
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td class="heading" colspan="2"><a name="Security">Security Information for %value /ProfileRecord/partnerName%</a></td>
							</tr>
							%ifvar /outSecurity/signInfo%
							<tr>
								<td class="evenrowdata-l">Sign Certificate</td>
								<td class="evenrow-l">&nbsp;</td>
							</tr>
							%ifvar /outSecurity/signInfo/cert%
							<tr>
								<td class="evenrow">Certificate</td>
								<td class="evenrow-l">%value /outSecurity/signInfo/cert%</td>
							</tr>
							%endif cert%
							%ifvar /outSecurity/signInfo/cacerts%
							<tr>
								<td class="evenrow">CA Certificates</td>
								<td class="evenrow-l">
								%loop /outSecurity/signInfo/cacerts%
								%value /outSecurity/signInfo/cacerts%<br>
								%endloop cacerts%
							</tr>
							%endif cacerts%
							%ifvar /outSecurity/signInfo/privkey%
							<tr>
								<td class="evenrow">Private Key</td>
								<td class="evenrow-l">%value /outSecurity/signInfo/privkey%</td>
							</tr>
							%endif privkey%
							%ifvar /outSecurity/signInfo/useDefault equals('true')%
							<tr>
								<td class="evenrow">&nbsp;</td>
								<td class="evenrow-l">{Use My Enterprise Default Sign Certificate}</td>
							</tr>
							%endif useDefault%
							%endif signInfo%

							%ifvar /outSecurity/decryptInfo%
							<tr>
								<td class="evenrowdata-l">Decrypt Certificate</td>
								<td class="evenrow-l">&nbsp;</td>
							</tr>
							%ifvar /outSecurity/decryptInfo/cert%
							<tr>
								<td class="evenrow">Certificate</td>
								<td class="evenrow-l">%value /outSecurity/decryptInfo/cert%</td>
							</tr>
							%endif cert%
							%ifvar /outSecurity/decryptInfo/cacerts%
							<tr>
								<td class="evenrow">CA Certificates</td>
								<td class="evenrow-l">
								%loop /outSecurity/decryptInfo/cacerts%
								%value /outSecurity/decryptInfo/cacerts%<br>
								%endloop cacerts%
							</tr>
							%endif cacerts%
							%ifvar /outSecurity/decryptInfo/privkey%
							<tr>
								<td class="evenrow">Private Key</td>
								<td class="evenrow-l">%value /outSecurity/decryptInfo/privkey%</td>
							</tr>
							%endif privkey%
							%ifvar /outSecurity/decryptInfo/useDefault equals('true')%
							<tr>
								<td class="evenrow">&nbsp;</td>
								<td class="evenrow-l">{Use My Enterprise Default Decrypt Certificate}</td>
							</tr>
							%endif useDefault%
							%endif decryptInfo%

							%ifvar /outSecurity/encryptInfo%
							<tr>
								<td class="evenrowdata-l">Encrypt Certificate</td>
								<td class="evenrow-l">&nbsp;</td>
							</tr>
							%ifvar /outSecurity/encryptInfo/cert%
							<tr>
								<td class="evenrow">Certificate</td>
								<td class="evenrow-l">%value /outSecurity/encryptInfo/cert%</td>
							</tr>
							%endif cert%
							%ifvar /outSecurity/encryptInfo/cacerts%
							<tr>
								<td class="evenrow">CA Certificates</td>
								<td class="evenrow-l">
								%loop /outSecurity/encryptInfo/cacerts%
								%value /outSecurity/encryptInfo/cacerts%<br>
								%endloop cacerts%
							</tr>
							%endif cacerts%
							%endif encryptInfo%

							%ifvar /outSecurity/verifyInfo%
							<tr>
								<td class="evenrowdata-l">Verify Certificate</td>
								<td class="evenrow-l">&nbsp;</td>
							</tr>
							%ifvar /outSecurity/verifyInfo/cert%
							<tr>
								<td class="evenrow">Certificate</td>
								<td class="evenrow-l">%value /outSecurity/verifyInfo/cert%</td>
							</tr>
							%endif cert%
							%ifvar /outSecurity/verifyInfo/cacerts%
							<tr>
								<td class="evenrow">CA Certificates</td>
								<td class="evenrow-l">
								%loop /outSecurity/verifyInfo/cacerts%
								%value /outSecurity/verifyInfo/cacerts%<br>
								%endloop cacerts%
							</tr>
							%endif cacerts%
							%endif verifyInfo%

							%endif outSecurity%

							%ifvar /isExtFldDefined equals('true')%
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td class="heading" colspan="2"><a name="Custom">Extended Fields for %value /ProfileRecord/partnerName%</a></td>
							</tr>
							%loop /ProfileRecord/extFields%
							%ifvar fields -notempty%
							<tr>
								<td class="evenrowdata-l">%value group% Group</td>
								<td class="evenrow">&nbsp;</td>
							</tr>
							%loop fields%
							%ifvar datatype equals('String')%
							<tr>
								<td class="evenrow">%value name% </td>
								<td class="evenrow-l">%value value% </td>
							</tr> 
							%endif datatype string%
							%ifvar datatype equals('Binary')%
							<tr>
								<td class="evenrow">%value name% </td>
								%ifvar value -isnull%
								<td class="evenrow-l">&nbsp;</td>
								%else%
								<td class="evenrow-l">{binary data}</td>
								%endif value%
							</tr>
							%endif datatype binary%
							%endloop fields%
							%endif fields%
							%endloop /ProfileRecord/extFields%
							%endif isExtFldDefined%


						</table>
					</td>
				</tr>
				%endif message%
			</table>
		%end invoke%

	</body>
</html>
