����  -� 
SourceFile 3/CFIDE/administrator/extensions/flexintegration.cfm cfflexintegration2ecfm976837517  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   KEYSTOREPASSWORD Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   KEYSTOREPWDLABEL   	   JR   	    FDSIP_ERROR_GET " " 	  $ I & & 	  ( CHECKCSRFTOKEN * * 	  , KEYSTOREPATHLABEL . . 	  0 IPS 2 2 	  4 BSEGMENTISINVALID 6 6 	  8 GETADMINVARIANT : : 	  < IP_ERROR_INVALID > > 	  @ CFCATCH B B 	  D GETCSRFTOKEN F F 	  H TOKEN J J 	  L FDSIP_ERROR_REMOVE N N 	  P OLDID R R 	  T IP_ERROR_ADD V V 	  X ERROR_KEYSTOREPASS Z Z 	  \ FORM ^ ^ 	  ` LOG b b 	  d SERVERIDENTITYLABEL f f 	  h AERRORMESSAGES j j 	  l REMOVE_BUTTON n n 	  p ERROR_FLEXASSEMBLER r r 	  t IDENTITY v v 	  x 	DEFAULTID z z 	  | ADMINSUBMIT ~ ~ 	  � REQUEST � � 	  � IPUTILS � � 	  � TMP � � 	  � IPINDEX � � 	  � 
ADD_BUTTON � � 	  � BERRORSEXIST � � 	  � KEYSTORE � � 	  � RESULT � � 	  � NUMSEGMENTS � � 	  � com.macromedia.SourceModTime  h���� pageContext #Lcoldfusion/runtime/NeoPageContext; � �	  � getOut ()Ljavax/servlet/jsp/JspWriter; � � javax/servlet/jsp/JspContext �
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
 � � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  setValue �
 � setHttpOnly (Z)V	
 �
 name cfadmin_lastpage_ concat &(Ljava/lang/String;)Ljava/lang/String;
 � setName �
 � 	hasEndTag	 coldfusion/tagext/GenericTag
 _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z
  $class$coldfusion$tagext$io$SilentTag coldfusion.tagext.io.SilentTag!  �	 # coldfusion/tagext/io/SilentTag% 
doStartTag ()I'(
&) 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;+,
 - LOCALE/ REQUEST.LOCALE1 en3 checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V56
 7 
LOCALEFILE9 java/lang/StringBuilder; resources/extensions_=  �
<? append -(Ljava/lang/String;)Ljava/lang/StringBuilder;AB
<C .cfmE toStringG �
 �H _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)VJK
 L IPLISTN FORM.IPLISTP  R falseT 2(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)V5V
 W defaultY set[ � coldfusion/runtime/Variable]
^\ _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;`a
 b getAdminVariantd 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;fg
 h jrunj _compare '(Ljava/lang/Object;Ljava/lang/String;)Dlm
 n &class$coldfusion$tagext$lang$ObjectTag  coldfusion.tagext.lang.ObjectTagqp �	 s  coldfusion/tagext/lang/ObjectTagu createw 	setActiony �
vz java| setType~ �
v jrunx.kernel.JRun� setClass� �
v� jr�
v getServerName� FORM.IDENTITY� 	defaultID� ArrayNew (I)Ljava/util/List;��
 � _Array 2(Ljava/lang/Object;)Lcoldfusion/runtime/FastArray;��
 �� setArray !(Lcoldfusion/runtime/FastArray;)V��
^� REMOVE� FORM.REMOVE�  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z��
 � _Object (Z)Ljava/lang/Object;��
 �� RESTRICTEDIPLIST� FORM.RESTRICTEDIPLIST� ADD� FORM.ADD� isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)Z��
 � IPTOBEADDED� FORM.IPTOBEADDED� Trim�
 � Len (Ljava/lang/Object;)I��
 � (I)Ljava/lang/Object;��
 �� 	CSRFTOKEN� FORM.CSRFTOKEN� checkCSRFToken� _autoscalarize�a
 � DATASERVTABKEYNAME� _factor4 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;��
 � *coldfusion/runtime/TransientVariableHolder� &(Lcoldfusion/runtime/NeoPageContext;)V �
