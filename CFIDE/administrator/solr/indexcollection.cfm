����  -< 
SourceFile -/CFIDE/administrator/solr/indexcollection.cfm  cfindexcollection2ecfm1704132983  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   PATH Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   GETCOLLECTIONINFO   	   $ERROR_DISABLE_HIGLIGHTING_COLLECTION   	    
EXTENSIONS " " 	  $ BROWSE_SERVER & & 	  ( DEFAULTPATH * * 	  , RURL . . 	  0 CFCATCH 2 2 	  4 TOKEN 6 6 	  8 ERROR_INDEXING_COLLECTION : : 	  < DIALOGSTYLE > > 	  @ SOLR_NEWNAME_REQUIRED B B 	  D 	TREEFIELD F F 	  H DISABLE J J 	  L SOLRSERVICE N N 	  P #ERROR_ENABLE_HIGLIGHTING_COLLECTION R R 	  T 	SOLRUTILS V V 	  X 
ISSOLRCORE Z Z 	  \ ENABLE ^ ^ 	  ` COLLECTIONNAME b b 	  d VALID_COLLECTION_PATH f f 	  h INDEXRESULT j j 	  l PREFIX n n 	  p COLLECTION_RENAMED r r 	  t ERROR_ALIASING_COLLECTION v v 	  x 	RETURNURL z z 	  | UTILS ~ ~ 	  � FULL_HIGHTLIGHT_ENABLED � � 	  � I � � 	  � RECURSE � � 	  � CHECKCSRFTOKEN � � 	  � HIGHTLIGHT_ENABLED � � 	  � LANG � � 	  � URL � � 	  � EXTERNAL � � 	  � COLLECTION_ALIASED � � 	  � 	URLENCHAR � � 	  � GETCSRFTOKEN � � 	  � ERROR_RENAMING_COLLECTION � � 	  � COLLECTION_INDEXED � � 	  � SOLRURL � � 	  � SOLR_HIGHLIGHTING_REMOTE � � 	  � FORM � � 	  � SOLRHOST � � 	  � AERRORMESSAGES � � 	  � COLLECTIONLANGUAGE � � 	  � 	LANGUAGES � � 	  � DIRPATH � � 	  � REQUEST � � 	  � SUBMIT � � 	  � CANCEL � � 	  � SOLR_ALIAS_REQUIRED � � 	  � BERRORSEXIST � � 	  � com.macromedia.SourceModTime  h���� pageContext #Lcoldfusion/runtime/NeoPageContext; � �	  � getOut ()Ljavax/servlet/jsp/JspWriter; � � javax/servlet/jsp/JspContext �
 � � parent Ljavax/servlet/jsp/tagext/Tag; � �	  � Cp1252 � setPageEncoding (Ljava/lang/String;)V � � !coldfusion/runtime/NeoPageContext 
 � D
<script language="Javascript" src="../scripts/util.js"></script>
 write � java/io/Writer
 $class$coldfusion$tagext$io$SilentTag Ljava/lang/Class; coldfusion.tagext.io.SilentTag forName %(Ljava/lang/String;)Ljava/lang/Class; java/lang/Class

	  _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag;
  coldfusion/tagext/io/SilentTag _setCurrentLineNo (I)V
  	hasEndTag (Z)V ! coldfusion/tagext/GenericTag#
$" 
doStartTag ()I&'
( 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;*+
 , LOCALE. REQUEST.LOCALE0 en2 checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V45
 6 java/lang/String8 
LOCALEFILE: java/lang/StringBuilder< resources/solr_>  �
=@ _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;BC
 D _String &(Ljava/lang/Object;)Ljava/lang/String;FG coldfusion/runtime/CastI
JH append -(Ljava/lang/String;)Ljava/lang/StringBuilder;LM
=N .cfmP toString ()Ljava/lang/String;RS java/lang/ObjectU
VT _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)VXY
 Z %class$coldfusion$tagext$lang$ParamTag coldfusion.tagext.lang.ParamTag]\	 _ coldfusion/tagext/lang/ParamTaga collectionnamec setNamee �
bf  h 
setDefault (Ljava/lang/Object;)Vjk
bl stringn setTypep �
bq _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Zst
 u .html, .htm, .cfm, .cfmlw 2(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)V4y
 z 0| english~ false� no� SOLRALIASNAME� FORM.SOLRALIASNAME� SOLRNEWNAME� FORM.SOLRNEWNAME� FORM.COLLECTIONNAME�  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z��
 � set�k coldfusion/runtime/Variable�
�� java�  coldfusion.server.ServiceFactory� CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;��
 � getSolrService� _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;��
 � "coldfusion.tagext.search.SolrUtils� 
getSolrUrl� _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;��
 � _factor6 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;��
 � _get��
 � getSolrHost� 
IsSolrCore� ArrayNew (I)Ljava/util/List;��
 � _Array 2(Ljava/lang/Object;)Lcoldfusion/runtime/FastArray;��
J� setArray !(Lcoldfusion/runtime/FastArray;)V��
�� indexcollection.cfm� ADMINSUBMIT� FORM.ADMINSUBMIT� _Object (Z)Ljava/lang/Object;��
J� _boolean (Ljava/lang/Object;)Z��
J� ALIASSUBMIT� FORM.ALIASSUBMIT� RENAMESUBMIT� FORM.RENAMESUBMIT� ENABLEHIGHLIGHTING� FORM.ENABLEHIGHLIGHTING� DISABLEHIGHLIGHTING� FORM.DISABLEHIGHLIGHTING� 	CSRFTOKEN� FORM.CSRFTOKEN� URL.CSRFTOKEN� checkCSRFToken� DATASERVTABKEYNAME� 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;��
 � FORM.CANCEL� 'class$coldfusion$tagext$net$LocationTag !coldfusion.tagext.net.LocationTag��	 � !coldfusion/tagext/net/LocationTag� 	index.cfm� setUrl� �
�� setAddtoken�!
�� BROWSESUBMIT FORM.BROWSESUBMIT dirpath SelectDirectory 'class$coldfusion$tagext$lang$IncludeTag !coldfusion.tagext.lang.IncludeTag
		  !coldfusion/tagext/lang/IncludeTag ../filedialog/index.cfm setTemplate �
 %class$coldfusion$tagext$lang$AbortTag coldfusion.tagext.lang.AbortTag	  coldfusion/tagext/lang/AbortTag 
TREESUBMIT FORM.TREESUBMIT Cancel  _compare '(Ljava/lang/Object;Ljava/lang/String;)D"#
 $ 
NEWDIRPATH& (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTag)(	 + "coldfusion/tagext/lang/ImportedTag- l10n/ 
../cftags/1 admin3 :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ve5
.6 &coldfusion/runtime/AttributeCollection8 id: valid_collection_name< var> ([Ljava/lang/Object;)V @
9A setAttributecollection (Ljava/util/Map;)VCD  coldfusion/tagext/lang/ModuleTagF
GE
G( .Please enter a valid name for this collection.J doAfterBodyL'
GM _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;OP
 Q doEndTagS' #javax/servlet/jsp/tagext/TagSupportU
VT doCatch (Ljava/lang/Throwable;)VXY
GZ 	doFinally\ 
G] valid_collection_path_ 8Please enter a valid Directory Path for this collection.a Trim &(Ljava/lang/String;)Ljava/lang/String;cd
 e Len (Ljava/lang/Object;)Igh
 i (I)Ljava/lang/Object;�k
Jl (Ljava/lang/Object;D)D"n
 o coldfusion/runtime/CFBooleanq t_true Lcoldfusion/runtime/CFBoolean;st	ru ArrayLenwh
 x (I)Ljava/lang/String;Fz
J{ Val (Ljava/lang/String;)D}~
  (D)Ljava/lang/Object;��
J� _arraySetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V��
 � *coldfusion/runtime/TransientVariableHolder� &(Lcoldfusion/runtime/NeoPageContext;)V �
�� 'class$coldfusion$tagext$search$IndexTag !coldfusion.tagext.search.IndexTag��	 � !coldfusion/tagext/search/IndexTag� update� 	setAction� �
�� path�
�q cfindex� prefix� _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;��
 � 	setPrefix� �
�� 
collection� setCollection� �
�� key� setKey� �
�� urlpath� 
setUrlpath� �
�� recurse� YesNoFormat�G
 � (Ljava/lang/String;)Z��
J� :(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Z��
 � 
setRecurse�!
�� indexResult� 	setStatus� �
�� language� setLanguage� �
�� 
extensions� setExtensions� �
�� collection_indexed� Collection � $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag��	 � coldfusion/tagext/io/OutputTag�
�( EncodeForHTML�d
 � 
 Indexed: � INSERTED� D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object;B�
 �  files inserted, � UPDATED�  files updated.�
�M coldfusion/tagext/QueryLoop�
�T
�Z
�] _factor0��
 � 
cflocation� url� index.cfm?CollectionMessage=� URLEncodedFormat 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;��
   concatd
9 unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable; coldfusion/runtime/NeoException
	 t53 [Ljava/lang/String; Any	  findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I
	 bind '(Ljava/lang/String;Ljava/lang/Object;)V
� error_indexing_collection ?
				There was an error indexing this collection. <br />
				 
ESAPIUTILS _resolveC
   encodeForHTMLFilePath" MESSAGE$ <br />
				& DETAIL( 
			* _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V,-
 . unbind0 
�1 _factor13�
 4 solr_alias_required6 An alias name is required.8 createSolrAlias: collection_aliased< 
                  Alias >  created for @ .B 
               D t54F	 G error_aliasing_collectionI ?
				There was an error aliasing this collection. <br />
				K <br />
			   M _factor2O�
 P solr_newname_requiredR "A new collection name is required.T renameSolrAliasV collection_renamedX 
                  Z  renamed to \ t55^	 _ error_renaming_collectiona ?
				There was an error renaming this collection. <br />
				c _factor3e�
 f getCollectionPathh solr_highlighting_remotej solr_highligting_remotel �Could not determine collection path locally. See the section Term Highlighting in the <i>Developing Coldfusion 9 Applications</i> to enable term highlighting for the entire document.n CFIDE.administrator.solr.utilsp &(Ljava/lang/String;)Ljava/lang/Object;�r
 s enableFullTermHighLightingu restartSolrCorew collection_hightlightenabledy hightlight_enabled{ Term highlighting enabled for } 6. Reindex collection for these changes to take effect  _factor4��
 � t56�	 � #error_enable_higlighting_collection� P
				There was an error enabling highlighting for this collection. <br />
				� disableFullTermHighLighting� %fullterm_collection_hightlightenabled� full_hightlight_enabled� $Full term highlighting disabled for � _factor5��
 � t57�	 � $error_disable_higlighting_collection� Q
				There was an error disabling highlighting for this collection. <br />
				� _factor7��
 � ,class$coldfusion$tagext$search$CollectionTag &coldfusion.tagext.search.CollectionTag��	 � &coldfusion/tagext/search/CollectionTag� list�
�� qVGetCollections�
�f $class$coldfusion$tagext$sql$QueryTag coldfusion.tagext.sql.QueryTag��	 � coldfusion/tagext/sql/QueryTag� getCollectionInfo�
�f query� 	setDbtype� �
��
�( 4
	select *
	from qVGetCollections
	where name = '� _escapeSingleQuotes�d
 � '
�
�M
�T
�Z
�]
$M
$Z
$] 	_factor16��
 � 
� 

� pagename_indexveritycollection� pagename� Index Solr Collections� ../header.cfm� )class$coldfusion$tagext$html$form$FormTag #coldfusion.tagext.html.form.FormTag��	 � #coldfusion/tagext/html/form/FormTag� indexcollection�
�f cfform� action� CGI� SCRIPT_NAME�
�� post� 	setMethod� �
��
�( ../include/margintop.cfm� ../include/errors.cfm� 1

<input type="hidden" name="csrftoken" value="� getCSRFToken� ">	

� 
<h2 class="pageHeader">� !indexcollection_pageHeader_manage� FData &amp; Services &gt; ColdFusion Collections &gt; Manage Collection </h2>
  indexcollection_pageHeader_index EData &amp; Services &gt; ColdFusion Collections &gt; Index Collection 	</h2>

	 

<br>

 IsLocalHost�
  
<p><strong>
 solrindex_welcome�
NOTE: Because you have a remote Solr server configured, you must ensure that the documents
to be indexed are accessible from the ColdFusion server machine as well as the computer
on which the Solr search services run. Also, if the local and remote file paths do not match exactly,
you can use the Remote Directory Path field to define a prefix that maps the local path to the path
on the remote Solr host.
 
</strong></p>
 	_factor10�
  Z

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td bgcolor="# 	GRAYLIGHT +" class="cellBlueTopAndBottom">
		<strong> l10n_indexcollection! Index Collection:#  % L</strong>
	</td>
</tr>
<input name="collectionname" type="hidden" value="' EncodeForHTMLAttribute)d
 * �" id="CollectionName">
<tr>
	<td>
		
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<label for="Extensions">, l10n_indexextensions. File Extensions0 ]</label>
			</td>
			<td>
				<input name="extensions" type="text" maxlength="550" value="2 I" size="25" id="Extensions">
			</td>
		</tr>
		<tr>
			<td>
	  		  4 
				<label for="DirPath">6 l10n_indexdirpath8 Directory Path: </label>
			  < l10n_LocalIndexdirpath> Local Directory Path@ 	_factor11B�
 C R
			</td>
			<td>
				<input name="dirpath" type="text" maxlength="550" value="E encodeForHTMLAttributeFilePathG 1" size="25" id="DirPath">
				&nbsp;&nbsp;
				I browser_serverK browse_serverM Browse ServerO E
				<input type="button" class="buttn"  name="BrowseSubmit" title="Q 	" value="S 5" onclick='wopen("DirPath");'>
			</td>
		</tr>
		U ,
		<tr>
			<td>
				<label for="DirPath">W l10n_indexdirprefixY Remote Directory Path[ Y</label>
			</td>
			<td>
				<input name="prefix" type="text" maxlength="550" value="] /" size="25" id="Prefix">
			</td>
		</tr>
		_ h
		<tr>
			<td>&nbsp;

			</td>
			<td>
				<input name="recurse" type="checkbox" value="1"
					a checkedc /
					id="Recurse">
				<label for="Recurse">e recurse_index_sub_dirsg !Recursively Index Sub Directoriesi I</label>
			</td>
		</tr>
		<tr>
			<td>
				<label for="ReturnURL">k l10n_indexreturnurlm 
Return URLo 	_factor12q�
 r W</label>
			</td>
			<td>
				<input name="rURL" type="text" maxlength="550" value="t }" size="25" style="width:25em;" class="label" id="ReturnURL">
			</td>
		</tr>
		<tr>
			<td>
				<label for="Language">v 10n_indexlanguagex Languagez .</label>
			</td>
			<td>
				
			        | 
					~ getLanguages� +class$coldfusion$tagext$html$form$SelectTag %coldfusion.tagext.html.form.SelectTag��	 � %coldfusion/tagext/html/form/SelectTag� collectionlanguage�
�f class� setLabel� �
�� (coldfusion/tagext/html/form/FormChildTag�
�E
�( 6
					<option value="English">Default</option>
					� 1� _double�~
J� P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable; �
 � 
						� _arrayGetAt C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object;��
 � 
						<option value="� NAME� ">� </option>
					� CFLOOP� checkRequestTimeout� �
 � _checkCondition (DDD)Z��
 �
�M
�T 
					
				� 	

					� LANGUAGE� =
					<input type="hidden" name="collectionlanguage" value="� ">
			        � 	_factor13��
 � C
			</td>
		</tr>
		</table>
		
	</td>
</tr>
<tr>
	<td>
		� cancel� 
		� submit� Submit� 3
		<input type="Submit" name="adminsubmit" title="� @">
		&nbsp;&nbsp;
		<input type="submit" name="cancel" title="� /">
	</td>
</tr>
</table>
<br />
<br />

� X
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td bgcolor="#� l10n_termhighlight_title� Enable Term Highlighting:� �</strong>
	</td>
</tr>
<tr>
	<td>
		
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
	        <td>
			� 
				� termhighlight_desc� �
				<p> By default, Solr highlights searched terms available in the summary content. Click Enable to highlight contents in the entire document. After you enable/disable, reindex the collection.</p>
				� Enable� enable� Disable� disable� 
               			� 
	       			� 
	
	       				� 
	       				� isHighLightingEnabled� ?
						<input type="submit" name="disablehighlighting" title="� 	">
					� >
						<input type="Submit" name="enablehighlighting" title="� "></BR></BR>
						� termhighlight_note� _
						Note: Enabling term highlighting for the entire document increases index size. 
						� 
				&nbsp;&nbsp;
	       			 _factor8�
  
		 	 termhighlight_remote_note �
				<p>By default, Solr highlights searched terms only in the summary content. See the section Term Highlighting in the <i>Developing Coldfusion 9 Applications</i> to enable term highlighting for the entire document.</p>
				
 

			 � 
		</td>
		</tr>
		</table>
	</td>
</tr>
</table>
</BR>


<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td bgcolor="# l10n_renamecollection Rename Collection: �</strong>
	</td>
</tr>
<tr>
	<td>
		
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
	 	<td>
			<label for="rename"> l10n_corerename New name for Collection _factor9�
  </label>
		</td>
		<td>
			 *class$coldfusion$tagext$html$form$InputTag $coldfusion.tagext.html.form.InputTag 	 " $coldfusion/tagext/html/form/InputTag$ SolrNewName&
%f text)
%q setMaxLength,
%- size/ 251 renamecollection3 style5 width:25em;7
%E ;
		</td>

		</tr>
		<tr>
	        <td>
			<br />
			: 5
			<input type="Submit" name="renamesubmit" title="< B">
			&nbsp;&nbsp;
			<input type="submit" name="cancel" title="> =">
		</td>
		</tr>
		</table>
	</td>
</tr>
</table>

@ 	_factor14B�
 C ../include/marginbottom.cfmE
�M
�T
�Z
�] 	_factor15K�
 L ../footer.cfmN metaData Ljava/lang/Object;PQ	 R 	FunctionsT 
PropertiesV getMetadata ()Ljava/lang/Object; this "Lcfindexcollection2ecfm1704132983; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; __factorParent out Ljavax/servlet/jsp/JspWriter; value 	include53 #Lcoldfusion/tagext/lang/IncludeTag; 	include54 module55 $Lcoldfusion/tagext/lang/ImportedTag; mode55 t8 Ljava/lang/Throwable; t9 t10 t11 t12 t13 module56 mode56 t16 t17 t18 t19 t20 t21 module57 mode57 t24 t25 t26 t27 t28 t29 LineNumberTable java/lang/Throwable� module58 mode58 t6 t7 module59 mode59 t14 t15 module60 mode60 t22 t23 module61 mode61 t30 t31 t32 t33 t34 t35 module62 mode62 module63 mode63 module64 mode64 module65 mode65 module66 mode66 select68 'Lcoldfusion/tagext/html/form/SelectTag; mode68 output67  Lcoldfusion/tagext/io/OutputTag; mode67 D module72 mode72 module73 mode73 module74 mode74 module75 mode75 module69 mode69 module70 mode70 input79 &Lcoldfusion/tagext/html/form/InputTag; module80 mode80 module81 mode81 t36 module71 mode71 module76 mode76 module77 mode77 module78 mode78 param1 !Lcoldfusion/tagext/lang/ParamTag; module51 mode51 	include52 form83 %Lcoldfusion/tagext/html/form/FormTag; mode83 	include82 silent50  Lcoldfusion/tagext/io/SilentTag; mode50 collection48 (Lcoldfusion/tagext/search/CollectionTag; query49  Lcoldfusion/tagext/sql/QueryTag; mode49 
location12 #Lcoldfusion/tagext/net/LocationTag; 	include13 abort14 !Lcoldfusion/tagext/lang/AbortTag; module24 mode24 module30 mode30 ,Lcoldfusion/runtime/TransientVariableHolder; #Lcoldfusion/runtime/AbortException; Ljava/lang/Exception; __cfcatchThrowable3 output41 mode41 module40 mode40 t37 t38 t39 t40 t41 t42 t43 t44 t45 t46 t47 __cfcatchThrowable4 output47 mode47 module46 mode46 t58 t59 t60 t61 t62 t63 t64 !coldfusion/runtime/AbortException� java/lang/Exception index17 #Lcoldfusion/tagext/search/IndexTag; index18 module20 mode20 output19 mode19 module15 mode15 module16 mode16 
location21 __cfcatchThrowable0 output23 mode23 module22 mode22 runPage output84 mode84 	include85 module36 mode36 module38 mode38 output37 mode37 
location39 module42 mode42 module44 mode44 output43 mode43 
location45 t4 module26 mode26 output25 mode25 
location27 __cfcatchThrowable1 output29 mode29 module28 mode28 <clinit> module32 mode32 output31 mode31 
location33 __cfcatchThrowable2 output35 mode35 module34 mode34 1     H                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     r     v     z     ~     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �    
   \   �   	      (   �   �      F   ^   �   �   �   �   �   �      PQ    XY ]   "     �S�   \       Z[      ]  �    �*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q**s+,� � u**w+,� � y**{+,� � }**+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �   \       �Z[    �^_   �`a     ]   #     *� 
