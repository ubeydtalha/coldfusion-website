����  - � 
SourceFile //CFIDE/administrator/security/_otheroptions.cfm Pcf_otheroptions2ecfm1591365072$funcCFADMIN_ADDRUNTIMEPERMISSIONTOSECURITYCONTEXT  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   PERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   	INDEXLOOP  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / getVariable  (I)Lcoldfusion/runtime/Variable; 1 2 %coldfusion/runtime/ArgumentCollection 4
 5 3 _setCurrentLineNo (I)V 7 8
 " 9 ArrayNew (I)Ljava/util/List; ; < coldfusion/runtime/CFPage >
 ? = set (Ljava/lang/Object;)V A B coldfusion/runtime/Variable D
 E C A 8
 E G REQUEST I java/lang/String K SECURITY M CONTEXTS O _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; Q R
 " S java/lang/Object U WEBAPP W _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; Y Z
 " [ 	DIRECTORY ] _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; _ `
 " a 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; c d
 ? e 
PERMISSION g 	StructNew ()Ljava/util/Map; i j
 ? k _set '(Ljava/lang/String;Ljava/lang/Object;)V m n
 " o CLASS q java.lang.RuntimePermission s _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V u v
 " w TARGET y RUNTIMEPERMISSIONSLIST { _String &(Ljava/lang/Object;)Ljava/lang/String; } ~ coldfusion/runtime/Cast �
 �  1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; Y �
 " � _int (Ljava/lang/Object;)I � �
 � � 	ListGetAt '(Ljava/lang/String;I)Ljava/lang/String; � �
 ? � ACTION �   � _List $(Ljava/lang/Object;)Ljava/util/List; � �
 � � ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z � �
 ? � _double (Ljava/lang/Object;)D � �
 � � _Object (D)Ljava/lang/Object; � �
 � � ListLen (Ljava/lang/String;)I � �
 ? � (I)Ljava/lang/Object; � �
 � � _compare '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 " � _LhsResolve � R
 " � _arraySetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 " � -cfadmin_addruntimePermissionToSecurityContext � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � author � "Mike Nimer (mnimer@macromedia.com) � param � /directory - working security context/directory. � hint � 5adds  RuntimePermissionslist to this security context � version � 1,  January 07, 2002 � return � Returns the permissions array. � 
Parameters � REQUIRED � false � NAME � runtimePermissionslist � ([Ljava/lang/Object;)V  �
 � � webapp � 	directory � getMetadata ()Ljava/lang/Object; this RLcf_otheroptions2ecfm1591365072$funcCFADMIN_ADDRUNTIMEPERMISSIONTOSECURITYCONTEXT; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �   2     � LY|SYXSY^S�    �        � �    � �  �  �    �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:� 6:� 6:� 6:
- �� :-� @� F� H
- �� :--J� LYNSYPS� T� VY-X� \SY-^� \S� b� f� F� H� �-h- �� :� l� p-h� LYrSt� x-h� LYzS- �� :-|� \� �-� �� �� �� x-h� LY�S�� x- �� :-
� �� �-h� \� �W-� �� �c� �� F-� �- �� :-|� \� �� �� �� ��t|���O-J� LYNSYPS� �� VY-X� \SY-^� \S-
� �� �-
� ���    �   �   � � �    � � �   � � �   � � �   � � �   � � �   � � �   � - .   �  �   �  � 	  �  � 
  �  �   � { �   � W �   � ] �  �  � e   } : } L � V � V � U � U � U � U � L � ] � ] � m � m � � � � � � � � � l � l � l � l � l � l � c � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �" �" �" �" �+ �+ �" �" �" �" �  �3 �3 �@ �@ �@ �@ �@ �@ �3 �3 � � �] �] �w �w �� �� �� �� �� �� �] �� �� �� �� �� �     �   #     *� 
�    �        � �    �   �   �     ƻ �Y� VY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY�SY�SY� VY� �Y� VY�SY�SY�SY�S� �SY� �Y� VY�SY�SY�SY�S� �SY� �Y� VY�SY�SY�SY�S� �SS� ޳ ��    �       � � �        ����  -) 
SourceFile //CFIDE/administrator/security/_otheroptions.cfm Jcf_otheroptions2ecfm1591365072$funcCFADMIN_GETALLENABLEDRUNTIMEPERMISSIONS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   PERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   APERMISSIONS  I ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 getVariable  (I)Lcoldfusion/runtime/Variable; 3 4 %coldfusion/runtime/ArgumentCollection 6
 7 5 _setCurrentLineNo (I)V 9 :
 $ ; ArrayNew (I)Ljava/util/List; = > coldfusion/runtime/CFPage @
 A ? set (Ljava/lang/Object;)V C D coldfusion/runtime/Variable F
 G E C :
 G I *coldfusion/runtime/TransientVariableHolder K &(Lcoldfusion/runtime/NeoPageContext;)V  M
 L N REQUEST P java/lang/String R SECURITY T CONTEXTS V _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; X Y
 $ Z java/lang/Object \ WEBAPP ^ _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; ` a
 $ b 	DIRECTORY d _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; f g
 $ h 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; j k
 A l 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; ` n
 $ o C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; f q
 $ r _Map #(Ljava/lang/Object;)Ljava/util/Map; t u coldfusion/runtime/Cast w
 x v CLASS z _resolveAndAutoscalarize 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; | }
 $ ~ java.lang.RuntimePermission � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 $ � _List $(Ljava/lang/Object;)Ljava/util/List; � �
 x � ArrayToList $(Ljava/util/List;)Ljava/lang/String; � �
 A � TARGET � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 x � ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I � �
 A � _boolean (J)Z � �
 x � ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z � �
 A � _double (Ljava/lang/Object;)D � �
 x � _Object (D)Ljava/lang/Object; � �
 x � ArrayLen (Ljava/lang/Object;)I � �
 A � (I)Ljava/lang/Object; � �
 x � '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 $ � 