�� (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTag�� �	 � "coldfusion/tagext/lang/ImportedTag� l10n� 
../cftags/� admin� :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V�
�� &coldfusion/runtime/AttributeCollection� id� error_req_keystore_pass� var� error_keystorepass� ([Ljava/lang/Object;)V �
�� setAttributecollection (Ljava/util/Map;)V��  coldfusion/tagext/lang/ModuleTag�
��
�) ;
    You must provide a keystore file and a password
    � write� � java/io/Writer�
�� doAfterBody (
� _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;
  doEndTag( #javax/servlet/jsp/tagext/TagSupport	

 doCatch (Ljava/lang/Throwable;)V
� 	doFinally 
� User  X changed Flex integration settings. The old values were Enable Flash Remoting support :  RUNTIME _resolve �
  isEnabledFlashRemoting 8, Enable Remote Adobe LiveCycle Data Management access:  isEnabledFlexDataServices  ,, Enable RMI over SSL for Data Management : " isEnabledRmiSSL$ ". Enable Flash Remoting support : & ENABLEFLASHREMOTING( FORM.ENABLEFLASHREMOTING* (Z)Ljava/lang/String; �,
 �- ENABLEFLEXASSEMBLER/ FORM.ENABLEFLEXASSEMBLER1 ENABLERMISSL3 FORM.ENABLERMISSL5 getDataServiceId7 '(Ljava/lang/Object;Ljava/lang/Object;)Dl9
 : setDataServiceId< setEnableFlexDataServices> coldfusion/runtime/CFBoolean@ f_false Lcoldfusion/runtime/CFBoolean;BC	AD t_trueFC	AG FORM.KEYSTOREPASSWORDI STATICPASSWORDK setKeystorePasswordM _factor0O�
 P FORM.KEYSTORER setKeystoreT getKeystoreV (Ljava/lang/Object;D)DlX
 Y getKeystorePassword[ setEnableRmiSSL] _List $(Ljava/lang/Object;)Ljava/util/List;_`
 �a ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Zcd
 e setEnableFlashRemotingg unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;ij coldfusion/runtime/NeoExceptionl
mk t36 [Ljava/lang/String; Anyqop	 s findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)Iuv
mw bind '(Ljava/lang/String;Ljava/lang/Object;)Vyz
�{ $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag~} �	 � coldfusion/tagext/io/OutputTag�
�) error_flexassembler� 7
					Error attempting to update settings:<br/>
					� MESSAGE� D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; ��
 � EncodeForHTML�
 � <br/>
					� DETAIL� 
				� _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V��
 �
� coldfusion/tagext/QueryLoop�
�
�
� unbind� 
�� _factor1��
 � #class$coldfusion$tagext$lang$LogTag coldfusion.tagext.lang.LogTag�� �	 � coldfusion/tagext/lang/LogTag� audit� setFile� �
�� setApplication�	
�� cflog� text� setText� �
��[ �
^� Java� coldfusion.util.IPAddressUtils� ipUtils� validateIPAdress� ip_error_invalid� #
				The IP you attempted to add (�) is not valid.
				IPs are four sets of numbers from 0 to 255 separated by periods (e.g., 127.0.0.1) in IPv4 addressing format
				or eight sets of hexadecimal numbers from 0 to FFFF seperated by colon (e.g., 0:0:0:0:0:0:0:1) in IPv6 addressing format.
			� ArrayLen��
 � (D)Ljava/lang/Object;��
 �� _arraySetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V��
 � [\+[:space:]\-]*� ALL� 	REReplace�
 � FLEXASSEMBLERIPLIST� ,� 
ListAppend J(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;��
 � t37�p	 � ip_error_add� %
						The IP you attempted to add (�) is not valid.
						IPs are four sets of numbers from 0 to 255 separated by periods (e.g., 127.0.0.1) in IPv4 addressing format
						or eight sets of hexadecimal numbers from 0 to FFFF seperated by colon (e.g., 0:0:0:0:0:0:0:1) in IPv6 addressing format. <br/>
						�  <br />
						� 
					� _factor2��
 �  added ip address � + where LiveCycle Data Services are running'� _int��
 �� 	ListGetAt '(Ljava/lang/String;I)Ljava/lang/String;��
 � ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I
  ListDeleteAt�
  _double (Ljava/lang/Object;)D	
 �
 ListLen (Ljava/lang/String;)I
  t38p	  fdsip_error_remove 
				An error occurred attempting to remove the requested IP(s).
				from the Flex Data Management configuration.<br />
				  <br />
				 
			 _factor3�
  t39p	  fdsip_error_get! �
				An error occurred attempting to retrieve a list of restricted IP addresses
				from the Flex Data Management configuration.<br />
				# <br />
				% _factor5'�
 ( cfusion*


 



/ flex_pagename1 pagename3 Flex integration5 'class$coldfusion$tagext$lang$IncludeTag !coldfusion.tagext.lang.IncludeTag87 �	 : !coldfusion/tagext/lang/IncludeTag< ../header.cfm> setTemplate@ �
=A _factor9C�
 D A

<form name="Flex" action="#CGI.Script_Name#" method="POST">
F ../include/margintop.cfmH ../include/errors.cfmJ ../include/buttonbar.cfmL 

<h2 class="pageHeader">N pageHeader_flexintegrationP Flex IntegrationR 	</h2>

T x
<table>
	<tr><td height="15px"></td></tr>
	<tr>
	<td class="px500">
	<input type="hidden" name="csrftoken" value="V getCSRFTokenX �">	
	<table><tr><td width="15px">
		<input name="EnableFlashRemoting"  type="CHECKBOX" class="text" value="true" id="EnableFlashRemoting" Z checked\ 6>
		</td><td>
		<b><label for="EnableFlashRemoting">^ enableFlashRem` Enable Flash Remotingb g</label></b>
		</td></tr><tr><td></td><td>
		<div class="description">
		<font class="sentance">
		d enableFlashRem_descf
			<span class="admin-tip">
			Lets a Flash client connect to this ColdFusion server and invoke ColdFusion Components (CFCs).
			</span>
			NOTE: <span class="admin-tip">Disabling this feature also disables ColdFusion server monitoring and multiserver monitoring.</span>
		h �
		</font>
		</div>
		</td></tr></table>
	</td>
	<td class="px500">
	<table><tr><td width="15px">
		<input name="EnableFlexAssembler" type="CHECKBOX" class="text" value="true" id="EnableFlexAssembler" j 6>
		</td><td>
		<b><label for="EnableFlexAssembler">l enableFlexDSn 4Enable Remote Adobe LiveCycle Data Management accessp enableFlexDS_descr]
		<span class="admin-tip">
			Lets LiveCycle Data Services ES connect to this ColdFusion server through RMI
			and use CFCs to read and update data that supports a
			Flex application. If you are not using this feature, disable it.
			This does not affect LiveCycle Data Services ES integrated in to the ColdFusion installation.
		</span>
		t �
		</font>
		</div>
		</td></tr></table>
	</td>
	</tr>
</table>
	<p>
		<table>
		<tr>
			<td width="140px"><label for="identity" class="label-bold">v serverIdentityLabelx Server Identityz _factor6|�
 } 5:</label></td>
			<td><input name="identity" title=" "  type="text" value="� EncodeForHTMLAttribute�
 � �" size="30" mansize="50" id="identity"></td>
		</tr>
		</table>
		<div class="spacer10"></div>
		<span class="admin-tip">
		� serverIdentity_info� �
			If you are running more than one instance of ColdFusion on this machine, you must
			configure each instance with a unique ID.
		� �
		</span>
		<div class="spacer20bottom"></div>
	</p>

	<p>
		<input name="EnableRmiSSL" type="CHECKBOX" class="text" value="true" id="EnableRmiSSL" � <>

		<label for="enable">
		<b><label for="EnableRmiSSL">� enablermissl� 'Enable RMI over SSL for Data Management� K</label></b>
		<div class="spacer10"></div>
		<font class="sentance">
		� enablermissl_desc��
		<span class="admin-tip">
			Lets you use Secure Socket Layer (SSL) encryption for the RMI communication between Flex and ColdFusion.
			This is not required unless you are transmitting authentication information or confidential
			data between Flex and ColdFusion over an unsecured network. You must provide a keystore file and keystore password.
			For instructions on how to create a keystore file, see the online Help.
		</span>
		� �
		</font>
		<div class="spacer10"></div>
		<table width="100%">
		<tr>
			<td class="px500"><label for="keystore" class="label-bold">� keystorePathLabel� Full path to keystore� 9:&nbsp;&nbsp;&nbsp;</label><input name="keystore" title="� " type="text" value="� _factor7��
 � 
ESAPIUTILS� encodeForHTMLAttributeFilePath� p" size="50" id="keystore" style=""></td>
			<td class="px500"><label for="keystorepassword" class="label-bold">� keystorePwdLabel� Keystore password� A:&nbsp;&nbsp;&nbsp;</label><input name="keystorepassword" title="� " type="password" value="� �" size="20" maxlength="50" id="keystorepassword" autocomplete="off"></td>
		</tr>
		</table>
	</p>
<hr class="line">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td>
		<b class="subheading">� selectIP� =Select IP addresses where LiveCycle Data Services are running� C</b>
	</td>
</tr>
<tr><td height="10px"></td></tr>
<tr>
<td>
� fdsip_welcometext�Q
To secure the LiveCycle Data Services ES integration point,
the hosts that are allowed to perform Data Management operations are restricted.
If you are running LiveCycle Data Services ES on a different computer, specify its IP address here.
By default, only the local computer can perform Data Management operations in ColdFusion.
� �
</td>
</tr>
<tr><td height="10px"></td></tr>
<tr>
	<td>
		
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<label for="ipaddress" class="labelbold">� 
ip_address� 
IP Address� |</label>
				<input type="text" maxlength="50" name="IPToBeAdded" size="20" id="ipaddress" style="margin-left: 80px">
				� 
add_button� Add� _factor8��
 � "
				<input type="submit" title="� " name="Add" value="  � �  " class="buttn-grey buttn-green">
			</td>
		</tr>
		</table>
		
	</td>
</tr>
</table>
<hr class="line">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td>
		<b><label for="removelist" class="subheading">� fdsviewdeleteIP� QView or Remove selected IP addresses where LiveCycle Data Services ES are running�</label></b>
	</td>
</tr>
<tr><td height="10px"></td></tr>
<tr>
	<td>
		
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="300px">
				<select name="RestrictedIPList"  id="removelist" size="4" multiple style="width:20em">
					� P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable; �
 � java/util/StringTokenizer� '(Ljava/lang/String;Ljava/lang/String;)V �
�� 	nextToken� �
�� 
						<option value="� ">� </option>
					� CFLOOP� checkRequestTimeout� �
 � hasMoreTokens ()Z��
�� J
				</select>
			</td>
			<td>
				<div class="spacer10"></div>
				� remove_button� Remove Selected� 1
				<input name="Remove"  type="submit" value="� u" class="buttn-grey" id="removelist">
			</td>
		</tr>
		</table>
		
	</td>
</tr>
</table>
<br />
<br />

� 


  ../include/marginbottom.cfm ?
<table align="center">
</table>

<br><br>


</form>

 ../footer.cfm metaData Ljava/lang/Object;		 
 	Functions 
Properties getMetadata ()Ljava/lang/Object; this !Lcfflexintegration2ecfm976837517; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; __factorParent out Ljavax/servlet/jsp/JspWriter; module36 $Lcoldfusion/tagext/lang/ImportedTag; mode36 t6 Ljava/lang/Throwable; t7 t8 t9 t10 t11 module37 mode37 t14 t15 t16 t17 t18 t19 module38 mode38 t22 t23 t24 t25 t26 t27 module39 mode39 t30 t31 t32 t33 t34 t35 module40 mode40 t40 t41 t42 t43 LineNumberTable java/lang/ThrowableF cookie0 !Lcoldfusion/tagext/net/CookieTag; silent20  Lcoldfusion/tagext/io/SilentTag; mode20 t12 t13 module21 mode21 t20 t21 	include22 #Lcoldfusion/tagext/lang/IncludeTag; module27 mode27 module28 mode28 module29 mode29 module30 mode30 module31 mode31 module32 mode32 module33 mode33 module34 mode34 module35 mode35 t4 ,Lcoldfusion/runtime/TransientVariableHolder; module6 mode6 #Lcoldfusion/runtime/AbortException; Ljava/lang/Exception; __cfcatchThrowable0 output8  Lcoldfusion/tagext/io/OutputTag; mode8 module7 mode7 t28 t29 !coldfusion/runtime/AbortExceptionu java/lang/Exceptionw runPage 	include23 	include24 	include25 module26 mode26 output43 mode43 module41 mode41 Ljava/lang/String; Ljava/util/StringTokenizer; module42 mode42 t44 	include44 	include45 object4 "Lcoldfusion/tagext/lang/ObjectTag; log9 Lcoldfusion/tagext/lang/LogTag; log15 __cfcatchThrowable3 output19 mode19 module18 mode18 object10 output12 mode12 module11 mode11 __cfcatchThrowable1 output14 mode14 module13 mode13 <clinit> t5 __cfcatchThrowable2 output17 mode17 module16 mode16 1     0                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     r     v     z     ~     �     �     �     �     �     �     �     �     �     � �     �   p �   � �   op   } �   � �   �p   p   p   7 �   	        "     ��                  �    �*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q**s+,� � u**w+,� � y**{+,� � }**+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � ��          �    �   �        #     *� 
�             ��    	 ,  ],*O� �**�� �Y�S��� �Y**� ���S� и ��,���*��$+� ���:*P� ��������Y� �Y�SY�SY�SY�S������Y6� 6*,�.M,�������� � :� �:*,�M��� :� #�� � #:		�� � :
� 
�:��,**� �ɸ ��,���,**� �ɸ ��,���,**� �ɸ ��,���*��%+� ���:*Y� ��������Y� �Y�SY�S������Y6� 6*,�.M,�������� � :� �:*,�M��� :� #�� � #:�� � :� �:��,���*��&+� ���:*_� ��������Y� �Y�SY�S������Y6� 6*,�.M,�������� � :� �:*,�M��� :� #�� � #:�� � :� �:��,¶�*��'+� ���:*n� ��������Y� �Y�SY�S������Y6� 6*,�.M,ƶ������ � :� �:*,�M��� : � # �� � #:!!�� � :"� "�:#��#,ȶ�*��(+� ���:$*p� �$�����$��Y� �Y�SY�SY�SY�S���$�$��Y6%� 6*$%,�.M,̶�$����� � :&� &�:'*%,�M�'$�� :(� #(�� � #:)$)�� � :*� *�:+$��+*� ( � � �G � � �G � � �G � � �G � � �G � � �G � � �G � � �G���G���G���G���G���G���G���G���G\x{G{�{GQ��G���GQ��G���G���G���G <?G?D?G_kGehkG_zGehzGkwzGzzG�GG�/;G58;G�/JG58JG;GJGJOJG   � ,  ]    ] �   ]   ] �	   ]   ] &   ] !   ]"	   ]#	   ]$! 	  ]%! 
  ]&	   ]'   ]( &   ])!   ]*	   ]+	   ],!   ]-!   ].	   ]/   ]0 &   ]1!   ]2	   ]3	   ]4!   ]5!   ]6	   ]7   ]8 &   ]9!   ]:	   ];	    ]<! !  ]=! "  ]>	 #  ]? $  ]@ & %  ]! &  ]	 '  ]A	 (  ]B! )  ]C! *  ]D	 +E   � ) "O "O O O O O  O rP rP ~P ~P ;PPPPPPPPPPP1P1P1P1P0P}Y}YFYA_A_
