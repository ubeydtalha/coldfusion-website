����  -F 
SourceFile //CFIDE/administrator/datasources/odbcsocket.cfm cfodbcsocket2ecfm139383958  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   ENABLEMAXCONNECTIONS_TITLE Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   GETNEWDSNDEFAULTS   	   FORMATJDBCURL   	    UPDATEODBCSERVERDSN " " 	  $ MAINTAINCONNECTIONS_TITLE & & 	  ( SHOWADVANCEDSETTINGS * * 	  , USETRUSTEDCONNECTION_TITLE . . 	  0 PASSWORD_TITLE 2 2 	  4 CFCATCH 6 6 	  8 TIMESTAMPASSTRING : : 	  < TOKEN > > 	  @ GETCFSETTINGDEFAULTS B B 	  D DSN F F 	  H LOGONMETHOD J J 	  L STDSN N N 	  P USERNAME_TITLE R R 	  T TIMEOUT V V 	  X QODBC Z Z 	  \ TIMEOUT_TITLE ^ ^ 	  ` GETDRIVERDEFAULTS b b 	  d KEY f f 	  h INTERVAL_TITLE j j 	  l DSN_NAME n n 	  p 
DRIVER_ERR r r 	  t ODBC_DSN_TIP v v 	  x I z z 	  | CHECKCSRFTOKEN ~ ~ 	  � URL � � 	  � ASTATUSMESSAGES � � 	  � HIDEADVANCEDSETTINGS � � 	  � THISDSN � � 	  � 	URLENCHAR � � 	  � BRANCH_ODBCDS � � 	  � 
ERR_UPDATE � � 	  � GETURLDEFAULTS � � 	  � CONNECTSTRING � � 	  � GETCSRFTOKEN � � 	  � BRANCH_ODBCINI � � 	  � INTERVAL � � 	  � SQLLINKENABLED � � 	  � FORM � � 	  � BRANCH_ODBCINST � � 	  � 	SCRIPTSRC � � 	  � CONNECTIONSTRING_TITLE � � 	  � AERRORMESSAGES � � 	  � THISLISTITEM � � 	  � MAXCONNECTION � � 	  � DATASOURCENAME_TITLE � � 	  � TEMP � � 	  � BSTATUSEXIST � � 	  � REQUEST � � 	  � UPDATEPASSWORD � � 	  � SUBMIT � � 	  � CANCEL � � 	  � BERRORSEXIST � � 	  � RETURNTIMESTAMP_TITLE � � 	  � GETDATASOURCEDEFAULTS � � 	  � com.macromedia.SourceModTime  h���� pageContext #Lcoldfusion/runtime/NeoPageContext; � �	  � getOut ()Ljavax/servlet/jsp/JspWriter; javax/servlet/jsp/JspContext
 parent Ljavax/servlet/jsp/tagext/Tag;	 	 Cp1252 setPageEncoding (Ljava/lang/String;)V !coldfusion/runtime/NeoPageContext
 'class$coldfusion$tagext$lang$IncludeTag Ljava/lang/Class; !coldfusion.tagext.lang.IncludeTag forName %(Ljava/lang/String;)Ljava/lang/Class; java/lang/Class
	  _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; 
 ! !coldfusion/tagext/lang/IncludeTag# _setCurrentLineNo (I)V%&
 ' udflibrary.cfm) setTemplate+
$, 	hasEndTag (Z)V./ coldfusion/tagext/GenericTag1
20 _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z45
 6 coldfusion/runtime/CFBoolean8 f_false Lcoldfusion/runtime/CFBoolean;:;	9< set (Ljava/lang/Object;)V>? coldfusion/runtime/VariableA
B@ ArrayNew (I)Ljava/util/List;DE
 F _Array 2(Ljava/lang/Object;)Lcoldfusion/runtime/FastArray;HI coldfusion/runtime/CastK
LJ setArray !(Lcoldfusion/runtime/FastArray;)VNO
BP ACTIONR 
URL.ACTIONT  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)ZVW
 X _Object (Z)Ljava/lang/Object;Z[
L\ _boolean (Ljava/lang/Object;)Z^_
L` java/lang/Stringb _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;de
 f deleteh _compare '(Ljava/lang/Object;Ljava/lang/String;)Djk
 l ADMINSUBMITn FORM.ADMINSUBMITp  r 	CSRFTOKENt FORM.CSRFTOKENv URL.CSRFTOKENx _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;z{
 | checkCSRFToken~ java/lang/Object� _autoscalarize�{
 � DATASERVTABKEYNAME� 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;��
 � CANCELSUBMIT� FORM.CANCELSUBMIT� 'class$coldfusion$tagext$net$LocationTag !coldfusion.tagext.net.LocationTag��	 � !coldfusion/tagext/net/LocationTag� setAddtoken�/
�� 	index.cfm� setUrl�
�� windows� SERVER� OS� NAME� _String &(Ljava/lang/Object;)Ljava/lang/String;��
L� 
FindNoCase '(Ljava/lang/String;Ljava/lang/String;)I��
 � (J)Z^�
L� _sl54del.cfm� SQLEXECUTIVE� DATASOURCES� _Map #(Ljava/lang/Object;)Ljava/util/Map;��
L� StructDelete %(Ljava/util/Map;Ljava/lang/String;Z)Z��
 �  REQUEST.CLIENTSCOPE.CLIENTSTORES� isDefinedCanonicalName (Ljava/lang/String;)Z��
 � CLIENTSCOPE� CLIENTSTORES� StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z��
 � _resolve�e
 � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;��
 � TYPE� 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object;d�
 � COOKIE� REGISTRY���
 � #class$coldfusion$tagext$lang$LogTag coldfusion.tagext.lang.LogTag��	 � coldfusion/tagext/lang/LogTag� audit� setFile�
�� setApplication�/
�� cflog� text� java/lang/StringBuilder� User � 
�� GetAuthUser ()Ljava/lang/String;��
 � append -(Ljava/lang/String;)Ljava/lang/StringBuilder;��
��  deleted datasource   . toString�
� _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
 	 setText
� _factor0 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;
  
DATASOURCE Trim &(Ljava/lang/String;)Ljava/lang/String;
  Len (Ljava/lang/Object;)I
  (I)Ljava/lang/Object;Z
L (Ljava/lang/Object;D)Dj
   t_true";	9# $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag&%	 ( coldfusion/tagext/io/OutputTag* 
doStartTag ()I,-
+. 
		0 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V23
 4 (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTag76	 9 "coldfusion/tagext/lang/ImportedTag; l10n= 
../cftags/? adminA setName :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)VCD
<E &coldfusion/runtime/AttributeCollectionG idI odbc_no_dsn_selected_errorK varM 
err_updateO ([Ljava/lang/Object;)V Q
HR setAttributecollection (Ljava/util/Map;)VTU  coldfusion/tagext/lang/ModuleTagW
XV
X. 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;[\
 ] L
			A ODBC Datasource must be selected before submitting changes.<br />
		_ writea java/io/Writerc
db doAfterBodyf-
Xg _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;ij
 k doEndTagm- #javax/servlet/jsp/tagext/TagSupporto
pn doCatch (Ljava/lang/Throwable;)Vrs
Xt 	doFinallyv 
Xw 
	y
+g coldfusion/tagext/QueryLoop|
}n
}t
+w 
	
	� ArrayLen�
 � (D)Ljava/lang/Object;Z�
L� _arraySetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V��
 � *coldfusion/runtime/TransientVariableHolder� &(Lcoldfusion/runtime/NeoPageContext;)V �
�� ORIGINALDSN� 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object;��
 � 	StructNew ()Ljava/util/Map;��
 � getNewDSNDefaults� %coldfusion/runtime/ArgumentCollection� scope� )([Ljava/lang/Object;[Ljava/lang/Object;)V �
�� b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object;��
 � getCFSettingDefaults� getDatasourceDefaults� dsn� DRIVER� _structSetAt��
 � '(Ljava/lang/Object;Ljava/lang/Object;)Dj�
 � ARGS� 	FORM.ARGS� THISDSN.URLMAP.ARGS� URLMAP� D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object;d�
 � no� ADVANCEDMODE� FORM.ADVANCEDMODE� FORM.TIMESTAMPASSTRING� yes� DBMSLogon(UID,PWD)� USETRUSTEDCONNECTION� FORM.USETRUSTEDCONNECTION� OSIntegrated� updateODBCServerDSN� odbcdsn� connectstring� TimeStampAsString� logonmethod� _factor1�
 � unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;�� coldfusion/runtime/NeoException�
�� t57 [Ljava/lang/String; Any���	 � findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I��
�� bind '(Ljava/lang/String;Ljava/lang/Object;)V��
�� 
			� odbc_access_sqlexecutive_error� >
				Unable to update the ColdFusion ODBC Server.<br />
				� MESSAGE� EncodeForHTML�
 � <br />
				� DETAIL <br />
			 
		
		 unbind 
� _factor8

  CLASS DESCRIPTION USERNAME FORM.USERNAME :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V�
  PASSWORD FORM.PASSWORD STATICPASSWORD encryptPassword _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; !
 " HOST$ 	FORM.HOST& THISDSN.URLMAP.HOST( PORT* 	FORM.PORT, THISDSN.URLMAP.PORT. _factor50
 1 FORM.DATASOURCE3 THISDSN.URLMAP.DATASOURCE5 getURLDefaults7 delims9 &(Ljava/lang/String;)Ljava/lang/Object;�;
 < :;=> _set@�
 A formatJdbcURLC driverE 
datasourceG hostI portK CONNECTIONPROPSM _factor6O
 P>&
BR _intT
LU ;W 	ListGetAt 9(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;YZ
 [ _LhsResolve]�
 ^ =` 	ListFirst 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;bc
 d ListLastfc
 g :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V�i
 j _double (Ljava/lang/Object;)Dlm
Ln ListLenp�
 q FORM.TIMEOUTs Val (Ljava/lang/String;)Duv
 w@N       FORM.INTERVAL{ LOGIN_TIMEOUT} FORM.LOGIN_TIMEOUT BUFFER� FORM.BUFFER� BLOB_BUFFER� FORM.BLOB_BUFFER� ENABLEMAXCONNECTIONS� FORM.ENABLEMAXCONNECTIONS� MAXCONNECTIONS� 	IsNumeric�_
 � maxconnections� _factor2�
 � VALIDATIONQUERY� FORM.VALIDATIONQUERY� VALIDATECONNECTION� FORM.VALIDATECONNECTION� 
CLIENTINFO� CLIENTHOSTNAME� FORM.CLIENTHOSTNAME� 
CLIENTUSER� FORM.CLIENTUSER� APPLICATIONNAME� FORM.APPLICATIONNAME� APPLICATIONNAMEPREFIX� FORM.APPLICATIONNAMEPREFIX� POOLING� FORM.POOLING� _factor3�
 � DISABLE� FORM.DISABLE� ENABLE_CLOB� FORM.ENABLE_CLOB� DISABLE_CLOB� ENABLE_BLOB� FORM.ENABLE_BLOB� DISABLE_BLOB� DISABLE_AUTOGENKEYS� FORM.DISABLE_AUTOGENKEYS� SELECT� FORM.SELECT� CREATE� FORM.CREATE� GRANT� 
FORM.GRANT� INSERT� FORM.INSERT� _factor4�
 � DROP� 	FORM.DROP� REVOKE� FORM.REVOKE� UPDATE� FORM.UPDATE� ALTER� 
FORM.ALTER� 
STOREDPROC� FORM.STOREDPROC� DELETE� FORM.DELETE� _factor7�
 �]e
 � t58��	 � 
				� odbcedit_error 
