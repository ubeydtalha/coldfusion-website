<cfcomponent displayname="menuNode">

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		default constructor code used to make sure that variables exists
		if the user does not call init()
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cfscript>
		// constructor code
		// Parent and children
		variables.parent = "";
		variables.children = arrayNew(1);
		variables.key = "";
		variables.name = "";
		variables.cfc = "";
		variables.method= "";
		variables.mode= "enter";
	</cfscript>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		init(String, String, String, String): call this method as a default constructor
			input: 
				String (name) -> menu node name that is displayed
				String (key) -> char that is used to access this node
				String (cfc) -> path to CFC that will be invoked when this node is selected
				Stirng (method) -> method to invoke on the CFC
			output: the created instance of the menuNode CFC
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction access="public" name="init" output="true" returntype="menuNode" hint="call this method as a default constructor">
		<cfargument name="name" type="string" required="yes" default="" hint="menu node name that is displayed" />
		<cfargument name="key" type="string" required="no" default="" hint="char that is used to access this node" />
		<cfargument name="cfc" type="string" required="no" default="" hint="path to CFC that will be invoked when this node is selected" />
		<cfargument name="method" type="string" required="no" default="" hint="method to invoke on the CFC" />
		<cfargument name="mode" type="string" required="no" default="enter" hint="automatically invoke the enter method for this node" />
		<cfscript>
			// Parent and children
			variables.parent = "";
			variables.children = arrayNew(1);
			variables.name = arguments.name;
			variables.key = arguments.key;
			variables.cfc = arguments.cfc;
			variables.method= arguments.method;
			variables.mode= arguments.mode;
		</cfscript>
		<cfreturn this />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		getParent(): returns the parent of the menuNode
			input: none
			output: menuNode -> the parent menuNode of this menuNode
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction name="getParent" access="public" returntype="any" output="false" hint="returns the parent of the menuNode">
		<cfreturn variables.parent />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		setParent(menuNode): sets the parent of this node to the passed in node
			input: menuNode (newParent) -> menuNode that is the parent of this node
			output: void
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction name="setParent" access="public" output="false" returntype="void" hint="sets the parent of this node to the passed in node">
		<cfargument name="newParent" type="any" required="yes" hint="menuNode that is the parent of this node" />
		<cfset variables.parent = newParent />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		isRoot(): check to see if this node is the root node
			input: none
			output: boolean -> whether or not this node is the root node
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction name="isRoot" access="public" returntype="boolean" output="false" hint="check to see if this node is the root node">
		<cfif isSimpleValue(variables.parent)>
			<cfreturn false />
		<cfelse>
			<cfreturn true />
		</cfif>
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		isLeaf(): check to see if this node is a leaf node (no children)
			input: none
			output: boolean -> whether or not this node is a leaf node
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction name="isLeaf" access="public" returntype="boolean" output="false" hint="check to see if this node is a leaf node (no children)">
		<cfif arrayLen(variables.children) NEQ 0>
			<cfreturn false />
		<cfelse>
			<cfreturn true />
		</cfif>
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		isEnterMode(): check to see if this node should execute the default enter method, 
						useful for nodes that need the user to enter data.
			input: none
			output: boolean -> whether or not this node is a leaf node
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="isEnterMode" access="public" returntype="boolean" output="No">
		<cfif variables.mode eq "enter">
			<cfreturn true>
		</cfif>
		<cfreturn false>
	</cffunction>
	
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		addChild(menuNode, String, String, String, String): 
				adds the specified menuNode as a child or creates a node with the
				specified information
			input: 
				menuNode (newNode) -> existing menuNode to add as a child
				String (name) -> menu node name that is displayed
				String (key) -> char that is used to access this node
				String (cfc) -> path to CFC that will be invoked when this node is selected
				Stirng (method) -> method to invoke on the CFC
			output: menuNode -> the menuNode that was added as a child
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction name="addChild" access="public" output="true" returntype="menunode" hint="adds the specified menuNode as a child or creates a node with the specified information">
		<cfargument name="newNode" type="any" required="no" hint="existing menuNode to add as a child" />
		<cfargument name="name" type="string" required="no" hint="menu node name that is displayed" />
		<cfargument name="key" type="string" required="no" default="" hint="char that is used to access this node" />
		<cfargument name="cfc" type="string" required="no" default="" hint="path to CFC that will be invoked when this node is selected" />
		<cfargument name="method" type="string" required="no" default="" hint="method to invoke on the CFC" />
		<cfargument name="mode" type="string" required="no" default="enter" hint="automatically invoke the enter method for this node" />
		<cfscript>
			if (isDefined("name"))
			{
				newNode = createObject("component", "CFIDE.componentutils.gatewaymenu.menunode").init(name=arguments.name, key=arguments.key, cfc=arguments.cfc, method=arguments.method, mode=arguments.mode);
			} 
			newNode.setParent(this);
			arrayAppend(children, newNode);
   		</cfscript>
		<cfreturn newNode />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		getChildren(): returns an array of child menuNodes
			input: none
			output: menuNode[] -> array of menuNodes
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction name="getChildren" access="public" output="false" returntype="array" hint="returns an array of child menuNodes">
		<cfreturn variables.children />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		getKey(): returns the single character key for this node
			input: none
			output: String -> key that is used to access this menuNode
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction name="getKey" access="public" output="false" returntype="string" hint="returns the single character key for this node">
		<cfreturn variables.key />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		setKey(String): sets the single character key for this node
			input: String (newKey) -> key that is used to access this menuNode
			output: void
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction name="setKey" access="public" output="false" returntype="void" hint="sets the single character key for this node">
		<cfargument name="newKey" type="string" required="yes" default="" hint="key that is used to access this menuNode" />
		<cfset variables.key = newKey>
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		getName(): returns the display name for this node
			input: none
			output: String -> the display name for this menuNode
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction name="getName" access="public" output="false" returntype="string" hint="returns the display name for this node">
		<cfreturn variables.name />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		setName(String): sets the display name for this node
			input: String (newName) -> display name that is used for this menuNode
			output: void
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction name="setName" access="public" output="false" hint="sets the display name for this node">
		<cfargument name="newName" type="string" required="yes" default="" hint="display name that is used for this menuNode">
		<cfset variables.name = newName />
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		getName(): returns the CFC method to invoke for this node
			input: none
			output: String -> the display name for this menuNode
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction name="getMethod" access="public" output="false" returntype="string" hint="returns the display name for this node">
		<cfreturn variables.method />
	</cffunction>

	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		invokeCFC(): invokes the CFC that is tied to this menuNode
			input: none
			output: String -> the return string from the CFC that was invoked
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="public" name="invokeCFC" output="true" returntype="string" hint="invokes the CFC that is tied to this menuNode">
		<cfargument name="message" required="yes" default="" />
		<cfargument name="message_from" required="no" default="" />
		<cfargument name="message_to" required="no" default="" />
		<cfargument name="networkInfo" required="no" default="" />
		<cfargument name="method" required="no" default="" />
				
		<cfif len(arguments.method) EQ 0>
			<cfinvoke component="#variables.cfc#" method="#variables.method#" returnvariable="str">
				<cfinvokeargument name="message" value="#arguments.message#" />
				<cfinvokeargument name="message_from" value="#arguments.message_from#" />
				<cfinvokeargument name="message_to" value="#arguments.message_to#" />
				<cfinvokeargument name="networkInfo" value="#arguments.networkInfo#" />
			</cfinvoke>
		<cfelse>
			<cfinvoke component="#variables.cfc#" method="#arguments.method#" returnvariable="str">
				<cfinvokeargument name="message" value="#arguments.message#" />
				<cfinvokeargument name="message_from" value="#arguments.message_from#" />
				<cfinvokeargument name="message_to" value="#arguments.message_to#" />
				<cfinvokeargument name="networkInfo" value="#arguments.networkInfo#" />
			</cfinvoke>
		</cfif>

		<cfreturn str />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		dumpTree(): debug method that displays the menu tree
			input: void
			output: String -> string representation of the menu tree
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="public" name="dumpTree" output="true" returntype="string" hint="debug method that displays the menu tree">
		<cfargument name="level" default="0" />
		<cfscript>
			returnString = repeatString("----", level) &"(" & getKey() & ") " & getName() & "<br/>";
			aChildren = getChildren();
			for(i = 1; i LTE arrayLen(aChildren); i = i + 1)
			{
				returnString = returnString & aChildren[i].dumpTree(level+1);
			}
		</cfscript>
		<cfreturn returnString />
	</cffunction>

</cfcomponent>