_nn�n�p�p�p�p�p C�   = 	   �*� �**� �*� ��� �Y�S� и ֙ o*� �+� �� �:*� �� ���*�� �Y�S� �� ����*� �*� ƶ����� �*�$+� ��&:*� ���*Y6��*,�.M*,��� :�����*,�)� :�����*� �* � �**�� �YS�W� ʶ ж_*� S�_* � �* � �**�� �YS�\� ʶ и�����Z�� *� *�� �YLS� ��_*� y* � �**�� �YS�8� ʶ ж_* � �**� =�ce*� ʸik�o�� �**� y��Z�o�~���Y� ֚ 8W**� y��+�o�~���Y� ֙ W**� }��+�o�~��� ֙ F*� y**� }�ɶ_*� �* � �**�� �YS�=� �Y**� }��S� ж_�,��`� � :	� 	�:
*,�M�
�� :� #�� � #:�-� � :� �:�.�*,0��*��+� ���:* �� ��������Y� �Y�SY2SY�SY4S������Y6� 6*,�.M,6������� � :� �:*,�M��� :� #�� � #:�� � :� �:��*�;+� ��=:* �� �?�B��� �*�  � �hG � �hG �ehGhmhG � ��G � ��G ���G���G � ��G � ��G ���G���G���G���G69G9>9GYeG_beGYtG_btGeqtGtytG    �   �    � �   �   � �	   �HI   �JK   �L &   �"	   �#	   �$! 	  �%	 
  �&	   �M!   �N!   �)	   �O   �P &   �,!   �-	   �.	   �Q!   �R!   �1	   �ST E  � s                8  8  C  C  C  C  i  i  q  q  q  q  i  i  #    � � � � � � � � � � � � � � � � � �. �. �. �. �O �O �] �] �] �] �Y �Y �. �{ �{ �{ �{ �p �p �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � �� �� �� �� �� �� �� �� �� �� � � � � � � �K �K �1 �1 �1 �1 �& �& �� �� � � � �� �� �� �� �� �� �� � |�     ,  �,W��,*� �**� I�cY*� �Y*�� �Y�S� �S�i� ��,[��*� �**�� �YS�� ʶ и ֙ 
,]��,_��*��+� ���:*� ��������Y� �Y�SYaS������Y6� 6*,�.M,c������� � :� �:*,�M��� :� #�� � #:		�� � :
� 
�:��,e��*��+� ���:*� ��������Y� �Y�SYgS������Y6� 6*,�.M,i������� � :� �:*,�M��� :� #�� � #:�� � :� �:��,k��*� �**�� �YS�!� ʶ и ֙ 
,]��,m��*��+� ���:*� ��������Y� �Y�SYoS������Y6� 6*,�.M,q������� � :� �:*,�M��� :� #�� � #:�� � :� �:��,e��*��+� ���:*� ��������Y� �Y�SYsS������Y6� 6*,�.M,u������� � :� �:*,�M��� : � # �� � #:!!�� � :"� "�:#��#,w��*��+� ���:$*.� �$�����$��Y� �Y�SYySY�SYyS���$�$��Y6%� 6*$%,�.M,{��$����� � :&� &�:'*%,�M�'$�� :(� #(�� � #:)$)�� � :*� *�:+$��+*� ( � � �G � � �G �	GG �	$G$G!$G$)$G���G���G���G���G���G���G���G���G���G���G}��G���G}��G���G���G���GLhkGkpkGA��G���GA��G���G���G���G8;G;@;G[gGadgG[vGadvGgsvGv{vG   � ,  �    � �   �   � �	   �U   �V &   � !   �"	   �#	   �$! 	  �%! 
  �&	   �W   �X &   �)!   �*	   �+	   �,!   �-!   �.	   �Y   �Z &   �1!   �2	   �3	   �4!   �5!   �6	   �[   �\ &   �9!   �:	   �;	    �<! !  �=! "  �>	 #  �] $  �^ & %  �! &  �	 '  �A	 (  �B! )  �C! *  �D	 +E   �     ! !      I I I � � xss<mm611��.�...�. ��     $  �,**� i�ɸ ��,���,**� i�ɸ ��,���,*/� �**� y�ɸ ����,���*�� +� ���:*4� ��������Y� �Y�SY�S������Y6� 6*,�.M,�������� � :� �:*,�M��� :� #�� � #:		�� � :
� 
�:��,���*=� �**�� �YS�%� ʶ и ֙ 
,]��,���*��!+� ���:*@� ��������Y� �Y�SY�S������Y6� 6*,�.M,�������� � :� �:*,�M��� :� #�� � #:�� � :� �:��,���*��"+� ���:*C� ��������Y� �Y�SY�S������Y6� 6*,�.M,�������� � :� �:*,�M��� :� #�� � #:�� � :� �:��,���*��#+� ���:*O� ��������Y� �Y�SY�SY�SY�S������Y6� 6*,�.M,�������� � :� �:*,�M��� : � # �� � #:!!�� � :"� "�:#��#,**� 1�ɸ ��,���,**� 1�ɸ ��,���*�   � � �G � � �G � � �G � � �G � � �G � � �G � � �G � � �G���G���G���G���G���G���G���G���G\x{G{�{GQ��G���GQ��G���G���G���G,HKGKPKG!kwGqtwG!k�Gqt�Gw��G���G   j $  �    � �   �   � �	   �_   �` &   � !   �"	   �#	   �$! 	  �%! 
  �&	   �a   �b &   �)!   �*	   �+	   �,!   �-!   �.	   �c   �d &   �1!   �2	   �3	   �4!   �5!   �6	   �e   �f &   �9!   �:	   �;	    �<! !  �=! "  �>	 #E   � . . . . .  . / / / / / 4/ 4/ 4/ 4/ 4/ 4/ 4/ 4/ ,/ �4 �4 L4===}@}@F@ACAC
