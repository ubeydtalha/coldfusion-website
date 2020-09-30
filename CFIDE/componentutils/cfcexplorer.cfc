<!--- 
* Copyright 2003-2006 Adobe Macromedia Software LLC. All rights reserved.
--->
<cfcomponent>
<cfsetting enablecfoutputonly="yes" showdebugoutput="no">

	<!--- where we store our data in the server scope --->
	<cfset CACHE_ROOT = "cfc">
	<!--- cache time out in minutes --->
	<cfset CACHE_TIMEOUT = 30>
	<!--- do we even use the cache? --->
	<cfset CACHE_ENABLED = TRUE>
	
	<cfinclude template="cfcexplorer_utils.cfm">

	<cffunction name="getComponentRoots" returnType="array" access="remote"
		hint="Returns array of component root directories. Each root directory is specified by its physical path using forward slashes a no trailing slash.">

		<cfscript>
			var authorizedFolders = "";
			var file = "";
			
			factory = CreateObject("java", "coldfusion.server.ServiceFactory");
			runtime = factory.getRuntimeService();
			security = factory.getSecurityService();
			customTagRoots = runtime.getCustomtags();
			mappings = runtime.getMappings() ;
						
			roots = ArrayNew(1) ;
			
			// add first all cf virtual directories in descendent order, this will
			// help preserve resolution precedence
			skipWebroot = false ;
			virtualDirs = StructKeyArray(mappings) ;
			ArraySort( virtualDirs, "TEXTNOCASE", "DESC" ) ;
			for ( i=1; i lte ArrayLen(virtualDirs); i=i+1 ) {
				prefix = NormalizePath( virtualDirs[i] );
				prefix = Replace( prefix, '/', '.', 'ALL' ) ;
				if ( Find( '.', prefix ) eq 1 )
					prefix = RemoveChars( prefix, 1, 1 ) ;
				if ( prefix eq '' and not skipWebroot )
					skipWebroot = true ;
			
				root = StructNew() ;
				root.prefix = prefix  ;
				root.physicalPath = NormalizePath( mappings[virtualDirs[i]] ) ;
				// for multiuser logins, check if the current user has access to folders
				if(security.isSandboxSecurityEnabled())
				{
					if(hasAccessToFolder(root.physicalPath))
					{
						ArrayAppend(roots, root);
					}
				}
				else
				{
					ArrayAppend(roots,root);
				}
				
			}
			
			// add webroot
			if ( not skipWebroot ) {
				temp = 'abcdefghijklmno.abcdefghijklmno' ; // temporary hack for IIS
				webroot = Replace(expandPath('/' & temp ), temp, '') ;
				root = StructNew() ;
				root.prefix = '' ;
				root.physicalPath = NormalizePath( webroot ) ;
				// for multiuser logins, check if the current user has access to folders
				if(security.isSandboxSecurityEnabled())
				{
					if(hasAccessToFolder(root.physicalPath))
					{
						ArrayAppend(roots, root);
					}
				}
				else
				{
					ArrayAppend(roots,root);
				}
			}
			
			// get custom tag roots
			installationRoot = Replace( server.coldfusion.rootdir, '\', '/', 'ALL' ) ;
			for ( ctRoot in customTagRoots ) {
				root = StructNew() ;
				root.prefix = '' ;
				// temporary workaround
				root.physicalPath = NormalizePath( 
					Replace( CustomTagRoots[ctRoot], "##server.coldfusion.rootdir##", installationRoot ) ) ;
				// for multiuser logins, check if the current user has access to folders
				if(security.isSandboxSecurityEnabled())
				{
					if(hasAccessToFolder(root.physicalPath))
					{
						ArrayAppend(roots, root);
					}
				}
				else
				{
					ArrayAppend(roots,root);
				}
			}
			return roots ;
		</cfscript>
	</cffunction>
	
	<cffunction name="getcfcs" returnType="array" access="remote"
		hint="Returns array of component metadata structs. Each metadata struct contains: <ul><li>name - full component name</li><li>package - package name</li><li>path - physical path of the component with forward slashes</li><li>cfcroot - physical path of the root under which this component was found (all forward slashes, no trailing slash). If sandbox security is enabled, only those components that are present in the sandboxes accessible to the user are retrieved.</li></ul>">

		<cfargument name="refreshCache" type="boolean" default="no">

		<cfscript>
			var key = "";
			factory = CreateObject("java", "coldfusion.server.ServiceFactory");
			security = factory.getSecurityService();
			if(security.isSandBoxSecurityEnabled())
			{
				key = "getcfcs"&getCurrentUser();
			}
			else
			{
				key = "getcfcs";
			}
			readFromCache = checkCache(key) and not refreshCache ;
	
			if ( readFromCache ) {
				return getCache(key) ;
				
			}
			else {
				roots = getComponentRoots() ;

				components = StructNew() ;
				packages = StructNew() ;				
				ignoreShadowedPackages = true ;
				
				for ( i=1; i lte ArrayLen( roots ); i=i+1 ) {

					root = CreateObject( "java", "java.io.File" ) ;
					root.init( roots[i].physicalPath ) ;
					browseForComponents( roots[i].prefix, root, roots[i].physicalPath, ignoreShadowedPackages ) ;

					// toggle the switch once we passed the web root (first root without
					// the package prefix
					if ( ignoreShadowedPackages and roots[i].prefix eq '' )
						ignoreShadowedPackages = false ;

				}
				
				result = ArrayNew(1) ;
				for ( name in components ) {
					ArrayAppend( result, components[name] ) ;
				}
				
				setCache(key, result) ;
				
				return result ;
			}
		</cfscript>

	</cffunction>
	
	
	<cffunction name="getcfcsinmcdl" returnType="struct" output="false" access="remote"
		hint="Returns associative array (struct) where keys are full component names and values are MCDL documents representing the components. If sandbox security is enabled, the struct contains the keys (component names) that are present in the sandboxes that can be accessed by the current user.">

		<cfargument name="refreshCache" type="boolean" default="no" />

 		<!--- check to see if we have a cached version --->
		<cfset readCache = checkCache("getcfcsinmcdl") and not refreshcache>
		<cfif readCache>
			<cfset result = getCache("getcfcsinmcdl")>
		<cfelse>
			<cfset mcdl_struct = structNew()>
			<cfset cfcs = getcfcs(refreshCache)>
			<cfloop index="x" from=1 to="#arrayLen(cfcs)#">
				<cfset error = structNew()>
				
				<cftry>
					<cfset mcdl = getcfcinmcdl( cfcs[x].name )>
					<cfcatch>
						<cfset error = cfcatch>
						<cfset mcdl = "">
					</cfcatch>
				</cftry>

				<cfif structIsEmpty(error)>
					<cfset mcdl_struct[cfcs[x].name] = trim(mcdl)>
				<cfelse>
					<cfset tempError = structnew()>
					<cfset tempError.Name = error.message>
					<cfset mcdl_struct[cfcs[x].name] = tempError>
				</cfif>
			
			</cfloop>
			<cfset result = mcdl_struct>
			<cfset setCache("getcfcsinmcdl", result)>
			
		</cfif>
	
		<cfreturn result>

	</cffunction>
	
	<cffunction name="getCFCMetaData" returnType="struct" output="no" access="remote"
		hint="Returns MCDL document representing the specified component.">

		<cfargument name="name" type="string" required="no" />
		<cfargument name="path" type="string" required="no" />
		
			<cfscript>
				if ( IsDefined('arguments.path') and arguments.path neq '' ) 
				{
					resourcescanonicalpath = createObject("java","java.io.File").init(arguments.path).getCanonicalPath();
					var indexOfCFC = FindNoCase("cfc.",reverse(resourcescanonicalpath));  // "cfc." = reverse(".cfc")
					if (indexOfCFC neq 1)  
					{
						//if path is not a cfc we throw error. 					
						Throw(type="Invalid Data", message="Unsupported file type. Check usage for Component Browser.");						
					}
					
					// we are trimming the extension if provided with path. because of
					// 76373. We want to use GetComponentMetadata method as it gives advantage 
					// over GetMetadata, in terms of not initializing the object to get metadata.
					// but Flex builder request come to call this method directly which have .cfc appended in the path.
					var trimmedPath = HTMLEditFormat(arguments.path);
					var indexOfCFC = FindNoCase("cfc.",reverse(trimmedPath));  // "cfc." = reverse(".cfc")
					if (indexOfCFC eq 1)  // trimmedPath ends with .cfc
					{
						trimmedPath = Left(trimmedPath, len(trimmedPath) - 4);  // Remove .cfc
					}
					return getComponentMetaData(trimmedPath);	
				} 
				else if( isDefined('arguments.name') )
				{
					//This name should be a fully qualified name.
					return getComponentMetaData(HTMLEditFormat(name));					
				}
			</cfscript>
		
	</cffunction>
	
	
	<cffunction name="getcfcinmcdl" returnType="string" output="no" access="remote"
		hint="Returns MCDL document representing the specified component.">

		<cfargument name="name" type="string" required="yes" />
		
		<cfscript>
			comp = CreateObject( "component", name ) ;
			utils = CreateObject( "component", "utils" ) ;
			return utils.cfcToMCDL(comp) ;
		</cfscript>
	</cffunction>
	
	
	<cffunction name="getcfcinhtml" access="remote" returnType="void"
		hint="Generates html descriptor of a component with the specified name or URI path as the http response.">
		<cfargument name="name" type="string" required="yes" />
		<cfargument name="path" type="string" required="no" />
		
		<cftry>
			<cfscript>
				proxy = CreateObject( "java", "coldfusion.runtime.TemplateProxyFactory" ) ;
				if ( IsDefined('arguments.path') and arguments.path neq '' ) {
					resourcescanonicalpath = createObject("java","java.io.File").init(arguments.path).getCanonicalPath();
					var indexOfCFC = FindNoCase("cfc.",reverse(resourcescanonicalpath));  // "cfc." = reverse(".cfc")
					if (indexOfCFC neq 1)  
					{						
						//if path is not a cfc we throw error. 					
						Throw(type="Invalid Data", message="Unsupported file type. Check usage for Component Browser.");						
					}else
					{
						// When using createObject, path should not contain file extension. We will trim extension here.
						//  reverse string to find last index of "."
						newpath = arguments.path;
						revstr = reverse(arguments.path);
						index = Find(".", revstr);
						if(index != 0)
						{
							// if found, take string from next character to this "." and then reverse to get path
							newpath = mid(revstr,index+1, len(arguments.path));
							newpath = reverse(newpath);
						}
						
						comp = proxy.ResolvePath( HTMLEditFormat(arguments.path), getPageContext() ) ;
					}
				} else {
					comp = proxy.resolveName(HTMLEditFormat(name),getPageContext());
				}
				if(!proxy.isComponentOrInterface(comp)){
					Throw(type="Invalid Data", message="Unsupported file type. Check usage for Component Browser.");
				}
				proxy.verifyInterfaceImplementation(comp,getPageContext());
				
				utils = CreateObject( "component", "utils" ) ;
				WriteOutput( utils.cfcToHTML(comp) ) ;
			</cfscript>
		<cfcatch type="coldfusion.runtime.CfJspPage$NoSuchTemplateException">
			<cfoutput><h4>Component not found</h4>
			The component definition file for component '#HTMLEditFormat(name)#' <cfif IsDefined('arguments.path') and arguments.path neq '' > and path '#HTMLEditFormat(arguments.path)#'  </cfif>cannot be found on this server.</cfoutput>
		</cfcatch>
		<cfcatch type="any">
			<cfrethrow>
		</cfcatch>
		</cftry>
	</cffunction>


	<cffunction name="getcfctree" returnType="struct" access="remote"
		hint="Returns associative array (struct) where keys are physical paths for each component root and values are associative arrays of packages found under each root. Each associative array of packages is a struct where keys are package names and values are arrays of short component names belonging to a package. If sandbox security is enabled, the returned struct contains the keys (component roots) that are present in the folders that can be accessed by the current user.</li></ul>">

		<cfargument name="refreshCache" type="boolean" default="no"  />

		<cfscript>
			tree = StructNew() ;

			cfcs = getcfcs(refreshCache) ;

			roots = getcomponentroots() ;
			for ( i=1; i lte ArrayLen(roots); i=i+1 ) {
				tree[roots[i].physicalPath] = StructNew() ;
			}

			for ( i=1; i lte ArrayLen(cfcs); i=i+1 ) {
				cfc = cfcs[i] ;
				if ( StructKeyExists( tree, cfc.cfcroot ) ) {
					if ( not StructKeyExists( tree[cfc.cfcroot], cfc.package ) ) {
						// add new package to the package struct
						tree[cfc.cfcroot][cfc.package] = ArrayNew(1) ;
					}
					ArrayAppend( tree[cfc.cfcroot][cfc.package], ListLast( cfc.name, '.' ) ) ;
				}
			}
			
			return tree ;
		</cfscript>
		
	</cffunction>
	


	<cffunction name="exists" returnType="boolean" output="no" access="remote"
		hint="Returns true if component with specifed name exists, false otherwise. This method always refreshes the internal cfc cache. If sandbox security is enabled, this function checks for the availability of components in the sandboxes that the current user has access to.">

		<cfargument name="name" type="string" required="yes" />

		<cfscript>
			cfcs = getcfcs(true) ;
		
			for ( i=1; i lte ArrayLen(cfcs); i=i+1 ) {
				if ( cfcs[i].name eq name )
					return true ;
			}
			
			return false ;
		</cfscript>

	</cffunction>

<cfsetting enablecfoutputonly="no"></cfcomponent>