�   \       Z[   � ]  F    j*,Ѷ/*�5+��:*O����%�v� �*,϶/*�6+��:*P����%�v� �,��	,*R�**� ����*�VY*��9Y�S�ES��K�	,��	**� ]���p�� �,��	*�,7+��.:*U�024�7�9Y�VY;SY S�B�H�%�IY6� 6*,�-M,�	�N���� � :� �:	*,�RM�	�W� :
� #
�� � #:�[� � :� �:�^�,�	� �,��	*�,8+��.:*W�024�7�9Y�VY;SYS�B�H�%�IY6� 6*,�-M,�	�N���� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�,
�	,�	**� ]���p�~���Y�љ W*\�***� Ŷ��K���͸љ �,�	*�,9+��.:*^�024�7�9Y�VY;SYS�B�H�%�IY6� 6*,�-M,�	�N���� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�,�	*� 47�7<7�Wc�]`c�Wr�]`r�cor�rwr���
��%1�+.1��%@�+.@�1=@�@E@�����5A�;>A��5P�;>P�AMP�PUP� \  .   jZ[    jb �   jcd   jeQ   jfg   jhg   jij   jk �   jlm   jnQ 	  joQ 
  jpm   jqm   jrQ   jsj   jt �   jum   jvQ   jwQ   jxm   jym   jzQ   j{j   j| �   j}m   j~Q   jQ   j�m   j�m   j�Q �   � 5  O  O O VP VP >P {R {R �R �R {R {R {R {R sR �T �T �T �T �U �U �U�W�W�W�V �T_\_\g\g\_\_\_\_\�\�\�\�\�\�\�\�\�\�\�\�\_\_\�^�^�^_\ B� ]    $  �,�	,*��9YS�E�K�	, �	*�,:+��.:*k�024�7�9Y�VY;SY"S�B�H�%�IY6� 6*,�-M,$�	�N���� � :� �:*,�RM��W� :� #�� � #:		�[� � :
� 
�:�^�*,&�/,*k�**� e���K��	,(�	,*n�**� e���K�+�	,-�	*�,;+��.:*u�024�7�9Y�VY;SY/S�B�H�%�IY6� 6*,�-M,1�	�N���� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�,3�	,*x�**� %���K�+�	,5�	*}�***� Ŷ��K�� �,7�	*�,<+��.:*~�024�7�9Y�VY;SY9S�B�H�%�IY6� 6*,�-M,;�	�N���� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�,=�	� �,7�	*�,=+��.:*��024�7�9Y�VY;SY?S�B�H�%�IY6� 6*,�-M,A�	�N���� � :� �:*,�RM��W� : � # �� � #:!!�[� � :"� "�:#�^�#,=�	*�   w � �� � � �� l � �� � � �� l � �� � � �� � � �� � � ��|�������q�������q�����������������������u�������u���������������Njm�mrm�C�������C��������������� \  j $  �Z[    �b �   �cd   �eQ   ��j   �� �   ��m   ��Q   �lQ   �nm 	  �om 
  �pQ   ��j   �� �   ��m   ��Q   �uQ   �vm   �wm   �xQ   ��j   �� �   ��m   ��Q   �}Q   �~m   �m   ��Q   ��j   �� �   ��m   ��Q   ��Q    ��m !  ��m "  ��Q #�   � 4 j j j j j \k \k %k �k �k �k �k �k �k �k �k �knnnnnnnn
nauau*u�x�x�x�x�x�x�x�x�x}}}}}}e~e~.~3�3����} q� ]  � 	 $  <,F�	,*��**��9YS�!H�VY**� ն�S���K�	,J�	*�,>+��.:*��024�7�9Y�VY;SYLSY?SYNS�B�H�%�IY6� 6*,�-M,P�	�N���� � :� �:*,�RM��W� :� #�� � #:		�[� � :
� 
�:�^�,R�	,**� )���K�	,T�	,**� )���K�	,V�	**� ]���p�~���Y�љ W*��***� Ŷ��K���͸љ	,X�	*�,?+��.:*��024�7�9Y�VY;SYZS�B�H�%�IY6� 6*,�-M,\�	�N���� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�,^�	,*��**��9YS�!H�VY**� q��S���K�	,`�	,b�	*��**� ����K������p�� 
,d�	,f�	*�,@+��.:*��024�7�9Y�VY;SYhS�B�H�%�IY6� 6*,�-M,j�	�N���� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�,l�	*�,A+��.:*��024�7�9Y�VY;SYnS�B�H�%�IY6� 6*,�-M,p�	�N���� � :� �:*,�RM��W� : � # �� � #:!!�[� � :"� "�:#�^�#*�   � � �� � � �� � � �� � � �� � � �� � � �� � � �� � � ����������� � ��/�/� ,/�/4/�'*�*/*� JV�PSV� Je�PSe�Vbe�eje�������������)�)�&)�).)� \  j $  <Z[    <b �   <cd   <eQ   <�j   <� �   <�m   <�Q   <lQ   <nm 	  <om 
  <pQ   <�j   <� �   <�m   <�Q   <uQ   <vm   <wm   <xQ   <�j   <� �   <�m   <�Q   <}Q   <~m   <m   <�Q   <�j   <� �   <�m   <�Q   <�Q    <�m !  <�m "  <�Q #�   F )� )� � � � � � y� y� �� �� B������)�)�)�)�(�>�>�F�F�>�>�>�>�c�c�c�c�b�b�b�b�b�b�b�b�>�>�������i�i�O�O�O�O�G�>�����������������������������}� �� ]  � 	 !  �,u�	,*��**��9YS�!H�VY**� 1��S���K�	,w�	*�,B+��.:*��024�7�9Y�VY;SYyS�B�H�%�IY6� 6*,�-M,{�	�N���� � :� �:*,�RM��W� :� #�� � #:		�[� � :
