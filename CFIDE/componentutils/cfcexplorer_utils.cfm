<cfscript>

/*
 * CheckCache: Checks the cache for our value, and the timeout stamp. If the value
 * exists, and has not timed out, we return true. If the value exists and is timed
 * out, we kill the old value and return false. If the value doesn't exist, we return
 * false. We also do a check to make sure server.CACHE_ROOT exist
 *
 * WARNING!! This UDF reads/writes to server scope w/o locking. I am assuming we will
 * be able to lock soon.
 *
 * @param cacheName		The name of the cache to check for
 * @return				Returns true or false
*/
function checkCache( cacheName ) {

 	val = "";
	if(NOT CACHE_ENABLED) return false;
 	if(NOT structKeyExists(server,CACHE_ROOT)) {
		server[CACHE_ROOT] = structNew();
		return false;
	}

	if(structKeyExists(server[CACHE_ROOT],cacheName)) {
		val = server[CACHE_ROOT][cacheName];
		if(DateCompare(Now(), val.dtTimeOut) IS 1) {
			structDelete(server[CACHE_ROOT],cacheName);
			return false;
		} else return true;
	}
	return false;
}

/*
 * GetCache - Returns the value for a cached item
 *
 * WARNING!! This UDF reads/writes to server scope w/o locking. I am assuming we will
 * be able to lock soon.
 *
 * @param cacheName		The name of the cache to check for
 * @return				Returns the value
*/
function getCache( cacheName ) {

 	val = "";
	if(NOT CACHE_ENABLED) return false;
 	if(NOT structKeyExists(server,CACHE_ROOT)) {
		server[CACHE_ROOT] = structNew();
	}
	if(structKeyExists(server[CACHE_ROOT],cacheName)) {
		val = server[CACHE_ROOT][cacheName];
		return duplicate(val.content);
	}
	return false;
}

/*
 * SetCache - Sets a value in the cache
 *
 * WARNING!! This UDF reads/writes to server scope w/o locking. I am assuming we will
 * be able to lock soon.
 *
 * @param cacheName		The name of the cache to check for
 * @param val			The value to cache
 * @return				Returns true
*/
function setCache( cacheName, val ) {

 	cache = structNew();
	if(NOT CACHE_ENABLED) return false;
 	if(NOT structKeyExists(server,CACHE_ROOT)) {
		server[CACHE_ROOT] = structNew();
	}
	cache.dtTimeout = DateAdd("n",CACHE_TIMEOUT, Now());
	cache.content = val;
	server[CACHE_ROOT][cacheName] = duplicate(cache);
	return true;
}

/*
 * NormalizePath - returns path with all forward slashes
 * without a trailing slash
 *
 * @param path 	physical path
 * @return		physical path with all forward slashes and without trailing slash
*/
function NormalizePath( path ) {
	path = Replace( path, '\', '/', 'ALL' ) ;
	if ( Right(path,1) eq '/' )
		return RemoveChars( path, Len(path), 1 ) ;
	else
		return path ;
}

/*
 * browseForComponents - fills component struct in the caller with
 * component info for components found under specified dir
 *
 * @param package		package name of the current directory
 * @param dir			java file object of the current directory
 * @param cfcRoot		root where we started search - used as a key in component struct
 * @param ignoreShadowedPackages	if true, all packages that match already browsed packages
 *						are ignored
 * @return				void
*/
function browseForComponents ( package, dir, cfcRoot, ignoreShadowedPackages ) {

	var i = 1;
	var file = "";
	var name ="";
	var isShadowed = false;
	var componentName = "";
	var packagePrefix = '' ;
	var fileNames = "" ;
	var dirPath = "" ;
	var isAuthorized = true;
	factory = CreateObject("java", "coldfusion.server.ServiceFactory");
	security = factory.getSecurityService();

	isShadowed = ignoreShadowedPackages and StructKeyExists( packages, package ) ;

	// is this a directory and is it not shadowed?
	if ( dir.exists() and not isShadowed ) {

		packagePrefix = package ;
		if ( packagePrefix neq '' )
			packagePrefix = packagePrefix & "." ;

		dirPath = dir.getPath() & dir.separator ;

		// add it to packages
		packages[package] = '' ;

		// get directoryContent, to optimize the lookup do it
		// thru names
		fileNames = dir.list() ;

		for ( i = 1; isDefined("fileNames") and i lte ArrayLen(fileNames); i=i+1 ) {

			name = fileNames[i] ;

			if ( Find( '.', name ) eq 0 ) {
				// instantiate as java File and check whether it is
				// a directory
				file = CreateObject( "java", "java.io.File" ) ;
				file.init( dirPath & name ) ;
				if(security.isSandboxSecurityEnabled())
				{
					isAuthorized = hasAccessToFolder( dirPath & name );
				}
				if(isAuthorized)
				{
					if ( file.isDirectory() )
					{
						browseForComponents ( packagePrefix & name,
						file, cfcRoot, ignoreShadowedPackages ) ;
					}
				}

			} else if ( ListLast( name, '.' ) eq 'cfc' ) {
				// instantiate as java File and check that it is
				// a file
				file = CreateObject( "java", "java.io.File" ) ;
				file.init( dirPath & name ) ;

				if ( file.isFile() ) {
					componentName = StructNew() ;
					componentName.name = packagePrefix & ListFirst( name, '.' ) ;
					componentName.path = Replace( file.getPath(), '\', '/', 'ALL' ) ;
					componentName.package = package ;
					componentName.cfcroot = cfcroot ;
					components[componentName.name] = componentName ;
				}
			}
		}

	}
}

/*
 * hasAccessToFolder -  returns true if the current logged in user has access to the specific file.
 *
 * @param filename		name of the file
 * @return				boolean
*/
function hasAccessToFolder(filename)
{
	var fileObj = CreateObject("java", "java.io.File").init(javacast("string", filename));
	var userid = getCurrentUser();
	factory = CreateObject("java", "coldfusion.server.ServiceFactory");
	security = factory.getSecurityService();
	if(security.getRootAdminUserId() eq userid)
	{
		return true;
	}
	else
	{
		authuser = security.getAuthorizedUser(userid);
		return authuser.getAuthorizedFolders().isAuthorized(fileObj);
	}
}

/*
 * getCurrentUser -  returns the id of the current logged in user
 *
 * @return	string
*/

function getCurrentUser()
{
	userutils = createObject("java", "coldfusion.security.UserUtils");
	userid = userutils.getAuthUser();
	return userid;

}
</cfscript>


