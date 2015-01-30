using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for WidgetsService
/// </summary>
/// 
[System.Web.Services.WebMethod]
[System.Web.Script.Services.ScriptService]
public class WidgetsService : System.Web.Services.WebService
{
   
	public WidgetsService()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod(UseHttpGet=true)]
    public string HelloWorld() {
        return "Hello World!!!";
    }

    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod(UseHttpGet = true)]
    public Widget getSomeWidget() { 
    
    }

}