COOOO�O�O�O�O�O�O�O�O�O�O�O O�   I    �*� e*7� �*� ƶ�*7� �**�� �YS�� ʶ и ��*7� �**�� �YS�!� ʶ и �#�*7� �**�� �YS�%� ʶ и �'�**� a)+���.��**� a02���.�#�**� a46���.��_*� e**� e�ɶ_*� U*9� �**�� �YS�8� ʶ ж_**� U��*_� �YwS� ��;�~� _*;� �**�� �YS�=� �Y*_� �YwS� �S� �W*=� �**�� �YS�?� �Y�ES� �W**� a02��� ]*C� �**�� �YS�!� ʶ и ��� +*D� �**�� �YS�?� �Y�HS� �W� R*G� �**�� �YS�!� ʶ и ֙ +*H� �**�� �YS�?� �Y�ES� �W**� aJ����Y� ֙ -W*_� �YS� �*�� �YLS� ��;�~��� ֙ 7*N� �**�� �YS�N� �Y*_� �YS� �S� �W*�      *   �    � �   �   � �	 E  6 �  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7   7   7   7   7  7  7  7  7 A 7 A 7  7  7  7  7 M 7 M 7 M 7 M 7  7  7  7  7 n 7 n 7  7  7  7  7 z 7 z 7 z 7 z 7  7  7  7  7 � 7 � 7  7  7  7  7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7  7  7  7  7 � 7 � 7  7  7  7  7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7  7  7  7  7 � 7 � 7  7  7  7  7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7  7  7  7  7   7 � 7 � 7 � 7 � 7   7 9 9 9 9 � 9# :# :+ :+ :# :# :d ;d ;J ;J ;J ;� =� =~ =~ =~ =# :� A� A� A� A� A� A� A� A� A� A� C� C� C� C� C� C� D� D� D� D� D� C G GL HL H2 H2 H2 H G� AU MU MU MU MY MY M[ M[ MT MT MT MT Ml Ml M{ M{ Ml Ml Ml Ml MT MT M� N� N� N� N� NT M ��   	�  !  ���Y*� ���:*��+� ���:*2� ��������Y� �Y�SY�SY�SY�S������Y6� 6*,�.M,�������� � :� �:*,�M��� :	� &�	�� � #:

