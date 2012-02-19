<!--- Create a New user --->
<cfhttp 
    url="http://localhost:8500/rest/RestSample/users" 
    method="POST" 
    port="8500" 
    result="res"> 
	<cfhttpparam name="username" value="someuser" type="formfield" />
	<cfhttpparam name="firstname" value="Some" type="formfield" />
	<cfhttpparam name="lastname" value="User" type="formfield" />
	<cfhttpparam name="email" value="some@user.com" type="formfield" />
</cfhttp>
<cfdump var = "#res#">

<!--- Delete a user --->
<cfhttp 
    url="http://localhost:8500/rest/RestSample/users/5" 
    method="DELETE" 
    port="8500" 
    result="res"> 
</cfhttp>
<cfdump var = "#res#">

<!--- Update an Existing user --->
<!--- Notice the UserId in the Path --->
<cfhttp 
    url="http://localhost:8500/rest/RestSample/users/4" 
    method="PUT" 
    port="8500" 
    result="res"> 
	<cfhttpparam name="username" value="someuser" type="header" />
	<cfhttpparam name="firstname" value="Some" type="header" />
	<cfhttpparam name="lastname" value="Updated User" type="header" />
	<cfhttpparam name="email" value="some@user.com" type="header" />
</cfhttp>
<cfdump var = "#res#">


<!--- Get a single user --->
<cfhttp 
    url="http://localhost:8500/rest/RestSample/users/7" 
    method="GET" 
    port="8500" 
    result="res"> 
</cfhttp>
<cfdump var = "#res#">

<!--- Get ALL user --->
<cfhttp 
    url="http://localhost:8500/rest/RestSample/users" 
    method="GET" 
    port="8500" 
    result="res"> 
</cfhttp>
<cfdump var = "#res#">
