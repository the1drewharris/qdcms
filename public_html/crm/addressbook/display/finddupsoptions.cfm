<cfoutput>
	<div class="options">
		<h3>Find duplicates by</h3>
		<span class="left">
		<input type="radio" id="byname" name="dupoptions" value="name" <cfif url.d EQ 'name'>checked</cfif>>Name
		</span>
		<span class="left">
		<input type="radio" id="byaddress" name="dupoptions" value="address" <cfif url.d EQ 'address'>checked</cfif>>Address
		</span>
		<span class="left">
		<input type="radio" id="byusername" name="dupoptions" value="username" <cfif url.d EQ 'username'>checked</cfif>>Username
		</span>
		<span class="left">
		<input type="radio" id="byclientuserid" name="dupoptions" value="clientuserid" <cfif url.d EQ 'clientuserid'>checked</cfif>>Clientuserid
		</span>
		<span class="left">
		<input type="radio" id="byhemail" name="dupoptions" value="hemail" <cfif url.d EQ 'hemail'>checked</cfif>>Home Email
		</span>
		<span class="left">
		<input type="radio" id="bywemail" name="dupoptions" value="wemail" <cfif url.d EQ 'wemail'>checked</cfif>>Work Email
		</span>
	</div>
	<div class="clear"></div><br /><br />
</cfoutput>