�� � :� �:��*+,�Q� :���**� a�S��� 7*Q� �**�� �YS�U� �Y*_� �Y�S� �S� �W**� a46��� �*T� �*T� �**�� �YS�W� ʶ и�����Z�t|��Y� ֙ ?W*T� �*T� �**�� �YS�\� ʶ и�����Z�t|��� ֙ .*U� �**�� �YS�^� �Y�HS� �W� 3*� ��H�_*� �*X� �**� m�ɸb**� ]�ɸf���_� +*[� �**�� �YS�^� �Y�ES� �W**� a)+��� 4*`� �**�� �YS�h� �Y�HS� �W� +*b� �**�� �YS�h� �Y�ES� �W��:�:�n:�t�x�   �           C�|*� ��H�_*��+� ���:*h� ����Y6�-*��� ���:*i� ��������Y� �Y�SY�SY�SY�S������Y6� �*,�.M,���,*k� �**� E� �Y�S��� ����,���,*l� �**� E� �Y�S��� ����*,�������� � :� �:*,�M��� :� )� i� ��� � #:�� � :� �:���������� :� &� f�� � #:��� � :� �:���*� �*o� �**� m�ɸb**� u�ɸf���_� �� � :� �: ��� *� % j � �G � � �G _ � �G � � �G _ � �G � � �G � � �G � � �Gs��G���GhGGh&G&G#&G&+&G
ZGNZGTWZG
iGNiGTWiGZfiGiniG  ��v � ��v ���v  ��x � ��x ���x  ��G � ��G ���G��GN�GT��G���G   L !  �    � �   �   � �	   �gh   �i   �j &   �"!   �#	   �$	 	  �%! 
  �&!   �M	   �N	   �)k   �*l   �m!   �no   �p &   �q   �r &   �R!   �1	   �2	   �3!   �4!   �5	   �6	   �s!   �t!   �9	   �:!   �;	  E  J � C 2 C 2 O 2 O 2  2 � P � P � P � P � P � P � P � P � P � P Q Q Q Q Q � P0 S0 S0 S0 S4 S4 S7 S7 S/ S/ SL TL TL TL Tm Tm TL TL TL TL T� T� T� T� T� T� T� T� T� T� TL TL T� U� U� U� U� U� W� W� W� W� W X X X X X X X X X X� XL TB [B [( [( [( [/ SK _K _K _K _O _O _R _R _J _J _{ `{ `a `a `a `� b� b� b� b� bJ _ � 5� g� g� g� g� g� gL iL iX iX i� k� k� k� k� k� k� k� k� k� l� l� l� l� l� l� l� l� l i� h� o� o� o� o� o� o� o� o� o� oz oz o   1 y   	  /  �*� �� �L*� �N*� ��� �*-+�E� �+G��*�;-� ��=:* �� �I�B��� �*�;-� ��=:* �� �K�B��� �*�;-� ��=:* �� �M�B��� �+O��*��-� ���:* �� ��������Y� �Y�SYQS������Y6� 6*+�.L+S������� � :	� 	�:
*+�L�
�� :� #�� � #:�� � :� �:��+U��*��+-� ���:* �� ����Y6��*+�~� :���*+��� :���*+��� :���+Ѷ�+**� ��ɸ ��+Ӷ�+**� ��ɸ ��+ն�*��)� ���:*~� ��������Y� �Y�SY�S������Y6� 6*+�.L+ٶ������ � :� �:*+�L��� :� &���� � #:�� � :� �:��+۶�**� 5�ɸ :�:6*'��:��Y��: � N ��M,�_+��+**� )�ɸ ��+��+**� )�ɸ ��+����`6 �����+���*��*� ���:!*�� �!�����!��Y� �Y�SY�SY�SY�S���!�!��Y6"� 6*!"+�.L+���!����� � :#� #�:$*"+�L�$!�� :%� &� �%�� � #:&!&�� � :'� '�:(!��(+���+**� q�ɸ ��+�������R��� :)� #)�� � #:**��� � :+� +�:,���,*+��*�;,-� ��=:-*�� �-�B-�-�� �+��*�;--� ��=:.*�� �.�B.�.�� �� ((+G+0+GKWGQTWGKfGQTfGWcfGfkfGg��G���G\��G���G\��G���G���G���G���G���G�GG� G G G % G��nG��nG��nG��nG�nGbnGhknG��}G��}G��}G��}G�}Gb}Ghk}Gnz}G}�}G   � /  �    �   � �	   � � �   �zT   �{T   �|T   �}   �~ &   �$! 	  �%	 
  �&	   �M!   �N!   �)	   �o   �� &   �,	   �-	   �.	   ��   �� &   �1!   �2	   �3	   �4!   �5!   �6	   �s�   �t�   �9 &   �:    �;�    �� !  �� & "  �>! #  �o	 $  ��	 %  �! &  �! '  �A	 (  �B	 )  �C! *  �D! +  ��	 ,  ��T -  ��T .E   � ; A � A � ) � o � o � W � � � � � � � � � � � � ��q�q�q�q�q�q�q�q�q�qL~L~~�������������4�4�4�4�3�Z�����������d�9�9�9�9�8�~ �������������   ��   �    .**� �024�8*�� �Y:S�<Y>�@*�� �Y0S� �� �DF�D�I�M**� aOQS�8**� �U�X*� }Z�_*� �**� =�ce*� ʸik�o�� g*�t+� ��v:*� �x�{}����������� �*� }*� �***� !�c�� ʶ ж_**� aw���8*� m*� �*������**� a������Y� ֚ W**� a������Y� ֚ W**� a������Y� ֚ W**� �����Y� ֚ EW**� a������Y� ֙ ,W*#� �*#� �*_� �Y�S� �� ������� ֙ m*� MS�_**� a�Ķ�� *� M*_� �Y�S� ��_*+� �**� -�c�*� �Y**� M��SY*�� �Y�S� �S�iW*�      4   .    . �   .   . �	   .�� E  b �                              "  "  (  (  (  (  >  >              K  K  K  K  O  O  R  R  U  U  J  J  J  \  \  \  \  `  `  [  [  [  j  j  j  j  f  f  v  v  v  v  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  v  �  �  �  �  �  �  �  �    �  �  �          " " " "" "" "% "% " " " " "7 "7 "7 "7 "; "; "> "> "6 "6 "6 "6 " " " " "P "P "P "P "T "T "W "W "O "O "O "O " " " " "i "i "i "i "h "h "h "h " " " " "| #| #| #| #� #� #� #� #{ #{ #{ #{ #� #� #� #� #� #� #� #� #� #� #{ #{ #{ #{ # # #� &� &� &� &� &� '� '� '� '� '� '� '� '� '� '� )� )� )� )� )� '� +� + + + + +� +� +� + " ! '�    
   �**� ���� \*+,��� �*��	+� ���:*r� ��������**� e�ɸ ������ �**� a������Y� ֚ EW**� a������Y� ֙ ,W*v� �*v� �*_� �Y�S� �� ������� ֙ �*+,��� �*��+� ���:* �� ���������<Y�@* �� �*� ƶD��D*_� �Y�S� �� �D��D�I������ �**� a������Y� ֙ W**� a������� ֙ *+,�� ���Y*� ���:*� 5*�� �YSY�S� ��_��:�:�n:		� �x�   �           C	�|*� ��H�_*��+� ���:
