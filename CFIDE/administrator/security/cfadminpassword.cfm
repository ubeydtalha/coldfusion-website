����  -� 
SourceFile 1/CFIDE/administrator/security/cfadminpassword.cfm  cfcfadminpassword2ecfm1620126549  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   PASSWORD_OLDPASSWORD_ERROR Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   RUNTIME   	   ISALLOWCONCLOGIN   	    CHECKCSRFTOKEN " " 	  $ ALLOWCONCLOGIN & & 	  ( ERR_SEEDLENGTH * * 	  , ISADMINROLESAVAILABLE . . 	  0 ADMIN 2 2 	  4 CFCATCH 6 6 	  8 ERROR_ALLOWCONCLOGIN : : 	  < FACTORY > > 	  @ GETCSRFTOKEN B B 	  D TOKEN F F 	  H PASSWORD_CONFIRM_ERROR J J 	  L ERROR_TOGGLE N N 	  P FORM R R 	  T 	SCRIPTSRC V V 	  X ERROR_SET_SEED Z Z 	  \  ERROR_TOGGLE_SINGLEADMINPASSWORD ^ ^ 	  ` AERRORMESSAGES b b 	  d PASSWORD_EMPTY_ERROR f f 	  h 	LOGACTION j j 	  l REQUEST n n 	  p SECURITYCFC r r 	  t 	LOGINUSER v v 	  x 	VARIABLES z z 	  | BERRORSEXIST ~ ~ 	  � RESULT � � 	  � com.macromedia.SourceModTime  h���. pageContext #Lcoldfusion/runtime/NeoPageContext; � �	  � getOut ()Ljavax/servlet/jsp/JspWriter; � � javax/servlet/jsp/JspContext �
 � � parent Ljavax/servlet/jsp/tagext/Tag; � �	  � Cp1252 � setPageEncoding (Ljava/lang/String;)V � � !coldfusion/runtime/NeoPageContext �
 � � _setCurrentLineNo (I)V � �
  � GetAuthUser ()Ljava/lang/String; � �
  � matches � java/lang/Object � ^\w$ � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
  � _boolean (Ljava/lang/Object;)Z � � coldfusion/runtime/Cast �
 � � %class$coldfusion$tagext$net$CookieTag Ljava/lang/Class; coldfusion.tagext.net.CookieTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
  � coldfusion/tagext/net/CookieTag � 30 � 
setExpires (Ljava/lang/Object;)V � �
 � � cfcookie � value � CGI � java/lang/String � SCRIPT_NAME � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
  � setValue � �
 � � setHttpOnly (Z)V � �
 � � name � cfadmin_lastpage_ � concat &(Ljava/lang/String;)Ljava/lang/String; � �
 � � setName � �
 � � 	hasEndTag � � coldfusion/tagext/GenericTag �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
  � java   coldfusion.server.ServiceFactory CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
  set � coldfusion/runtime/Variable

	 _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;
  getRuntimeService getCFFormScriptSrc �

<script src="../../../cf_scripts/scripts/ajax/jquery/jquery.js"></script>
<script src="../sha1.js" type="text/javascript" ></script>
 write � java/io/Writer
 'class$coldfusion$tagext$lang$IncludeTag !coldfusion.tagext.lang.IncludeTag �	  !coldfusion/tagext/lang/IncludeTag! pstrength.cfm# setTemplate% �
"& ../auditlog.cfm( i

<script type="text/javascript">
function select(){
	$('.password').pstrength();
}
</script>


* SECURITY, _resolve. �
 / isAdminSecurityEnabled1 isAdminUserIdRequired3 isRootAdminUser5 NOTROOTADMIN7 coldfusion/runtime/CFBoolean9 t_true Lcoldfusion/runtime/CFBoolean;;<	:= _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V?@
 A 	cfincludeC templateE GetContextRootG �
 H "/CFIDE/administrator/forbidden.cfmJ %class$coldfusion$tagext$lang$AbortTag coldfusion.tagext.lang.AbortTagML �	 O coldfusion/tagext/lang/AbortTagQ (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTagTS �	 V "coldfusion/tagext/lang/ImportedTagX l10nZ 
../cftags/\ admin^ :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V �`
Ya &coldfusion/runtime/AttributeCollectionc ide err_seedLengthg vari ([Ljava/lang/Object;)V k
dl setAttributecollection (Ljava/util/Map;)Vno  coldfusion/tagext/lang/ModuleTagq
rp 
doStartTag ()Itu
rv 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;xy
 z !Seed must be minimum 8 characters| doAfterBody~u
r _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;��
 � doEndTag�u #javax/servlet/jsp/tagext/TagSupport�
�� doCatch (Ljava/lang/Throwable;)V��
r� 	doFinally� 
r� password_oldpassword_error� Old password is incorrect� LOCALE� REQUEST.LOCALE� en� checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V��
 � 
LOCALEFILE� java/lang/StringBuilder� resources/security_�  �
�� append -(Ljava/lang/String;)Ljava/lang/StringBuilder;��
�� .cfm� toString� �
 ��a



<SCRIPT TYPE="text/javascript">
<!--
// Check whether seed entered is mimimum 8 characters

function validateSeed()
{
	var seedField = document.getElementById('seed')
	if(seedField)
	  var seedval = seedField.value.replace(/^\s+|\s+$/g,"")
	if(seedval)
	 var length = seedval.length;

	if (length && length > 0 && length <8 )
	{
		� $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag�� �	 � coldfusion/tagext/io/OutputTag�
�v alert('� _autoscalarize�
 � ');�
� coldfusion/tagext/QueryLoop�
��
��
��S
		seedField.focus();
		seedField.select();
		return false;
	}
	else
    {
        transformPasswordFields();
		return true;
    }
}

function transformPasswordFields()
{
    var pwdFields = [document.getElementById('cfadmin_oldpassword'), document.getElementById('cfadmin_Newpassword'),document.getElementById('cfadmin_NewpasswordConfirm')];
    for(var i=0; i < pwdFields.length; i++)
    {
        var value = pwdFields[i].value;
        var length = value.length;
        if(length > 0)
            pwdFields[i].value = hex_sha1(value);
    }
}
// -->
</SCRIPT>


� false� 2(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)V��
 � 
� _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V��
 � ArrayNew (I)Ljava/util/List;��
 � _Array 2(Ljava/lang/Object;)Lcoldfusion/runtime/FastArray;��
 �� setArray !(Lcoldfusion/runtime/FastArray;)V��
� password_confirm_error� \Your password could not be changed because the new and confirmation passwords did not match.� password_oldpassword_error1� ?Password could not be changed as the old password is incorrect.� password_empty_error� Password can not be blank.� 	component� CFIDE.adminapi.security� ADMINSUBMIT� FORM.ADMINSUBMIT�  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z��
 � _Object (Z)Ljava/lang/Object;��
 �� REQUEST.SECURITY�  � 	CSRFTOKEN  FORM.CSRFTOKEN checkCSRFToken SECTABKEYNAME 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;	
 
 CFADMIN_OLDPASSWORD Trim �
  CFADMIN_NEWPASSWORD CFADMIN_NEWPASSWORDCONFIRM Len (Ljava/lang/Object;)I
  (I)Ljava/lang/Object;�
 � _compare (Ljava/lang/Object;D)D
  _List $(Ljava/lang/Object;)Ljava/util/List; !
 �" ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z$%
 & FORM.CFADMIN_NEWPASSWORD( FORM.CFADMIN_NEWPASSWORDCONFIRM* checkAdminPassword, Compare '(Ljava/lang/String;Ljava/lang/String;)I./
 0 setAdminPassword2 BRESETCOOKIE4 _factor0 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;67
 8 VARIABLES.BRESETCOOKIE: isAllowConcurrentAdminLogin< *class$coldfusion$tagext$security$LogoutTag $coldfusion.tagext.security.LogoutTag?> �	 A $coldfusion/tagext/security/LogoutTagC currentE 
setSessionG �
DH cfadminJ getCFAdminCookieSuffixL setApplicationTokenN �
DO allQ 	loginuserS %coldfusion/runtime/ArgumentCollectionU adminPasswordW )([Ljava/lang/Object;[Ljava/lang/Object;)V Y
VZ b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object;\
 ] *coldfusion/runtime/TransientVariableHolder_ &(Lcoldfusion/runtime/NeoPageContext;)V a
`b SEEDd 	FORM.SEEDf '(Ljava/lang/Object;Ljava/lang/String;)Dh
 i setSeedk 	logactionm "has set the ColdFusion server seedo unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;qr coldfusion/runtime/NeoExceptiont
us t28 [Ljava/lang/String; Anyywx	 { findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I}~
u bind '(Ljava/lang/String;Ljava/lang/Object;)V��
`� 
					� error_set_seed� 
						There was an error while updating passwords with new seed.<br/>
						Please check logs for more details.</br>
						� MESSAGE� D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; ��
 � EncodeForHTML� �
 � <br/>
						� DETAIL� 
				� 

				� unbind� 
`� _factor1�7
 � FORM.ALLOWCONCLOGIN� SECURITYAPI� setAllowConcurrentAdminLogin� Nhas updated concurrent login sessions configuration for Administrator console.� f_false�<	:� t29�x	 � error_allowconclogin� �
						There was an error while updating concurrent login sessions flag.<br/>
						Please check logs for more details.</br>
						� 	ADMINAUTH� FORM.ADMINAUTH� none� setAdminSecurityEnabled� t30�x	 � error_toggle� G
						Unable to set Administrator authentication switch.<br/>
						� _factor2�7
 � username� setLoginUserIdRequired� t31�x	 �  error_toggle_singleadminpassword� E
						Unable to set Administrator authentication type.<br/>
						� #class$coldfusion$tagext$lang$LogTag coldfusion.tagext.lang.LogTag�� �	 � coldfusion/tagext/lang/LogTag� audit� setFile� �
�� setApplication� �
�� cflog� text� User � ] has set Administrator authentication type to: Separate user name and password authentication� setText� �
�� H has set Administrator authentication type to: No authentication needed � password� J has set Administrator authentication type to: Use a single password only � _factor3�7
 � adminpasswordpagename� pagename� !ColdFusion Administrator password� ../header.cfm� )class$coldfusion$tagext$html$form$FormTag #coldfusion.tagext.html.form.FormTag�� �	 � #coldfusion/tagext/html/form/FormTag  security
 � cfform action 	setAction	 �

 POST 	setMethod �
 return validateSeed() setOnSubmit �

v ../include/margintop.cfm ../include/errors.cfm ^
	<script language="javaScript">
	//top.frame_nav.document.location.reload();
	</script>
	 

 1

<input type="hidden" name="csrftoken" value=" getCSRFToken! ">

<h2 class="pageHeader"># pageHeader_adminpassword% Administrator' �
</h2>
<br>
<label class="label-bold" for="cfadmin_password">
<b class="subheading" onClick=toggleClass("coldfusionAdministrationAuthentication")>) cfadmin_password+ (ColdFusion Administration Authentication- _</b><br/>
</label>
	<div class="spacer10 coldfusionAdministrationAuthentication">
	</div>
	/ cfadmin_password_explanation1�
	<span class="admin-tip coldfusionAdministrationAuthentication">
		You should restrict access to the ColdFusion Administrator to trusted
		users. By default the ColdFusion Administrator requires authentication to access
		these pages. However, if you configure your web server to restrict access to
		these pages, you can disable this authentication and
		rely on your web server's security instead. (Consult your web server
		documentation for details on securing pages.)
	</span>
	3 X
	<div class="spacer10"></div>
<span class="coldfusionAdministrationAuthentication">
5 cfadmin_username_explanation7 7
		Select the type of Administrator authentication:
	9 �
</span>
<div class="spacer10"></div>
<table class="coldfusionAdministrationAuthentication">
<tr><td>
<input name="AdminAuth" type="RADIO" value="password"
; 
	checked
= L
>
<b>
<label for="cfadmin_singlepassword" style="margin-right: 30px;">
? cfadmin_singlepasswordA $Use a single password only (default)C _factor4E7
 F </label>
</b>
</td>

H IsAdminRolesAvailableJ @<td >
	<input name="AdminAuth" type="RADIO" value="username"
	L 
		checked
	N K
	>
	<b>
	<label for="cfadmin_usernames" style="margin-right: 30px;">
	P cfadmin_usernamesR FSeparate user name and password authentication (allows multiple users)T </label>
	</b>
	</td>
V R
<td>
<input name="AdminAuth" type="RADIO" value="none" id="cfadmin_password"
	X N
>
<b>
<label for="cfadmin_securitydisabled" style="margin-right: 30px;">
Z cfadmin_securitydisabled\ *No authentication needed (not recommended)^ �</label>
</b>
</td></tr>

</table>
<hr class="line">

<table border="0" cellpadding="0" cellspacing="0">
<tr>
	<td>
		<b class="subheading" onClick=toggleClass("rootAdministratorPassword")>` errorheaderb Root Administrator Passwordd n</b>
	</td>
</tr>
</table>
<div class="spacer10">
</div>
<p>
<span class="rootAdministratorPassword">
f cfadmin_changePasswordh �
To change the ColdFusion Administrator password for the root administrative user,
enter old password, new password and then confirm
j �
</span>
</p>
<div class="spacer10">
</div>
<table border="0" cellpadding="0" cellspacing="0" class="rootAdministratorPassword">
<tr><td valign="top" style="padding-bottom: 20px; width: 350px">
<label class="label-bold" for="cfadmin_oldpassword">
l cfadmin_oldpasswordn Old Passwordp _factor5r7
 s9</label>&nbsp;&nbsp;&nbsp;
<input name="cfadmin_oldpassword" id="cfadmin_oldpassword" type="password" size=25 maxlength="50" onFocus="select()" value="" autocomplete="off" style="float: right;">
</td></tr><tr><td valign="top" style="padding-bottom: 20px">
<label class="label-bold" for="cfadmin_Newpassword">
u cfadmin_Newpasswordw New PasswordyT</label>&nbsp;&nbsp;&nbsp;
<input name="cfadmin_Newpassword" id="cfadmin_Newpassword" type="password" size=25 class="password" maxlength="50" onFocus="select()" value="" autocomplete="off" style="float: right;">
</td></tr><tr>
<td valign="top" style="padding-bottom: 20px;">
<label class="label-bold" for="cfadmin_NewpasswordConfirm">
{ cfadmin_NewpasswordConfirm} Confirm Password �</label>&nbsp;&nbsp;&nbsp;
<input name="cfadmin_NewpasswordConfirm" id="cfadmin_NewpasswordConfirm" type="PASSWORD" size=25 maxlength="50" onFocus="select()" value="" autocomplete="off" style="float: right;">
<br>
� cfadmin_passwordlength� �
</td></tr>
</table>

<hr class="line">

<table border="0" width="100%" cellpadding="0">
<tr>
	<td>
		<b class="subheading" onClick=toggleClass("passwordSeed")>� 
seedHeader� Password Seed� _</b>
	</td>
</tr>
</table>
<div class="spacer10"></div>
<p>
<span class="passwordSeed">
� cfadmin_changeSeed� @
To specify a new seed value to encrypt data source passwords
� b
</span>
</p>

<div class="passwordSeed spacer10">
<label class="label-bold" for="newSeed">
� _factor6�7
 � newSeed� New Seed� �</label>
<input name="seed" id="seed" type="text" size="50" maxlength="500" onFocus="select()" value="" style="margin-left: 35px"> &nbsp;
� cfadmin_seedlength� .(8-character minimum and 500-character limit.)� �

</div>

<hr class="line">

<table border="0">
<tr>
	<td>
		<b class="subheading" onClick=toggleClass("loginSession")>� concurrentloginheader� Concurrent Login Session� �</b>
	</td>
</tr>
</table>

<p class="loginSession spacer10">
		<input name="allowconclogin" type="CHECKBOX" class="text" value="true" id="allowconclogin" � checked� 4>
		<label class="label-bold" for="allowconclogin">� allowconcloginLabel� @<b>Allow concurrent login sessions for Administrator Console</b>� ,</label><br>
</p>

<table width="100%">
� ../include/buttonbar.cfm� _factor7�7
 � 
</table>

� _factor8�7
 � ../include/marginbottom.cfm� ../footer.cfm�

�
�
� _factor9�7
 � metaData Ljava/lang/Object;��	 � 	Functions� 
Properties� getMetadata ()Ljava/lang/Object; this "Lcfcfadminpassword2ecfm1620126549; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; __factorParent out Ljavax/servlet/jsp/JspWriter; 	include28 #Lcoldfusion/tagext/lang/IncludeTag; 	include29 output30  Lcoldfusion/tagext/io/OutputTag; mode30 I t8 t9 Ljava/lang/Throwable; t10 t11 output51 mode51 t14 t15 t16 t17 t18 t19 t20 t21 LineNumberTable java/lang/Throwable� cookie0 !Lcoldfusion/tagext/net/CookieTag; include1 include2 include3 abort4 !Lcoldfusion/tagext/lang/AbortTag; module5 $Lcoldfusion/tagext/lang/ImportedTag; mode5 t12 t13 module6 mode6 t22 t23 t24 output8 mode8 t27 module10 mode10 t33 t34 t35 t36 t37 t38 module11 mode11 t41 t42 t43 t44 t45 t46 module12 mode12 t49 t50 t51 t52 t53 t54 module26 mode26 t57 t58 t59 t60 t61 t62 	include27 form54 %Lcoldfusion/tagext/html/form/FormTag; mode54 t66 	include52 t68 	include53 t70 t71 t72 t73 t74 t75 t76 module41 mode41 t6 t7 module42 mode42 module43 mode43 t25 t26 module44 mode44 t32 module45 mode45 t39 t40 module46 mode46 module47 mode47 module48 mode48 module49 mode49 	include50 logout13 &Lcoldfusion/tagext/security/LogoutTag; logout14 ,Lcoldfusion/runtime/TransientVariableHolder; #Lcoldfusion/runtime/AbortException; Ljava/lang/Exception; __cfcatchThrowable0 output16 mode16 module15 mode15 !coldfusion/runtime/AbortException] java/lang/Exception_ runPage module31 mode31 module32 mode32 module33 mode33 module34 mode34 module35 mode35 module36 mode36 module37 mode37 module38 mode38 module39 mode39 module40 mode40 t4 t5 __cfcatchThrowable1 output18 mode18 module17 mode17 __cfcatchThrowable2 output20 mode20 module19 mode19 <clinit> __cfcatchThrowable3 output22 mode22 module21 mode21 log23 Lcoldfusion/tagext/lang/LogTag; log24 log25 1     )                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     r     v     z     ~     �     � �    �   L �   S �   � �   > �   wx   �x   �x   �x   � �   � �   ��    �� �   "     �ʰ   �       ��      �  �    W*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q**s+,� � u**w+,� � y**{+,� � }**+,� � �**�+,� � ��   �       W��    W��   W��     �   #     *� 
�   �       ��   �7 �  �    �*� +� ��":*� ��'� �� �� �*� +� ��":*� ��'� �� �� �**� U�����Y� �� W**� q-������ �� y*��+� ���:*$� �� ���Y6� ,��������� :� #�� � #:		�Ũ � :
� 
�:�Ʃ*,��*,��*��3+� ���:*,� �� ���Y6� b*,�G� :� ��*,�t� :� l�*,��� :� X�*,��� :� D�,���������� :� #�� � #:�Ũ � :� �:�Ʃ*�  � � �� � � �� � � �� � � �� � � �� � � ��&?��ES��Yg��m{����������&?��ES��Yg��m{������������������ �   �   ���    �� �   ���   � ��   ���   ���   ���   ���   ���   ��� 	  ��� 
  ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ��� �   � #     F F . ]! ]! ]! ]! a! a! d! d! \! \! \! \! v! v! v! v! z! z! }! }! u! u! u! u! \! \! �$ \!
, �7 �  � 
 M  
	*� �**� �*� ��� �Y�S� �� �� m*� �+� �� �:*� �ʶ ���*�� �Y�S� ܸ �� � �� ����*� �*� �� �� � �� �� �� �*� A*� �*��*� *	� �***� A�� �� ��*� Y*
� �***� �� �� ��,�*� +� ��":*� �$�'� �� �� �*� +� ��":*� �)�'� �� �� �,+�*� �**o� �Y-S�02� �� �Y� �� %W*� �**o� �Y-S�04� �� �� �� �*� �**o� �Y-S�06� �� �� ��� }*o� �Y8S�>�B*� +� ��":*� �DF*� �*�IK� �� �'� �� �� �*�P+� ��R:*� �� �� �� �*�W+� ��Y:	* � �	[]_�b	�dY� �YfSYhSYjSYhS�m�s	� �	�wY6
� 6*	
,�{M,}�	������ � :� �:*
,��M�	��� :� #�� � #:	��� � :� �:	���*�W+� ��Y:*!� �[]_�b�dY� �YfSY�SYjSY�S�m�s� ��wY6� 6*,�{M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���**� q�����*o� �Y�S��Y���*o� �Y�S� ܸ ��������B,��*��+� ���:*?� �� ���Y6� (,��,**� -��� �,���������� :� #�� � #:�Ũ � :� �:�Ʃ,ȶ**� �ʶ�*,϶�*� e*[� �*�׸۶�*�W
+� ��Y:*]� �[]_�b�dY� �YfSY�SYjSY�S�m�s� ��wY6 � 6* ,�{M,������� � :!� !�:"* ,��M�"��� :#� ##�� � #:$$��� � :%� %�:&���&*�W+� ��Y:'*^� �'[]_�b'�dY� �YfSY�SYjSY�S�m�s'� �'�wY6(� 6*'(,�{M,�'������ � :)� )�:**(,��M�*'��� :+� #+�� � #:,',��� � :-� -�:.'���.*�W+� ��Y:/*_� �/[]_�b/�dY� �YfSY�SYjSY�S�m�s/� �/�wY60� 6*/0,�{M,�/������ � :1� 1�:2*0,��M�2/��� :3� #3�� � #:4/4��� � :5� 5�:6/���6*� u*a� �*���**� U�����Y� �� W**� q-������ �� '*+,��� �*+,��� �*+,��� �*� !*� �**o� �Y�S�0=� �� ��*�W+� ��Y:7*� �7[]_�b7�dY� �YfSY�SYjSY�S�m�s7� �7�wY68� 6*78,�{M,��7������ � :9� 9�::*8,��M�:7��� :;� #;�� � #:<7<��� � :=� =�:>7���>*� +� ��":?*� �?��'?� �?� �� �*��6+� ��:@*� �@�@*�� �Y�S� ܸ �� �@�@�@� �@�Y6A� �*@A,�{M*@,��� :B� �� �B�*,��*� 4@� ��":C*ƶ �C��'C� �C� �� :D� X� �D�*� 5@� ��":E*Ƕ �E��'E� �E� �� :F� � WF�@����j� � :G� G�:H*A,��M�H@��� :I� #I�� � #:J@J�¨ � :K� K�:L@�éL*� G��������������������������������a}������V�������V���������������8t��z}��8t��z}����������,HK�KPK�!kw�qtw�!k��qt��w�����������3?�9<?��3N�9<N�?KN�NSN�������������������58�8=8�Xd�^ad�Xs�^as�dps�sxs�		-	��	3	n	��	t	�	��	�	�	��	�	�	��		-	��	3	n	��	t	�	��	�	�	��	�	�	��		-	��	3	n	��	t	�	��	�	�	��	�	�	��	�	�	��	�	�	�� �   M  
	��    
	� �   
	��   
	 ��   
	��   
	��   
	��   
	��   
	��   
	�� 	  
	�� 
  
	��   
	��   
	 �   
	��   
	��   
	��   
	�   
	�   
	��   
	��   
	��   
	�   
	�   
	�   
	�   
	�   
	�   
	w�   
	��   
	��   
		�   
	
�    
	� !  
	� "  
	� #  
	� $  
	� %  
	� &  
	� '  
	� (  
	� )  
	� *  
	� +  
	� ,  
	� -  
	� .  
	� /  
	� 0  
	� 1  
	� 2  
	� 3  
	� 4  
	� 5  
	 � 6  
	!� 7  
	"� 8  
	#� 9  
	$� :  
	%� ;  
	&� <  
	'� =  
	(� >  
	)� ?  
	*+ @  
	,� A  
	-� B  
	.� C  
	/� D  
	0� E  
	1� F  
	2� G  
	3� H  
	4� I  
	5� J  
	6� K  
	7� L�  R �             8  8  C  C  C  C  h  h  o  o  o  o  h  h  #    �  �  �  �  �  �  �  �  �  �  � 	 � 	 � 	 � 	 � 	 � 	 � 	 � 
 � 
 � 
 � 
 � 
 � 
 � 
 �    � - -  P P P P y y y y P P � � � � � � � � � � � � � � � � � � � � �  � P r  r  ~  ~  =  : !: !F !F ! !� *� *� ,� ,� ,� ,� ,� ,
 ,
 ,� ,� ,� ,� ,� ,� +K ?K ?K ?K ?J ? ?� Z� Z� [� [� [� [� [� [� [� [ ] ] ] ]� ]� ^� ^� ^� ^� ^� _� _� _� __ _2 a2 a5 a5 a1 a1 a1 a1 a' a' a? b? b? b? bC bC bF bF b> b> b> b> bX bX bX bX b\ b\ b_ b_ bW bW bW bW b> b> b> b������������������������	T�	T�	;�	��	��	t�� �7 �  &  ,  �,v�*�W)+� ��Y:*�� �[]_�b�dY� �YfSYxS�m�s� ��wY6� 6*,�{M,z������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,|�*�W*+� ��Y:*�� �[]_�b�dY� �YfSY~S�m�s� ��wY6� 6*,�{M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,��*�W++� ��Y:*�� �[]_�b�dY� �YfSY�S�m�s� ��wY6� /*,�{M������ � :� �:*,��M���� :� #�� � #:��� � :� �:���,��*�W,+� ��Y:*�� �[]_�b�dY� �YfSY�S�m�s� ��wY6� 6*,�{M,�������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,��*�W-+� ��Y:$*�� �$[]_�b$�dY� �YfSY�S�m�s$� �$�wY6%� 6*$%,�{M,��$������ � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+,��*� ( Y u x� x } x� N � �� � � �� N � �� � � �� � � �� � � ��9<�<A<�\h�beh�\w�bew�htw�w|w����������%�"%��4�"4�%14�494���������������������������������b~������W�������W��������������� �  � ,  ���    �� �   ���   � ��   �8�   �9�   �:�   �;�   ���   ��� 	  ��� 
  ���   �<�   �=�   ���   ���   ���   ���   ���   ���   �>�   �?�   ��   ��   ��   �@�   �A�   ��   �B�   �C�   ���   ���   �D�    �� !  �� "  �� #  �E� $  �F� %  �� &  �G� '  �H� (  �� )  �� *  �� +�   >  >� >� ��� ������������L�G�G�� �7 �  2  %  \*�W.+� ��Y:*�� �[]_�b�dY� �YfSY�S�m�s� ��wY6� 6*,�{M,�������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,��*�W/+� ��Y:*�� �[]_�b�dY� �YfSY�S�m�s� ��wY6� 6*,�{M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,��*�W0+� ��Y:*�� �[]_�b�dY� �YfSY�S�m�s� ��wY6� 6*,�{M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,��**� !��� �� 
,��,��*�W1+� ��Y:*�� �[]_�b�dY� �YfSY�S�m�s� ��wY6� 6*,�{M,�������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,��*� 2+� ��":$*�� �$��'$� �$� �� �*�   R n q� q v q� G � �� � � �� G � �� � � �� � � �� � � ��25�5:5�Ua�[^a�Up�[^p�amp�pup����������%�"%��4�"4�%14�494��������������������� �  t %  \��    \� �   \��   \ ��   \I�   \J�   \:�   \;�   \��   \�� 	  \�� 
  \��   \K�   \L�   \��   \��   \��   \��   \��   \��   \M�   \N�   \�   \�   \�   \@�   \A�   \�   \O�   \P�   \��   \��   \D�    \� !  \� "  \� #  \Q� $�   J  7� 7�  � �� �� ��������L�L�L�����h�D�D�,� 67 �  �    �*� I��**� U��� *� I*S� �YS� ܶ*l� �**� %�*� �Y**� I��SY*o� �YS� �S�W*S� �YS*q� �*S� �YS� ܸ ��B*S� �YS*r� �*S� �YS� ܸ ��B*S� �YS*s� �*S� �YS� ܸ ��B*t� �*S� �YS� ܸ����t|��Y� �� .W*t� �*S� �YS� ܸ����~���� �� **� ��>�*w� �**� e���#**� i���'W**� U)����Y� �� W**� U+����Y� �� .W*z� �*S� �YS� ܸ����t|��� ��&*|� �***� u�-� �Y*S� �YS� �SY�>S� �� ��� **� ��>�*� �**� e���#**� ���'W* �� �*S� �YS� ܸ �*S� �YS� ܸ �1����~��� +*� ��>�* �� �**� e���#**� M���'W**� ���� ��� J* �� �***� u�3� �Y*S� �YS� �SY�>S� �W*{� �Y5S�>�B*�   �   *   ���    �� �   ���   � �� �  b �  g  g  g  g   g  h  h  h  h  h  h  h  h 
 h 
 h  j  j  j  j  j 
 h 8 l 8 l J l J l U l U l 8 l 8 l 8 l } q } q } q } q } q } q } q } q j q � r � r � r � r � r � r � r � r � r � s � s � s � s � s � s � s � s � s � t � t � t � t
 t
 t � t � t � t � t& t& t& t& t< t< t& t& t& t& t � t � tT vT vT vT vP v` w` w` w` wk wk w` w` w` w � tx yx yx yx y| y| y y yw yw yw yw y� y� y� y� y� y� y� y� y� y� y� y� yw yw yw yw y� z� z� z� z� z� z� z� z� z� zw zw z� |� |� |� | | |� |� |� |� |� |� | ~ ~ ~ ~ ~# # # # . . # # # � |A �A �A �A �T �T �T �T �A �A �m �m �A �A �A �A �A �A �� �� �� �� �} �� �� �� �� �� �� �� �� �� �A �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �w y �7 �  �    h*+,�9� �**� ���� ����Y� �� W**� }5;����Y� �� W*{� �Y5S� ܸ ��>*� )* �� �**o� �Y-S�0=� �� ��**� )��� �� d*�B+� ��D:* �� �F�IK* �� �**o� �Y-S�0M� �� �� � �P� �� �� �� a*�B+� ��D:* �� �R�IK* �� �**o� �Y-S�0M� �� �� � �P� �� �� �*� 5* �� �**� y�T*�VY� �YXS� �Y*S� �YS� �S�[�^��`Y*� ��c:**� Ueg����Y� �� .W* �� �*S� �YeS� ܸ ���j�~��� �� Z* �� �**o� �Y-S�0l� �Y*S� �YeS� �S� �W* �� �**� m�n*� �YpS�W�"�(:�:�v:		�|���  �           7	��*� ��>�*��+� ���:
* �� �
� �
��Y6�@*,���*�W
� ��Y:* �� �[]_�b�dY� �YfSY�SYjSY�S�m�s� ��wY6� �*,�{M,��,* �� �**� 9� �Y�S��� ���,��,* �� �**� 9� �Y�S��� ���*,��������� � :� �:*,��M���� :� )� q� ��� � #:��� � :� �:���*,���
�����
��� :� &� o�� � #:
�Ũ � :� �:
�Ʃ*,���*� �* �� �**� e���#**� ]���'���� �� � :� �:���*� 	z}�}�}���������������������������������������	���	���	��	�		��>A^�>F`�>U�A�U���U��RU�UZU� �     h��    h� �   h��   h ��   hRS   hTS   h:U   h;V   h�W   hX� 	  hY� 
  hZ�   h[�   h\�   h��   h��   h��   h��   h��   h��   h��   h��   h�   h�   h�   h@� �  v �   d  �  �  �  �  �  �  �  � % � % � % � % � ) � ) � , � , � $ � $ � $ � $ �  �  �  �  � = � = � = � = �  �  � ^ � ^ � ^ � ^ � S � S � | � | � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � | �T �T �t �t �T �T �T �T �I �I �  �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � �� �� �� �! �! �3 �3 �! �! �! �� �� �u �u �u �u �q �q �� �� �� �� �" �" �" �" �" �" �" �" � �L �L �L �L �L �L �L �L �D �� �{ �- �- �- �- �8 �8 �- �- �- �- �" �" �� � a� �   l     $*� �� �L*� �N*� ��� �*-+��� ��   �   *    $��     $��    $ ��    $ � � �       E7 �  �  ,  I, �,*.� �**� E�"*� �Y*o� �YS� �S�� �,$�*�W+� ��Y:*0� �[]_�b�dY� �YfSY&S�m�s� ��wY6� 6*,�{M,(������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,*�*�W +� ��Y:*4� �[]_�b�dY� �YfSY,S�m�s� ��wY6� 6*,�{M,.������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,0�*�W!+� ��Y:*8� �[]_�b�dY� �YfSY2S�m�s� ��wY6� 6*,�{M,4������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,6�*�W"+� ��Y:*D� �[]_�b�dY� �YfSY8S�m�s� ��wY6� 6*,�{M,:������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,<�*L� �**o� �Y-S�04� �� �� ��� 
,>�,@�*�W#+� ��Y:$*R� �$[]_�b$�dY� �YfSYBS�m�s$� �$�wY6%� 6*$%,�{M,D�$������ � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( � � �� � � �� � � �� � � �� � � �� � � �� � � �� � � ��Xtw�w|w�M�������M���������������8;�;@;�[g�adg�[v�adv�gsv�v{v���������+�%(+��:�%(:�+7:�:?:������ ���'�!$'��6�!$6�'36�6;6� �  � ,  I��    I� �   I��   I ��   Ib�   Ic�   I:�   I;�   I��   I�� 	  I�� 
  I��   Id�   Ie�   I��   I��   I��   I��   I��   I��   If�   Ig�   I�   I�   I�   I@�   IA�   I�   Ih�   Ii�   I��   I��   ID�    I� !  I� "  I� #  Ij� $  Ik� %  I� &  IG� '  IH� (  I� )  I� *  I� +�   ~  . . !. !. . . . . . y0 y0 B0=4=4488�8�D�D�DYLYLYLYLYLYLYL�R�R�R r7 �  �  ,  r,I�*V� �**� 1�K*� ��� ��,M�*X� �**o� �Y-S�04� �� �� �� 
,O�,Q�*�W$+� ��Y:*^� �[]_�b�dY� �YfSYSS�m�s� ��wY6� 6*,�{M,U������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,W�,Y�*d� �**o� �Y-S�02� �� �� ��� 
,O�,[�*�W%+� ��Y:*j� �[]_�b�dY� �YfSY]S�m�s� ��wY6� 6*,�{M,_������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,a�*�W&+� ��Y:*t� �[]_�b�dY� �YfSYcS�m�s� ��wY6� 6*,�{M,e������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,g�*�W'+� ��Y:*|� �[]_�b�dY� �YfSYiS�m�s� ��wY6� 6*,�{M,k������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,m�*�W(+� ��Y:$*�� �$[]_�b$�dY� �YfSYoS�m�s$� �$�wY6%� 6*$%,�{M,q�$������ � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( � � �� � � �� � �� � �� � �� � ������������������������}�������r�������r���������������A]`�`e`�6�������6���������������!$�$)$��DP�JMP��D_�JM_�P\_�_d_� �  � ,  r��    r� �   r��   r ��   rl�   rm�   r:�   r;�   r��   r�� 	  r�� 
  r��   rn�   ro�   r��   r��   r��   r��   r��   r��   rp�   rq�   r�   r�   r�   r@�   rA�   r�   rr�   rs�   r��   r��   rD�    r� !  r� "  r� #  rt� $  ru� %  r� &  rG� '  rH� (  r� )  r� *  r� +�   z  V V V V 5X 5X 5X �^ �^ d^ V6d6d6d6d6d6d6d�j�jgjbtbt+t&|&|�|������ �7 �  �  ,  Ļ`Y*� ��c:**� U'�����Y� �� -W* �� �*S� �Y'S� ܸ ���j�~��� �� W* �� �**o� �Y�S�0�� �Y�>S� �W* �� �**� m�n*� �Y�S�W� ,* �� �**o� �Y�S�0�� �Y��S� �W�#�):�:�v:�����   �           7��*� ��>�*��+� ���:* ƶ �� ���Y6	�@*,���*�W� ��Y:
* Ƕ �
[]_�b
�dY� �YfSY�SYjSY�S�m�s
� �
�wY6� �*
,�{M,��,* ʶ �**� 9� �Y�S��� ���,��,* ˶ �**� 9� �Y�S��� ���*,���
������ � :� �:*,��M�
��� :� )� q� ��� � #:
��� � :� �:
���*,����������� :� &� o�� � #:�Ũ � :� �:�Ʃ*,���*� �* ϶ �**� e���#**� =���'���� �� � :� �:����`Y*� ��c:**� U������Y� �� #W*S� �Y�S� ���j�~���� �� 6* ׶ �**o� �Y-S�0�� �Y��S� �W� ,* ٶ �**o� �Y-S�0�� �Y�>S� �W�#�):�:�v:�����   �           7��*� ��>�*��+� ���:* � �� ���Y6�@*,���*�W� ��Y:* � �[]_�b�dY� �YfSY�SYjSY�S�m�s� ��wY6� �*,�{M,��,* � �**� 9� �Y�S��� ���,��,* � �**� 9� �Y�S��� ���*,��������� � : �  �:!*,��M�!��� :"� )� q� �"�� � #:##��� � :$� $�:%���%*,����������� :&� &� o&�� � #:''�Ũ � :(� (�:)�Ʃ)*,���*� �* � �**� e���#**� Q���'���� �� � :*� *�:+���+*� .�
���3?�9<?��3N�9<N�?KN�NSN�'3��9~������'3��9~��������������  � �^  � �`  ��� �3��9~����������e�������Z���Z�������V�JV�PSV���e�Je�PSe�Vbe�eje���^��`�������J��P������� �  � ,  ���    �� �   ���   � ��   �vU   �wV   �:W   �x�   �y�   �z� 	  �{� 
  �|�   ���   � �   ���   ���   ���   ���   ���   ���   ���   ���   ��   ��   �U   �@V   �AW   �}�   �~�   ��   ���   ���   �D�    �� !  �� "  �� #  �� $  �� %  �� &  �G� '  �H� (  �� )  �� *  �� +�  � �  �  �  �  �  �  �  �  �  �  �  �  � , � , � , � , � , � , � A � A � , � , � , � , �  �  � u � u � [ � [ � [ � � � � � � � � � � � � � � � � � � � � � � � � �  �  � � � � � � �r �r �~ �~ �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �: � �� �� �� �� �� �� �� �� �� �� �� �� �   � � � � � � � � � � � � � � �, �, � � � � � � �b �b �H �H �H �� �� �t �t �t � � �� �� �� �� �� �� �> �> �J �J �~ �~ �~ �~ �~ �~ �~ �~ �v �� �� �� �� �� �� �� �� �� � �� �� �� �� �� �� �� �� �� �� �� �~ �~ �� � �  �   �     ��� �� �� �� N� ��PU� ��W�� ���@� ��B� �YzS�|� �YzS��� �YzS��� �YzS��Ҹ ����� ����dY� �Y�SY� �SY�SY� �S�m�ʱ   �       ���   �7 �  	�    ̻`Y*� ��c:**� U������Y� �� #W*S� �Y�S� �Ƹj�~���� �� 6* � �**o� �Y�S�0�� �Y�>S� �W� ,* �� �**o� �Y�S�0�� �Y��S� �W�%�+:�:�v:�˸��     �           7��*� ��>�*��+� ���:* �� �� ���Y6	�@*,���*�W� ��Y:
* �� �
[]_�b
�dY� �YfSY�SYjSY�S�m�s
� �
�wY6� �*
,�{M,϶,* �� �**� 9� �Y�S��� ���,��,* �� �**� 9� �Y�S��� ���*,���
������ � :� �:*,��M�
��� :� )� q� ��� � #:
��� � :� �:
���*,����������� :� &� o�� � #:�Ũ � :� �:�Ʃ*,���*� �*� �**� e���#**� a���'���� �� � :� �:���**� ���� ����**� U������Y� �� #W*S� �Y�S� �Ƹj�~���� �� j*��+� ���:*	� �ض������Y��*	� �*� �������� ��� �� �� ��J**� U������Y� �� #W*S� �Y�S� ���j�~���� �� j*��+� ���:*� �ض������Y��*� �*� �������� ��� �� �� �� �**� U������Y� �� #W*S� �Y�S� ���j�~���� �� g*��+� ���:*� �ض������Y��*� �*� �������� ��� �� �� �*� q�������f��f&�&�#&�&+&� �b�Vb�\_b� �q�Vq�\_q�bnq�qvq�  � �^  � �`  ��� ���V��\������� �     ���    �� �   ���   � ��   �vU   �wV   �:W   ���   ���   ��� 	  ��� 
  ���   ���   � �   ���   ���   ���   ���   ���   ���   ���   ���   ��   ��   ���   ���   ��� �   �  �  �  �  �  �  �  �  �  �  �  �  � & � & � 6 � 6 � & � & � & � & �  �  � l � l � R � R � R � � � � � ~ � ~ � ~ �  �  � � � � � � � � � � � � �J �J �V �V �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � �������������   ���������������������������4	4	L	L	Y	Y	Y	Y	`	`	H	H		���������������������������������))))--00((((AAQQAAAA((~~����������f(���       �    