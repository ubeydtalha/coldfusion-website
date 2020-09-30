<cfcomponent displayname="menu">

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		default constructor code used to make sure that variables exists
		if the user does not call init()
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cfscript>
		variables.currentNode = "";
		variables.rootNode = "";
		variables.returnChar = chr(13);
		variables.type = "SMS";
		variables.gatewayID="unknown";
		variables.debug = false;
		variables.aStringBuffer = arrayNew(1);
		variables.start = 1;
		variables.max = 3;
		variables.maxlength = 254;
	</cfscript>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		init(): call this method as a default constructor
			input: String (type) determines the gateway type being used (SMS|IM|Socket)
			output: the created instance of the menu CFC
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="public" name="init" output="false" returntype="any" hint="call this method as a default constructor">
		<cfargument name="type" type="string" required="no" default="SMS" hint="determines the gateway type being used (SMS|IM|Socket)" />
		<cfargument name="gatewayID" type="string" required="Yes" hint="the Gateway ID you would like messages sent to">
		<cfscript>
			variables.currentNode = "";
			variables.rootNode = "";
			variables.type = arguments.type;
			variables.gatewayid = arguments.gatewayID;
			variables.aStringBuffer = arrayNew(1);
			variables.start = 1;
			variables.max = 3;
			variables.maxlength = 254;
		</cfscript>
		<cfreturn this />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		setRoot(menuNode): sets the passed in menuNode as the root of the menu tree
			input: menuNode (node) -> node that will be the root of the tree
			output: void
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="public" name="setRoot" output="true" returntype="void" hint="sets the passed in menuNode as the root of the menu tree">
		<cfargument name="node" type="menuNode" required="yes" hint="node that will be the root of the tree" />
		<cfset root = node />
		<cfset variables.currentNode = root />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		getRoot(menuNode): return the root node of the tree.
			output: menunode
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="public" name="getRoot" output="true" returntype="void" hint="get the root of the menu tree">
		<cfreturn node>
	</cffunction>	
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		setGreeting(message): sets Greeting banner above the top level menu
			input: String (message) -> message to use
			output: void
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="public" name="setGreeting" output="false" returntype="void" hint="set a greeting banner above the top level menu">
		<cfargument name="message" type="string" required="yes" hint="message to prepend" />
		<cfset variables.greeting = arguments.message />
	</cffunction>
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		setReturnChar(returnChar): sets the character used for line breaks	
			input: String (returnChar) -> character to be used for line break
			output: void
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="public" name="setReturnChar" output="false" returntype="void" hint="sets the character used for line breaks">
		<cfargument name="returnChar" type="string" required="yes" hint="character to be used for line break" />
		<cfset variables.returnChar = arguments.returnChar />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		setMaxMessages(maxMessages): sets the number of consecutive messages that can be sent
			input: int (MaxMessages) -> the number of consecutive messages that can be sent
			output: void
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="public" name="setMaxMessages" output="false" returntype="void" hint="sets the number of consecutive messages that can be sent">
		<cfargument name="maxMessages" type="numeric" required="yes" hint="the number of consecutive messages that can be sent" />
		<cfset variables.max = arguments.maxMessages />
	</cffunction>
		
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		setMaxMessageLength(length): Sets the maximum number of characters that can be sent in a single message
			input: int (length) -> the maximum number of characters that can be sent in a single message
			output: void
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="public" name="setMaxMessageLength" output="false" returntype="void" hint="Sets the maximum number of characters that can be sent in a single message">
		<cfargument name="length" type="numeric" required="yes" hint="the maximum number of characters that can be sent in a single message" />
		<cfset variables.maxlength = arguments.length />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		getCurrentNode: get the current node of the tree.
			output: menunode
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="public" name="getCurrentNode" output="false" returntype="menuNode" hint="return the current level node.">
		<cfreturn variables.currentNode>
	</cffunction>	
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		enableDebug(booelan): Enable debugging statements
			input: Boolean (debug) -> Determines whether or not to display debug statments
			output: void
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="public" name="enableDebug" output="false" returntype="void" hint="Enable debugging statements">
		<cfargument name="debug" type="boolean" required="yes" hint="Determines whether or not to display debug statments" />
		<cfset variables.debug = arguments.debug />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		back(): navigates up one node in the tree
			input: none
			output: menuNode -> the node that the user is currently in
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="private" name="goBack" output="false" returntype="menuNode" hint="navigates up one node in the tree">
		<cfif NOT isSimpleValue(variables.currentNode.getParent())>
			<cfset variables.currentNode = variables.currentNode.getParent() />
		</cfif>
		<cfreturn variables.currentNode />
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		navigate(String): navigates the user to the specified node in the tree
			input: String (str) -> the key of the node to navigate to
			output: void
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="private" name="navigate" output="true" returntype="void" hint="navigates the user to the specified node in the tree">
		<cfargument name="str" type="string" required="yes" hint="the key of the node to navigate to" />

		<cfscript>
			// println("navigate(" & str & ")");
			if (str EQ "B")
			{
				goBack();
				return;
			}
			else if (variables.currentNode.isLeaf())
			{
				return;
			}
			
			found = false;
			aChildren = variables.currentNode.getChildren();
			for(i = 1; i LTE arrayLen(aChildren); i = i + 1)
			{
				if (aChildren[i].getKey() EQ arguments.str)
				{
					variables.currentNode = aChildren[i];
					break;
				}
			}
		</cfscript>
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		displayMenu(): Produces a navigation string based on the current node
						that the user is in.
			input: none
			output: String -> valid navigation options for the user
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="private" name="displayMenu" output="true" returntype="string" hint="Produces a navigation string based on the current node that the user is in.">
		<cfscript>
			returnString = variables.returnChar;
			aChildren = variables.currentNode.getChildren();
			for(i = 1; i LTE arrayLen(aChildren); i = i + 1)
			{
				returnString = returnString & aChildren[i].getKey() & " - " & aChildren[i].getName() & variables.returnChar;
			}
			if (NOT isSimpleValue(variables.currentNode.getParent()))
				returnString = returnString & "B - Back" & variables.returnChar;
			else if (isdefined("variables.greeting"))
				returnString = variables.greeting & variables.returnChar & returnString;
		</cfscript>
		<cfreturn returnString />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		validate(String): determines if the passed in string is a valid navigation key
			input: String (str) -> user entered string that will be checked to see
							 if it is a valid navigation key
			output: boolean -> determination of the validity of the passed in key
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="private" name="validate" output="true" returntype="boolean" hint="determines if the passed in string is a valid navigation key">
		<cfargument name="str" type="string" required="yes" />
		<cfscript>
			found = false;
			aChildren = variables.currentNode.getChildren();
			for(i = 1; i LTE arrayLen(aChildren); i = i + 1)
			{
				if (aChildren[i].getKey() EQ arguments.str)
				{
					found = true;
					break;
				}
			}
			
			if (NOT found AND str EQ "B")
				found = true;
		</cfscript>
		<cfreturn found />
	</cffunction>
	
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		process(String, String, String, String): 
			input: 
				String (message) -> 
				String (message_from) -> 
				String (message_to) -> 
				String (networkInfo) -> 
			output: void
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction access="public" name="process" output="true" returntype="void">
		<cfargument name="message" required="yes" default="" />
		<cfargument name="message_from" required="no" default="" />
		<cfargument name="message_to" required="no" default="" />
		<cfargument name="networkInfo" required="no" default="" />
		<cfargument name="invokeEnter" required="no" default="true" />

		<cfset var str = "" />
		

		<cfscript>
			println("++++++++++++++++++++++++++++++++++++++");
			println("RECEIVED MESSAGE");
			println("message: " &arguments.message);
			println("from: " &arguments.message_from);
			println("to: " &arguments.message_to);
		</cfscript>

		
		<cfscript>
			// check to see if the command is a valid menu option based on the user's current location
			if (validate(arguments.message))
			{
				// make sure that the buffer is cleared
				variables.aStringBuffer = arrayNew(1);
				
				navigate(arguments.message);
				if (variables.currentNode.isLeaf())
				{
					// invoke the "enter" method to see if the application sends something back on first entery
					if( variables.currentNode.isEnterMode() )
					{
						str = trim(variables.currentNode.invokeCFC(message=arguments.message, message_from=arguments.message_from, message_to=arguments.message_to, networkInfo=arguments.networkInfo, method="enter"));
					}
					else
					{
						str = trim(variables.currentNode.invokeCFC(message=arguments.message, message_from=arguments.message_from, message_to=arguments.message_to, networkInfo=arguments.networkInfo, method=variables.currentNode.getMethod()));
						goBack();
					}
					// the app has sent something back so send it to the user
					if (len(str) neq 0)
					{
						str = reReplace(str, "<br>", variables.returnChar, "all");
						if (len(str) GTE variables.maxlength)
						{
							// chunk the string into an array
							variables.aStringBuffer = arrayNew(1);
							for (i = 1; i LTE evaluate(len(str) / variables.maxlength + 1); i = i + 1)
							{
								arrayAppend(variables.aStringBuffer, Mid(str, i*variables.maxlength-variables.maxlength+1, variables.maxlength));
							}
	
							upperLoop = min(arrayLen(variables.aStringBuffer), variables.max);
							for (i = 1; i LTE upperLoop; i = i + 1)
							{
								sendMessage(variables.aStringBuffer[1], message_to, message_from, networkInfo);
								ArrayDeleteAt(variables.aStringBuffer, 1);
							}
							
							if (arrayLen(variables.aStringBuffer) NEQ 0)
							{
								sendMessage('"M"ore', arguments.message_to, arguments.message_from, arguments.networkInfo);
							}
						}
						else
						{
							sendMessage(str, arguments.message_to, arguments.message_from, arguments.networkInfo);
						}
					}
					// the app did not return anything from enter() so inform the user that they have entered the app
					else 
					{
						sendMessage("Entering " & variables.currentNode.getName(), arguments.message_to, arguments.message_from, arguments.networkInfo);
					}
					
				}
				else
				{
					sendMessage(displayMenu(), arguments.message_to, arguments.message_from, arguments.networkInfo);
				}
			}

			// if the user has entered an application from the menu pass on the request to the registered CFC
			else if (variables.currentNode.isLeaf())
			{
				// check if the user is requesting more from the previous session
				if (arrayLen(variables.aStringBuffer) NEQ 0 AND left(arguments..message, 1) EQ "M")
				{
					upperLoop = min(arrayLen(variables.aStringBuffer), variables.max);
					for (i = 1; i LTE upperLoop; i = i + 1)
					{
						sendMessage(variables.aStringBuffer[1], arguments.message_to, arguments.message_from, arguments.networkInfo);
						ArrayDeleteAt(variables.aStringBuffer, 1);
					}
					
					if (arrayLen(variables.aStringBuffer) NEQ 0)
					{
						sendMessage('"M"ore', arguments.message_to, arguments.message_from, arguments.networkInfo);
					}
				}
				else 
				{
					str = trim(variables.currentNode.invokeCFC(message=arguments.message, message_from=arguments.message_from, message_to=arguments.message_to, networkInfo=arguments.networkInfo));
					str = reReplace(str, "<br>", variables.returnChar, "all");
					if (len(str) GTE variables.maxlength)
					{
						// chunk the string into an array
						variables.aStringBuffer = arrayNew(1);
						for (i = 1; i LTE evaluate(len(str) / variables.maxlength + 1); i = i + 1)
						{
							arrayAppend(variables.aStringBuffer, Mid(str, i*variables.maxlength-variables.maxlength+1, variables.maxlength));
						}

						upperLoop = min(arrayLen(variables.aStringBuffer), variables.max);
						for (i = 1; i LTE upperLoop; i = i + 1)
						{
							sendMessage(variables.aStringBuffer[1], arguments.message_to, arguments.message_from, arguments.networkInfo);
							ArrayDeleteAt(variables.aStringBuffer, 1);
						}
						
						if (arrayLen(variables.aStringBuffer) NEQ 0)
						{
							sendMessage('"M"ore', arguments.message_to, arguments.message_from, arguments.networkInfo);
						}
					}
					else
						sendMessage(str, arguments.message_to, arguments.message_from, arguments.networkInfo);
				}
			}
			// unknown command and the user is not in an application so just show the current location in the menu system
			else
			{
				sendMessage(displayMenu(), arguments.message_to, arguments.message_from, arguments.networkInfo);
			}
		</cfscript>
		
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		sendMessage(String): sends the passed in string back to the gateway
			input: 
				String (message) -> message to send to gateway client
				String (message_from) -> which client the message is being sent from
				String (message_to) -> client that the message is being sent to
				String (networkInfo) -> 
			output: void
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="private" name="sendMessage" output="false" returntype="void" hint="sends the passed in string back to the gateway">
		<cfargument name="message" type="string" required="yes" hint="message to send to gateway client" />
		<cfargument name="message_from" type="string" required="yes" hint="which client the message is being sent from" />
		<cfargument name="message_to" type="string" required="yes" hint="client that the message is being sent to" />
		<cfargument name="networkInfo" type="string" required="yes" />
		
		<cfscript>	
			println("++++++++++++++++++++++++++++++++++++++");
			if (variables.type EQ "IM")
			{
				println("SENDING IM");
				mesg = structNew();
				mesg.command = "submit";
				mesg.buddyID = arguments.message_to;
				mesg.message = arguments.message;
				sendGatewayMessage(variables.gatewayID, mesg);
			}
			else if (variables.type EQ "SMS")
			{
				println("SENDING SMS");
				mesg = structNew();
				mesg.command = "submit";
				mesg.sourceAddress = arguments.message_from;
				mesg.destAddress = arguments.message_to;
				mesg.shortMessage = arguments.message;
				sendGatewayMessage(variables.gatewayID, mesg);
			}
			else if (variables.type EQ "Socket")
			{
				println("SENDING Socket Msg");
				mesg = structNew();
				mesg.MESSAGE = arguments.message;
				mesg.OriginatorID = arguments.message_to;
				sendGatewayMessage(variables.gatewayID, mesg);
			}
			else
			{
				println("Don't know how to send the message: unknown TYPE");
			}
			
			println("SENT MESSAGE");
			println("GatewayId: " & variables.gatewayID);
			println("message: " &arguments.message);
			println("to: " &arguments.message_to);
			println("from: " &arguments.message_from);
			
		</cfscript>
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		dumpTree(): debug method that returns a string that represents the menu tree
			input: void
			output: String -> string representation of the menu tree
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="public" name="dumpTree" output="false" returntype="string" hint="debug method that returns a string that represents the menu tree">
		<cfreturn variables.rootNode.dumpTree() />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		println(String): debug method used to pipe information into a log file
			input: String (str) -> string to be sent to the log file
			output: void
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="private" name="println" output="true" returntype="void" hint="debug method used to pipe information into a log file">
		<cfargument name="str" type="string" required="yes" hint="string to be sent to the log file" />
		<cflog text="#arguments.str#" type="Information" file="cfc_menu" application="yes" />
	</cffunction>
</cfcomponent>