* Ҷ �
�
��Y6�0*��
� ���:* Ӷ ��������Y� �Y�SY"SY�SY"S������Y6� �*,�.M,$��,* ֶ �**� E� �Y�S��� ����,&��,* ׶ �**� E� �Y�S��� ����*,������� � :� �:*,�M��� :� )� i� ��� � #:�� � :� �:��
�����
��� :� &� o�� � #:
��� � :� �:
���**� m� �Y* ۶ �**� m�ɸχc��S**� %�ɶ֧ �� � :� �:���*� }��G���Gr#G #Gr2G 2G#/2G272GfGZfG`cfGuGZuG`cuGfruGuzuG���v���x���G��GZ�G`��G���G      �    � �   �   � �	   ���   ���   � h   �"k   �#l   ��! 	  ��o 
  �� &   ��   �� &   �)!   �*	   �+	   �,!   �-!   �.	   �Q	   �R!   �1!   �2	   �3!   �4	 E  r �  0  0  0  0   0   0 . r . r B r B r B r B r  r   0 e v e v e v e v i v i v l v l v d v d v d v d v ~ v ~ v ~ v ~ v � v � v � v � v } v } v } v } v � v � v � v � v � v � v � v � v � v � v } v } v } v } v d v d v � � � �  �  � � � � � � � � � � �0 �0 � � � � � � � d vQ �Q �Q �Q �U �U �X �X �P �P �P �P �j �j �j �j �n �n �q �q �i �i �i �i �P �P �P �� �� �� �� �� �� �� �� �� �� �� �� �V �V �b �b �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � ��   
�  '  .*� ���*� 9�E�_*�t
+� ��v:*z� ����x�{¶�Ķ���� �*{� �***� ��c�� �Y*{� �*_� �Y�S� �� ��S� и ��� *� 9�H�_**� 9�ɸ ֙�*� ��H�_*��+� ���:* �� ����Y6� *��� ���:* �� ��������Y� �Y�SY�SY�SY�S������Y6� ^*,�.M,ʶ�,* �� �*_� �Y�S� �� ����,̶����̨ � :	� 	�:
*,�M�
�� :� &� c�� � #:�� � :� �:��������� :� #�� � #:��� � :� �:���**� m� �Y* �� �**� m�ɸχc��S**� A�ɶ֧�*_� �Y�S* �� �*_� �Y�S� �� �SڸݶM��Y*� ���:*� 5*�� �YSY�S� ��_**� 5��� D*�� �YSY�S* �� �**� 5�ɸ *_� �Y�S� �� ��M�0�6:�:�n:��x�             C�|*��+� ���:* �� ����Y6�X*��� ���:* �� ��������Y� �Y�SY�SY�SY�S������Y6� �*,�.M,��,* �� �*_� �Y�S� �� ����,��,* �� �**� E� �Y�S��� ����,��,* �� �**� E� �Y�S��� ����*,�����w� � :� �:*,�M��� :� )� i� ��� � #:�� � :� �: �� �������� :!� &� o!�� � #:""��� � :#� #�:$���$**� m� �Y* �� �**� m�ɸχc��S**� Y�ɶ֧ �� � :%� %�:&���&*� '?��G���G4��G���G4��G���G���G���G ���G���G���G ��G��G��G�G	G�HKGKPKG�q}Gwz}G�q�Gwz�G}��G���GEq�Gw��G���GEq�Gw��G���G���G���G���v���x��G�qGw�G�G G   � '  .    . �   .   . �	   .��   .�o   .� &   .�   .� &   .$! 	  .%	 
  .&	   .M!   .N!   .)	   .*	   .+!   .,!   .-	   ..h   .Qk   .Rl   .�!   .�o   .� &   .�   .� &   .6!   .s	   .t	   .9!   .:!   .;	    .<	 !  .=! "  .>! #  .o	 $  .�! %  .	 &E  � �   x   x  y  y  y  y  y  y ) z ) z 1 z 1 z 9 z 9 z A z A z  z ^ { ^ { u { u { u { u { u { u { ] { ] { ] { ] { ] { ] { � | � | � | � | � | � | ] { �  �  � � � � � � � � � � � � � �$ �$ �X �X �X �X �X �X �X �X �P � � � � �' �' �' �' �' �' �3 �3 �' �' �9 �9 �9 �9 �9 �9 � � �[ �[ �[ �[ �n �n �q �q �t �t �[ �[ �[ �[ �G �G �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � � � � � � �P �) �� �� �� �� �� �� �� �� �� �� � � � � � � �� �� �} �G � �  �     �     �ڸ � �"� �$r� �t׸ ��� �YrS�t� ���� ��� �YrS��� �YrS�� �YrS� 9� �;��Y� �YSY� �SYSY� �S���          �   �   � 	   ,��Y*� ���:*� )��� �*� �* �� �*�� �YSY�S� �� * �� �*_� �Y�S� �� **� )�ɸ�� ����_**� ��ɸ ֙ G*�� �YSY�S* �� �*�� �YSY�S� �� **� ��ɸ���M*� )**� )�ɸc�Ҷ_**� )��* �� �*_� �Y�S� �� ����;�t|�����:�:�n:��x�     �           C�|*� ��H�_*��+� ���:* �� ����Y6	�0*��� ���:
* �� �
�����
��Y� �Y�SYSY�SYS���
�
��Y6� �*
,�.M,��,* ¶ �**� E� �Y�S��� ����,��,* ö �**� E� �Y�S��� ����*,��
����� � :� �:*,�M�
�� :� )� i� ��� � #:
�� � :� �:
���������� :� &� o�� � #:��� � :� �:���**� m� �Y* Ƕ �**� m�ɸχc��S**� Q�ɶ֧ �� � :� �:���*� �FIGINIG�o{Gux{G�o�Gux�G{��G���Gko�Gu��G���Gko�Gu��G���G���G���G v x GoGu�G�GG    �   ,    , �   ,   , �	   ,gh   ,�k   , l   ,�!   ,�o   ,� & 	  ,� 
  ,� &   ,M!   ,N	   ,)	   ,*!   ,+!   ,,	   ,-	   ,.!   ,Q!   ,R	   ,1!   ,2	 E  � n  � # � # � # � # � C � C � C � C � V � V � V � V � C � C � C � C � # � # � # � # �  � m � m � � � � � � � � � � � � � � � � � � � � � � � � � { � m � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �  �  �I �I �I �I �E �E �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � � � � � � �v �O �� �� �� �� �� �� �� �� �� �� � � � � � � �� �� �   �       �    