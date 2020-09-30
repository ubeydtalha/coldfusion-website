<cfscript>
	function GetAncestors(cd) {
		var ancestors = ArrayNew(1);
		if ( StructKeyExists( cd, 'extends' ) )
			ancestors = GetAncestors( cd.extends ) ;
		
		ArrayAppend( ancestors, cd ) ;
		
		return ancestors ;
	
	}

	/**
	*	Gets ancestors (interfaces) from given interface metadata
	*	It only get direct ancestors.
	*
	*	@param cd Meta data of the interface whose ancestors are to be obtained.
	*	@returns ancestors - Array of meta data of direct ancestors
	*/	
	function GetInterfaceAncestors(cd) {
		var ancestors = ArrayNew(1);
		
		if (not IsStruct(cd))
			return ancestors;
			
		if (StructKeyExists(cd,'extends')) {
			for (intf in cd.extends)
			{
				ArrayAppend(ancestors,cd.extends[#intf#]);
			}
		} 
		return ancestors;
	}

	/**
	*	Checks if given metadata belongs to interface or component
	* 	
	*	@param cd Metadata of component or interface
	*	@return true if it is an interface else false
	*/
	function IsInterface(cd) {
		if (IsStruct(cd) and StructKeyExists(cd,'type') and cd.type eq "interface")
			return true;
		return false;
	}

	/**
	*	Gets array of only direct imlpemented interfaces.
	
	*	@param cd Metadata of the Component
	*	@return Array of metadata (Struct) of direct implemented interfaces
	*/	
	function GetImplementedInterfaces(cd) {
		var interfaces = ArrayNew(1);
		
		if (not IsStruct(cd)) 
			return interfaces;
			
		if (StructKeyExists(cd,'implements')) {
			for (itf in cd.implements) {
				ArrayAppend(interfaces,cd.implements[#itf#]);
			}
		}
			
		return interfaces;
	}

	function GetMethods(ancestors) {
		
		var methods = StructNew() ;
		var curAncestor = "";
		var curMethod = "";
		
		for ( i=1; i lte ArrayLen(ancestors); i=i+1 ) {
			curAncestor = ancestors[i] ;
			
			if ( StructKeyExists( curAncestor, 'functions' ) )
				for ( j=1; j lte ArrayLen( curAncestor.functions ); j=j+1 ) {
					curMethod = StructNew() ;
					curMethod.metadata = curAncestor.functions[j] ;
					curMethod.implementedIn = curAncestor.name ;
					if ( i eq ArrayLen(ancestors) 								// don't exclude any method 1)from this
						or not StructKeyExists( curMethod.metadata, 'access' ) 	// 2)that does not have 'access' attribute
						or curMethod.metadata.access neq 'private' ) {			// 3)that does not have access='private'
						methods[curmethod.metadata.name] = curMethod ;
					}
				}
		
		}	
		return methods ;
	}
	
	/**
	*	Gets methods of given interface metadata and its parents. Gets methods recursively
	
	*	@param cd - Metadata of an interface
	*	@param methods - Struct of methods obtained so far. 
	*	@param originalInterface - A flag indicating if this method is being called for 
	*							the original interface for which are obtaining methods. 
	*							For recursive calls, this flag is set to false.
	*	@return Struct. Key is method name. Value is a Struct contining metadata of the method,
	*					and name of the interface where it is defined
	*					
	*/
	function GetInterfaceMethods(cd, methods, originalInterface) {
		var curMethod = "";
		
		if (not IsStruct(cd))
			return methods;
			
		if (StructKeyExists(cd,'extends')) {
			for (intf in cd.extends)
			{
				methods = GetInterfaceMethods(cd.extends[#intf#],methods,false);
			}
		} 
				
		if ( StructKeyExists( cd, 'functions' ) ) {
			for ( j=1; j lte ArrayLen( cd.functions ); j=j+1 ) {
				curMethod = StructNew() ;
				curMethod.metadata = cd.functions[j] ;
				curMethod.implementedIn = cd.name ;
				if ( originalInterface 								// don't exclude any method 1)from this
					or not StructKeyExists( curMethod.metadata, 'access' ) 	// 2)that does not have 'access' attribute
					or curMethod.metadata.access neq 'private' ) {			// 3)that does not have access='private'
					methods[curmethod.metadata.name] = curMethod ;
				}
			}//of for (j = 1; j lte ArrayLen(currAncestorchain); j = j+1)
		}
		
		return methods;
	}

	function GetProperties(ancestors) {
		
		var properties = StructNew();
		var curAncestor = "";
		var curProperty = "";
		
		for ( i=1; i lte ArrayLen(ancestors); i=i+1 ) {
			curAncestor = ancestors[i] ;
			
			if ( StructKeyExists( curAncestor, 'properties' ) )
				for ( j=1; j lte ArrayLen( curAncestor.properties ); j=j+1 ) {
					curProperty = StructNew() ;
					curProperty.metadata = curAncestor.properties[j] ;
					curProperty.implementedIn = curAncestor.name ;
					properties[curProperty.metadata.name] = curProperty ;
				}
		
		}	
		return properties ;
	
	}
	
	function GetFullComponentName( name ) {
		var package = "";
		if ( Find( '.', name ) )
			return name ;
		else {
			package = ListDeleteAt( cd.name, ListLen( cd.name, '.' ), '.' ) ;
			return ListAppend( package, name, '.' ) ;
		}
	}

	function GetShortComponentName( name ) {
		var package ="";
		var referencePackage = "";
		if ( Find( '.', name ) ) {
			package = ListDeleteAt( name, ListLen( name, '.' ), '.' ) ;
			referencePackage = ListDeleteAt( cd.name, ListLen( cd.name, '.' ), '.' ) ;
			if ( package eq referencePackage )
				return ListLast( name, '.' ) ;
			else
				return name ;
		} else
			return name ;
	
	}
	
	function GetURLToViewer( fullName, anchor ) {
		var url = '#getpageContext().getRequest().getContextPath()#/CFIDE/componentutils/cfcexplorer.cfc?method=getcfcinhtml&name=' & fullName ;
		if ( anchor neq '' )
			url = url & '&##' & anchor ;
		return url ;
	}
	
	function GetLinkForType( type, captionType ) {
		var caption = "";
		
		if ( ListFindNoCase( 'string,numeric,boolean,date,any,binary,UUID,variableName,query,array,struct,object,guid', type ) )
			return type ;
		else {
			caption = GetShortComponentName( type ) ;
			type = GetFullComponentName( type ) ;
			if ( captionType eq "LONG" )
				caption = type ;
			if ( type eq cd.name )
				return caption ;
			else
				return "<a href=""" & GetURLToViewer( type, '' ) & """>" & caption & "</a>" ;
		}
	}
	
	function GetLinkForMethod( methodName, componentName ) {
		return "<a href=""" & 
			GetURLToViewer( GetFullComponentName(componentName), 'method_' & methodName ) &
			""">" & methodName & "</a>" ;
	}

	// returns path with forward slashes without a trailing slash
	function GetNormalizedPath( path ) {
		path = Replace( path, '\', '/', 'ALL' ) ;
		if ( Right( path, 1 ) eq '/' )
			path = RemoveChars( path, Len(path), 1	 ) ;
		return path ;
	}
	
	// returns true if root is longer (closer to the path) than
	// the closestRoot and if path is under the root
	function IsResolvable( path, root, closestRoot ) {
		return ( Len(root) gt Len(closestRoot )
				and Find( root, path, 1 ) eq 1 ) ;
	}
	
	// returns full component name; 
	// when calling this function path must be resolvable
	function ResolveName( path, root, mapping ) {
		var name = RemoveChars( path, 1, Len(root) ) ; // remove root
		name = Left( name, Len(name) - 4 ) ;	// remove '.cfc'
		name = mapping & name ;			// prepend mapping
		
		// remove leading slash
		if ( Left( name, 1 ) eq '/' )
			name = RemoveChars( name, 1, 1) ;
		
		// convert slashes to dots and return
		return Replace( name, '/', '.', 'ALL' ) ;
	}
</cfscript>