� 
�:�^�,}�	**� ]���p��E*,�/*� �*��***� Q����V����*,�/*��D+���:*���������9Y�VY;SY�S�B���%��Y6�~*,�-M*,�/*��C���:*���%��Y6� �,��	9*��**� Ѷ��y�9���9��N*���:-��� �*,��/*� �**� �**� �������,��	,**� ��9Y�S��K�	,��	,**� ��9Y�S��K�	,��	c\9��N-���������y*,�/���*��� :� )� M� ��� � #:�� � :� �:���*,�/������ � :� �:*,�RM���� :� #�� � #:�ɨ � :� �: �ʩ *,��/� K*,��/,**� �9Y�S��K�	,��	,**� �9Y�S��K�	,��	*�  � � �� � � �� � � �� � � �� � � �� � � �� � � �� � � �����������������������������������.��".�(+.���=��"=�(+=�.:=�=B=� \  .   �Z[    �b �   �cd   �eQ   ��j   �� �   ��m   ��Q   �lQ   �nm 	  �om 
  �pQ   ���   �� �   ���   �� �   �u�   �w�   �y�   ��    ��Q   �}m   �~m   �Q   ��m   ��Q   ��Q   ��m   ��m   ��Q  �   F )� )� � � � � � y� y� B�����+�+�*�*�*�*���`�`�h�h���������������������%�%� � � � ���;�;�;�;�:�[�[�[�[�Z�������H�b�b�b�b�a�����������Y�� � ]  Y 	 $  �*,޶/*�,H+��.:*߶024�7�9Y�VY;SY�S�B�H�%�IY6� 6*,�-M,�	�N���� � :� �:*,�RM��W� :� #�� � #:		�[� � :
� 
�:�^�*,޶/*�,I+��.:*�024�7�9Y�VY;SY�SY?SY�S�B�H�%�IY6� 6*,�-M,�	�N���� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�*,޶/*�,J+��.:*�024�7�9Y�VY;SY�SY?SY�S�B�H�%�IY6� 6*,�-M,�	�N���� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�*,޶/*� Y*�*������*,�/*� *�***� Y��i�VY**� e��SY**� ���S����*,�/*�*�**� ���K�f�j�m��p���*,�/*� �*�*q�t��*,�/*�***� �����VY**� ��S���љ 9,��	,**� M���K�	,T�	,**� M���K�	,��	� �,��	,**� a���K�	,T�	,**� a���K�	,��	*�,K+��.:*��024�7�9Y�VY;SY�S�B�H�%�IY6� 6*,�-M, �	�N���� � :� �:*,�RM��W� : � # �� � #:!!�[� � :"� "�:#�^�#*,�/,�	*�   Z v y� y ~ y� O � �� � � �� O � �� � � �� � � �� � � ��+GJ�JOJ� jv�psv� j��ps��v��������� ��;G�ADG��;V�ADV�GSV�V[V�!$�$)$��DP�JMP��D_�JM_�P\_�_d_� \  j $  �Z[    �b �   �cd   �eQ   ��j   �� �   ��m   ��Q   �lQ   �nm 	  �om 
  �pQ   ��j   �� �   ��m   ��Q   �uQ   �vm   �wm   �xQ   ��j   �� �   ��m   ��Q   �}Q   �~m   �m   ��Q   ��j   �� �   ��m   ��Q   ��Q    ��m !  ��m "  ��Q #�  V U ?� ?� ����� ������������{�{�~�~�z�z�z�z�o�o�����������������������������������������������������'�'�8�8�&�&�R�R�R�R�Q�h�h�h�h�g�����������������������������&��� B� ]  W  %  �,ƶ	*�,E+��.:*ƶ024�7�9Y�VY;SY�SY?SY�S�B�H�%�IY6� 6*,�-M,!�	�N���� � :� �:*,�RM��W� :� #�� � #:		�[� � :
� 
�:�^�*,ʶ/*�,F+��.:*Ƕ024�7�9Y�VY;SY�SY?SY�S�B�H�%�IY6� 6*,�-M,ζ	�N���� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�,ж	,**� ݶ��K�	,T�	,**� ݶ��K�	,Ҷ	,**� ���K�	,T�	,**� ���K�	,Զ	**� ]���p���*+,�� �,�	*�#O+��%:*�'�(*�+ ��.�9Y�VY0SY2SY;SY4SY6SY8S�B�9�%�v� �,;�	*�,P+��.:*�024�7�9Y�VY;SY�SY?SY�S�B�H�%�IY6� 6*,�-M,!�	�N���� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�*,+�/*�,Q+��.:*�024�7�9Y�VY;SY�SY?SY�S�B�H�%�IY6� 6*,�-M,ζ	�N���� � :� �: *,�RM� �W� :!� #!�� � #:""�[� � :#� #�:$�^�$,=�	,**� ݶ��K�	,T�	,**� ݶ��K�	,?�	,**� ���K�	,T�	,**� ���K�	,A�	*�   e � �� � � �� Z � �� � � �� Z � �� � � �� � � �� � � ��6RU�UZU�+u��{~��+u��{~������������ ��;G�ADG��;V�ADV�GSV�V[V�������������'�'�$'�','� \  t %  �Z[    �b �   �cd   �eQ   ��j   �� �   ��m   ��Q   �lQ   �nm 	  �om 
  �pQ   ��j   �� �   ��m   ��Q   �uQ   �vm   �wm   �xQ   ���   ��j   �� �   ��m   �}Q   �~Q   �m   ��m   ��Q   ��j   �� �   ��m   ��Q    ��Q !  ��m "  ��m #  ��Q $�  2 L >� >� J� J� ����� ������������������������������������������ � ���<<DDeeqq}}$���������o@@@@?VVVVUllllk����� � � ]    $  �,ֶ	,*��9YS�E�K�	, �	*�,G+��.:*ն024�7�9Y�VY;SY�S�B�H�%�IY6� 6*,�-M,ڶ	�N���� � :� �:*,�RM��W� :� #�� � #:		�[� � :
� 
�:�^�*,&�/,*ն**� e���K��	,ܶ	*޶***� Ŷ��K�� *+,�� �*,�/� �*,޶/*�,L+��.:*��024�7�9Y�VY;SY	S�B�H�%�IY6� 6*,�-M,�	�N���� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�*,�/,�	,*��9YS�E�K�	, �	*�,M+��.:*�024�7�9Y�VY;SYS�B�H�%�IY6� 6*,�-M,�	�N���� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�*,&�/,*�**� e���K��	,�	*�,N+��.:*�024�7�9Y�VY;SYS�B�H�%�IY6� 6*,�-M,�	�N���� � :� �:*,�RM��W� : � # �� � #:!!�[� � :"� "�:#�^�#*�   w � �� � � �� l � �� � � �� l � �� � � �� � � �� � � ����������������������������������~�������s�������s���������������c������X�������X��������������� \  j $  �Z[    �b �   �cd   �eQ   ��j   �� �   ��m   ��Q   �lQ   �nm 	  �om 
  �pQ   ��j   �� �   ��m   ��Q   �uQ   �vm   �wm   �xQ   ��j   �� �   ��m   ��Q   �}Q   �~m   �m   ��Q   ��j   �� �   ��m   ��Q   ��Q    ��m !  ��m "  ��Q #�   � 0 � � � � � \� \� %� �� �� �� �� �� �� �� �� ��������y�y�B�:��cc,���������HH �� ]  � 
   �**� �/13�7*��9Y;S�=Y?�A*��9Y/S�E�K�OQ�O�W�[*�`+��b:*"�d�gi�mo�r�%�v� �**� %x�{**� �i�{**� �}�{**� qi�{**� ��{**� 1i�{**� ���{**� ���{**� ���i�7**� ���i�7**� �c���� *� e*��9YcS�E��*� Q*2�**2�*������V����*� �*3�**3�*������VY**� Q��S����*�   \   4   �Z[    �b �   �cd   �eQ   ��� �  � �                              "  "  (  (  (  (  >  >              ` " ` " h " h " p " p " J " �  �  �  �  � # � # �  �  �  �  �  �  �  � $ � $ �  �  �  �  �  �  �  � % � % �  �  �  �  �  �  �  � & � & �  �  �  �  �  �  �  � ' � ' �  �  �  �  �  �  �  � ( � ( �  �  �  �  �  �  �  � ) � ) �  �  �  �  �  �  �  � * � * �  �  �  �  �  �  �  �  �  �  �  � + � + �  �  �  �  �  �  �  �  �  �  �  � , � , �  �  �  . . . . . . . .  .  . / / / / / /  .8 28 2; 2; 27 27 20 20 20 20 2& 2& 2` 3` 3c 3c 3_ 3_ 3r 3r 3X 3X 3X 3X 3N 3N 3 K� ]   	   �*,Ѷ/*�,3+��.:*I�024�7�9Y�VY;SY�SY?SY�S�B�H�%�IY6� 6*,�-M,׶	�N���� � :� �:*,�RM��W� :� #�� � #:		�[� � :
� 
�:�^�*,Ѷ/*�4+��:*K�ٶ�%�v� �*,Ѷ/*��S+���:*M�����*��9Y�S�E�K�������%��Y6� �*,�-M*,�� :� Ĩ ��*,�D� :� �� ��*,�s� :� �� ��*,��� :� � ��*,�D� :� h� ��*,Ѷ/*�R��:*&�F��%�v� :� '� _�*,϶/�G��?� � :� �:*,�RM��H� :� #�� � #:�I� � :� �:�J�*� " f � �� � � �� [ � �� � � �� [ � �� � � �� � � �� � � ��i�=���=���=���=���=��!=�':=�=B=�^�i���i���i���i���i��!i�']i�cfi�^�x���x���x���x���x��!x�']x�cfx�iux�x}x� \     �Z[    �b �   �cd   �eQ   ��j   �� �   ��m   ��Q   �lQ   �nm 	  �om 
  �pQ   ��g   ���   �� �   ��Q   �uQ   �vQ   �wQ   �xQ   ��g   �zQ   ��m   ��Q   �}Q   �~m   �m   ��Q �   R  ?I ?I KI KI I �K �K �K'M'M5M5M5M5MRMRM&&�&M �� ]      �,�	*�2+��:*��%�)Y6�j*,�-M*,��� :�C�{�*,��� :�,�d�*��0���:*@��������%�v� :	� �#	�*��1���:
*A�
���
���
�%
��Y6� Y*
,�-M,��	,*D�**� e���K���f�	,ö	
�Ě�Ѩ � :� �:*,�RM�
��� :� )� E� }�� � #:
�ƨ � :� �:
�ǩ�Ț��� � :� �:*,�RM��W� :� #�� � #:�ɨ � :� �:�ʩ*�  ��$� �EQ�KNQ� �E`�KN`�Q]`�`e`� , G� M ^� d �� �E�K|��� ! G�� M ^�� d ��� �E��K������� ! G�� M ^�� d ��� �E��K��������������� \   �   �Z[    �b �   �cd   �eQ   ���   �� �   ��Q   ��Q   ���   �nQ 	  ��� 
  �� �   �qm   �rQ   ��Q   ��m   �um   �vQ   �wm   �xQ   �yQ   �zm   ��m   ��Q �   V     }@ }@ �@ �@ d@ �A �A �A �A �D �D �D �D �D �D �D �D �D �A   �� ]    A  
-*� �*4�***� Q����V����*� ]*5�**5�*������VY**� ���SY**� e��S����*� �*8�*������*� }Ŷ�**� ��ɶ���Y�њ W**� ��ն���Y�њ W**� ��ٶ���Y�њ W**� ��ݶ���Y�њ W**� �����͸љ �*� 9i��**� ������Y�њ W**� �����͸љ >*� 9**� ����� *��9Y�S�E� *��9Y�S�E��*E�**� ����*�VY**� 9��SY*��9Y�S�ES��W**� ����� 6*��+���:*J����� �%�v� �**� ���� {*� -**� ն���*� I��*� A��*�+��:*R���%�v� �*�+��:*T��%�v� ���**� �����Y�љ !W*��9YS�E!�%�~�͸љ *� �*��9Y'S�E���g**� ��ɶ�� *+,�5� ��G**� ��ն��d*�,+��.:* ��024�7�9Y�VY;SY7SY?SY7S�B�H�%�IY6� 6*,�-M,9�	�N���� � :	� 	�:
*,�RM�
�W� :� #�� � #:�[� � :� �:�^�* ��* ��*��9Y�S�E�K�f�j�m��p�� H*� �v��**� ��VY* ��* ��**� ɶ��y�|��c��S**� ����**� ������ *+,�Q� ���**� ��ٶ��d*�,+��.:* ��024�7�9Y�VY;SYSSY?SYSS�B�H�%�IY6� 6*,�-M,U�	�N���� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�* ��* ��*��9Y�S�E�K�f�j�m��p�� H*� �v��**� ��VY* ö* ö**� ɶ��y�|��c��S**� E����**� ������ *+,�g� ��c**� ��ݶ��%��Y*� ��:*+,��� :�������:�:�
:����     �           3�*��)+���:*��%��Y6�J*�,(��.:*�024�7�9Y�VY;SY�SY?SY�S�B�H�%�IY6� `*,�-M,��	,*�**� 5�9Y%S��K��	,N�	�N��ʨ � : �  �:!*,�RM�!�W� :"� )� �� �"�� � #:##�[� � :$� $�:%�^�%*� �v��**� ��VY*	�*	�**� ɶ��y�|��c��S**� U����������� :&� &� @&�� � #:''�� � :(� (�:)���)� �� � :*� *�:+�2�+�0**� �������Y*� ��:,*+,��� :-��-����:..�://�
:00����  �           ,30�*��/+���:1*-�1�%1��Y62�J*�,.1��.:3*.�3024�73�9Y�VY;SY�SY?SY�S�B�H3�%3�IY64� `*34,�-M,��	,*0�**� 5�9Y%S��K��	,N�	3�N��ʨ � :5� 5�:6*4,�RM�63�W� :7� )� �� �7�� � #:838�[� � :9� 9�::3�^�:*� �v��**� ��VY*5�*5�**� ɶ��y�|��c��S**� !����1����1��� :;� &� @;�� � #:<1<�� � :=� =�:>1���>� /�� � :?� ?�:@,�2�@*� DVru�uzu�K�������K���������������������������"�"�"�"'"���	��*6�036��*E�03E�6BE�EJE�Q*��0�������Q*��0����������������� �� ������������*��0������������	1	4�	4	9	4��	Z	f�	`	c	f��	Z	u�	`	c	u�	f	r	u�	u	z	u��	Z	��	`	�	��	�	�	���	Z	��	`	�	��	�	�	��	�	�	��	�
	��)5 /25 ):/2:)
�/2
�5	Z
�	`	�
�	�

�


� \  � A  
-Z[    
-b �   
-cd   
-eQ   
-��   
-�g   
-��   
-�j   
-� �   
-nm 	  
-oQ 
  
-pQ   
-qm   
-rm   
-�Q   
-�j   
-� �   
-vm   
-wQ   
-xQ   
-ym   
-zm   
-�Q   
-��   
-}Q   
-~�   
-�   
-�m   
-��   
-� �   
-�j   
-� �   
-�m    
-�Q !  
-�Q "  
-�m #  
-�m $  
-�Q %  
-�Q &  
-�m '  
-�m (  
-�Q )  
-�m *  
-�Q +  
-�� ,  
-�Q -  
-�� .  
-�� /  
-�m 0  
-�� 1  
-� � 2  
-�j 3  
-� � 4  
-m 5  
-FQ 6  
-^Q 7  
-�m 8  
-�m 9  
-�Q :  
-�Q ;  
-�m <  
-�m =  
-�Q >  
-�m ?  
-�Q @�  ��  4  4 
 4 
 4 
 4 
 4   4   4 2 5 2 5 5 5 5 5 1 5 1 5 D 5 D 5 O 5 O 5 * 5 * 5 * 5 * 5   5   5 i 8 i 8 h 8 h 8 h 8 h 8 ^ 8 ^ 8 w 9 w 9 w 9 w 9 s 9 s 9 ~ < ~ < ~ < ~ < � < � < � < � < } < } < } < } < � < � < � < � < � < � < � < � < � < � < � < � < } < } < } < } < � < � < � < � < � < � < � < � < � < � < � < � < } < } < } < } < � = � = � = � = � = � = � = � = � = � = � = � = } = } = } = } = � = � = � = � = � = � = � = � = � = � = � = � = } = } = � @ � @ � @ � @ � @ A A A A A A
 A
 A A A A A A A A A  A  A# A# A A A A A A A7 C7 C7 C7 C; C; C> C> C6 C6 CG CG CZ CZ C6 C6 C6 C6 C2 C As Es E� E� E� E� Es Es Es E } < } ;� I� I� I� I� I� I� I� I� I� I� J� J� J� I� M� M� M� M� M� M� M� M� M� M� N� N� N� N� N� N O O O O O O P P P P P P3 R3 R RI Tr Vr Vr Vr Vv Vv Vy Vy Vq Vq Vq Vq V� V� V� V� V� V� V� V� Vq Vq V� W� W� W� W� W� W� X� X� X� X� X� X� X� X� X� X� �� �� �� �� �� �� �� �� �� �/ �/ �; �; �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � � � � � � � �) �) � � �/ �/ �/ �/ �� �� �� �: �: �: �: �: �: �: �Z �Z �Z �Z �^ �^ �a �a �Y �Y �� �� �� �� �j �A �A �A �A �A �A �A �A �] �] �k �k �k �k �g �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �q �g �A �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��������������\ZZZZVy	y	y	y	y	y	y	y	y	y	�	�	y	y	�	�	�	�	`	V5� ��������.�.�.�.	0	0	0	0	0	0	0	0�0�.	�3	�3	�3	�3	�3	�5	�5	�5	�5	�5	�5	�5	�5	�5	�5	�5	�5	�5	�5	�5	�5	�5	�5	�5	�2e-�� �Y �� �� Xq V� M �� ]  �    �*f�*f�**� %���K�f�j�m��p�� �*��+���:*g���������**� q���K������**� e���K������**� ն��K������**� 1���K������*m�**� �����������Ŷ���**� Ͷ��K�����%�v� �� �*��+���:*r���������**� q���K������**� e���K������**� ն��K������**� 1���K������**� %���K������*y�**� �����������Ŷ���**� Ͷ��K�����%�v� �*�,+��.:*�024�7�9Y�VY;SY�SY?SY�S�B�H�%�IY6�*,�-M,ֶ	*�����:*��%��Y6	� j,*�**� e���K��	,�	,**� m�9Y�S��K�	,�	,**� m�9Y�S��K�	,�	������� :
� )� E� }
�� � #:�� � :� �:����N��(� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�*� �%�"%��4�"4�%14�494�hS�PS�SXS�]�s�y|�]��s��y|��������� \   �   �Z[    �b �   �cd   �eQ   �   �   �j   � �   ��   �	 � 	  �oQ 
  �pm   �qm   �rQ   ��m   ��Q   �uQ   �vm   �wm   �xQ �  � k  f  f  f  f  f  f  f  f   f   f A g A g I h I h W i W i W i W i q j q j q j q j � k � k � k � k � l � l � l � l � m � m � m � m � m � m � n � n � o � o � o � o * g& r& r. s. s< t< t< t< tV uV uV uV up vp vp vp v� w� w� w� w� x� x� x� x� y� y� y� y� y� y� z� z� {� {� {� { r q  fA A M M � � � � � � � � � � � � � � � � � � � y   3� ]  	�  +  �*�,+��.:*Y�024�7�9Y�VY;SY=SY?SY=S�B�H�%�IY6� 6*,�-M,K�	�N���� � :� �:*,�RM��W� :� #�� � #:		�[� � :
� 
�:�^�*�,+��.:*Z�024�7�9Y�VY;SY`SY?SY`S�B�H�%�IY6� 6*,�-M,b�	�N���� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�*\�*\�**� ն��K�f�j�m��p�� F*� �v��**� ��VY*`�*`�**� ɶ��y�|��c��S**� i����**� ��������Y*� ��:*+,��� :���*��+���:* ��� ���* ��**� ����K**� ����K�������%�v� :�\��V�\:�:�
:���    )           3�*��+���:* ���%��Y6�f*�,��.:* ��024�7�9Y�VY;SYSY?SYS�B�H�%�IY6� �*,�-M,�	,* ��**��9YS�!#�VY**� 5�9Y%S��S���K�	,'�	,* ��**��9YS�!#�VY**� 5�9Y)S��S���K�	*,+�/�N��i� � :� �: *,�RM� �W� :!� )� i� �!�� � #:""�[� � :#� #�:$�^�$������� :%� &� �%�� � #:&&�� � :'� '�:(���(*� �v��**� ��VY* ��* ��**� ɶ��y�|��c��S**� =����� �� � :)� )�:*�2�**� - ] y |� | � |� R � �� � � �� R � �� � � �� � � �� � � ��%AD�DID�dp�jmp�d�jm�p|���S������H#/�),/�H#>�),>�/;>�>C>��#r�)fr�lor��#��)f��lo��r~������'� -�� ��� '�-�����'��-��������#��)f��l������� \  � +  �Z[    �b �   �cd   �eQ   �
j   � �   ��m   ��Q   �lQ   �nm 	  �om 
  �pQ   �j   � �   ��m   ��Q   �uQ   �vm   �wm   �xQ   �y�   �zQ   ��   ��Q   �}�   �~�   �m   ��   � �   �j   � �   ��m   ��Q    ��Q !  ��m "  ��m #  ��Q $  ��Q %  ��m &  ��m '  ��Q (  ��m )  ��Q *�  � t 6 Y 6 Y B Y B Y   Y � Z � Z
 Z
 Z � Z� \� \� \� \� \� \� \� \� \� \� ^� ^� ^� ^� ^� `� `� `� `� `� `� `� `� `� `� `� `� `� `� `� `� `� `� `� ]� \� d� d� d� d� d� dQ �Q �[ �[ �[ �[ �f �f �f �f �[ �[ �[ �[ �Q �Q �- �, �, �8 �8 �� �� �l �l �l �l �d �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � e� d Y ]  �     �*� � �L*� �N*� ���*-+��� �*+϶/*��T-���:*G��%��Y6� '*+�M� :� E�*+϶/������� :� #�� � #:�� � :	� 	�:
���
*+϶/*�U-��:*)�O��%�v� ��  F _ �� e � �� � � �� F _ �� e � �� � � �� � � �� � � �� \   z    �Z[     �cd    �eQ    � � �    ��    � �    ��Q    ��Q    �lm    �nm 	   �oQ 
   �g �     *G �) �) �)   �� ]  � 	   �*� Y* �*������*� * �***� Y��i�VY**� e��SY**� ���S����* �* �**� ���K�f�j�m��p��*�,$+��.:* �024�7�9Y�VY;SYkSY?SYmS�B�H�%�IY6� 6*,�-M,o�	�N���� � :� �:*,�RM��W� :� #�� � #:		�[� � :
� 
�:�^�*� �v��**� ��VY* �* �**� ɶ��y�|��c��S**� �����**� ������7*� �* ��*q�t��* ��***� ���v�VY**� ��S��W* ��***� Y��x�VY**� e��SY**� ���S��W*�,&+��.:* ��024�7�9Y�VY;SYzSY?SY|S�B�H�%�IY6� �*,�-M*,[�/*��%���:* ���%��Y6� 2,~�	,* ��**� e���K��	,��	������� :� )� M� ��� � #:�� � :� �:���*,E�/�N��V� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�*��'+���:* ��� ���* ��**� ����K**� ����K�������%�v� �*�  � � �� � � �� �$�!$� �3�!3�$03�383�������������������������c� �� � % �X�L��@L�FIL�X�[��@[�FI[�LX[�[`[� \     �Z[    �b �   �cd   �eQ   �j   � �   ��m   ��Q   �lQ   �nm 	  �om 
  �pQ   �j   � �   ��   � �   �uQ   �vm   �wm   �xQ   �ym   �zQ   ��Q   ��m   �}m   �~Q   �� �   �  �  �  �  �  �  �  �  �   �   � $ � $ � 5 � 5 � @ � @ � # � # � # � # �  �  � ] � ] � ] � ] � ] � ] � ] � ] � q � q � � � � � � � � � { �H �H �H �H �D �g �g �g �g �g �g �g �g �g �g �x �x �g �g �~ �~ �~ �~ �N �D � ] �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �< �< �H �H �� �� �� �� �� �� �� �� �� �u � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �l �� � �� ]  � 	   �*� Y*�*������*� *�***� Y��i�VY**� e��SY**� ���S����*�*�**� ���K�f�j�m��p��*�,*+��.:*�024�7�9Y�VY;SYkSY?SYmS�B�H�%�IY6� 6*,�-M,o�	�N���� � :� �:*,�RM��W� :� #�� � #:		�[� � :
� 
�:�^�*� �v��**� ��VY*�*�**� ɶ��y�|��c��S**� �����**� ������7*� �*!�*q�t��*"�***� �����VY**� ��S��W*%�***� Y��x�VY**� e��SY**� ���S��W*�,,+��.:*'�024�7�9Y�VY;SY�SY?SY�S�B�H�%�IY6� �*,�-M*,[�/*��+���:*(��%��Y6� 2,��	,*(�**� e���K��	,��	������� :� )� M� ��� � #:�� � :� �:���*,E�/�N��V� � :� �:*,�RM��W� :� #�� � #:�[� � :� �:�^�*��-+���:**�� ���**�**� ����K**� ����K�������%�v� �*�  � � �� � � �� �$�!$� �3�!3�$03�383�������������������������c� �� � % �X�L��@L�FIL�X�[��@[�FI[�LX[�[`[� \     �Z[    �b �   �cd   �eQ   �j   �  �   ��m   ��Q   �lQ   �nm 	  �om 
  �pQ   �!j   �" �   �#�   �$ �   �uQ   �vm   �wm   �xQ   �ym   �zQ   ��Q   ��m   �}m   �~Q   �%� �   �             $ $ 5 5 @ @ # # # #   ] ] ] ] ] ] ] ] q q � � � � {HHHHDggggggggggxxgg~~~~ND ]�������!�!�!�!�!�!�!�!�"�"�"�"�"�"�"�"�%�%�%�%�%�%�%�%�%�%<'<'H'H'�(�(�(�(�(�(�(�(�(u('�*�*�*�*�*�*�*�*�*�*�*�*�*�*�*�*l*� O� ]  	1  (  ]��Y*� ��:*� Y* ��*������* ��***� Y��;�VY**� ���SY**� e��SY*��9Y�S�ES��W*�,+��.:* ��024�7�9Y�VY;SY=SY?SY=S�B�H�%�IY6� �*,�-M,?�	*�����:* ���%��Y6� S,* ��*��9Y�S�E�K��	,A�	,* ��**� e���K��	,C�	������� :	� ,� P� ���	�� � #:

�� � :� �:���*,E�/�N��3� � :� �:*,�RM��W� :� &���� � #:�[� � :� �:�^�*��+���:* ��� ���* ��**� ����K**� ����K�������%�v� :�������:�:�
:�H��   �           3�*��+���:* ���%��Y6�J*�,��.:* ��024�7�9Y�VY;SYJSY?SYJS�B�H�%�IY6� `*,�-M,L�	,* ��**� 5�9Y%S��K��	,N�	�N��ʨ � :� �:*,�RM��W� :� )� �� ��� � #:�[� � : �  �:!�^�!*� �v��**� ��VY* ��* ��**� ɶ��y�|��c��S**� y����������� :"� &� @"�� � #:##�� � :$� $�:%���%� �� � :&� &�:'�2�'*� 1 �eq�knq� �e��kn��q}������ �e��k������� �e��k������� �e��k���������������ad�did�������������������������������-��-�-�*-�-2-� ed k�d �Xd ^ad  eik�i�Xi^ai eJ�k�J��XJ�^aJ�d�J��J�GJ�JOJ� \  � (  ]Z[    ]b �   ]cd   ]eQ   ]&�   ]'j   ]( �   ])�   ]* �   ]nQ 	  ]om 
  ]pm   ]qQ   ]rm   ]�Q   ]�Q   ]um   ]vm   ]wQ   ]+�   ]yQ   ]z�   ]��   ],m   ]-�   ]. �   ]/j   ]0 �   ]�m   ]�Q   ]�Q   ]�m   ]�m    ]�Q !  ]�Q "  ]�m #  ]�m $  ]�Q %  ]�m &  ]�Q '�  � h  �  �  �  �  �  �  �  �  �  � - � - � > � > � I � I � T � T � , � , � , � , � � � � � � � � � � � � � � � � �  �0 �0 �0 �0 �0 �0 �0 �0 �( � � � i � � �$ �$ �$ �$ �/ �/ �/ �/ �$ �$ �$ �$ � � �� �� �� �  �  �4 �4 �4 �4 �4 �4 �4 �4 �, �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �   � 1  ]   �     ���^��`��������*��,����ٸ���9YS��9YS�H�9YS�`�9YS���9YS����������ܸ������!��#�9Y�VYUSY�VSYWSY�VS�B�S�   \       �Z[   e� ]  	1  (  ]��Y*� ��:*� Y* Ͷ*������* ζ***� Y��W�VY**� ���SY**� e��SY*��9Y�S�ES��W*�, +��.:* ϶024�7�9Y�VY;SYYSY?SYYS�B�H�%�IY6� �*,�-M*,[�/*�����:* ж�%��Y6� S,* ж**� e���K��	,]�	,* ж*��9Y�S�E�K��	,C�	������� :	� ,� P� ���	�� � #:

�� � :� �:���*,E�/�N��2� � :� �:*,�RM��W� :� &���� � #:�[� � :� �:�^�*��!+���:* Ҷ� ���* Ҷ**� u���K**� ����K�������%�v� :������:�:�
:�`��  �           3�*��#+���:* Զ�%��Y6�J*�,"��.:* ն024�7�9Y�VY;SYbSY?SYbS�B�H�%�IY6� `*,�-M,d�	,* ׶**� 5�9Y%S��K��	,N�	�N��ʨ � :� �:*,�RM��W� :� )� �� ��� � #:�[� � : �  �:!�^�!*� �v��**� ��VY* ܶ* ܶ**� ɶ��y�|��c��S**� ������������ :"� &� @"�� � #:##�� � :$� $�:%���%� �� � :&� &�:'�2�'*� 1 �fr�lor� �f��lo��r~������ �f��l������� �f��l������� �f��l���������������ad�did�������������������������������-��-�-�*-�-2-� fe l�e �Ye _be  fjl�j�Yj_bj fJ�l�J��YJ�_bJ�e�J��J�GJ�JOJ� \  � (  ]Z[    ]b �   ]cd   ]eQ   ]&�   ]2j   ]3 �   ]4�   ]5 �   ]nQ 	  ]om 
  ]pm   ]qQ   ]rm   ]�Q   ]�Q   ]um   ]vm   ]wQ   ]6�   ]yQ   ]z�   ]��   ]7m   ]8�   ]9 �   ]:j   ]; �   ]�m   ]�Q   ]�Q   ]�m   ]�m    ]�Q !  ]�Q "  ]�m #  ]�m $  ]�Q %  ]�m &  ]�Q '�  � h  �  �  �  �  �  �  �  �  �  � - � - � > � > � I � I � T � T � , � , � , � , � � � � � � � � �	 �	 �	 �	 �	 �	 �	 �	 � �) �) �) �) �) �) �) �) �! � � � i � � �% �% �% �% �0 �0 �0 �0 �% �% �% �% � � �� �� �� �  �  �4 �4 �4 �4 �4 �4 �4 �4 �, �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �   �       �    