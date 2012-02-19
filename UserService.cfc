component restpath="users" rest="true"
{
	import model.User;
	
	remote Array function getUsers() httpmethod="GET" 
	{
		var response = [];
		var qry = new Query();
		var userQry = "";
		
		qry.setSQl("select * from tbluser");
		userQry = qry.execute().getResult();
		
		if(userQry.recordcount)
		{
			for(i = 1; i lte userQry.recordcount; i++)
			{
				objUser = populateUser(userQry, i);
				arrayAppend(response, objUser);
			}
		}
		
		return response;
	}  
	
	remote User function getUser(numeric userid restargsource="Path") httpmethod="GET" restpath="{userid}" 
	{
		var response = "";
		var qry = new Query();
		var userQry = "";
		
		qry.setSQl("select * from tbluser where id = :userid");
		qry.addParam(name="userid", value="#arguments.userid#", cfsqltype="cf_sql_numeric");
		userQry = qry.execute().getResult();
		
		if(userQry.recordcount)
		{
			response = populateUser(userQry, 1);
		} else {
			throw(type="Restsample.UserNotFoundError", errorCode='404', detail='User not found');
		}
		
		return response;
	}  
	
	remote any function deleteUser(numeric userid restargsource="Path") httpmethod="DELETE" restpath="{userid}" 
	{
		var response = "";
		var qry = new Query();
		var userQry = "";
		
		qry.setSQl("delete from tbluser where id = :userid");
		qry.addParam(name="userid", value="#arguments.userid#", cfsqltype="cf_sql_numeric");
		userQry = qry.execute().getPrefix();
		
		if(userQry.recordcount)
		{
			response = "User Deleted";
		} else {
			throw(type="Restsample.UserNotFoundError", errorCode='404', detail='User not found');
		}
		
		return response;
	}  
	
	remote any function createUser(
			required string username restargsource="Form",
			required string firstname restargsource="Form", 
			required string lastname restargsource="Form", 
			required string email restargsource="Form") httpmethod="POST"
	{ 
		var response = "";
		var qry = new Query();
		var userQry = "";
		
		qry.setSQl("insert into tbluser (username, firstname, lastname, email) VALUES (:username, :firstname, :lastname, :email)");
		qry.addParam(name="username", value="#arguments.username#", cfsqltype="cf_sql_varchar");
		qry.addParam(name="firstname", value="#arguments.firstname#", cfsqltype="cf_sql_varchar");
		qry.addParam(name="lastname", value="#arguments.lastname#", cfsqltype="cf_sql_varchar");
		qry.addParam(name="email", value="#arguments.email#", cfsqltype="cf_sql_varchar");
		userQry = qry.execute().getPrefix();
		
		if(userQry.recordcount)
		{
			response = "User Created";
		} else {
			throw(type="Restsample.UnKnownError", detail='Unknown error occured');
		}
		
		return response;
	}  
	
	remote any function updateUser(
			required string username restargsource="header",
			required string firstname restargsource="header", 
			required string lastname restargsource="header", 
			required string email restargsource="header",
			required numeric userid restargsource="Path") httpmethod="PUT" restpath="{userid}" 
	{ 
		var response = "";
		var qry = new Query();
		var userQry = "";
		
		qry.setSQl("update tbluser set username = :username, firstname = :firstname, lastname = :lastname, email = :email where id = :userid");
		qry.addParam(name="username", value="#arguments.username#", cfsqltype="cf_sql_varchar");
		qry.addParam(name="firstname", value="#arguments.firstname#", cfsqltype="cf_sql_varchar");
		qry.addParam(name="lastname", value="#arguments.lastname#", cfsqltype="cf_sql_varchar");
		qry.addParam(name="email", value="#arguments.email#", cfsqltype="cf_sql_varchar");
		qry.addParam(name="userid", value="#arguments.userid#", cfsqltype="cf_sql_numeric");
		userQry = qry.execute().getPrefix();
		
		if(userQry.recordcount)
		{
			response = "User Updated";
		} else {
			throw(type="Restsample.UnKnownError", detail='Unknown error occured');
		}
		
		return response;
	} 
	
	private User function populateUser(query qry, numeric rowNumber)
	{
		var response       = createObject("component", "model.User");
		response.id  	   = qry.id[rowNumber];
		response.username  = qry.username[rowNumber];
		response.firstname = qry.firstname[rowNumber];
		response.lastname  = qry.lastname[rowNumber];
		response.email     = qry.email[rowNumber];
		return response;
	}
}
	