component output="false"
{
	this.name = "RestSample";
	this.applicationTimeout = createTimespan(0,2,0,0);
	this.datasource = "restsample";
	
	this.restsettings.skipCFCWithError = true;
	
	public boolean function onRequestStart()
	{
		if(structKeyExists(url, "refreshRestServices"))
		{
			restInitApplication(getDirectoryFromPath(getCurrentTemplatePath()), this.name);
		}
		
		return true;
	}
}