textnocase � asc � 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z � �
 A � unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable; � � coldfusion/runtime/NeoException �
 � � t0 [Ljava/lang/String; any � � �	  � findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I � �
 � � ex � bind '(Ljava/lang/String;Ljava/lang/Object;)V � �
 L � unbind � 
 L � 'cfadmin_getAllEnabledRuntimePermissions � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � author � "Mike Nimer (mnimer@macromedia.com) � param � /directory - working security context/directory. � hint � Sreturn an array of all RuntimePermissions that are enabled by this security context � version � 1,  January 07, 2002 � return � Returns an array. � 
Parameters � REQUIRED � false � NAME � webapp � ([Ljava/lang/Object;)V  �
 � � 	directory � getMetadata ()Ljava/lang/Object; this LLcf_otheroptions2ecfm1591365072$funcCFADMIN_GETALLENABLEDRUNTIMEPERMISSIONS; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t15 ,Lcoldfusion/runtime/TransientVariableHolder; t16 #Lcoldfusion/runtime/AbortException; t17 Ljava/lang/Exception; __cfcatchThrowable0 Ljava/lang/Throwable; t19 t20 LineNumberTable !coldfusion/runtime/AbortException" java/lang/Exception$ java/lang/Throwable& <clinit> 1       � �    � �         "     � ذ                 !     ԰             	    -     � SY_SYeS�             
   �    +� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:� 8:� 8:
-N� <-� B� H-O� <-� B� H� J� LY-� (� O:
-V� <--Q� SYUSYWS� [� ]Y-_� cSY-e� cS� i� m� H� J� �--
-� p� s� y� SY{S� �� ��� u-_� <-_� <-� p� �� �--
-� p� s� y� SY�S� � �� ��� ��� 2-a� <-� p� �--
-� p� s� y� SY�S� � �W-� p� �c� �� H-� p-Y� <-
� p� �� �� ��t|���2-f� <-� p� ���� �W� M� S:�:� �:� Ÿ ɪ                  �� ϧ �� � :� �:� ҩ-� p��  ��# ��% ��'���'���'    �           �             �    / 0         	    
       !    ^    d                    � !  � n   L B L L N U N U N T N T N T N T N L N \ O e O e O d O d O d O d O \ O l P l P � V � V � V � V � V � V � V � V � V � V � V � V  V � Y � \ � \ � \ � \ � \ � \ � _ � _ � _ � _ � _ � _ � _ � _ _ _ _ _ _ _ � _ � _ � _ � _ � _ � _3 a3 a3 a3 a@ a@ a< a< a3 a3 a3 a � _ � \^ Y^ Y^ Y^ Yg Yg Y^ Y^ Y^ Y^ Y\ Yo Yo Y{ Y{ Y{ Y{ Yo Yo Y � Y� f� f� f� f� f� f� f� f� f� f� f r T n n n n n       #     *� 
�             (     �     �� SY�S� Ż �Y� ]Y�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY�SY�SY� ]Y� �Y� ]Y�SY�SY�SY�S� �SY� �Y� ]Y�SY�SY�SY�S� �SS� �� ر          �        ����  - | 
SourceFile //CFIDE/administrator/security/_otheroptions.cfm Ccf_otheroptions2ecfm1591365072$funcCFADMIN_GETALLRUNTIMEPERMISSIONS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   ! javax/servlet/jsp/JspContext #
 $ " parent Ljavax/servlet/jsp/tagext/Tag; & '	  ( _setCurrentLineNo (I)V * +
  , REQUEST . java/lang/String 0 SECURITYAPI 2 _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; 4 5
  6 getAllRuntimePermissions 8 java/lang/Object : _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; < =
  >  cfadmin_getallRuntimePermissions @ metaData Ljava/lang/Object; B C	  D &coldfusion/runtime/AttributeCollection F name H author J "Mike Nimer (mnimer@macromedia.com) L param N - none P hint R 1return an array of all default RuntimePermissions T version V 1,  January 07, 2002 X return Z Returns an array. \ 
Parameters ^ ([Ljava/lang/Object;)V  `
 G a getMetadata ()Ljava/lang/Object; this ELcf_otheroptions2ecfm1591365072$funcCFADMIN_GETALLRUNTIMEPERMISSIONS; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1       B C     c d  h   "     � E�    g        e f    i j  h   !     A�    g        e f    k l  h   #     � 1�    g        e f    m n  h   �  
   F+� � :+� ,� :	-� � %:-� ):-� ---/� 1Y3S� 79� ;� ?��    g   f 
   F e f     F o p    F q C    F r s    F t u    F v w    F x C    F & '    F  y    F  y 	 z        $  *  *  *  *  *      h   #     *� 
�    g        e f    {   h   ~     `� GY� ;YISYASYKSYMSYOSYQSYSSYUSYWSY	YSY
[SY]SY_SY� ;S� b� E�    g       ` e f        ����  -` 
SourceFile //CFIDE/administrator/security/_otheroptions.cfm cf_otheroptions2ecfm1591365072  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   FORM Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   &CFADMIN_GETREMAININGRUNTIMEPERMISSIONS   	   -CFADMIN_ADDRUNTIMEPERMISSIONTOSECURITYCONTEXT   	    I " " 	  $ CHECKCSRFTOKEN & & 	  ( AERRORMESSAGES * * 	  , L . . 	  0 WEBAPP 2 2 	  4 MAP_ERROR_UPDATE_DS 6 6 	  8 ARPNAMESLIST : : 	  < ARPNAMES > > 	  @ RRP B B 	  D TEMP F F 	  H MAP_ERROR_REMOVE_DS J J 	  L 	DIRECTORY N N 	  P 'CFADMIN_GETALLENABLEDRUNTIMEPERMISSIONS R R 	  T ERPNAMES V V 	  X 2CFADMIN_REMOVERUNTIMEPERMISSIONFROMSECURITYCONTEXT Z Z 	  \ DRPNAMES ^ ^ 	  ` CFCATCH b b 	  d BERRORSEXIST f f 	  h TOKEN j j 	  l L10N_FINISH n n 	  p com.macromedia.SourceModTime  h���, pageContext #Lcoldfusion/runtime/NeoPageContext; u v	  w getOut ()Ljavax/servlet/jsp/JspWriter; y z javax/servlet/jsp/JspContext |
 } { parent Ljavax/servlet/jsp/tagext/Tag;  �	  � Cp1252 � setPageEncoding (Ljava/lang/String;)V � � !coldfusion/runtime/NeoPageContext �
 � � $class$coldfusion$tagext$io$SilentTag Ljava/lang/Class; coldfusion.tagext.io.SilentTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
  � coldfusion/tagext/io/SilentTag � _setCurrentLineNo (I)V � �
  � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 
doStartTag ()I � �
 � � 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
  � 	VARIABLES � java/lang/String � !GLOBALREMAININGRUNTIMEPERMISSIONS � _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
  � &cfadmin_getremainingRuntimePermissions � java/lang/Object � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
  � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
  � _factor0 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object; � �
  � _factor1 � �
  � ADDRUNTIMEPERMISSIONS_SUBMIT � !FORM.ADDRUNTIMEPERMISSIONS_SUBMIT �  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z � �
  � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � DISABLEDRUNTIMEPERMISSIONS � FORM.DISABLEDRUNTIMEPERMISSIONS �  DISABLERUNTIMEPERMISSIONS_SUBMIT � %FORM.DISABLERUNTIMEPERMISSIONS_SUBMIT � ENABLEDRUNTIMEPERMISSIONS � FORM.ENABLEDRUNTIMEPERMISSIONS �   � set (Ljava/lang/Object;)V � � coldfusion/runtime/Variable �
 � � 	CSRFTOKEN � FORM.CSRFTOKEN � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
  � checkCSRFToken � _autoscalarize � �
  � REQUEST � SECTABKEYNAME *coldfusion/runtime/TransientVariableHolder &(Lcoldfusion/runtime/NeoPageContext;)V 
 -cfadmin_addruntimePermissionToSecurityContext unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;
 coldfusion/runtime/NeoException
 t23 [Ljava/lang/String; Any	  findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I
 bind '(Ljava/lang/String;Ljava/lang/Object;)V
 true $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag!  �	 # coldfusion/tagext/io/OutputTag%
& � (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTag)( �	 + "coldfusion/tagext/lang/ImportedTag- l10n/ 
../cftags/1 admin3 setName :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V56
.7 &coldfusion/runtime/AttributeCollection9 id; map_error_update_ds= var? ([Ljava/lang/Object;)V A
:B setAttributecollection (Ljava/util/Map;)VDE  coldfusion/tagext/lang/ModuleTagG
HF
H � 7
					Unable to add selected data source:<br />
					K writeM � java/io/WriterO
PN MESSAGER D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; �T
 U _String &(Ljava/lang/Object;)Ljava/lang/String;WX
 �Y EncodeForHTML &(Ljava/lang/String;)Ljava/lang/String;[\
 ] <br />
					_ DETAILa 
				c _whitespace %(Ljava/io/Writer;Ljava/lang/String;)Vef
 g doAfterBodyi �
Hj _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;lm
 n doEndTagp � #javax/servlet/jsp/tagext/TagSupportr
sq doCatch (Ljava/lang/Throwable;)Vuv
Hw 	doFinallyy 
Hz
&j coldfusion/tagext/QueryLoop}
~q
~w
&z ArrayLen (Ljava/lang/Object;)I��
 � (D)Ljava/lang/Object; ��
 �� _arraySetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V��
 � unbind� 
� 2cfadmin_removeruntimePermissionFromSecurityContext� t24�	 � dump� /WEB-INF/cftags� cfdump� _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;��
 � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z��
 � map_error_remove_ds� ;
					Unable to remove selected data sources:<br />
					� _factor2� �
 � ArrayNew (I)Ljava/util/List;��
 � _Array 2(Ljava/lang/Object;)Lcoldfusion/runtime/FastArray;��
 �� setArray !(Lcoldfusion/runtime/FastArray;)V��
 �� 'cfadmin_getAllEnabledRuntimePermissions� _List $(Ljava/lang/Object;)Ljava/util/List;��
 �� ArrayToList $(Ljava/util/List;)Ljava/lang/String;��
 � (I)Ljava/lang/Object; ��
 �� _compare (Ljava/lang/Object;D)D��
 � _arrayGetAt C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object;��
 � *� '(Ljava/lang/Object;Ljava/lang/String;)D��
 � � �
 �� ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z��
 � _double (Ljava/lang/Object;)D��
 �� '(Ljava/lang/Object;Ljava/lang/Object;)D��
 � ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I��
 � (J)Z ��
 �� allRuntimePermissions� +
	&lt;&lt;ALL RuntimePermissions&gt;&gt;
� _factor3� �
 �
 �j
 �w
 �z 


� 
� 'class$coldfusion$tagext$lang$IncludeTag !coldfusion.tagext.lang.IncludeTag�� �	 � !coldfusion/tagext/lang/IncludeTag� ../include/errors.cfm� setTemplate� �
�� q
<table border="0" cellpadding="0" cellspacing="0">
<tr>
	<td>&nbsp;</td>
	<td nowrap height="25"  bgcolor="#� 	BLUELIGHT  5">&nbsp;&nbsp; <a href="javascript:changeTab('dsn')"> l10n_secdsource Data Sources M</a> &nbsp;&nbsp;</td>
	<td>&nbsp;</td>
	<td nowrap height="25"  bgcolor="# 8">&nbsp;&nbsp; <a href="javascript:changeTab('cftags')">
 l10n_cftags CF Tags =">&nbsp;&nbsp; <a href="javascript:changeTab('cffunctions')"> l10n_cffunctions CF Functions L</a> &nbsp;&nbsp;</td>
	<td>&nbsp;</td>
	<td nowrap height="25" bgcolor="# 7">&nbsp;&nbsp; <a href="javascript:changeTab('files')"> l10n_cfilesdir 
Files/Dirs 8">&nbsp;&nbsp; <a href="javascript:changeTab('ipport')"> ipports  Server/Ports" 	GRAYLIGHT$ 8">&nbsp;&nbsp; <a href="javascript:changeTab('Others')">& Others( |</a> &nbsp;&nbsp;</td>
</tr>
</table>


<table border="0" cellpadding="0" cellspacing="1" width="100%">
<tr bgcolor="#* C" class="cellBlueTopAndBottom">
	<td height="20">&nbsp;&nbsp; <b >, otherspermissions. Other Permissions:0 _factor42 �
 3 
		5 
			7 /*9 (; rootsecuritycntx= Root Security Context? )A 
ESAPIUTILSC _resolveE �
 F encodeForHTMLFilePathH _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;JK
 L
	</b></td>
</tr>
<tr>
	<td align="center">
		<table border="0" cellpadding="0" cellspacing="0">
		<tr><td height="5"></td></tr>
		<tr>
			<td nowrap><font class="label">&nbsp;&nbsp;</font></td>
			<td width="210" nowrap><font class="label">&nbsp;<label for="enabledrps">N l10n_endata_runtimeP Enabled Runtime PermissionsR �</label></font></td>
			<td width="40" nowrap></td>
			<td width="210" nowrap><font class="label">&nbsp;<label for="disabledrps">T l10n_disdata_runtimeV Disabled Runtime PermissionsX'</label></font></td>
			<td nowrap><font class="label">&nbsp;&nbsp;</font></td>
		</tr>
		<tr><td height="5"></td></tr>
		<tr>
			<td></td>
			<td>

				<select name="enabledruntimePermissions" id="enabledrps" size="12" multiple class="label" style="width:20em;">

                    Z 
textnocase\ asc^ 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z`a
 b 
					d 1f (Ljava/lang/String;)D�h
 �i P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable; k
 l 
						<option value="n " >p </option>
					r CFLOOPt checkRequestTimeoutv �
 w _checkCondition (DDD)Zyz
 {

				</select>
			</td>
			<td align="center">
				<input type="Submit" title="Add" name="disableruntimePermissions_submit" value=">>"><br />
				<input type="Submit" title="Remove" name="addruntimePermissions_submit" value="<<"><br />
				<br />
			</td>
			<td>
				} �
				<select name="disabledruntimePermissions" id="disabledrps" size="12" multiple style="width:20em" class="label">


					 

						<option value="� </option>

					� c

				</select>
			</td>
		</tr>
		<tr><td height="10"></td></tr>
		</table>
	</td>
</tr>
� finish� l10n_finish� Finish� -
<tr class="cellBlueTopAndBottom" bgcolor="#� �">
	<td height="30" colspan="3">
		<table border="0" cellpadding="0" cellspacing="0"><tr>
		<td nowrap><font class="label">&nbsp;&nbsp;</font></td>
		<td><input type="Submit" title="� " class="buttn-fix" value="� �" name="finish"></td>
		</tr></table></td>
</tr>
</table>

<br />
<table border="0" cellpadding="0" cellspacing="0" width="80%">
<tr><td>
<font class="sentance">
� step_ds_runtime��
To disable the Runtime Permissions for a ColdFusion page in this directory, select the Runtime Permission from the Enable Runtime Permissions box and move it to the Disabled Runtime Permissions box.
To disable more than one Runtime Permissions for a ColdFusion page, hold down the Control key and click the name of the Runtime Permissions. ColdFusion pages in the directory cannot use Runtime Permissions that are listed in the Disabled Runtime Permissions box.
 <br />
<br />
<b>Please note:</b> By default, all Runtime Permissions are enabled. However, you can choose to enable or disable the permissions listed in the Enabled Runtime Permissions box. � _factor5� �
 � 7
<br />
<br />
<br />
</font>
</td></tr></table>
� IsDebugMode ()Z��
 � 
	<a var="� SECURITY� CONTEXTS� 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;��
 � ">
� _factor6� �
 � Lcoldfusion/runtime/UDFMethod; Pcf_otheroptions2ecfm1591365072$funcCFADMIN_ADDRUNTIMEPERMISSIONTOSECURITYCONTEXT�
� 	�	 � registerUDF 3(Ljava/lang/String;Lcoldfusion/runtime/UDFMethod;)V��
 � Icf_otheroptions2ecfm1591365072$funcCFADMIN_GETREMAININGRUNTIMEPERMISSIONS�
� 	 ��	 � Jcf_otheroptions2ecfm1591365072$funcCFADMIN_GETALLENABLEDRUNTIMEPERMISSIONS�
� 	��	 �  cfadmin_getallRuntimePermissions Ccf_otheroptions2ecfm1591365072$funcCFADMIN_GETALLRUNTIMEPERMISSIONS�
� 	��	 �  CFADMIN_GETALLRUNTIMEPERMISSIONS� Ucf_otheroptions2ecfm1591365072$funcCFADMIN_REMOVERUNTIMEPERMISSIONFROMSECURITYCONTEXT�
� 	��	 � metaData Ljava/lang/Object;��	 � 	Functions�	��	��	��	��	�� 
Properties� getMetadata ()Ljava/lang/Object; this  Lcf_otheroptions2ecfm1591365072; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; registerUDFs __factorParent out Ljavax/servlet/jsp/JspWriter; value silent6  Lcoldfusion/tagext/io/SilentTag; mode6 t6 t7 t8 Ljava/lang/Throwable; t9 t10 t11 t12 t13 output20  Lcoldfusion/tagext/io/OutputTag; mode20 t16 t17 t18 t19 t20 t21 LineNumberTable java/lang/Throwable runPage include7 #Lcoldfusion/tagext/lang/IncludeTag; module8 $Lcoldfusion/tagext/lang/ImportedTag; mode8 module9 mode9 t15 module10 mode10 t25 t26 t27 t28 module11 mode11 t31 t32 t33 t34 t35 t36 module12 mode12 t39 t40 t41 t42 t43 t44 module13 mode13 t47 t48 t49 t50 t51 t52 module14 mode14 t55 t56 t57 t58 t59 t60 module15 mode15 module16 mode16 t14 module17 mode17 t22 D t30 t37 module18 mode18 t45 t46 module19 mode19 t53 t54 t4 ,Lcoldfusion/runtime/TransientVariableHolder; t5 #Lcoldfusion/runtime/AbortException; Ljava/lang/Exception; __cfcatchThrowable1 output1 mode1 module0 mode0 __cfcatchThrowable2 module2 t29 output4 mode4 module3 mode3 t38 !coldfusion/runtime/AbortExceptionY java/lang/Exception[ <clinit> module5 mode5 1     #                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     � �        �   ( �   �   � �   �    ��   ��   ��   ��   ��    �� �   "     �԰   �       ��      �  M    *+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q�   �       ��    ��   ��  �  �   M     /*����*����*S�ö�*˲ɶ�*[�ж��   �       /��      �   #     *� 
�   �       ��   � � �  �    �*� �+� �� �:*� �� �� �Y6� ]*,� �M*,��� :� 6� n�*,��� :� � W����ͨ � :� �:	*,�oM�	�t� :
� #
�� � #:�� � :� �:���*,�h*�$+� ��&:*�� �� ��'Y6� �*,�4� :� ��*,��� :� ��,��Q*�� �*��� M,��Q,** � �Y�SY�S�G� �Y**� 5� �SY**� Q� �S���Z�Q,��Q*,�h�|��l�� :� #�� � #:��� � :� �:���*�  & A l G X l ^ i l l q l  A � G X � ^ � � � � �  A � G X � ^ � � � � � � � � � � � � �� �	������ � �� �	������������ �   �   ���    �� �   ���   ���   ���   �� "   ���   ���   ���   ��� 	  ��� 
  ���   ���   ���   ���   �� "   ���   ���   ���   ���   � �   ��    F       ��-�-�J�J�U�U�,�,�,�,�+�� ��  � � �   >     *�   �   *    ��     � �    ��    ��   � � �   >     *�   �   *    ��     � �    ��    ��  � �   l     $*� x� ~L*� �N*� x�� �*-+��� ��   �   *    $��     $��    $��    $  �        2 � �  �  =  m*,�h*��+� ���:*�� ����� ���� �,��Q,* � �YS� ��Z�Q,�Q*�,+� ��.:*�� �024�8�:Y� �Y<SYS�C�I� ��JY6� 6*,� �M,�Q�k���� � :� �:*,�oM��t� :	� #	�� � #:

�x� � :� �:�{�,	�Q,* � �YS� ��Z�Q,�Q*�,	+� ��.:*�� �024�8�:Y� �Y<SYS�C�I� ��JY6� 6*,� �M,�Q�k���� � :� �:*,�oM��t� :� #�� � #:�x� � :� �:�{�,	�Q,* � �YS� ��Z�Q,�Q*�,
+� ��.:*�� �024�8�:Y� �Y<SYS�C�I� ��JY6� 6*,� �M,�Q�k���� � :� �:*,�oM��t� :� #�� � #:�x� � :� �:�{�,�Q,* � �YS� ��Z�Q,�Q*�,+� ��.:*�� �024�8�:Y� �Y<SYS�C�I� ��JY6� 6*,� �M,�Q�k���� � :� �: *,�oM� �t� :!� #!�� � #:""�x� � :#� #�:$�{�$,	�Q,* � �YS� ��Z�Q,�Q*�,+� ��.:%*�� �%024�8%�:Y� �Y<SY!S�C�I%� �%�JY6&� 6*%&,� �M,#�Q%�k���� � :'� '�:(*&,�oM�(%�t� :)� #)�� � #:*%*�x� � :+� +�:,%�{�,,	�Q,* � �Y%S� ��Z�Q,'�Q*�,+� ��.:-*�� �-024�8-�:Y� �Y<SY)S�C�I-� �-�JY6.� 6*-.,� �M,)�Q-�k���� � :/� /�:0*.,�oM�0-�t� :1� #1�� � #:2-2�x� � :3� 3�:4-�{�4,+�Q,* � �Y%S� ��Z�Q,-�Q*�,+� ��.:5*�� �5024�85�:Y� �Y<SY/S�C�I5� �5�JY66� 6*56,� �M,1�Q5�k���� � :7� 7�:8*6,�oM�85�t� :9� #9�� � #::5:�x� � :;� ;�:<5�{�<*� 8 � � � � � � � � � � � � � � � � �������������������������t�����i�����i�����������Wsvv{vL�����L�����������:VYY^Y/y���/y���������9<<A<\hbeh\wbewhtww|w $�?KEHK�?ZEHZKWZZ_Z �  d =  m��    m� �   m��   m��   m   m	   m
 "   m��   m��   m�� 	  m�� 
  m��   m��   m	   m "   m�   m��   m��   m��   m��   m �   m	   m "   m�   m��   m�   m�   m�   m�   m	   m "   m�   m�    m� !  m� "  m� #  m� $  m	 %  m " &  m� '  m� (  m � )  m!� *  m"� +  m#� ,  m$	 -  m% " .  m&� /  m'� 0  m(� 1  m)� 2  m*� 3  m+� 4  m,	 5  m- " 6  m.� 7  m/� 8  m0� 9  m1� :  m2� ;  m3� <   � ;  �  � � >� >� >� >� =� �� �� \�!�!�!�!� �v�v�?������Y�Y�"�����������<�<���������������������������������������������� � � �  � 	 :  m*,6�h**� Q� ����� *,6�h�)*,8�h**� Q� �:���� �,<�Q*�,+� ��.:*�� �024�8�:Y� �Y<SY>S�C�I� ��JY6� 6*,� �M,@�Q�k���� � :� �:*,�oM��t� :� #�� � #:		�x� � :
� 
�:�{�,B�Q� 8,*�� �** � �YDS�GI� �Y**� Q� �S�M�Z�Q*,6�h,O�Q*�,+� ��.:*�� �024�8�:Y� �Y<SYQS�C�I� ��JY6� 6*,� �M,S�Q�k���� � :� �:*,�oM��t� :� #�� � #:�x� � :� �:�{�,U�Q*�,+� ��.:*�� �024�8�:Y� �Y<SYWS�C�I� ��JY6� 6*,� �M,Y�Q�k���� � :� �:*,�oM��t� :� #�� � #:�x� � :� �:�{�,[�Q*� I*Ƕ �**� Y� ���]_�c� ٶ �*,e�h9*ȶ �**� Y� ����9g�j9  ��N*#�m:""-� � h,o�Q,**� Y**� %� ��ʸZ�Q,q�Q,*ɶ �**� Y**� %� ��ʸZ�^�Q,s�Q c\9 ��N"-� �u�x �|���,~�Q*� I*Զ �**� a� ���]_�c� ٶ �,��Q9#*ض �**� a� ����9%g�j9''��N*#�m:))-� � h,��Q,**� a**� %� ��ʸZ�Q,q�Q,*ڶ �**� a**� %� ��ʸZ�^�Q,��Q'#c\9'��N)-� �u�x#'%�|���,��Q*�,+� ��.:**� �*024�8*�:Y� �Y<SY�SY@SY�S�C�I*� �*�JY6+� 6**+,� �M,��Q*�k���� � :,� ,�:-*+,�oM�-*�t� :.� #.�� � #:/*/�x� � :0� 0�:1*�{�1,��Q,* � �YS� ��Z�Q,��Q,**� q� ��Z�Q,��Q,**� q� ��Z�Q,��Q*�,+� ��.:2*� �2024�82�:Y� �Y<SY�S�C�I2� �2�JY63� 6*23,� �M,��Q2�k���� � :4� 4�:5*3,�oM�52�t� :6� #6�� � #:727�x� � :8� 8�:92�{�9*� ( � � � � � � � � � � � � � � � � � � � � � � � ������������������������h�����]�����]�������������0<69<�0K69K<HKKPK $�?KEHK�?ZEHZKWZZ_Z �  
 4  m��    m� �   m��   m��   m4	   m5 "   m��   m��   m��   m�� 	  m�� 
  m��   m6	   m7 "   m8�   m�   m��   m��   m��   m��   m9	   m: "   m;�   m�   m��   m�   m�   m�   m<   m=<   m<    m  "  m< #  m>< %  m< '  m   )  m?	 *  m@ " +  m#� ,  mA� -  mB� .  m&� /  m'� 0  m(� 1  mC	 2  mD " 3  m+� 4  mE� 5  mF� 6  m.� 7  m/� 8  m0� 9   � � � � � -� -� 5� 5� ~� ~� G�1�1������� -� %� �����R�M�M��������������������������������������L�L�G�G�G�G�F�q�q�l�l�l�l�l�l�l�l�d������������������������������������������������(�(�#�#�#�#�"�M�M�H�H�H�H�H�H�H�H�@���������������d�d�d�d�c��������������������������� � � �    /  �*�� �Y�S*� �**� � ��*� �� �� �*+,� �� �*+,� �� �**� �϶ Ӹ �Y� ݚ W**� �� Ӹ �Y� ݚ W**� �� Ӹ �Y� ݚ W**� �� Ӹ ٸ ݙ j*� m� �**� ��� ә *� m*� �Y�S� �� �*� �**� )� ��*� �Y**� m� �SY* � �YS� �S� �W**� �϶ Ӹ �Y� ݙ W**� �� Ӹ ٸ ݙs�Y*� x�:*� I*� �**� !� �	*� �Y*� �Y�S� �SY**� 5� �SY**� Q� �S� �� ��:�:�:���   �           c�*� i� �*�$+� ��&:*$� �� ��'Y6	�/*�,� ��.:
*%� �
024�8
�:Y� �Y<SY>SY@SY>S�C�I
� �
�JY6� �*
,� �M,L�Q,*'� �**� e� �YSS�V�Z�^�Q,`�Q,*(� �**� e� �YbS�V�Z�^�Q*,d�h
�k���� � :� �:*,�oM�
�t� :� )� i� ��� � #:
�x� � :� �:
�{��|����� :� &� o�� � #:��� � :� �:���**� -� �Y*,� �**� -� ����c��S**� 9� ���� �� � :� �:���**� �� Ӹ �Y� ݙ W**� �� Ӹ ٸ ݙ޻Y*� x�:*� I*@� �**� ]� ��*� �Y*� �Y�S� �SY**� 5� �SY**� Q� �S� �� �|��:�:�:����   O           c�*�,+� ��.:*C� ����8**� e� �:�@��W�:Y� �Y@SYS�C�I� ���� :���*� i� �*�$+� ��&:*E� �� ��'Y6 �/*�,� ��.:!*F� �!024�8!�:Y� �Y<SY�SY@SY�S�C�I!� �!�JY6"� �*!",� �M,��Q,*H� �**� e� �YSS�V�Z�^�Q,`�Q,*I� �**� e� �YbS�V�Z�^�Q*,d�h!�k���� � :#� #�:$*",�oM�$!�t� :%� )� i� �%�� � #:&!&�x� � :'� '�:(!�{�(�|����� :)� &� o)�� � #:**��� � :+� +�:,���,**� -� �Y*M� �**� -� ����c��S**� M� ���� �� � :-� -�:.���.*� /G�����<�����<������������0�$0*-0��?�$?*-?0<??D?9��Z9��\9������$�*�����N�����C�����C���� ��7�+7147��F�+F14F7CFFKF�!$Z�!)\�!�$������+�1����� �  � /  ���    �� �   ���   ���   �GH   �IJ   ��K   �L�   �M�   �N " 	  �O	 
  �P "   ���   ���   �8�   ��   ���   ���   ���   ���   � �   ��   �;�   ��   ��H   �J   �K   �Q�   �R	   �S�   �=�   �T�   �U "    �V	 !  �W " "  �� #  �� $  �>� %  �X� &  �� '  �� (  � � )  �!� *  �"� +  �#� ,  �A� -  �B� .  r                   '  @ @ @ @ D D F F ? ? ? ? W W W W [ [ ] ] V V V V ? ? ? ? n n n n r r t t m m m m ? ? ? ? � � � � � � � � � � � � ? ? � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � ? ?      DDVVhhssDDDD99�#�#�#�#�#�# % %,%,%`'`'`'`'`'`'`'`'X'�(�(�(�(�(�(�(�(�(�%�$b,b,b,b,b,b,n,n,b,b,t,t,t,t,t,t,P,P,, �8�8�8�8�8�8�8�8�8�8�8�8�8�8�8�8�8�8�8�8�8�8�8�8�8�8�@�@�@�@@@@@�@�@�@�@�@�@wCwCwCwCUC�D�D�D�D�D�D'F'F3F3FgHgHgHgHgHgHgHgH_H�I�I�I�I�I�I�I�I�I�F�EiMiMiMiMiMiMuMuMiMiM{M{M{M{M{M{MWMWM�>�8 ]  �   	    ��� �� �� �YS�"� ��$*� ��,� �YS���� �����Y������Y������Y���û�Y�ǳɻ�Y�γл:Y� �Y�SY� �Y��SY��SY��SY��SY��SSY�SY� �S�C�Ա   �       ���     * 
 � } � } � * � * � L � L � � � � �  �  � � �  ( 	   �*� a*`� �*������*� A*c� �**� U� ��*� �Y**� 5� �SY**� Q� �S� �� �*� Y*e� �*������*� =*g� �**� A� ������ �*� E*�� �Y�S� �� �*m� �**� A� ���������~�� �Y� ݙ W**� A�¶�̸��~�� ٸ ݙ y*� 1�ѧ @*s� �**� Y� ���**� E**� 1� ��ʸ�W*� 1**� 1� ���c��� �**� 1� �*p� �**� E� ����¸��t|����� �*� 1�ѧ �*~� �**� =� ��Z**� E**� 1� ��ʸZ����� 3*�� �**� Y� ���**� E**� 1� ��ʸ�W� )*�� �**� a� ���**� E**� 1� ��ʸ�W*� 1**� 1� ���c��� �**� 1� �*{� �**� E� ����¸��t|���J*�,+� ��.:*�� �024�8�:Y� �Y<SY�SY@SY�S�C�I� ��JY6� 6*,� �M,�Q�k���� � :� �:*,�oM��t� :� #�� � #:		�x� � :
� 
�:�{�*� �����t�����t����������� �   z   ���    �� �   ���   ���   �^	   �_ "   ���   ���   ���   ��� 	  ��� 
  ���   j � ` ` ` ` ` `  ` !c !c 3c 3c >c >c !c !c !c !c c Ye Ye Xe Xe Xe Xe Me ng ng ng ng ng ng ng ng cg �i �i �i �i i �m �m �m �m �m �m �m �m �m �m �m �m �m �m �m �m �m �m �m �m �p �s �s �s �sss �s �s �s �s �spppp!p!pppppp)p)p8p8p8p8p)p)p �pW{i~i~i~i~y~y~t~t~t~t~i~i~��������������������������������������������i~�{�{�{�{�{�{�{�{�{�{�{�{�{{{{{�{�{W{ �m  \X�X�d�d�"�       r    s����  -a 
SourceFile //CFIDE/administrator/security/_otheroptions.cfm Ucf_otheroptions2ecfm1591365072$funcCFADMIN_REMOVERUNTIMEPERMISSIONFROMSECURITYCONTEXT  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   PERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMSARR  ALLRUNTIMEPERMISSIONS ! 	LOOPINDEX # I % J ' REMRUNTIMEPERMISSIONS ) REMRUNTIMEPERMISSIONSLIST + K - VALUE / UPDATEDPERMSARR 1 M 3 coldfusion/runtime/CfJspPage 5 pageContext #Lcoldfusion/runtime/NeoPageContext; 7 8	 6 9 getOut ()Ljavax/servlet/jsp/JspWriter; ; < javax/servlet/jsp/JspContext >
 ? = parent Ljavax/servlet/jsp/tagext/Tag; A B	 6 C getVariable  (I)Lcoldfusion/runtime/Variable; E F %coldfusion/runtime/ArgumentCollection H
 I G _setCurrentLineNo (I)V K L
 6 M ArrayNew (I)Ljava/util/List; O P coldfusion/runtime/CFPage R
 S Q set (Ljava/lang/Object;)V U V coldfusion/runtime/Variable X
 Y W  CFADMIN_GETALLRUNTIMEPERMISSIONS [ _get &(Ljava/lang/String;)Ljava/lang/Object; ] ^
 6 _  cfadmin_getallRuntimePermissions a java/lang/Object c 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; e f
 6 g 	VARIABLES i java/lang/String k !GLOBALREMAININGRUNTIMEPERMISSIONS m _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; o p
 6 q _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; s t
 6 u _List $(Ljava/lang/Object;)Ljava/util/List; w x coldfusion/runtime/Cast z
 { y ArrayToList $(Ljava/util/List;)Ljava/lang/String; } ~
 S  U L
 Y � REQUEST � SECURITY � CONTEXTS � _resolve � p
 6 � WEBAPP � s ^
 6 � 	DIRECTORY � _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 6 � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 S � RUNTIMEPERMISSIONSLIST � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 { � ListLen (Ljava/lang/String;)I � �
 S � _boolean (J)Z � �
 { � SET � java � java.util.HashSet � CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; � �
 S � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 6 � addAll � ListToArray $(Ljava/lang/String;)Ljava/util/List; � �
 S � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 6 � C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; � �
 6 � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 { � CLASS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; o �
 6 � java.lang.RuntimePermission � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 6 � _Object (Z)Ljava/lang/Object; � �
 { � (Ljava/lang/Object;)Z � �
 { � TARGET � * � _int (Ljava/lang/Object;)I � �
 { � ArrayDeleteAt (Ljava/util/List;I)Z � �
 S � FLAG � contains � (Ljava/lang/Object;D)D � �
 6 � ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z � �
 S � _double (Ljava/lang/Object;)D � �
 { � (D)Ljava/lang/Object; � �
 { � ArrayLen � �
 S � (I)Ljava/lang/Object; � �
 { � '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 6 � 	removeAll  toArray 
PERMISSION 	StructNew ()Ljava/util/Map;
 S _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V

 6 ACTION   _LhsResolve p
 6 _arraySetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V
 6 2cfadmin_removeruntimePermissionFromSecurityContext metaData Ljava/lang/Object;	  &coldfusion/runtime/AttributeCollection name! author# "Mike Nimer (mnimer@macromedia.com)% param' /directory - working security context/directory.) hint+ 8remove RuntimePermissionslist from this security context- version/ 1,  January 07, 20021 return3 Returns the permissions array.5 
Parameters7 REQUIRED9 false; NAME= runtimePermissionslist? ([Ljava/lang/Object;)V A
 B webappD 	directoryF getMetadata ()Ljava/lang/Object; this WLcf_otheroptions2ecfm1591365072$funcCFADMIN_REMOVERUNTIMEPERMISSIONFROMSECURITYCONTEXT; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1          HI M   "     ��   L       JK   NO M   "     �   L       JK   PQ M   2     � lY�SY�SY�S�   L       JK   RS M  �    .+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :+.� :+0� :+2� :+4� :-� :� @:-� D:� J:� J:� J:
- �� N-� T� Z- �� N-\� `b-� d� h� Z-j� lYnS� r� Z- �� N-� v� |� �� Z� �� �� �� �� �� �- �� N-� T� Z
- �� N--�� lY�SY�S� �� dY-�� �SY-�� �S� �� �� Z- �� N-�� �� �� ��� ��t-�- �� N-��� �� �- �� N--�� `�� dY- �� N-�� �� �� �S� �W� ��=--
-� v� ¸ �� lY�S� �͸ ��~�� �Y� ؙ .W--
-� v� ¸ �� lY�S� �ܸ ��~�� ո ؙ *- Ŷ N--
� v� |-� v� � �W� �� �-�--
-� v� ¸ �� lY�S� �͸ ��~�� �Y� ؙ :W- ̶ N--�� `�� dY--
-� v� ¸ �� lY�S� �S� �� �-� ��� ��� #- ж N-� v� |-
-� v� ¸ �W-� v� �c� �� Z-� v- �� N-
� v� �� �� ��t|����-� v�� ����-�- ܶ N-��� �� �- ݶ N--�� `�� dY-� vS� �W- ޶ N--�� `� dY- ޶ N-�� �� �� �S� �W- � N--�� `� d� �� Z� �� 6- � N-� v� |--� v� ¸ �W-� v� �c� �� Z-� v- � N-� v� �� �� ��t|����� �� �-- � N�	� �-� lY�SͶ-� lY�S--� v� ¶-� lYS�- � N-
� v� |-� �� �W-� v� �c� �� Z-� v- � N-� v� �� �� ��t|���[� -� v�� ��� 
-� v� Z-�� lY�SY�S�� dY-�� �SY-�� �S-
� v�-
� v��   L   �   .JK    .TU   .V   .WX   .YZ   .[\   .]   . A B   . ^   . ^ 	  . ^ 
  . ^   . !^   . #^   . %^   . '^   . )^   . +^   . -^   . /^   . 1^   . 3^   . �^   . �^   . �^ _  ^W   � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �# �# �" �" �" �" � �4 �4 �N �N �W �W �3 �3 �3 �3 �3 �3 �* �n �n �n �n �n �n �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � �� �� � � �� �� �� �� �� �� �7 �7 �7 �7 �@ �@ �@ �@ �6 �6 �6 �M �S �� �] �] �Y �Y �u �u �Y �Y �Y �Y �� �� �� �� �� �� �� �� �� �� �Y �Y �Y �Y �V �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � � � � � �� �. �. �4 �4 �I �I �K �K �H �H �H �H �> �[ �[ �i �i �Z �Z �Z �| �| �� �� �� �� �� �� �{ �{ �{ �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �	 �	 �	 �	 �� �� �� �# �7 �7 �7 �7 �, �J �J �J �J �= �_ �_ �\ �\ �\ �\ �O �y �y �y �y �k �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �# �� �� �� �� �� �� �� �� �� �� �� �. �n �� �� � � � � � � � � �� �%%%%%    M   #     *� 
�   L       JK   `  M   �     ߻ Y� dY"SYSY$SY&SY(SY*SY,SY.SY0SY	2SY
4SY6SY8SY� dY� Y� dY:SY<SY>SY@S�CSY� Y� dY:SY<SY>SYES�CSY� Y� dY:SY<SY>SYGS�CSS�C��   L       �JK        ����  - � 
SourceFile //CFIDE/administrator/security/_otheroptions.cfm Icf_otheroptions2ecfm1591365072$funcCFADMIN_GETREMAININGRUNTIMEPERMISSIONS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   REMAININGRUNTIMEPERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - _setCurrentLineNo (I)V / 0
   1 ArrayNew (I)Ljava/util/List; 3 4 coldfusion/runtime/CFPage 6
 7 5 set (Ljava/lang/Object;)V 9 : coldfusion/runtime/Variable <
 = ; _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; ? @
   A _List $(Ljava/lang/Object;)Ljava/util/List; C D coldfusion/runtime/Cast F
 G E createClassLoader I ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z K L
 7 M exitVM O loadLibrary.* Q setSecurityManager S 
setFactory U setIO W modifyThreadGroup Y 
textnocase [ asc ] 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z _ `
 7 a java/lang/String c &cfadmin_getremainingRuntimePermissions e metaData Ljava/lang/Object; g h	  i &coldfusion/runtime/AttributeCollection k java/lang/Object m name o author q "Mike Nimer (mnimer@macromedia.com) s param u - none w hint y 2return an array of all Remainig RuntimePermissions { version } 1,  January 07, 2002  return � Returns an array. � 
Parameters � ([Ljava/lang/Object;)V  �
 l � getMetadata ()Ljava/lang/Object; this KLcf_otheroptions2ecfm1591365072$funcCFADMIN_GETREMAININGRUNTIMEPERMISSIONS; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1       g h     � �  �   "     � j�    �        � �    � �  �   !     f�    �        � �    � �  �   #     � d�    �        � �    � �  �  �     �+� � :+� ,� :	+� :
-� $� *:-� .:
-,� 2-� 8� >-.� 2-
� B� HJ� NW-/� 2-
� B� HP� NW-0� 2-
� B� HR� NW-1� 2-
� B� HT� NW-2� 2-
� B� HV� NW-3� 2-
� B� HX� NW-4� 2-
� B� HZ� NW-8� 2-
� B� H\^� bW-
� B��    �   p    � � �     � � �    � � h    � � �    � � �    � � �    � � h    � + ,    �  �    �  � 	   �  � 
 �  f Y   * , * , , 5 , 5 , 4 , 4 , 4 , 4 , , , B . B . B . B . K . K . B . B . B . W / W / W / W / ` / ` / W / W / W / l 0 l 0 l 0 l 0 u 0 u 0 l 0 l 0 l 0 � 1 � 1 � 1 � 1 � 1 � 1 � 1 � 1 � 1 � 2 � 2 � 2 � 2 � 2 � 2 � 2 � 2 � 2 � 3 � 3 � 3 � 3 � 3 � 3 � 3 � 3 � 3 � 4 � 4 � 4 � 4 � 4 � 4 � 4 � 4 � 4 � 8 � 8 � 8 � 8 � 8 � 8 � 8 � 8 � 8 � 8 � 8 � : � : � : � : � :     �   #     *� 
�    �        � �    �   �   ~     `� lY� nYpSYfSYrSYtSYvSYxSYzSY|SY~SY	�SY
�SY�SY�SY� nS� �� j�    �       ` � �        