driver_err (
					Error editing/creating this dsn ( )<br />
					 <br />
						 

			 _factor9
  	_factor10
  	_factor22
  LOCALE REQUEST.LOCALE en checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
  
LOCALEFILE  resources/datasources_" .cfm$ false& 2(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)V(
 ) BSHOWADVANCED+ STDSN.BSHOWADVANCED- STDSN.DRIVER/ 
ODBCSocket1 STDSN.CLASS3  macromedia.jdbc.MacromediaDriver5 FORM.DSN7 STDSN.ORIGINALDSN9 system; getDriverDefaults= updatePassword? isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)ZAB
 C ListToArray $(Ljava/lang/String;)Ljava/util/List;EF
 G java/util/ListI iterator ()Ljava/util/Iterator;KLJM java/lang/IntegerO getClass ()Ljava/lang/Class;QR
�S isArray ()ZUV
W _List $(Ljava/lang/Object;)Ljava/util/List;YZ
L[ coldfusion/sql/QueryTable] class$coldfusion$sql$QueryTable coldfusion.sql.QueryTable`_	 b _cast 7(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;de
Lf getMetaData ()Ljava/sql/ResultSetMetaData;hi
^j getRowVector ()Ljava/util/Vector;lm coldfusion/sql/imq/imqTableo
pn absolute (I)Zrs
^t java/util/Mapv keySet ()Ljava/util/Set;xywz java/util/Set|}M java/util/Iterator next ()Ljava/lang/Object;���� coldfusion/sql/imq/Row� getColumnList ()[Ljava/lang/String;��
^� _queryRowDataToStruct T(Ljava/lang/Object;[Ljava/lang/String;Ljava/lang/Object;)Lcoldfusion/runtime/Struct;��
 � relative�s
^� 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;��
 � hasNext�V�� 	_factor11�
 � )HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI� ;HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources� -HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBCINST.INI� (class$coldfusion$tagext$lang$RegistryTag "coldfusion.tagext.lang.RegistryTag��	 � "coldfusion/tagext/lang/RegistryTag� GETALL� 	setAction�
�� qODBC�C
�� string� setType�
�� entry� setSort�
�� 
cfregistry� branch� 	setBranch�
�� t59��	 � errorAccessingODBCDatasource� 4
				Error accessing available odbc datasources. - � 
socketdrvr� pagename� ODBC Socket� ../header.cfm� 

� ../include/margintop.cfm� 
� ../include/errors.cfm� ../include/status.cfm� java� coldfusion.server.SystemInfo� CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;��
 � IsSqlLinkEnabled� 

	� sequelLinkDisabledODBC� S
		The ColdFusion ODBC Server service is not running or has not been installed.
	� $
	<br clear="left" /><br /><br />
� 

<h2 class="pageHeader">� odbcsocket_pageHeader� &</h2>

<form name="editdsn" action="� CGI� SCRIPT_NAME� ?� QUERY_STRING� EncodeForURL�
 � " method="post">

� 
	    	  
			<script src=" %ajax/jquery/jquery.js"></script>
			 ../include/anchorclick.js ../include/formsubmit.cfm G
			<script type="text/javascript">
				goTo("index.cfm?verifyNewDsn=
 URLEncodedFormatc
  "," getCSRFToken ");
			</script>
	 	_factor15
  -

<input type="hidden" name="class" value=" .">
<input type="hidden" name="driver" value=" ,">
<input type="hidden" name="host" value=" ,">
<input type="hidden" name="port" value=" 1">
<input type="hidden" name="csrftoken" value="  p">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td>
		<b class="subheading">
		" REQUEST.SQLEXECUTIVE.DRIVERS$ DRIVERS&  :&nbsp;
		( �
		</b>
	</td>
</tr>
<tr>
	<td>
		
		<table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="15px"></td>
		</tr>
		<tr>
			<td width="150px">
				<label for="dsn">
					* datasourcename, CF Data Source Name. 5
				</label>
			</td>
			<td width="300px">
				0 datasourcename_title2 ColdFusion datasouce name4 ;
				<input type="text" maxlength="150" name="dsn" value="6 EncodeForHTMLAttribute8
 9 6"
					id="dsn" size="12" style="width:12em;" title="; 7">
				<input type="hidden" name="originaldsn" value="= 	_factor16?
 @ H">
			</td>
			<td width="150px">
				<label for="datasource">
					B odbc_dsnD ODBC DSNF M
					<select name="datasource" id="datasource" style="width:10em;">
						H qODBC.EntryJ 	ValueListL
 M ListFindNoCaseO�
 P "
							<option value="">
						R 
						T $class$coldfusion$tagext$lang$LoopTag coldfusion.tagext.lang.LoopTagWV	 Y coldfusion/tagext/lang/LoopTag[ setQuery]?
}^
\. 
						<option value="a ENTRYc " e selectedg >i </option>
						k
\g
\n
\w 
					</select>
				p 
					r odbc_dsn_tipt N
					Enter the ODBC data source name that the bridge will connect to.
					v 4
					<input type="input" name="datasource" value="x 	" title="z +" style="width:12em" id="datasource">
				| 	_factor17~
  �
			</td>
		</tr>
		<tr>
			<td height="15px"></td>
		</tr>
		<tr>
			<td>
				<label for="UseTrustedConnection">
					� UseTrustedConnection� Trusted Connection� '
				</label>
			</td>
			<td>
				� UseTrustedConnection_title� K
				<input type="checkbox" name="UseTrustedConnection" value="true"
				� checked� '
				id="UseTrustedConnection" title="� v">
			</td>
		</tr>
		<tr>
			<td height="15px"></td>
		</tr>
		<tr>
			<td>
				<label for="username">
					� username� 	User name� username_title� <Enter the user name if the database requires authentication.� @
				<input type="text" maxlength="550" name="username" value="� ;"
					size="12" style="width:12em;" id="username" title="� 8">
			</td>
			<td>
				<label for="password">
					� password� Password� 	_factor18�
 � password_title� ZEnter the password corresponding to the user name if the database requires authentication.� 4
				<input type="password" name="password" value="� ;"
					size="12" style="width:12em;" id="password" title="� �" autocomplete="off">
				
			</td>
		</tr>
		</table>
		<table width="100%">
		<tr>
			<td height="15px"></td>
		</tr>
		<tr>
			<td width="150px">
				<label for="description">
					� description� Description� |
				</label>
			</td>
			<td>
				<textarea name="description" id="description" rows="3" cols="25" style="width:25em;">� �</textarea>
			</td>
		</tr>
		<tr>
			<td height="15px"></td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="grey-background-div">
						� SHOWADVANCED� FORM.SHOWADVANCED� 	
							� hideAdvancedSettings� Hide Advanced Settings� 9
							<input type="Submit" name="hideAdvanced" value="� ]" class="buttn-grey" >
							<input type="hidden" name="advancedmode" value="true">
						� showAdvancedSettings� Show Advanced Settings� 9
							<input type="Submit" name="showAdvanced" value="� ^" class="buttn-grey" >
							<input type="hidden" name="advancedmode" value="false">
						� 	_factor19�
 � *
					<span style="float: right">
						� submit� Submit� Cancel� 7
						<input type="Submit" name="adminsubmit" value="� N" class="buttn-grey" >
						<input type="Submit" name="cancelSubmit" value="� K" class="buttn-grey" >
					</span>
				</div>
			</td>
		</tr>
		
		� a
			<tr>
				<td height="5"></td>
			</tr>
			<tr>
				<td>
					<label for="args">
						� ConnectionString� Connection String� +
					</label>
				</td>
				<td>
					� ConnectionString_title� kEnter name/value pairs for vendor-specific connection string arguments. The format is typically name=value.� A
					<textarea name="args" id="args" rows="3" cols="25" title="� ">� �</textarea>
				</td>
			</tr>
			<tr>
				<td height="5"></td>
			</tr>
			<tr>
				<td>
					<label for="TimeStampAsString">
						� returnTimeStamp� Return TimeStamp as String� returnTimeStamp_title� 7Select the checkbox to enable the max connection limit.� i
					<input type="checkbox" name="TimeStampAsString" value="true"
						id="TimeStampAsString"
						� STDSN.URLMAP.TIMESTAMPASSTRING� 
						title="� �">
				</td>
			</tr>
			<tr>
				<td height="5"></td>
			</tr>
			
			<tr>
				<td>
					<label for="enablemaxconnections">
						 maxConnections_limit Limit Connections 	_factor12
  enablemaxconnections_title
 o
					<input type="checkbox" name="enablemaxconnections" value="true"
						id="enablemaxconnections"
						 STDSN.URLMAP.MAXCONNECTIONS t60 any�	  
					     :">
						&nbsp;&nbsp;
						<label for="maxconnections"> maxConnections_enable Restrict connections to $</label>
						&nbsp;&nbsp;
						 t61�	   K
					<input type="Text" name="maxconnections" id="maxconnections" value="" �" size="3">
				</td>
			</tr>
			<tr>
				<td height="5"></td>
			</tr>
			<tr>
				<td>
					<label for="pooling">
						$ maintainConnections& Maintain Connections( 	_factor13*
 + maintainConnections_title- �Select the checkbox to enable server connection pooling for your data source. This is highly recommended to increase performance./ U
					<input type="checkbox" name="pooling" value="true"
						id="pooling"
						1 <">
					&nbsp;&nbsp; --
					<label for="pooling">
						3 !maintainConnectionsAcrossRequests5 ,Maintain connections across client requests.7 �
					</label>
				</td>
			</tr>
			<tr>
				<td height="5"></td>
			</tr>
			<tr>
				<td>
					<label for="timeout">
						9 timeout; Timeout (min)= timeout_title? |Enter a time, in minutes, that the server allows a data source connection to remain inactive before closing that connection.A _div (DD)DCD
 E Round (D)DGH
 I @
					<input type="text" maxlength="550" name="timeout" value="K (D)Ljava/lang/String;�M
LN 	_factor14P
 Q &"
						size="4" id="timeout" title="S :">
					&nbsp;&nbsp;
					<label for="interval">
						U IntervalW Interval (min)Y )
					</label>
					&nbsp;&nbsp;
					[ interval_title] aEnter a time, in minutes, that the server waits before closing an expired data source connection._ 2
					<input type="input" name="interval" value="a '"
						size="4" id="interval" title="c H">
				</td>
			</tr>
			<tr>
				<td height="5"></td>
			</tr>
		e 	_factor20g
 h /
		</table>
		
	</td>
</tr>
</table>


j _cfsettings.cfml 	_factor21n
 o 	_factor23q
 r IsDebugModetV
 u 	STDSN.DSNw dumpy /WEB-INF/cftags{ cfdump} \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
 � ../include/marginbottom.cfm� ../footer.cfm� metaData Ljava/lang/Object;��	 � 	Functions� 
Properties� this Lcfodbcsocket2ecfm139383958; __factorParent out Ljavax/servlet/jsp/JspWriter; value module48 $Lcoldfusion/tagext/lang/ImportedTag; mode48 t6 Ljava/lang/Throwable; t7 t8 t9 t10 t11 module49 mode49 t14 t15 t16 t17 t18 t19 module62 mode62 t22 t23 t24 t25 t26 t27 module63 mode63 t30 t31 t32 t33 t34 t35 LocalVariableTable LineNumberTable java/lang/Throwable� Code 	include26 #Lcoldfusion/tagext/lang/IncludeTag; 	include27 	include28 module29 mode29 t12 t13 	include64 include0 	location1 #Lcoldfusion/tagext/net/LocationTag; t4 ,Lcoldfusion/runtime/TransientVariableHolder; 
registry21 $Lcoldfusion/tagext/lang/RegistryTag; #Lcoldfusion/runtime/AbortException; Ljava/lang/Exception; __cfcatchThrowable2 output23  Lcoldfusion/tagext/io/OutputTag; mode23 module22 mode22 t20 t21 module24 mode24 t28 t29 	include25 output65 mode65 t37 t38 t39 t40 t41 !coldfusion/runtime/AbortException� java/lang/Exception� runPage module66 t5 	include67 	include68 getMetadata varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; output6 mode6 module5 mode5 Ljava/util/Iterator; Lcoldfusion/sql/QueryTable; #Lcoldfusion/sql/QueryTableMetaData; module50 mode50 module51 mode51 module52 mode52 module53 mode53 module54 mode54 t42 t43 include7 __cfcatchThrowable0 output9 mode9 module8 mode8 module55 mode55 __cfcatchThrowable3 module56 mode56 __cfcatchThrowable4 module57 mode57 t36 __cfcatchThrowable1 output11 mode11 module10 mode10 module58 mode58 module59 mode59 module60 mode60 module61 mode61 module30 mode30 output31 mode31 	include32 	include33 module34 mode34 module35 mode35 module36 mode36 loop37  Lcoldfusion/tagext/lang/LoopTag; mode37 module38 mode38 module39 mode39 module40 mode40 module41 mode41 module42 mode42 module43 mode43 module44 mode44 module45 mode45 module46 mode46 module47 mode47 include2 log3 Lcoldfusion/tagext/lang/LogTag; 	location4 <clinit> 1     G                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     r     v     z     ~     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �       �   �   %   6   ��   ��   _   �   ��   V   �   �   ��    g �  �  $  ,Զe*�:0+�"�<:*��(>@B�F�HY��YJSY�SYNSY�S�S�Y�3�ZY6� 6*,�^M,ضe�h���� � :� �:*,�lM��q� :� #�� � #:		�u� � :
� 
�:�x�*,U�5*�:1+�"�<:*��(>@B�F�HY��YJSY�SYNSY�S�S�Y�3�ZY6� 6*,�^M,ڶe�h���� � :� �:*,�lM��q� :� #�� � #:�u� � :� �:�x�,ܶe,**� �����e,޶e,**� ������e,�e**� ����Y�:*+,�	� �*+,�,� �*+,�R� �,T�e,**� a�����e,V�e*�:>+�"�<:*0�(>@B�F�HY��YJSYXS�S�Y�3�ZY6� 6*,�^M,Z�e�h���� � :� �:*,�lM��q� :� #�� � #:�u� � :� �:�x�,\�e*�:?+�"�<:*3�(>@B�F�HY��YJSY^SYNSY^S�S�Y�3�ZY6� 6*,�^M,`�e�h���� � :� �:*,�lM��q� : � # �� � #:!!�u� � :"� "�:#�x�#*,s�5*� �*4�(**� Q�cY�S���oy�F�J���C,b�e,**� ������e,d�e,**� m�����e,f�e*�   e � �� � � �� Z � �� � � �� Z � �� � � �� � � �� � � ��6RU�UZU�+u��{~��+u��{~����������x�������m�������m���������������Hdg�glg�=�������=��������������� �  j $  ��    �   ��   ��   ��   � z   ��   ��   ��   �� 	  �� 
  ��   ��   � z   ��   ��   ��   ��   ��   ��   ��   � z   ��   ��   ��   ��   ��   ��   ��   � z   ��   ��   ��    �� !  �� "  �� #�   F >� >� J� J� ����� ������������������������������������������-----]0]0&0!3!3-3-3�3�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�5�5�5�5�566666�� n �      c*,Ҷ5*�+�"�$:*�(Զ-�3�7� �*,ֶ5*�+�"�$:*�(ض-�3�7� �*,ֶ5*�+�"�$:*�(ڶ-�3�7� �*,Ҷ5*� �*�(**�(*�޶�����#�C*,ֶ5**� ����a�� �*,�5*�:+�"�<:*!�(>@B�F�HY��YJSY�S�S�Y�3�ZY6� 6*,�^M,�e�h���� � :	� 	�:
*,�lM�
�q� :� #�� � #:�u� � :� �:�x�,�e� �*+,�� �*+,�A� �*+,��� �*+,��� �*+,��� �*+,�i� �,k�e**� ����Y� A*,z�5*�@+�"�$:*G�(m�-�3�7� �*,ֶ5*,Ҷ5*� Fbe�eje�;�������;��������������� �   �   c��    c�   c��   c��   c��   c��   c��   c��   c� z   c�� 	  c�� 
  c��   c��   c��   c��   c�� �   � .      V V > � � t � � � � � � � � � � � � � � � � � �+!+! �!FFFFFFFF
F
F;G;G#G
F�% �  �  �    �*�+�"�$:*�(*�-�3�7� �*� �=�C*� �*�(*�G�M�Q**� �SU�Y�]Y�a� #W*��cYSS�gi�m�~��]Y�a� W**� �oq�Y�]�a� �*� As�C**� �uw�Y�]Y�a� W**� �uy�Y�]�a� >*� A**� �uw�Y� *��cYuS�g� *��cYuS�g�C*�(**� ��}*��Y**� A��SY*��cY�S�gS��W**� ����Y� 8*��+�"��:*�(������3�7� �� m**� �SU�Y�]Y�a� #W*��cYSS�gi�m�~��]�a� *+,�� ��  **� �oq�Y� *+,�� �*�   �   >   ���    ��   ���   ���   ���   ��� �  � �           /  /  /  /  +  +  ?  ?  >  >  >  >  5  5  J 	 J 	 J 	 J 	 N 	 N 	 Q 	 Q 	 I 	 I 	 I 	 I 	 b 	 b 	 r 	 r 	 b 	 b 	 b 	 b 	 I 	 I 	 I 	 I 	 � 	 � 	 � 	 � 	 � 	 � 	 � 	 � 	 � 	 � 	 � 	 � 	 I 	 I 	 �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �    �  �  �  �  �  �   - - 8 8     I 	 I N N N N R R U U M M z z ^ � � � � � � � � � � � � � � � � � � � � � � � 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� M  q �  
� 
 *  s**� ��*��cY!S��Y#��*��cYS�g����%����**� �'�***� �'�***� �*��(*�G�***� �*��(*�G�***� Q,.'�**� Q�02�**� Q46�**� �G8�Y� H**� Q�cYGS*��cYGS�g��**� Q�cY�S*��cY�S�g��� #**� Q�cYGS*��cYGS�g��**� Q�:**� Q�cYGS���*+,��� �*� ���C*� ���C*� ���C��Y*� ��:*��+�"��:*�(��������������**� ������
���3�7� :����:�:��:		�ĸ�    �           7	��*� �$�C*�)+�"�+:
*�(
�3
�/Y6�*,��5*�:
�"�<:*�(>@B�F�HY��YJSY�SYNSYPS�S�Y�3�ZY6� `*,�^M,ȶe,*�(**� 9�cY�S�������e,�e�h��ʨ � :� �:*,�lM��q� :� )� q� ��� � #:�u� � :� �:�x�*,1�5
�{���
�~� :� &� w�� � #:
�� � :� �:
���*,�5**� ���Y*�(**� ɶ����c��S**� ������ �� � :� �:�	�*�:+�"�<:*�(>@B�F�HY��YJSY�SYNSY�S�S�Y�3�ZY6� 6*,�^M,ζe�h���� � :� �:*,�lM��q� :� #�� � #:�u� � : �  �:!�x�!*�+�"�$:"*�("ж-"�3"�7� �*�)A+�"�+:#*�(#�3#�/Y6$� '*#,�p� :%� E%�*,Ҷ5#�{���#�~� :&� #&�� � #:'#'�� � :(� (�:)#���)*� *����,8�258��,G�25G�8DG�GLG�K,��2w��}���K,��2w��}������������������������������������,��2w��}�������Uqt�tyt�J�������J���������������
#Q�)EQ�KNQ�
#`�)E`�KN`�Q]`�`e`� �  � *  s��    s�   s��   s��   s��   s��   s��   s��   s��   s�� 	  s�� 
  s� z   s��   s� z   s��   s��   s��   s��   s��   s��   s��   s��   s��   s��   s��   s��   s��   s� z   s��   s��   s��   s��   s��    s�� !  s�� "  s�� #  s� z $  s�� %  s�� &  s�� '  s�� (  s�� )�  f � � � "� "� (� (� (� (� >� >� � � � � � � O� O� Z� Z� m� m� l� l� l� l� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��������� ��;�;�;�;�O�_�_�_�_�[�[�i�i�i�i�e�e�s�s�s�s�o�o��������������))))%%�������������^/������������������y..::����� �� �  �    �*� �L*�
N*� �*-+�� �*-+�s� �*+Ҷ5*N�(*�v�]Y�a� W**� QGx�Y�]Y�a� ?W*N�(**��cY�SY�S�g��**� Q�cYGS�����̸]�a� �*�:B-�"�<:*O�(z|�F*��cY�SY�S��**� Q�cYGS����:~N��W�HY��YNSYS�S�Y�3�7� �*�C-�"�$:*R�(��-�3�7� �*�D-�"�$:*S�(��-�3�7� ��   �   R   ���    ���   ���   �   ���   ���   ���   ��� �   � 3 >N >N >N >N NN NN NN NN RN RN TN TN MN MN MN MN >N >N >N >N mN mN mN mN �N �N �N �N lN lN lN lN >N >N �O �O �O �O �O �O �O �O �O >NERER-RsSsS[S   �� �   "     ���   �       ��      �  �    �*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q**s+,� � u**w+,� � y**{+,� � }**+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � ��   �       ���    ���   ���     �   #     *� 
�   �       ��    �  � 	   �*:�(*:�(*��cYS�g�������!���*� �$�C*�)+�"�+:*=�(�3�/Y6� �*,1�5*�:�"�<:*>�(>@B�F�HY��YJSYLSYNSYPS�S�Y�3�ZY6� 6*,�^M,`�e�h���� � :� �:	*,�lM�	�q� :
� &� k
�� � #:�u� � :� �:�x�*,z�5�{�� �~� :� #�� � #:�� � :� �:���*,��5**� ���Y*C�(**� ɶ����c��S**� �����**� ���a�� *+,�� �*�  � � �� � � �� �	�� �	$�$�!$�$)$� W	]�Q]�WZ]� W	l�Ql�WZl�]il�lql� �   �   ���    ��   ���   ���   ���   �� z   ���   �� z   ���   ��� 	  ��� 
  ���   ���   ���   ���   ���   ���   ��� �   � 0  :  :  :  :  :  :  :  : ( : ( : 6 < 6 < 6 < 6 < 2 < 2 < � > � > � > � > j > < =� C� C� C� C� C� C� C� C� C� C� C� C� C� C� C� C� C� C  :� F� F� F� F� F� F� F � �  Z    �*� Q*Ӷ(**� �}�*��Y�cY�S��Y**� Q��S�����C**� Q�cYS<��*� Q*׶(**� E�}�*��Y�cY�S��Y**� Q��S�����C*�*ڶ(**� e�}>*��Y�cY�S��Y*ڶ(**� Q����S�����B**� Q�cY�SY+S*��cY+S�g��**� Q�cY�SY%S*��cY%S�g��*� Q*޶(**� ��}�*��Y�cY�SY�S��Y**� Q��SY**� Q�cY�S��S�����C*� Q*߶(**� �}@*��Y�cY�S��Y**� Q��S�����C**� Q�cY�S���a� **� Q�cY�S�=��� **� Q�cY�S�$��**� Q�cY�S���a� **� Q�cY�S�=��� **� Q�cY�S�$��**� ��D�X**� �4�Y� +**� Q�cY�SYS*��cYS�g��**� �%'�Y� +**� Q�cY�SY%S*��cY%S�g��**� �+-�Y� +**� Q�cY�SY+S*��cY+S�g��**� ��жY� !**� Q�cY�SY�S�$��� O**� �G8�Y�]Y�a� W**� ��жY��]�a� **� Q�cY�SY�S�=��:::*��=:�c� ���H�N :� ��P� ���H�N :���� �T�X� �\�N :����J� �\�N :����^� -�c�g�^:�k:�q�N :�uW��~���{ �~ :� W�� N-� J-��� -����N��W*� i-�C**� Q��Y**� i��S*�**� i�������� ���� � 
�uW*�   �   R   ���    ��   ���   ���   ���   ���   ���   ��� �  J � � � +� +� � � � �  � L� L� L� L� =� ]� ]� }� }� ]� ]� ]� ]� R� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ������ ��0�0�V�V�a�a�0�0�0�0�%�����������������}�������������������������������&�&�&�&��>�>�>�>�/���E�E�E�E�D�D�P�P�P�P�T�T�W�W�O�O�u�u�u�u�`�O����������������������������������������������������������������������������������� � � � ��*�*�*�*�.�.�0�0�)�)�)�)�B�B�B�B�F�F�I�I�A�A�A�A�A�A�A�A�)�)�o�o�o�o�Z�)�)���~�~�p�p�|�|�y�y�y�y�e�u�D�  �  M  ,  },�e*�:2+�"�<:*ζ(>@B�F�HY��YJSY�S�S�Y�3�ZY6� 6*,�^M,�e�h���� � :� �:*,�lM��q� :� #�� � #:		�u� � :
� 
�:�x�,�e*�:3+�"�<:*Ҷ(>@B�F�HY��YJSY�SYNSY�S�S�Y�3�ZY6� 6*,�^M,�e�h���� � :� �:*,�lM��q� :� #�� � #:�u� � :� �:�x�,�e,**� Ŷ����e,�e,**� Q�cY�SY�S�����e,�e*�:4+�"�<:*ܶ(>@B�F�HY��YJSY�S�S�Y�3�ZY6� 6*,�^M,��e�h���� � :� �:*,�lM��q� :� #�� � #:�u� � :� �:�x�,�e*�:5+�"�<:*�(>@B�F�HY��YJSY�SYNSY�S�S�Y�3�ZY6� 6*,�^M,��e�h���� � :� �:*,�lM��q� : � # �� � #:!!�u� � :"� "�:#�x�#,��e*��ĸ]Y�a� W**� Q�cY�SY;S���a� 
,��e, �e,**� ������e,�e*�:6+�"�<:$*�($>@B�F$�HY��YJSYS�S�Y$�3$�ZY6%� 6*$%,�^M,�e$�h���� � :&� &�:'*%,�lM�'$�q� :(� #(�� � #:)$)�u� � :*� *�:+$�x�+*� ( Y u x� x } x� N � �� � � �� N � �� � � �� � � �� � � ��)EH�HMH�ht�nqt�h��nq��t�������)EH�HMH�ht�nqt�h��nq��t�����������8D�>AD��8S�>AS�DPS�SXS�,/�/4/�O[�UX[�Oj�UXj�[gj�joj� �  � ,  }��    }�   }��   }��   }��   }� z   }��   }��   }��   }�� 	  }�� 
  }��   }��   }� z   }��   }��   }��   }��   }��   }��   }��   }� z   }��   }��   }��   }��   }��   }��   }��   }� z   }��   }��   }��    }�� !  }�� "  }�� #  }�� $  }� z %  }�� &  }�� '  }�� (  }�� )  } � *  }� +�   � / >� >� ����� ������������������������������������l�l�k�k�k�k�}�}�}�}�k�k�k����������������� 
 �  �    o*S�(**��cY�SY�S�g��*��cY�S�g���̙ ?*� �*U�(*��cY�SY�S��*��cY�S�g�Ӹ��C� �*� �*W�(���C*� �*Y�(**� �}�*��Y�cY�S��Y**� ���S�����C*� �*Z�(**� E�}�*��Y�cY�S��Y**� ���S�����C*� �*[�(**� ��}�*��Y�cY�SY�S��Y**� ���SY*��cYGS�gS�����C**� ��cY�S*��cY�S�g��*� �*a�(���C*��cY�S�gs�m�~�]Y�a� -W*��cY�S�g*��cYGS�g���~�]�a� G*� q*��cY�S�g�C*�+�"�$:*k�(��-�3�7� ���Y*� ��:*+,��� :�/��)�/:�:��:		���  �           7	��*� �$�C*�)	+�"�+:
* ��(
�3
�/Y6�?*,��5*�:
�"�<:* ��(>@B�F�HY��YJSY�SYNSYPS�S�Y�3�ZY6� �*,�^M,��e,* ��(**� 9�cY�S�������e, �e,* ��(**� 9�cYS�������e,�e�h���� � :� �:*,�lM��q� :� )� q� ��� � #:�u� � :� �:�x�*,1�5
�{���
�~� :� &� w�� � #:
�� � :� �:
���*,�5**� ���Y* ��(**� ɶ����c��S**� ������ �� � :� �:�	�*� 	y|�|�|�������������������������������������������������(5A�;>A�(5F�;>F�(5\�;>\�A�\���\��Y\�\a\� �     o��    o�   o��   o��   o�   o��   o��   o��   o��   o� 	  o� 
  o z   o�   o z   o��   o��   o��   o��   o��   o��   o��   o��   o��   o��   o��   o�� �  F �  S  S  S  S   S   S   S   S  S  S C U C U Y U Y U C U C U C U C U C U C U 9 U  W  W  W  W u W � Y � Y � Y � Y � Y � Y � Y � Y � Y � Z � Z � Z � Z � Z � Z � Z � Z � Z [ [- [- [8 [8 [ [ [ [ [ � [  S` `` `` `` `Q `} a} a} a} as a  O� i� i� i� i� i� i� i� i� i� i� i� i� i� i� i� i� i� i� j� j� j� j� j� j k k� k� i( tu �u �u �u �q �q �� �� �� �� �" �" �" �" �" �" �" �" � �L �L �L �L �L �L �L �L �D �� �{ �3 �3 �3 �3 �3 �3 �? �? �3 �3 �E �E �E �E �E �E �! �! � m * �  �  (  ,�e*�:7+�"�<:*�(>@B�F�HY��YJSYSYNSYS�S�Y�3�ZY6� 6*,�^M,��e�h���� � :� �:*,�lM��q� :� #�� � #:		�u� � :
� 
�:�x�,�e��Y*� ��:*,U�5*�ę 
,��e*,U�5� T� Z:�:��:���     '           7��*,�5� �� � :� �:�	�, �e,**� �����e,�e*�:8+�"�<:*��(>@B�F�HY��YJSYS�S�Y�3�ZY6� 6*,�^M,�e�h���� � :� �:*,�lM��q� :� #�� � #:�u� � :� �:�x�,�e��Y*� ��:*,U�5*�ę E*,��5*� �* �(**� Q�cY�SY�S�����x���C*,U�5� *,��5*� �s�C*,U�5*,U�5� e� k:�:��:�!��    8           7��*,�5*� �s�C*,s�5� �� � :� �:�	�,#�e,**� Ѷ����e,%�e*�:9+�"�<: *�( >@B�F �HY��YJSY'S�S�Y �3 �ZY6!� 6* !,�^M,)�e �h���� � :"� "�:#*!,�lM�# �q� :$� #$�� � #:% %�u� � :&� &�:' �x�'*� " e � �� � � �� Z � �� � � �� Z � �� � � �� � � �� � � �� �� �� �Q�NQ�QVQ�������������+�+�(+�+0+�P���P���P�#�� #�#(#�������������������������������� �  � (  ��    �   ��   ��   �   	 z   ��   ��   ��   �� 	  �� 
  ��   ��   ��   ��   
�   ��   ��   �    z   ��   ��   ��   ��   ��   ��   ��   ��   ��   �   ��   ��   �     z !  �� "  �� #  � $  �� %  �� &  �� '�   � 8 >� >� J� J� � �� �� �� �� �� ��j�j�j�j�i������Y�Y�X�X�u u u u u u u u j j �������X�				C�<<<<;��Q  �  � 
   G��Y*� ��:*+,�� :�"�*+,�2� :��*+,�Q� :���*+,��� :���*��cYGS�g*��cY�S�g���~� <*��(**��cY�SY�S�g��*��cY�S�g����W*��cY�SY�S����Y*��cYGS�gS**� ����k�J�P:		�:

��:����              7��*� �$�C*�)+�"�+:*��(�3�/Y6�_*, �5*�:
�"�<:*��(>@B�F�HY��YJSYSYNSYS�S�Y�3�ZY6� �*,�^M,�e,*��(**� I�������e,�e,*��(**� 9�cY�S�������e,
�e,*��(**� 9�cYS�������e, �e�h���� � :� �:*,�lM��q� :� )� q� ��� � #:�u� � :� �:�x�*,��5�{����~� :� &� w�� � #:�� � :� �:���*,�5**� ���Y*��(**� ɶ����c��S**� u����� 
�� � :� �:�	�*� #�QT�TYT��z�������z��������������Oz����������Oz������������������   ��   - �� 3 @ �� F S �� Y � ��   ��   - �� 3 @ �� F S �� Y � ��  4�   -4� 3 @4� F S4� Y �4� �z4���4��14�494� �     G��    G�   G��   G��   G��   G��   G��   G��   G��   G�� 	  G�� 
  G�   G�   G z   G�   G z   G��   G��   G��   G��   G��   G��   G��   G��   G��   G��   G��   G�� �  b X Y� Y� h� h� Y� Y� �� �� �� �� �� �� �� �� �� �� �� �� �� Y� �� �� �� �� �� �� �� �� ��   �-�-�-�-�)�)���������������������������������������������$�$�$�$�$�$�$�$��b�3���������������������   J P �    $  �,�e*�::+�"�<:*�(>@B�F�HY��YJSY.SYNSY.S�S�Y�3�ZY6� 6*,�^M,0�e�h���� � :� �:*,�lM��q� :� #�� � #:		�u� � :
� 
�:�x�,2�e**� Q�cY�S���a� 
,��e, �e,**� )�����e,4�e*�:;+�"�<:*�(>@B�F�HY��YJSY6S�S�Y�3�ZY6� 6*,�^M,8�e�h���� � :� �:*,�lM��q� :� #�� � #:�u� � :� �:�x�,:�e*�:<+�"�<:*&�(>@B�F�HY��YJSY<S�S�Y�3�ZY6� 6*,�^M,>�e�h���� � :� �:*,�lM��q� :� #�� � #:�u� � :� �:�x�,�e*�:=+�"�<:**�(>@B�F�HY��YJSY@SYNSY@S�S�Y�3�ZY6� 6*,�^M,B�e�h���� � :� �:*,�lM��q� : � # �� � #:!!�u� � :"� "�:#�x�#*,s�5*� Y*+�(**� Q�cYWS���oy�F�J���C,L�e,*,�(**� Y�����x�O�e*�   e � �� � � �� Z � �� � � �� Z � �� � � �� � � �� � � ��e�������Z�������Z���������������)EH�HMH�ht�nqt�h��nq��t�����������8D�>AD��8S�>AS�DPS�SXS� �  j $  ���    ��   ���   ���   ��   � z   ���   ���   ���   ��� 	  ��� 
  ���   ��   � z   ���   ���   ���   ���   ���   ���   ��   � z   ���   ���   ���   ���   ���   ���   ��   � z   ���   ���   ���    ��� !  ��� "  ��� #�   � 1 > > J J  � � � � � � � �JJ&&�&�*�*�*�*�*w+w+w+w+�+�+w+w+w+w+w+w+w+w+l+l+�,�,�,�,�,�,�,�,�, O �  �    �**� ����Y� .**� ��cY�SY�S*��cY�S�g��� K*��ę .*��cY�S**� ��cY�SY�S���� *��cY�Ss�**� �4�Y� .**� ��cY�SYS*��cYS�g��� K*6�ę .*��cYS**� ��cY�SYS���� *��cYSs�**� ��жY� !**� ��cY�SY�S�$��� **� ��cY�SY�S�=��*�*�(**� ��}8*��Y�cY�SY:S��Y*��=SY?S�����B**� ��cY�S*�(**� !�}D*��Y�cYFSYHSYJSYLS��Y*��cY�S�gSY*��cYGS�gSY*��cY%S�gSY*��cY+S�gS������**� ��cY�SYNS*�(����**� ��cY�SYNSYS*��cYGS�g��*�   �   *   ���    ��   ���   ��� �  � y  �  �  �  �  �  �  �  �   �   � & � & � & � & �  � =  =  <  <  S S S S F ~ ~ ~ ~ q <  <    � � � � � � � � � � � � � � � � � � � � � � � � � � � � �	
	
	
	






....LLLL7
\\����\\\\R�����������MMMM1nnnnS  �      �,�e*�:+�"�<:*'�(>@B�F�HY��YJSY�S�S�Y�3�ZY6� 6*,�^M,ζe�h���� � :� �:*,�lM��q� :� #�� � #:		�u� � :
� 
�:�x�,�e,*��cY�S�g���e,��e,*)�(*��cY�S�g�����e,��e**� �oq�Y��*,z�5**� ���a��o*,�5*�)+�"�+:*-�(�3�/Y6� (,�e,**� ������e,�e�{����~� :� #�� � #:�� � :� �:���*,��5*� +�"�$:*0�(�-�3�7� �*,��5*�!+�"�$:*1�(	�-�3�7� �,�e,*3�(*��cYGS�g��**� �������e,�e,*3�(**� ��}*��Y*��cY�S�gS�����e,�e*,ֶ5*�  Y u x� x } x� N � �� � � �� N � �� � � �� � � �� � � ��`�������`��������������� �   �   ���    ��   ���   ���   ��   � z   ���   ���   ���   ��� 	  ��� 
  ���   � �   �! z   ���   ���   ���   ���   �"�   �#� �   E >' >' ' �) �) �) �) �) �) �) �) �) �) �) �) �) �)++++++++++,,,,,,,,,,,,s.s.s.s.r.D-�0�0�0111C3C3C3C3U3U3U3U3C3C3C3C3;3u3u3�3�3u3u3u3u3m3,,+ � �  � 	   **� ��cY�SYNSY%S*��cY%S�g��**� ��cY�SYNSY+S*��cY+S�g��**� ����Y� �*� }�S� �*� �*'�(*��cY�S�g��**� }���VX�\�C**� ��cY�SYNS�_��Y*(�(**� Ͷ���a�eS*(�(**� Ͷ���a�h�k*� }**� }���oc���C**� }��*%�(*��cY�S�g��X�r����t|���/**� ��ƶY�]Y�a� W*��cY�S�g�a��*+,��� �*+,��� �*+,��� �**� ���Y� **� ��cY�S�$��� **� ��cY�S�=��**� ���Y� **� ��cY�S�$��� **� ��cY�S�=��**� ���Y� **� ��cY�S�$��� **� ��cY�S�=��**� ���Y� **� ��cY�S�$��� **� ��cY�S�=��**� ���Y� **� ��cY�S�$��� **� ��cY�S�=��**� ����Y� **� ��cY�S�$��� **� ��cY�S�=��*�   �   *   ��    �   ��   �� �  � �       I  I  I  I  .  ]# ]# ]# ]# a# a# d# d# \# \# m% �' �' �' �' �' �' �' �' �' �' �' �' �' �' x' �( �( �( �( �( �( �( �( �( �( �( �( �( �( �( �( �( �( �( �( �( % % % %%% % % % % �%%%"%"%"%"%5%5%"%"%%% m% \#M,M,M,M,Q,Q,T,T,L,L,L,L,e,e,e,e,L,L,�|�|�|�|�|�|�|�|�|�|�}�}�}�}�}�~�~�~�~�~�|������������������������������ � �#�#���;�;�;�;�,�S�S�S�S�D��Z�Z�Z�Z�^�^�a�a�Y�Y�y�y�y�y�j�����������Y���������������������������������������������������������������������������������L, ? �  �    �,�e,**� Q�cYS�����e,�e,**� Q�cY�S�����e,�e,**� Q�cY�SY%S�����e,�e,**� Q�cY�SY+S�����e,!�e,*<�(**� ��}*��Y*��cY�S�gS�����e,#�e**� Q�0�Y�]Y�a� W*%�ĸ]Y�a� @W*B�(**��cY�SY'S�g��**� Q�cY�S�����̸]�a� U*,��5,**��cY�SY'S��**� Q�cY�S���Ӹ��cY�S�ظ��e,)�e*,1�5,*E�(**� I�������e,+�e*�:"+�"�<:*S�(>@B�F�HY��YJSY-S�S�Y�3�ZY6� 6*,�^M,/�e�h���� � :� �:*,�lM��q� :� #�� � #:		�u� � :
� 
�:�x�,1�e*�:#+�"�<:*W�(>@B�F�HY��YJSY3SYNSY3S�S�Y�3�ZY6� 6*,�^M,5�e�h���� � :� �:*,�lM��q� :� #�� � #:�u� � :� �:�x�,7�e,*X�(**� Q�cYGS�����:�e,<�e,**� ն����e,>�e,*Z�(**� Q�cY�S�����:�e*� #&�&+&��FR�LOR��Fa�LOa�R^a�afa����������"�"��1�1�".1�161� �   �   ���    ��   ���   ���   �$�   �% z   ���   ���   ���   ��� 	  ��� 
  ���   �&�   �' z   ���   ���   ���   ���   ���   ��� �  � s 8 8 8 8 8 (9 (9 (9 (9 '9 H: H: H: H: G: n; n; n; n; m; �< �< �< �< �< �< �< �< �< �B �B �B �B �B �B �B �B �B �B �B �B �B �B �B �B �B �B �B �B �B �BBBBBBBBB B B B B �B �BECEC[C[CDCDCDCDCCC �B�E�E�E�E�E�E�E�E�E�S�S�S�W�W�W�WyWQXQXQXQXQXQXQXQXIXsYsYsYsYrY�Z�Z�Z�Z�Z�Z�Z�Z�Z ~ �  X    �,C�e*�:$+�"�<:*^�(>@B�F�HY��YJSYES�S�Y�3�ZY6� 6*,�^M,G�e�h���� � :� �:*,�lM��q� :� #�� � #:		�u� � :
� 
�:�x�,1�e**� ]�D��,I�e*d�(*d�(*K�N**� Q�cY�SYS�����Q����� 
,S�e*,U�5*�Z%+�"�\:*g�(��_�3�`Y6�#,b�e,*h�(**� ]�cYdS������e,f�e**� Q�cY�SYS��**� ]�cYdS�����~��]Y�a� oW*h�(**� Q�cY�SYS�����s�m�~��]Y�a� 3W**� Q�cYGS��**� ]�cYdS�����~��]�a� 
,h�e,j�e,*h�(**� ]�cYdS������e,l�e�m����n� :� #�� � #:�� � :� �:�o�,q�e�$*,s�5*�:&+�"�<:*l�(>@B�F�HY��YJSYuSYNSYuS�S�Y�3�ZY6� 6*,�^M,w�e�h���� � :� �:*,�lM��q� :� #�� � #:�u� � :� �:�x�,y�e,*o�(**� Q�cYGS�����:�e,{�e,*o�(**� y������e,}�e*�  Y u x� x } x� N � �� � � �� N � �� � � �� � � �� � � ��L�������L���������������;>�>C>�^j�dgj�^y�dgy�jvy�y~y� �     ���    ��   ���   ���   �(�   �) z   ���   ���   ���   ��� 	  ��� 
  ���   �*+   �, z   ���   ���   ���   ���   �-�   �. z   ���   ���   ���   ���   ���   ��� �  � k >^ >^ ^ �b �b �b �b �b �b �d �d �d �d �d �d �d �d �d �d �d �d �d �d �d �d �d@g@gfhfhfhfhfhfhfhfh^h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�hhhhhhhhh�h�h�h�h�h�h�hMhMhMhMhMhMhMhMhEh(g�l�lll�l�o�o�o�o�o�o�o�o�o�o�o�o�o�o�o�o�o�o�k �b � �    ,  _,��e*�:'+�"�<:*y�(>@B�F�HY��YJSY�S�S�Y�3�ZY6� 6*,�^M,��e�h���� � :� �:*,�lM��q� :� #�� � #:		�u� � :
� 
�:�x�,��e*�:(+�"�<:*}�(>@B�F�HY��YJSY�SYNSY�S�S�Y�3�ZY6� /*,�^M�h���� � :� �:*,�lM��q� :� #�� � #:�u� � :� �:�x�,��e**� Q�cY�SY�S���a� 
,��e,��e,**� 1�����e,��e*�:)+�"�<:*��(>@B�F�HY��YJSY�S�S�Y�3�ZY6� 6*,�^M,��e�h���� � :� �:*,�lM��q� :� #�� � #:�u� � :� �:�x�,��e*�:*+�"�<:*��(>@B�F�HY��YJSY�SYNSY�S�S�Y�3�ZY6� 6*,�^M,��e�h���� � :� �:*,�lM��q� : � # �� � #:!!�u� � :"� "�:#�x�#,��e,**� Q�cYS�����e,��e,**� U�����e,��e*�:++�"�<:$*��($>@B�F$�HY��YJSY�S�S�Y$�3$�ZY6%� 6*$%,�^M,��e$�h���� � :&� &�:'*%,�lM�'$�q� :(� #(�� � #:)$)�u� � :*� *�:+$�x�+*� ( Y u x� x } x� N � �� � � �� N � �� � � �� � � �� � � ��)>A�AFA�am�gjm�a|�gj|�my|�|�|�(DG�GLG�gs�mps�g��mp��s����������7C�=@C��7R�=@R�COR�RWR�����1=�7:=��1L�7:L�=IL�LQL� �  � ,  _��    _�   _��   _��   _/�   _0 z   _��   _��   _��   _�� 	  _�� 
  _��   _1�   _2 z   _��   _��   _��   _��   _��   _��   _3�   _4 z   _��   _��   _��   _��   _��   _��   _5�   _6 z   _��   _��   _��    _�� !  _�� "  _�� #  _7� $  _8 z %  _�� &  _�� '  _�� (  _�� )  _ � *  _� +�   � % >y >y y}}}} �}���������������������������k�k�k�k�j����������������� � �  C  $  �,��e*�:,+�"�<:*��(>@B�F�HY��YJSY�SYNSY�S�S�Y�3�ZY6� 6*,�^M,��e�h���� � :� �:*,�lM��q� :� #�� � #:		�u� � :
� 
�:�x�,��e,**� Q�cYS�����e,��e,**� 5�����e,��e*�:-+�"�<:*��(>@B�F�HY��YJSY�S�S�Y�3�ZY6� 6*,�^M,��e�h���� � :� �:*,�lM��q� :� #�� � #:�u� � :� �:�x�,��e,**� Q�cYS�����e,��e**� ����Y� �*,��5*�:.+�"�<:*��(>@B�F�HY��YJSY�SYNSY�S�S�Y�3�ZY6� 6*,�^M,öe�h���� � :� �:*,�lM��q� :� #�� � #:�u� � :� �:�x�,Ŷe,**� ������e,Ƕe� �*,��5*�:/+�"�<:*��(>@B�F�HY��YJSY�SYNSY�S�S�Y�3�ZY6� 6*,�^M,˶e�h���� � :� �:*,�lM��q� : � # �� � #:!!�u� � :"� "�:#�x�#,Ͷe,**� -�����e,϶e*�   e � �� � � �� Z � �� � � �� Z � �� � � �� � � �� � � ��_{~�~�~�T�������T���������������h�������]�������]���������������Yux�x}x�N�������N��������������� �  j $  ���    ��   ���   ���   �9�   �: z   ���   ���   ���   ��� 	  ��� 
  ���   �;�   �< z   ���   ���   ���   ���   ���   ���   �=�   �> z   ���   ���   ���   ���   ���   ���   �?�   �@ z   ���   ���   ���    ��� !  ��� "  ��� #�   � 7 >� >� J� J� � �� �� �� �� �� �� �� �� �� ��D�D��������������������������������A�A�M�M�
�����������2�2�>�>�����������������  �  � 
   p*� q*��cYGS�g�C*#�(�*��cY�SY�S�g�������� /*�+�"�$:*$�(��-�3�7� �*)�(**��cY�SY�S�g��*��cYGS�g����W*��ę*-�(**��cY�SY�S�g��*��cYGS�g���̸]Y�a� �W**��cY�SY�S��*��cYGS�g�Ӹ��cY�S��ڸm�~�]Y�a� JW**��cY�SY�S��*��cYGS�g�Ӹ��cY�S��ܸm�~�]�a� 9*/�(**��cY�SY�S�g��*��cYGS�g����W*��+�"��:*3�(�������Y���*4�(*������*��cYGS�g��������
��3�7� �*��+�"��:*6�(������3�7� �*�   �   H   p��    p�   p��   p��   pA�   pBC   pD� �  � q                #  #  #  #  #  #  #  # Y $ Y $ C $  # v ) v ) v ) v ) � ) � ) � ) � ) � ) � ) u ) u ) u ) � + � + � + � + � - � - � - � - � - � - � - � - � - � - � - � - � - � - - - � - � -) -) - � - � - � - � -? -? -U -U -> -> -w -w -> -> -> -> - � - � - � - � - � - � -� /� /� /� /� /� /� /� /� /� /� / � - � + u '� 3� 3� 4� 4� 4� 4� 4� 4 4 4 4 4 4 4 4 4� 4� 4� 3X 6X 6< 6 � �  �    I*� �s�C**� ����Y� *� �*��cY�S�g�C� v*��ĸ]Y�a� @W*x�(*x�(**� ��cY�SY�S���������!�~�]�a� "*� �**� ��cY�SY�S���C*� =¶C**� ��ƶY�]Y�a� W*��cY�S�gY�a� W**� �;ȶY��]�a� *� =¶C� u**� ��ƶY�]Y�a� W*��cY�S�gY�a� W**� �;ȶY�]�a� *� =ʶC� !*� =**� ��cY�SY;S���C*� M̶C**� ��жY�]Y�a� W*��cY�S�g�a� *� MҶC* ��(**� %�}�*��Y�cY�SY�SY�SY�SY�S��Y*��cYGS�gSY*��cYS�gSY**� ���SY**� =��SY**� M��S����W*�   �   *   I��    I�   I��   I�� �  � �  u  u  u  u   u  v  v  v  v  v  v  v  v 
 v 
 v  w  w  w  w  w 6 x 6 x 5 x 5 x 5 x 5 x S x S x S x S x S x S x S x S x w x w x S x S x S x S x 5 x 5 x � y � y � y � y � y 5 x 5 x 
 v � { � { � { � { � { � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � | � } � } � } � } � }	 ~	 ~	 ~	 ~ ~ ~ ~ ~ ~ ~ ~ ~! ~! ~! ~! ~ ~ ~ ~ ~: ~: ~: ~: ~> ~> ~@ ~@ ~9 ~9 ~9 ~9 ~ ~ ~S S S S O ` �` �` �` �\ � ~ ~ � |~ �~ �~ �~ �z �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � �! �! �, �, �7 �7 �� �� �� � � �  �    �**� ����Y� **� ��cY�S�$��� **� ��cY�S�=��**� ����Y� **� ��cY�S�=��� **� ��cY�S�$��**� ��ŶY� **� ��cY�S�=��� **� ��cY�S�$��**� ��˶Y� **� ��cY�S�$��� **� ��cY�S�=��**� ��϶Y� **� ��cY�S�$��� **� ��cY�S�=��**� ��ӶY� **� ��cY�S�$��� **� ��cY�S�=��**� ��׶Y� **� ��cY�S�$��� **� ��cY�S�=��**� ��۶Y� **� ��cY�S�$��� **� ��cY�S�=��*�   �   *   ���    ��   ���   ��� �  � � d d d d d d d d  d  d  e  e  e  e e 8f 8f 8f 8f )f  d ?g ?g ?g ?g Cg Cg Fg Fg >g >g ^h ^h ^h ^h Oh vi vi vi vi gi >g }j }j }j }j �j �j �j �j |j |j �k �k �k �k �k �l �l �l �l �l |j �m �m �m �m �m �m �m �m �m �m �n �n �n �n �n �o �o �o �o �o �m �p �p �p �p �p �p p p �p �pqqqq	q0r0r0r0r!r �p7s7s7s7s;s;s>s>s6s6sVtVtVtVtGtnunununu_u6suvuvuvuvyvyv|v|vtvtv�w�w�w�w�w�x�x�x�x�xtv�y�y�y�y�y�y�y�y�y�y�z�z�z�z�z�{�{�{�{�{�y 0 �  V    �**� ��cY�S*��cYGS�g��**� ��cY�S*��cY�S�g��**� ��cYS*��cYS�g��**� ��cYS*��cYS�g��**� ��Y� (**� ��cYS*��cYS�g��� *��cYSs�**� ��Y�]Y�a� .W*��cYS�g*��cYS�g���~�]�a� �* �(* �(*��cYS�g�������!�� M**� ��cYS* �(**��cY�S����Y*��cYS�gS�#��� **� ��cYSs��**� �%'�Y� .**� ��cY�SY%S*��cY%S�g��� K*)�ę .*��cY%S**� ��cY�SY%S���� *��cY%Ss�**� �+-�Y� .**� ��cY�SY+S*��cY+S�g��� K*/�ę .*��cY+S**� ��cY�SY+S���� *��cY+Ss�*�   �   *   ���    ��   ���   ��� �  ^ �  �  �  �  �   � 0 � 0 � 0 � 0 � ! � R � R � R � R � C � t � t � t � t � e � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �' �' �' �' �' �' �' �' �C �C �} �} �c �c �c �c �M �� �� �� �� �� �' � � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �* �* �* �* � �� �� �� �1 �1 �1 �1 �5 �5 �8 �8 �0 �0 �V �V �V �V �A �m �m �l �l �� �� �� �� �v �� �� �� �� �� �l �l �0 � � �  � 	   {**� �;ȶY� ,**� ��cY�SY;S*��cY;S�g��� **� ��cY�SY;S¶�**� �Wt�Y� :**� ��cYWS*5�(*��cYWS�g���xyk����� **� ��cYWS���**� ��|�Y� :**� ��cY�S*8�(*��cY�S�g���xyk����� **� ��cY�S���**� �~��Y� 8**� ��cY~S*;�(*��cY~S�g���x����� **� ��cY~S���**� ����Y� 5**� ��cY�S*>�(*��cY�S�g���x����**� ����Y� 5**� ��cY�S*@�(*��cY�S�g���x����**� ����Y�]Y�a� !W*B�(*��cY�S�g���]�a� 5**� ��cY�SY�S*��cY�S�g��� (*F�(***� ��cY�S�������W*�   �   *   {��    {�   {��   {�� �  � � 0 0 0 0 0 0 0 0  0  0 $1 $1 $1 $1 1 M2 M2 M2 M2 92  0 T4 T4 T4 T4 X4 X4 Z4 Z4 S4 S4 x5 x5 x5 x5 x5 x5 x5 x5 �5 �5 x5 x5 x5 x5 c5 �6 �6 �6 �6 �6 S4 �7 �7 �7 �7 �7 �7 �7 �7 �7 �7 �8 �8 �8 �8 �8 �8 �8 �8 �8 �8 �8 �8 �8 �8 �89999 �9 �7::::::::::2;2;2;2;2;2;2;2;;`<`<`<`<Q<:h=h=h=h=l=l=o=o=g=g=�>�>�>�>�>�>�>�>x>g=�?�?�?�?�?�?�?�?�?�?�@�@�@�@�@�@�@�@�@�?�B�B�B�B�B�B�B�B�B�B�B�BBBBBBB�B�B>C>C>C>C)C\F\F\F\FqFqFtFtF[F[F[F�B E  �   �     ����������'��)8��:�cY�S���cY�S��a��c�����cY�S��X��Z�cYS��cYS�!�HY��Y�SY��SY�SY��S�S���   �       ���   � �  � 	   '**� ����Y� (**� ��cY�S*��cY�S�g��� **� ��cY�Ss��**� ����Y� (**� ��cY�S*��cY�S�g��� **� ��cY�S�=��**� ��cY�S*R�(����**� ����Y� !**� ��cY�SY�S�$��� **� ��cY�SY�S�=��**� ����Y� !**� ��cY�SY�S�$��� **� ��cY�SY�S�=��**� ����Y� !**� ��cY�SY�S�$��� **� ��cY�SY�S�=��**� ����Y� .**� ��cY�SY�S*��cY�S�g��� **� ��cY�SY�Ss��**� ����Y� **� ��cY�S�$��� **� ��cY�S�=��*�   �   *   '��    '�   '��   '�� �  b � I I I I I I I I  I  I  J  J  J  J J EK EK EK EK 6K  I LM LM LM LM PM PM SM SM KM KM kN kN kN kN \N �O �O �O �O �O KM �R �R �R �R �R �S �S �S �S �S �S �S �S �S �S �T �T �T �T �T �U �U �U �U �U �S �V �V �V �VVVVV �V �V"W"W"W"WW@X@X@X@X+X �VGYGYGYGYKYKYNYNYFYFYlZlZlZlZWZ�[�[�[�[u[FY�\�\�\�\�\�\�\�\�\�\�]�]�]�]�]�^�^�^�^�^�\�a�a�a�a�a�a�a�a�a�abbbb�bccccc�a       �    