<cfoutput>
	<cfset itIsAJbfSite=FALSE>
	<cfif listfindnocase(client.siteurl,'jbfsale','.') GT 0><cfset itIsAJbfSite=TRUE></cfif>
	<div class="options">
		<h3>You are about to export #n# contacts. <cfif itIsAJbfSite>Select columns you want to export</cfif></h3>
		<form method="post" action="#exportaction#">
			<cfif itIsAJbfSite>
			<div style="float:left"><input type="radio" name="l" value="0" checked="true">Normal Export </div>
			<div style="float:left"><input type="radio" name="l" value="1">JBF Export for POS</div>
			<div class="clear"><br /></div>
			<h3>For Normal export, select columns you want to export</h3>
			</cfif>
			<div style="float:left"><input type="checkbox" name="username" value="1" checked="TRUE">Username</div>
			<div style="float:left"><input type="checkbox" name="thePassword" value="1" checked="TRUE">Password</div>
			<div style="float:left"><input type="checkbox" name="firstname" value="1" checked="TRUE">First Name</div>
			<div style="float:left"><input type="checkbox" name="lastname" value="1" checked="TRUE">Last Name</div>
			<div style="float:left"><input type="checkbox" name="company" value="1" checked="TRUE">Company</div>
			<div style="float:left"><input type="checkbox" name="title" value="1" checked="TRUE">Title</div>
			<div style="float:left"><input type="checkbox" name="address1" value="1" checked="TRUE">Address 1</div>
			<div style="float:left"><input type="checkbox" name="address2" value="1" checked="TRUE">Address 2</div>
			<div style="float:left"><input type="checkbox" name="city" value="1" checked="TRUE">City</div>
			<div style="float:left"><input type="checkbox" name="state" value="1" checked="TRUE">State</div>
			<div style="float:left"><input type="checkbox" name="country" value="1" >Country</div>
			<div style="float:left"><input type="checkbox" name="zip" value="1" checked="TRUE">Zip</div>
			<div style="float:left"><input type="checkbox" name="lat" value="1">Latitude</div>
			<div style="float:left"><input type="checkbox" name="lon" value="1">Longitude</div>
			<div style="float:left"><input type="checkbox" name="clientuserid" value="1">Client User ID</div>
			<div style="float:left"><input type="checkbox" name="hphone" value="1" checked="TRUE">Home Phone</div>
			<div style="float:left"><input type="checkbox" name="wphone" value="1" checked="TRUE">Work Phone</div>
			<div style="float:left"><input type="checkbox" name="mphone" value="1" checked="TRUE">Mobile Phone</div>
			<div style="float:left"><input type="checkbox" name="wemail" value="1" checked="TRUE">Work Email</div>
			<div style="float:left"><input type="checkbox" name="hemail" value="1" checked="TRUE">Home Email</div>
			<div style="float:left"><input type="checkbox" name="oemail" value="1">Other Email</div>
			<div style="float:left"><input type="checkbox" name="memail" value="1">Mobile Email</div>
			<div style="float:left"><input type="checkbox" name="referredby" value="1">Referred By</div>
			<div style="float:left"><input type="checkbox" name="gender" value="1">Gender</div>
			<div style="float:left"><input type="checkbox" name="maritalstatus" value="1">Marital Status</div>
			<div style="float:left"><input type="checkbox" name="dob" value="1">DOB</div>
			<div style="float:left"><input type="checkbox" name="spousename" value="1">Spouse Name</div>
			<div style="float:left"><input type="checkbox" name="icq" value="1">ICQ</div>
			<div style="float:left"><input type="checkbox" name="aol" value="1">AOL</div>
			<div style="float:left"><input type="checkbox" name="yahoo" value="1">Yahoo</div>
			<div style="float:left"><input type="checkbox" name="jabber" value="1">Jabber</div>
			<div style="float:left"><input type="checkbox" name="mac" value="1">.mac</div>
			<div style="float:left"><input type="checkbox" name="msn" value="1">MSN</div>
			<div style="float:left"><input type="checkbox" name="url" value="1">URL</div>
			<div style="float:left"><input type="checkbox" name="description" value="1">Description</div>
			<div style="float:left"><input type="checkbox" name="lastupdated" value="1">Last Updated</div>
			<div style="float:left"><input type="checkbox" name="timecreated" value="1">Time Created</div>
			<div style="float:left"><input type="checkbox" name="TWITTER" value="1">Twitter</div>
			<div style="float:left"><input type="checkbox" name="LINKEDIN" value="1">LinkedIn</div>
			<div style="float:left"><input type="checkbox" name="YOUTUBE" value="1">You Tube</div>
			<div style="float:left"><input type="checkbox" name="PLAXO" value="1">Plaxo</div>
			<div style="float:left"><input type="checkbox" name="MYSPACE" value="1">My Space</div>
			<div style="float:left"><input type="checkbox" name="FRIENDFEED" value="1">Friend Feed</div>
			<div class="clear"></div><br />
			<h3></h3>
			<div style="float:left"><input type="checkbox" name="groups" value="groups" checked="checked">Groups</div>
			<div style="float:left"><input type="checkbox" name="events" value="events">Events</div>
			<div style="float:left"><input type="checkbox" name="notes" value="notes">Notes</div>
			<div style="float:left"><input type="checkbox" name="hau" value="hau">Heard About Us</div>
			<div style="float:left"><input type="checkbox" name="shifts" value="shifts">Shifts</div>
			<span style="float:right">
			<input type="Submit" name="Submit" value="Export">
			</span>
			<div class="clear"></div>
		</form>
		<br />
	</div>
</cfoutput>