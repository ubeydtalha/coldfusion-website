����  -A 
SourceFile /CFIDE/adminapi/security.cfc 6cfsecurity2ecfc637258255$funcGETDEFAULTSECURITYSANDBOX  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ALLRUNTIMEPERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   ACCESSMANAGER  K ! WEBAPP # coldfusion/runtime/CfJspPage % pageContext #Lcoldfusion/runtime/NeoPageContext; ' (	 & ) getOut ()Ljavax/servlet/jsp/JspWriter; + , javax/servlet/jsp/JspContext .
 / - parent Ljavax/servlet/jsp/tagext/Tag; 1 2	 & 3 	DIRECTORY 5 getVariable  (I)Lcoldfusion/runtime/Variable; 7 8 %coldfusion/runtime/ArgumentCollection :
 ; 9 _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; = >
  ? 

         A _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V C D
 & E _setCurrentLineNo (I)V G H
 & I 	component K CFIDE.adminapi.accessmanager M CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; O P coldfusion/runtime/CFPage R
 S Q set (Ljava/lang/Object;)V U V coldfusion/runtime/Variable X
 Y W 
		 [ / ] _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; _ `
 & a checkAdminRoles c java/lang/Object e coldfusion.sandboxsecurity g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 & k PERMISSIONS m ArrayNew (I)Ljava/util/List; o p
 S q _set '(Ljava/lang/String;Ljava/lang/Object;)V s t
 & u INTERNAL w ISINTERNALSANDBOX y &(Ljava/lang/String;)Ljava/lang/Object; _ {
 & | isInternalSandBox ~ _autoscalarize � {
 & � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 & � 
PERMISSION � 	StructNew ()Ljava/util/Map; � �
 S � java/lang/String � CLASS � java.io.SerializablePermission � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 & � TARGET � * � ACTION �   � _List $(Ljava/lang/Object;)Ljava/util/List; � � coldfusion/runtime/Cast �
 � � ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z � �
 S � java.util.PropertyPermission � 
read,write � java.net.NetPermission � java.sql.SQLPermission �  java.security.SecurityPermission � java.net.SocketPermission � connect,resolve � _factor1 j(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;Lcoldfusion/runtime/CFPage;)Ljava/lang/Object; � �
  � _boolean (Ljava/lang/Object;)Z � �
 � � java.lang.RuntimePermission � #coldfusion.sql.DataSourcePermission � java.io.FilePermission � <<ALL FILES>> � read,write,execute,delete � coldfusion.vfs.VFilePermission � ram:///- � ram:/// � %coldfusion.runtime.FunctionPermission � _factor0 � �
  � *-createobject(java) � GETALLRUNTIMEPERMISSIONS � getAllRuntimePermissions � U H
 Y � � `
 & � _arrayGetAt C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; � �
 & � _double (Ljava/lang/Object;)D � �
 � � _Object (D)Ljava/lang/Object; � �
 � � ArrayLen (Ljava/lang/Object;)I � �
 S � (I)Ljava/lang/Object; � �
 � � _compare '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 & � #java.lang.reflect.ReflectPermission � &coldfusion.tagext.GenericTagPermission � 'coldfusion.tagext.lang.ModulePermission � 
	 � getDefaultSecuritySandbox � metaData Ljava/lang/Object; � 	  false &coldfusion/runtime/AttributeCollection name access	 private output hint 1Create the default structure for a blank sandbox. 
Parameters REQUIRED true HINT 'Specifies the directory of the sandbox. NAME 	directory ([Ljava/lang/Object;)V !
" getMetadata ()Ljava/lang/Object; this 8Lcfsecurity2ecfc637258255$funcGETDEFAULTSECURITYSANDBOX; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; __factorParent out Ljavax/servlet/jsp/JspWriter; 
parentPage Lcoldfusion/runtime/CFPage; value LineNumberTable runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance __arguments 'Lcoldfusion/runtime/ArgumentCollection; Lcoldfusion/runtime/Variable; <clinit> 	getOutput 1       �    
 $% )   "     ��   (       &'   *+ )   !     ��   (       &'   ,- )         �   (       &'   ./ )   (     
� �Y6S�   (       
&'    � � )  �    -�-� J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-� J-n� �� �-�� �� �W-�-� J� �� v-�� �Y�S¶ �-�� �Y�S�� �-�� �Y�S�� �-� J-n� �� �-�� �� �W-�-� J� �� v-�� �Y�SĶ �-�� �Y�Sƶ �-�� �Y�Sȶ �-� J-n� �� �-�� �� �W-�-�� J� �� v-�� �Y�Sʶ �-�� �Y�S̶ �-�� �Y�Sȶ �-�� J-n� �� �-�� �� �W-�-�� J� �� v-�� �Y�Sʶ �-�� �Y�Sζ �-�� �Y�Sȶ �- � J-n� �� �-�� �� �W-�-� J� �� v-�� �Y�Sж �-�� �Y�S�� �-�� �Y�S�� �-�   (   4   &'    0 2   12   34   5  6  � � 
� 
� 
� 
�  � � � � � � -� -� -� -� !� >� >� >� >� 2� J� J� J� J� S� S� J� J� J� g� g� g� g� ]� y� y� y� y� m� �� �� �� �� ~� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �����������!�!�!�!��3�3�3�3�'�D�D�D�D�8�U�U�U�U�I�a�a�a�a�j�j�a�a�a�~�~�~�~�t�������������������������������� � � � � � � � � ���������������  � � )  �    -�-�� J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-�� J-n� �� �-�� �� �W-�-�� J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-ö J-n� �� �-�� �� �W-�-Ŷ J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-ɶ J-n� �� �-�� �� �W-�-˶ J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-϶ J-n� �� �-�� �� �W-�-Ѷ J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-ն J-n� �� �-�� �� �W-�-׶ J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-�   (   4   &'    0 2   12   34   5  6  � � 
� 
� 
� 
�  � � � � � � -� -� -� -� !� >� >� >� >� 2� J� J� J� J� S� S� J� J� J� g� g� g� g� ]� y� y� y� y� m� �� �� �� �� ~� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �����������!�!�!�!��3�3�3�3�'�D�D�D�D�8�U�U�U�U�I�a�a�a�a�j�j�a�a�a�~�~�~�~�t������������������������������������������������������������������������������������ 78 )   
   �+� � :+� ,� :	+� :
+ � :+"� :+$� :-� *� 0:-� 4:*6� <� @:-B� F-�� J-LN� T� Z-\� F^� Z-�� J--� bd� fYhS� lW-n-�� J-� r� v-x-�� J-z� }-� fY-6� �S� �� v*-� �� �-۶ J-n� �� �-�� �� �W-x� �� �� /*-� �� �-� J-n� �� �-�� �� �W�&-�-� J� �� v-�� �Y�Sж �-�� �Y�Sն �-�� �Y�S�� �-� J-n� �� �-�� �� �W
-� J-׶ }�-� f� �� Z� ۧ }-�-� J� �� v-�� �Y�S�� �-�� �Y�S-
-� ݶ � �-�� �Y�S�� �-� J-n� �� �-�� �� �W-� ݸ �c� � Z-� �-� J-
� ݸ �� � ��t|���b-�-� J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-#� J-n� �� �-�� �� �W-�-&� J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-*� J-n� �� �-�� �� �W-�--� J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-1� J-n� �� �-�� �� �W-n� ��-�� F�   (   �   �&'    �9:   �;    �34   �<=   �12   �5    � 1 2   � >   � > 	  � > 
  � >   � !>   � #>   � 5> 6  � �  � \� f� f� h� h� e� e� e� e� \� \� x� z� z� z� z� x� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��((????5QQQQEbbbbVssssg����������������������������������    ))    11>>>>11� ��bbbbXt t t t h �!�!�!�!y!�"�"�"�"�"�#�#�#�#�#�#�#�#�#�&�&�&�&�&�'�'�'�'�'�(�(�(�(�(�)�)�)�)�)�*�*�*�***�*�*�*-----........".?/?/?/?/3/P0P0P0P0D0\1\1\1\1e1e1\1\1\1o3o3o3o3o3 x�    )   #     *� 
�   (       &'   ?  )   �     ��Y
� fYSY�SY
SYSYSYSYSYSYSY	� fY�Y� fYSYSYSYSYSY S�#SS�#��   (       �&'   @+ )   "     �   (       &'        ����  -6 
SourceFile /CFIDE/adminapi/security.cfc 5cfsecurity2ecfc637258255$funcDELETEALLOWEDIPADDRESSES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  IPLIST ! IPADDR # coldfusion/runtime/CfJspPage % pageContext #Lcoldfusion/runtime/NeoPageContext; ' (	 & ) getOut ()Ljavax/servlet/jsp/JspWriter; + , javax/servlet/jsp/JspContext .
 / - parent Ljavax/servlet/jsp/tagext/Tag; 1 2	 & 3 DEBUGIP 5 string 7 getVariable  (I)Lcoldfusion/runtime/Variable; 9 : %coldfusion/runtime/ArgumentCollection <
 = ; 3coldfusion/tagext/validation/CFTypeValidatorFactory ? STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; A B	 @ C _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G 
		 I _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V K L
 & M _setCurrentLineNo (I)V O P
 & Q ArrayNew (I)Ljava/util/List; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [   _ 	
     		 a 	component c CFIDE.adminapi.accessmanager e CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; g h
 W i _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; k l
 & m checkRootAdminUser o java/lang/Object q _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; s t
 & u java w  coldfusion.server.ServiceFactory y getSecurityService { 
			 } _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object;  �
 & � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � ListToArray $(Ljava/lang/String;)Ljava/util/List; � �
 W � I � _Object (I)Ljava/lang/Object; � �
 � � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 & � _arrayGetAt C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; � �
 & � Trim &(Ljava/lang/String;)Ljava/lang/String; � �
 W � POS � getAllowedIPList �  l
 & � ListFind '(Ljava/lang/String;Ljava/lang/String;)I � �
 W � _boolean (Ljava/lang/Object;)Z � �
 � � setAllowedIPList � _int (Ljava/lang/Object;)I � �
 � � ListDeleteAt '(Ljava/lang/String;I)Ljava/lang/String; � �
 W � _double (Ljava/lang/Object;)D � �
 � � (D)Ljava/lang/Object; � �
 � � ArrayLen � �
 W � _compare '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 & � LOGAUDIT � k �
 & � logaudit � java/lang/String � msg � java/lang/StringBuilder � d deleted list of one or more client IP addresses that should be allowed to invoke exposed services:  � (Ljava/lang/String;)V  �
 � � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 & � append -(Ljava/lang/String;)Ljava/lang/StringBuilder; � �
 � � . � toString ()Ljava/lang/String; � �
 r � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 = � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 & � 	
	 � deleteAllowedIPAddresses � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype hint aRemoves an IP address from client IP addresses that should be allowed to invoke exposed services. 
Parameters REQUIRED	 Yes TYPE HINT List of IP addresses to remove. NAME debugip ([Ljava/lang/Object;)V 
 � getMetadata ()Ljava/lang/Object; this 7Lcfsecurity2ecfc637258255$funcDELETEALLOWEDIPADDRESSES; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	     "     � �               �    !     �             !"          �             # �    !     ��             $%    (     
� �Y6S�          
   &'   U    [+� � :+� ,� :	+� :
+ � :+"� :+$� :-� *� 0:-� 4:*68� >� D� H:-J� N-	Ƕ R-� X� ^-J� N`� ^-b� N
-	ɶ R-df� j� ^-J� N-	ʶ R--
� np� r� vW-J� N-	˶ R--	˶ R-xz� j|� r� v� ^-~� N-	Ͷ R-6� �� �� �� ^-�� �� �� �-	ж R--�� �� �� �� �� ^-�-	Ѷ R-	Ѷ R--� n�� r� v� �-� �� �� �� �� �-�� �� �� K-	Զ R--� n�� rY-	Զ R-	Զ R--� n�� r� v� �-�� �� �� �S� vW-�-�� �� �c� �� �-�� �-	ζ R-� �� �� �� ��t|��� -J� N-	ض R-ƶ ��-� =Y� �Y�S� rY� �Yҷ �-� �Y6S� ٸ �� �߶ ݶ �S� � �W-� N�      �   [    [()   [* �   [+,   [-.   [/0   [1 �   [ 1 2   [ 2   [ 2 	  [ 2 
  [ 2   [ !2   [ #2   [ 52 3  J �  	� _	� i	� i	� h	� h	� h	� h	� _	� _	� x	� z	� z	� z	� z	� x	� x	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	�	�	�	�	�	�!	�!	�	�	�	�	�	�	�	�	�	�E	�E	�D	�D	�D	�D	�W	�W	�W	�W	�D	�D	�D	�D	�3	�i	�i	�}	�}	��	��	��	��	��	��	��	��	��	��	��	��	�|	�|	�|	�i	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	�	� �	�	�	�'	�'	�,	�,	�,	�,	�,	�,	�A	�A	�#	�#	�	�	�	�	�       #     *� 
�             4     �     �� �Y� rY�SY�SY�SY�SY SY�SYSY�SYSY	SY
SY� rY� �Y� rY
SYSYSY8SYSYSYSYS�SS�� �          �   5 �    !     ��                  ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 3cfsecurity2ecfc637258255$funcSETLOGINUSERIDREQUIRED  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / ISUSERIDREQUIRED 1 boolean 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 
		
         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; m n
 " o checkRootAdminUser q setAdminUserIdRequired s _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; u v
 " w 
		
	 y java/lang/String { setLoginUserIdRequired } metaData Ljava/lang/Object;  �	  � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � 4Sets whether or not a user id is required for login. � 
Parameters � REQUIRED � true � TYPE � NAME � isUserIdRequired � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 5Lcfsecurity2ecfc637258255$funcSETLOGINUSERIDREQUIRED; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1        �     � �  �   "     � ��    �        � �    � �  �   !     ~�    �        � �    � �  �         �    �        � �    � �  �   (     
� |Y2S�    �       
 � �    � �  �       �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
-y� N-PR� X� ^-`� J-z� N--z� N-bd� Xf� h� l� ^-`� J-{� N--
� pr� h� lW-`� J-|� N--� pt� hY-2� xS� lW-z� J�    �   �    � � �     � � �    � � �    � � �    � � �    � � �    � � �    � - .    �  �    �  � 	   �  � 
   �  �    � 1 �  �   � '   v O y X y X y Z y Z y W y W y W y W y O y O y j z z z z z | z | z y z y z r z r z r z r z j z j z � { � { � { � { � { � { � | � | � | � | � | � | � | � |     �   #     *� 
�    �        � �    �   �   �     u� �Y
� hY�SY~SY�SY�SY�SY�SY�SY�SY�SY	� hY� �Y� hY�SY�SY�SY4SY�SY�S� �SS� �� ��    �       u � �    � �  �   !     ��    �        � �        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc 5cfsecurity2ecfc637258255$funcDELETEDISABLEDDATASOURCE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   PERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   	DSNEXISTS  ACCESSMANAGER ! ADDWILDCARD # SECURITY % I ' WEBAPP ) APOS + coldfusion/runtime/CfJspPage - pageContext #Lcoldfusion/runtime/NeoPageContext; / 0	 . 1 getOut ()Ljavax/servlet/jsp/JspWriter; 3 4 javax/servlet/jsp/JspContext 6
 7 5 parent Ljavax/servlet/jsp/tagext/Tag; 9 :	 . ; 	DIRECTORY = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G 
DATASOURCE I 
		 K _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V M N
 . O / Q set (Ljava/lang/Object;)V S T coldfusion/runtime/Variable V
 W U _setCurrentLineNo (I)V Y Z
 . [ ArrayNew (I)Ljava/util/List; ] ^ coldfusion/runtime/CFPage `
 a _   c S Z
 W e coldfusion/runtime/CFBoolean g t_true Lcoldfusion/runtime/CFBoolean; i j	 h k f_false m j	 h n 	component p CFIDE.adminapi.accessmanager r CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; t u
 a v java x  coldfusion.server.ServiceFactory z getSecurityService | java/lang/Object ~ _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
 . � checkAdminRoles � coldfusion.sandboxsecurity � java/lang/String � CONTEXTS � _resolve D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � _autoscalarize � �
 . � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � _resolveAndAutoscalarize � �
 . � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 a � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 . � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � &(Ljava/lang/String;)Ljava/lang/Object; � �
 . � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 . � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 . � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 a � <<All Datasources>> � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 . � ArrayLen (Ljava/lang/Object;)I � �
 a � _Object (I)Ljava/lang/Object; � �
 � � C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; � �
 . � CLASS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � #coldfusion.sql.DataSourcePermission � _List $(Ljava/lang/Object;)Ljava/util/List; � �
 � � _int �
 � ArrayDeleteAt (Ljava/util/List;I)Z
 a _double (Ljava/lang/Object;)D	
 �
 (D)Ljava/lang/Object; �
 � (Ljava/lang/Object;D)D �
 . 
PERMISSION 	StructNew ()Ljava/util/Map;
 a _set '(Ljava/lang/String;Ljava/lang/Object;)V
 . _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V
 . TARGET  *" ACTION$ ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z&'
 a( '(Ljava/lang/Object;Ljava/lang/Object;)D �*
 .+ _boolean (Ljava/lang/Object;)Z-.
 �/ GETDISABLEDDATASOURCES1 � �
 .3 getDisabledDatasources5 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;78
 .9 (J)Z-;
 �< _LhsResolve> �
 .? _arraySetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)VAB
 .C LOGAUDITE logauditG msgI java/lang/StringBuilderK  removed a datasource M  �
LO append -(Ljava/lang/String;)Ljava/lang/StringBuilder;QR
LS G from the list of disabled datasource in the sandbox for the directory U .W toString ()Ljava/lang/String;YZ
 [ )([Ljava/lang/Object;[Ljava/lang/Object;)V ]
 C^ b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object;7`
 .a 
	c deleteDisabledDatasourcee metaData Ljava/lang/Object;gh	 i voidk falsem &coldfusion/runtime/AttributeCollectiono nameq accesss publicu outputw 
returntypey hint{ LRemoves a data source from the list of disabled data sources in the sandbox.} 
Parameters REQUIRED� true� HINT� ESpecifies the sandbox directory for which the data source is enabled.� NAME� 	directory� ([Ljava/lang/Object;)V �
p� 0Specifies the name of the data source to enable.� 
datasource� getMetadata ()Ljava/lang/Object; this 7Lcfsecurity2ecfc637258255$funcDELETEDISABLEDDATASOURCE; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw44 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �   gh   	 �� �   "     �j�   �       ��   �Z �   "     f�   �       ��   �� �         �   �       ��   �Z �   "     l�   �       ��   �� �   -     � �Y>SYJS�   �       ��   �� �  �    �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :-� 2� 8:-� <:*>� D� H:*J� D� H:-L� PR� X
-�� \-� b� Xd� X� f� l� X� o� X-ƶ \-qs� w� X-Ƕ \--Ƕ \-y{� w}� � �� X-ɶ \--� ��� Y�S� �W-˶ \--� �Y�S� �-� �� �� �-� �Y>S� �� �� ��� G-� �� �� �:-Ͷ \�� ���-˶ θ ��� Ҷ �� �� ݙ �
-Ѷ \--� �Y�S� �� Y-� �SY->� �S� � � X-� �YJS� �� ��� �-׶ \-
� �� � � X� Z--
-� �� �� �� �Y�S� ��� ��� !-ܶ \--
� �� -� ���W-� ��g�� X-� �������--� \��-� �Y�S��-� �Y!S#�-� �Y%Sd�-� \-
� �� -� θ)W�{� f� |--
-� �� �� �� �Y�S� ��� ��� C--
-� �� �� �� �Y!S� �-� �YJS� ��,�~�� � l� X-� ��c�� X-� �-� \-
� �� � �,�t|���c-� ��0�� t--�� \��-� �Y�S��-� �Y!S-� �YJS� ��-� �Y%Sd�-�� \-
� �� -� θ)W-� \-� \-2�46-� Y-� �Y>S� �S�:� =�� � l� X� f� l--
-� �� �� �� �Y�S� ��� ��� 3--
-� �� �� �� �Y!S� �#� ��� � o� X-� ��c�� X-� �-� \-
� �� � �,�t|���s-� ��0� h--� \��-� �Y�S��-� �Y!S#�-� �Y%Sd�-� \-
� �� -� θ)W-� �Y�S�@� Y-� �SY->� �S-
� ��D-L� P-!� \-F�4H-� CY� �YJS� Y�LYN�P-� �YJS� �� ��TV�T-� �Y>S� �� ��TX�T�\S�_�bW-d� P�   �   �   ���    ���   ��h   ���   ���   ���   ��h   � 9 :   � �   � � 	  � � 
  � �   � !�   � #�   � %�   � '�   � )�   � +�   � =�   � I�   ��� �  �~  � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �����������.�.�����:�:�:�:�������w�w�w�w�T������������������������������������������������������ � �2�2�2�2�;�;�;�;�1�1�1��J�J�J�J�S�S�J�J�J�J�H�[�[�a�a���v�v�v�v�k���������|�������������������������������������������������������������<�<�<�<�:����D�D�D�D�M�M�D�D�D�D�B�U�U�b�b�b�b�U�U���|�|�|�|�|�|�����������������������������������������������������������|�										;;;;9	ANNJJffttpp�������pJ�������������������A��������	++++7777@@777���KK``iippppK ���!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!    �   #     *� 
�   �       ��   �  �   �     ��� �� ��pY� YrSYfSYtSYvSYxSYnSYzSYlSY|SY	~SY
�SY� Y�pY� Y�SY�SY�SY�SY�SY�S��SY�pY� Y�SY�SY�SY�SY�SY�S��SS���j�   �       ���   �Z �   "     n�   �       ��        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 5cfsecurity2ecfc637258255$funcSETENABLESANDBOXSECURITY  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / ENABLE 1 boolean 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; m n
 " o checkAdminRoles q %enterprise,coldfusion.sandboxsecurity s setSandboxSecurityEnabled u java/lang/String w _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; y z
 " { _boolean (Ljava/lang/Object;)Z } ~ coldfusion/runtime/Cast �
 �  CREATEDEFAULTSANDBOXES � &(Ljava/lang/String;)Ljava/lang/Object; m �
 " � createDefaultSandboxes � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 " � 
		
	 � setEnableSandboxSecurity � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � -Specifies whether to enable sandbox security. � 
Parameters � REQUIRED � Yes � TYPE � HINT � True or False � NAME � enable � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 7Lcfsecurity2ecfc637258255$funcSETENABLESANDBOXSECURITY; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� xY2S�    �       
 � �    � �  �  �    +� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
-ƶ N-PR� X� ^-`� J-Ƕ N--Ƕ N-bd� Xf� h� l� ^-`� J-ȶ N--
� pr� hYtS� lW-`� J-ʶ N--� pv� hY-� xY2S� |S� lW-� xY2S� |� �� -Ͷ N-�� ��-� h� �W-�� J�    �   �    � �     � �    � �    � �    � �    � �    � �    - .     �     � 	    � 
    �    1 �  �   � 1  � O� Y� Y� [� [� X� X� X� X� O� O� k� }� }� � � |� |� t� t� t� t� k� k� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ������� �� ��     �   #     *� 
�    �        � �    �   �   �     �� �Y� hY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� hY� �Y� hY�SY�SY�SY4SY�SY�SY�SY�S� �SS� �� ��    �       � � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 0cfsecurity2ecfc637258255$funcGETUSEADMINPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   SECURITY  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - 
		 / _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 1 2
   3 _setCurrentLineNo (I)V 5 6
   7 java 9  coldfusion.server.ServiceFactory ; CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; = > coldfusion/runtime/CFPage @
 A ? getSecurityService C java/lang/Object E _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; G H
   I set (Ljava/lang/Object;)V K L coldfusion/runtime/Variable N
 O M _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; Q R
   S isAdminSecurityEnabled U 
	 W java/lang/String Y getUseAdminPassword [ metaData Ljava/lang/Object; ] ^	  _ false a &coldfusion/runtime/AttributeCollection c name e access g public i output k hint m =Checks whether ColdFusion Administrator security is required. o 
Parameters q ([Ljava/lang/Object;)V  s
 d t getMetadata ()Ljava/lang/Object; this 2Lcfsecurity2ecfc637258255$funcGETUSEADMINPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       ] ^     v w  {   "     � `�    z        x y    | }  {   !     \�    z        x y    ~   {         �    z        x y    � �  {   #     � Z�    z        x y    � �  {  b     �+� � :+� ,� :	+� :
-� $� *:-� .:-0� 4
-� 8--� 8-:<� BD� F� J� P-0� 4-� 8--
� TV� F� J�-X� 4�    z   p    � x y     � � �    � � ^    � � �    � � �    � � �    � � ^    � + ,    �  �    �  � 	   �  � 
 �   Z     4  D  D  F  F  C  C  <  <  <  <  4  4  f  f  e  e  e  e  e  e      {   #     *� 
�    z        x y    �   {   f     H� dY
� FYfSY\SYhSYjSYlSYbSYnSYpSYrSY	� FS� u� `�    z       H x y    � }  {   !     b�    z        x y        ����  -+ 
SourceFile /CFIDE/adminapi/security.cfc 1cfsecurity2ecfc637258255$funcGETSECURITYSANDBOXES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ST  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACCESSMANAGER ! SECURITY # WEBAPP % coldfusion/runtime/CfJspPage ' pageContext #Lcoldfusion/runtime/NeoPageContext; ) *	 ( + getOut ()Ljavax/servlet/jsp/JspWriter; - . javax/servlet/jsp/JspContext 0
 1 / parent Ljavax/servlet/jsp/tagext/Tag; 3 4	 ( 5 getVariable  (I)Lcoldfusion/runtime/Variable; 7 8 %coldfusion/runtime/ArgumentCollection :
 ; 9 
		 = _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V ? @
 ( A / C set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G _setCurrentLineNo (I)V K L
 ( M 	StructNew ()Ljava/util/Map; O P coldfusion/runtime/CFPage R
 S Q ArrayNew (I)Ljava/util/List; U V
 S W 	component Y CFIDE.adminapi.accessmanager [ CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ] ^
 S _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 ( k _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; m n
 ( o checkAdminRoles q Ucoldfusion.sandboxsecurity,coldfusion.serversettings,coldfusion.serversettingssummary s coldfusion/runtime/CFBoolean u f_false Lcoldfusion/runtime/CFBoolean; w x	 v y java/lang/String { CONTEXTS } _resolve D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object;  �
 ( � _autoscalarize � n
 ( � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 ( � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 S � arguments.directory � 	IsDefined (Ljava/lang/String;)Z � �
 S � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � /* � StructDelete %(Ljava/util/Map;Ljava/lang/String;Z)Z � �
 S � 	DIRECTORY � &(Ljava/lang/String;)Ljava/lang/Object; � �
 ( � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 S � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 ( � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 ( � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 ( � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 ( � _resolveAndAutoscalarize � �
 ( � _arraySetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 ( � 
	 � getSecuritySandboxes � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � 6Returns all security sandboxes or a specified sandbox. � 
Parameters � REQUIRED  HINT !Sandbox directory to be returned. NAME 	directory ([Ljava/lang/Object;)V 

 � getMetadata ()Ljava/lang/Object; this 3Lcfsecurity2ecfc637258255$funcGETSECURITYSANDBOXES; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw25 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �    � �        "     � ��                 !     �                       �                 (     
� |Y�S�          
      �    +� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :-� ,� 2:-� 6:� <:->� BD� J
-ڶ N� T� J-۶ N-� X� J-ݶ N-Z\� `� J-޶ N--޶ N-bd� `f� h� l� J-߶ N--� pr� hYtSY� zS� lW-� N-� |Y~S� �-� �� �� �� J-� N-�� ��� ,-� N--� �� ��� �W-� ��� �-� N--� |Y~S� �-� �� �� �-�� �� �� �� 4--� |Y~S� �� hY-� �SY-�� �S� �� J� G-� �� �� �:-� Nö ���-϶ �� �ø Ӷ �� �� ޙ �-
� hY-� |Y�S� �S-� N-� �� �� �-
� ��-� B�      �           �       !   "#   $ �    3 4    %    % 	   % 
   %    !%    #%    %%    �%   &' (   �  � \� ^� ^� ^� ^� \� c� l� l� l� l� c� r� |� |� {� {� {� {� r� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ���������� � � � �)�)�+�+����0�0�0�0�0�B�B�Q�Q�B�B�B�B�]�]�]�]�A�A�o�o���������n�n�n�n�l�����������A������������������� \�       #     *� 
�             )     �     ��� �� �� �Y
� hY�SY�SY�SY�SY�SY�SY�SY�SY�SY	� hY� �Y� hYSY�SYSYSYSY	S�SS�� ��          �   *    !     �                  ����  - � 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc637258255$funcISINTERNALSANDBOX  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   ! javax/servlet/jsp/JspContext #
 $ " parent Ljavax/servlet/jsp/tagext/Tag; & '	  ( 	DIRECTORY * getVariable  (I)Lcoldfusion/runtime/Variable; , - %coldfusion/runtime/ArgumentCollection /
 0 . _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; 2 3
  4 
		 6 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 8 9
  : _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; < =
  > _setCurrentLineNo (I)V @ A
  B GETCFIDEDIRECTORY D _get F =
  G getCFIDEDirectory I java/lang/Object K 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; M N
  O _compare '(Ljava/lang/Object;Ljava/lang/Object;)D Q R
  S _Object (Z)Ljava/lang/Object; U V coldfusion/runtime/Cast X
 Y W _boolean (Ljava/lang/Object;)Z [ \
 Y ] GETWEBINFDIRECTORY _ getWebInfDirectory a coldfusion/runtime/CFBoolean c t_true Lcoldfusion/runtime/CFBoolean; e f	 d g f_false i f	 d j 
	 l java/lang/String n isInternalSandBox p metaData Ljava/lang/Object; r s	  t false v &coldfusion/runtime/AttributeCollection x name z access | public ~ output � hint � 9Returns true if the sandbox directory is CFIDE or WEB-INF � 
Parameters � REQUIRED � true � HINT � 'Specifies the directory of the sandbox. � NAME � 	directory � ([Ljava/lang/Object;)V  �
 y � getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc637258255$funcISINTERNALSANDBOX; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       r s     � �  �   "     � u�    �        � �    � �  �   !     q�    �        � �    � �  �         �    �        � �    � �  �   (     
� oY+S�    �       
 � �    � �  �  �     �+� � :+� ,� :	-� � %:-� ):*+� 1� 5:
-7� ;-+� ?-�� C-E� HJ-� L� P� T�~�� ZY� ^� -W-+� ?-�� C-`� Hb-� L� P� T�~�� Z� ^� 
� h�� � k�-m� ;�    �   p    � � �     � � �    � � s    � � �    � � �    � � �    � � s    � & '    �  �    �  � 	   � * � 
 �   � #  � <� <� I� I� I� I� <� <� <� <� m� m� z� z� z� z� m� m� m� m� <� <� �� �� �� �� �� �� �� �� �� �� <� <�     �   #     *� 
�    �        � �    �   �   �     u� yY
� LY{SYqSY}SYSY�SYwSY�SY�SY�SY	� LY� yY� LY�SY�SY�SY�SY�SY�S� �SS� �� u�    �       u � �    � �  �   !     w�    �        � �        ����  -~ 
SourceFile /CFIDE/adminapi/security.cfc /cfsecurity2ecfc637258255$funcSETSECURITYSANDBOX  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  DIR ! WEBAPP # coldfusion/runtime/CfJspPage % pageContext #Lcoldfusion/runtime/NeoPageContext; ' (	 & ) getOut ()Ljavax/servlet/jsp/JspWriter; + , javax/servlet/jsp/JspContext .
 / - parent Ljavax/servlet/jsp/tagext/Tag; 1 2	 & 3 	DIRECTORY 5 string 7 getVariable  (I)Lcoldfusion/runtime/Variable; 9 : %coldfusion/runtime/ArgumentCollection <
 = ; 3coldfusion/tagext/validation/CFTypeValidatorFactory ? STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; A B	 @ C _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G SANDBOX I array K ARRAY_VALIDATOR M B	 @ N _validateArgWithValidator P F
  Q 
		 S _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V U V
 & W / Y set (Ljava/lang/Object;)V [ \ coldfusion/runtime/Variable ^
 _ ] java/lang/String a _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; c d
 & e _setCurrentLineNo (I)V g h
 & i 	component k CFIDE.adminapi.accessmanager m CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; o p coldfusion/runtime/CFPage r
 s q java u  coldfusion.server.ServiceFactory w getSecurityService y java/lang/Object { _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; } ~
 &  _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
 & � checkAdminRoles � coldfusion.sandboxsecurity � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � DirectoryExists (Ljava/lang/String;)Z � �
 s � CONTEXTS � _resolve � d
 & � _autoscalarize � �
 & � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 & � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 s � _Object (Z)Ljava/lang/Object; � �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � arguments.sandbox � 	IsDefined � �
 s � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 & � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_ALREADY_EXISTS � &(Ljava/lang/String;)Ljava/lang/Object; � �
 & � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 & � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 & � GETDEFAULTSECURITYSANDBOX � � �
 & � getDefaultSecuritySandbox � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 & � _LhsResolve � d
 & � _arraySetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 & � /* � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 & � GETCFIDEDIRECTORY � getCFIDEDirectory � '(Ljava/lang/Object;Ljava/lang/Object;)D �
 & GETWEBINFDIRECTORY getWebInfDirectory SETDEFAULTFILEPERMISSION setDefaultFilePermission
 ERROR_INVALIDDIRECTORY LOGAUDIT logaudit msg java/lang/StringBuilder . created a security sandbox for the directory   �
 append -(Ljava/lang/String;)Ljava/lang/StringBuilder;
 . toString ()Ljava/lang/String; !
 |" )([Ljava/lang/Object;[Ljava/lang/Object;)V $
 =% b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; �'
 &( 		
	* setSecuritySandbox, metaData Ljava/lang/Object;./	 0 void2 false4 &coldfusion/runtime/AttributeCollection6 name8 access: public< output> 
returntype@ hintB 5Creates a security sandbox for a specified directory.D 
ParametersF REQUIREDH trueJ TYPEL HINTN Specifies a sandbox directory.P NAMER 	directoryT ([Ljava/lang/Object;)V V
7W NoY aThe sandbox array object, which is an array of structures with each structure being a permission.[ sandbox] getMetadata ()Ljava/lang/Object; this 1Lcfsecurity2ecfc637258255$funcSETSECURITYSANDBOX; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw26 !Lcoldfusion/tagext/lang/ThrowTag; throw27 LineNumberTable <clinit> 	getOutput 1       � �   ./   	 _` d   "     �1�   c       ab   e! d   "     -�   c       ab   fg d         �   c       ab   h! d   "     3�   c       ab   ij d   -     � bY6SYJS�   c       ab   kl d  
    ~+� � :+� ,� :	+� :
+ � :+"� :+$� :-� *� 0:-� 4:*68� >� D� H:*JL� >� O� R:-T� XZ� `-� bY6S� f� `
-�� j-ln� t� `-�� j--�� j-vx� tz� |� �� `-� j--
� ��� |Y�S� �W-� j--� bY6S� f� �� ���-� j--� bY�S� �-� �� �� �-� �� �� �� �Y� �� W-� j-�� ��� �� �� Q-� �� �� �:-� jǶ ���-Ӷ ָ �Ǹ ڶ �� �� � ��4-� j-�� �� -� bYJS� f� `� (-� j-� ��-� |Y-� �S� � `-� bY�S� �� |Y-� �SY-� �S-J� ָ �-� bY6S� f�� ��~� �Y� �� 5W-� bY6S� f-� j-�� � -� |� ��~� �Y� �� 6W-� bY6S� f-� j-� �-� |� ��~� �� �� &-� j-	� �-� |Y-� �S� �W� H-� �� �� �:-� jǶ ���-� ָ �Ǹ ڶ �� �� � �-T� X-� j-� �-� =Y� bYS� |Y�Y�-� bY6S� f� ����#S�&�)W-+� X�   c   �   ~ab    ~mn   ~o/   ~pq   ~rs   ~tu   ~v/   ~ 1 2   ~ w   ~ w 	  ~ w 
  ~ w   ~ !w   ~ #w   ~ 5w   ~ Iw   ~xy   ~zy {  � �  � r� t� t� t� t� r� y� {� {� {� {� y� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � � � � � � � � � �&&&&



EEDDDDDDDD

xxU�����
�
�
�
�
���������������%%99OOOO9999rr����rrrr�������
��� � r�$$GGMMMMMMbbCC$$$$    d   #     *� 
�   c       ab   |  d       ��� �� ��7Y� |Y9SY-SY;SY=SY?SY5SYASY3SYCSY	ESY
GSY� |Y�7Y� |YISYKSYMSY8SYOSYQSYSSYUS�XSY�7Y� |YISYZSYMSYLSYOSY\SYSSY^S�XSS�X�1�   c       �ab   }! d   "     5�   c       ab        ����  - 
SourceFile /CFIDE/adminapi/security.cfc /cfsecurity2ecfc637258255$funcGETSECURABLECFTAGS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ATAGS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   ACCESSMANAGER  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 	
		
	 	 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 ArrayNew (I)Ljava/util/List; ; < coldfusion/runtime/CFPage >
 ? = set (Ljava/lang/Object;)V A B coldfusion/runtime/Variable D
 E C 

         G 	component I CFIDE.adminapi.accessmanager K CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; M N
 ? O 
		 Q _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; S T
 " U checkAdminRoles W java/lang/Object Y coldfusion.sandboxsecurity [ _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; ] ^
 " _ _autoscalarize a T
 " b _List $(Ljava/lang/Object;)Ljava/util/List; d e coldfusion/runtime/Cast g
 h f 	CFContent j ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z l m
 ? n CFDirectory p CFFile r CFObject t 
CFRegistry v 	CFExecute x CFFtp z CFMail | CFLog ~ CFCollection � CFCookie � CFHTTP � CFHTTPParam � CFIndex � CFLDAP � CFInvoke � 
CFSchedule � CFSearch � CFTransaction � CFPOP � CFQuery � CFInsert � CFUpdate � CFStoredProc � CFGridUpdate � 
CFDocument � CFReport � CFThread � CFImage � CFFeed � CFExchangeConnection � CFExchangeCalendar � CFExchangeMail � CFExchangeContact � CFExchangeTask � CFPdf � CFPrint � CFDBInfo � CFObjectCache � CFSharepoint � CFSpreadSheet � CFCache � CFIMAP � CFFileUpload � CFExchangeConversation � CFExchangeFolder � CFWebSocket � CFHtmlToPdf � 
textnocase � asc � 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z � �
 ? � 
	 � java/lang/String � getSecurableCFTags � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � #Returns an array of securable tags. � 
Parameters � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 1Lcfsecurity2ecfc637258255$funcGETSECURABLECFTAGS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �  �   "     � ߰    �        � �    � �  �   !     ۰    �        � �    � �  �         �    �        � �    �   �   #     � ٰ    �        � �     �  �    �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-ʶ :-� @� F-H� 6-˶ :-JL� P� F-R� 6-̶ :--� VX� ZY\S� `W-R� 6-϶ :-
� c� ik� oW-ж :-
� c� iq� oW-Ѷ :-
� c� is� oW-Ҷ :-
� c� iu� oW-Ӷ :-
� c� iw� oW-Զ :-
� c� iy� oW-ն :-
� c� i{� oW-ֶ :-
� c� i}� oW-׶ :-
� c� i� oW-ڶ :-
� c� i�� oW-۶ :-
� c� i�� oW-ܶ :-
� c� i�� oW-ݶ :-
� c� i�� oW-޶ :-
� c� i�� oW-߶ :-
� c� i�� oW-� :-
� c� i�� oW-� :-
� c� i�� oW-� :-
� c� i�� oW-� :-
� c� i�� oW-� :-
� c� i�� oW-� :-
� c� i�� oW-� :-
� c� i�� oW-� :-
� c� i�� oW-� :-
� c� i�� oW-� :-
� c� i�� oW-� :-
� c� i�� oW-� :-
� c� i�� oW-� :-
� c� i�� oW-� :-
� c� i�� oW-� :-
� c� i�� oW-� :-
� c� i�� oW-� :-
� c� i�� oW-�� :-
� c� i�� oW-�� :-
� c� i�� oW-�� :-
� c� i�� oW-�� :-
� c� i�� oW-�� :-
� c� i�� oW-�� :-
� c� i�� oW-�� :-
� c� i�� oW-�� :-
� c� i�� oW-�� :-
� c� i�� oW- � :-
� c� i�� oW-� :-
� c� iø oW-� :-
� c� iŸ oW-� :-
� c� iǸ oW-� :-
� c� iɸ oW-� :-
� c� i˸ oW-
� :-
� c� i͸ oW-� :-
� c� i�Ѹ �W-
� c�-׶ 6�    �   z   � � �    �   � �   �   �	   �
   � �   � - .   �    �  	  �  
  �    z�  � <� F� F� E� E� E� E� <� <� U� _� _� a� a� ^� ^� ^� ^� U� U� y� y� �� �� x� x� x� x� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �����������!�!�!�!�*�*�!�!�!�7�7�7�7�@�@�7�7�7�M�M�M�M�V�V�M�M�M�c�c�c�c�l�l�c�c�c�y�y�y�y�����y�y�y��������������������������������������������������������������������������������������������������������������������)�)�)�)�2�2�)�)�)�?�?�?�?�H�H�?�?�?�U�U�U�U�^�^�U�U�U�k�k�k�k�t�t�k�k�k��������������������������������������������������������������������������������������������������������������������������$�$����1�1�1�1�:�:�1�1�1�G�G�G�G�P�P�G�G�G�]�]�]�]�f�f�]�]�]�s�s�s�s�|�|�s�s�s��������������������������������������������������������������������������������������������������� � ����������������# # # # , , # # # 9999BB999OOOOXXOOOeeeenneee{{{{��{{{����������
�
�
�
�
�
�
�
�
���������������� ��     �   #     *� 
�    �        � �      �   f     H� �Y
� ZY�SY�SY�SY�SY�SY�SY�SY�SY�SY	� ZS� �� ߱    �       H � �    �  �   !     �    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc *cfsecurity2ecfc637258255$funcISRAMALLFILES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   ! javax/servlet/jsp/JspContext #
 $ " parent Ljavax/servlet/jsp/tagext/Tag; & '	  ( PATH * getVariable  (I)Lcoldfusion/runtime/Variable; , - %coldfusion/runtime/ArgumentCollection /
 0 . _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; 2 3
  4 
			 6 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 8 9
  : _setCurrentLineNo (I)V < =
  > _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; @ A
  B _String &(Ljava/lang/Object;)Ljava/lang/String; D E coldfusion/runtime/Cast G
 H F Trim &(Ljava/lang/String;)Ljava/lang/String; J K coldfusion/runtime/CFPage M
 N L set (Ljava/lang/Object;)V P Q coldfusion/runtime/Variable S
 T R ram:///- V _compare '(Ljava/lang/Object;Ljava/lang/String;)D X Y
  Z _Object (Z)Ljava/lang/Object; \ ]
 H ^ _boolean (Ljava/lang/Object;)Z ` a
 H b ram://- d coldfusion/runtime/CFBoolean f t_true Lcoldfusion/runtime/CFBoolean; h i	 g j f_false l i	 g m 	
	 o java/lang/String q isRAMAllFiles s metaData Ljava/lang/Object; u v	  w boolean y false { &coldfusion/runtime/AttributeCollection } java/lang/Object  name � access � private � output � 
returntype � hint � -Checks if the argument is ram:///- or ram://- � 
Parameters � REQUIRED � true � HINT � "specifies the path to the ram file � NAME � path � ([Ljava/lang/Object;)V  �
 ~ � getMetadata ()Ljava/lang/Object; this ,Lcfsecurity2ecfc637258255$funcISRAMALLFILES; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       u v   	  � �  �   "     � x�    �        � �    � �  �   !     t�    �        � �    � �  �         �    �        � �    � �  �   !     z�    �        � �    � �  �   (     
� rY+S�    �       
 � �    � �  �  �     �+� � :+� ,� :	-� � %:-� ):*+� 1� 5:
-7� ;
-ڶ ?-+� C� I� O� U-+� CW� [�~�� _Y� c� W-+� Ce� [�~�� _� c� 
� k�� � n�-p� ;�    �   p    � � �     � � �    � � v    � � �    � � �    � � �    � � v    � & '    �  �    �  � 	   � * � 
 �   � (  � E� E� E� E� E� E� E� E� <� T� T� Z� Z� T� T� T� T� p� p� v� v� p� p� p� p� T� T� �� �� �� �� �� �� �� �� �� �� T� <�     �   #     *� 
�    �        � �    �   �   �     �� ~Y� �Y�SYtSY�SY�SY�SY|SY�SYzSY�SY	�SY
�SY� �Y� ~Y� �Y�SY�SY�SY�SY�SY�S� �SS� �� x�    �       � � �    � �  �   !     |�    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc637258255$funcGETUSERDSPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 

         1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G 
		 K java M  coldfusion.server.ServiceFactory O getSecurityService Q java/lang/Object S _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; U V
 " W _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; Y Z
 " [ checkAdminRoles ] :coldfusion.serversettings,coldfusion.serversettingssummary _ coldfusion/runtime/CFBoolean a f_false Lcoldfusion/runtime/CFBoolean; c d	 b e isRDSSecurityEnabled g 
	 i java/lang/String k getUseRDSPassword m metaData Ljava/lang/Object; o p	  q false s &coldfusion/runtime/AttributeCollection u name w access y public { output } hint  HChecks whether a Remote Development Services (RDS) password is required. � 
Parameters � ([Ljava/lang/Object;)V  �
 v � getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc637258255$funcGETUSERDSPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       o p     � �  �   "     � r�    �        � �    � �  �   !     n�    �        � �    � �  �         �    �        � �    � �  �   #     � l�    �        � �    � �  �       �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
- �� :-<>� D� J-L� 6- �� :-- �� :-NP� DR� T� X� J-L� 6- �� :--
� \^� TY`SY� fS� XW- �� :--� \h� T� X�-j� 6�    �   z    � � �     � � �    � � p    � � �    � � �    � � �    � � p    � - .    �  �    �  � 	   �  � 
   �  �  �   � *   � < � F � F � H � H � E � E � E � E � < � < � X � j � j � l � l � i � i � a � a � a � a � X � X � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �     �   #     *� 
�    �        � �    �   �   f     H� vY
� TYxSYnSYzSY|SY~SYtSY�SY�SY�SY	� TS� �� r�    �       H � �    � �  �   !     t�    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc -cfsecurity2ecfc637258255$funcGETALLOWEDIPLIST  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
	         1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G 
		 K _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; M N
 " O checkRootAdminUser Q java/lang/Object S _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; U V
 " W java Y  coldfusion.server.ServiceFactory [ getSecurityService ] getAllowedIPList _ 
	 a java/lang/String c metaData Ljava/lang/Object; e f	  g false i &coldfusion/runtime/AttributeCollection k name m access o public q output s hint u XReturns a list of client IP addresses that should be allowed to invoke exposed services. w 
Parameters y ([Ljava/lang/Object;)V  {
 l | getMetadata ()Ljava/lang/Object; this /Lcfsecurity2ecfc637258255$funcGETALLOWEDIPLIST; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       e f     ~   �   "     � h�    �        � �    � �  �   !     `�    �        � �    � �  �         �    �        � �    � �  �   #     � d�    �        � �    � �  �  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-	�� :-<>� D� J-L� 6-	�� :--
� PR� T� XW-L� 6-	�� :--	�� :-Z\� D^� T� X� J-L� 6-	�� :--� P`� T� X�-b� 6�    �   z    � � �     � � �    � � f    � � �    � � �    � � �    � � f    � - .    �  �    �  � 	   �  � 
   �  �  �   � &  	� <	� F	� F	� H	� H	� E	� E	� E	� E	� <	� <	� `	� `	� _	� _	� _	� _	� x	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� x	� x	� �	� �	� �	� �	� �	� �	� �	�     �   #     *� 
�    �        � �    �   �   f     H� lY
� TYnSY`SYpSYrSYtSYjSYvSYxSYzSY	� TS� }� h�    �       H � �    � �  �   !     j�    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc /cfsecurity2ecfc637258255$funcCHECKADMINPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / PASSWORD 1 string 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C get (I)Ljava/lang/Object; E F
 9 G ISHASHED I false K put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; M N
 9 O boolean Q BOOL_VALIDATOR S >	 < T _validateArgWithValidator V B
  W 

         Y _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V [ \
 " ] _setCurrentLineNo (I)V _ `
 " a 	component c CFIDE.adminapi.accessmanager e CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; g h coldfusion/runtime/CFPage j
 k i set (Ljava/lang/Object;)V m n coldfusion/runtime/Variable p
 q o 
		 s java u  coldfusion.server.ServiceFactory w getSecurityService y java/lang/Object { _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; } ~
 "  _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
 " � checkRootAdminUser � checkAdminPassword � java/lang/String � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 " � 
	 � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � Checks admin password. � 
Parameters � REQUIRED � Yes � TYPE � HINT � Administrator password. � NAME � password � ([Ljava/lang/Object;)V  �
 � � ;Set it to true if the password sent is already hashed once. � no � DEFAULT � isHashed � getMetadata ()Ljava/lang/Object; this 1Lcfsecurity2ecfc637258255$funcCHECKADMINPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   -     � �Y2SYJS�    �        � �    � �  �  u    +� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:� H� JL� PW*JR� :� U� X:-Z� ^
- �� b-df� l� r-t� ^- �� b-- �� b-vx� lz� |� �� r-t� ^- �� b--
� ��� |� �W- �� b--� ��� |Y-� �Y2S� �SY-� �YJS� �S� ��-�� ^�    �   �    � �     � �    � �    � �    � �    � �    � �    - .     �     � 	    � 
    �    1 �    I �  �   � ,   � U � U � v � � � � � � � � �  �  �  �  � v � v � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �     �   #     *� 
�    �        � �    �   �   �     ƻ �Y
� |Y�SY�SY�SY�SY�SYLSY�SY�SY�SY	� |Y� �Y� |Y�SY�SY�SY4SY�SY�SY�SY�S� �SY� �Y
� |Y�SY�SY�SY�SY�SYRSY�SYLSY�SY	�S� �SS� �� ��    �       � � �    � �  �   !     L�    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc *cfsecurity2ecfc637258255$funcSETRDSENABLED  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / ENABLED 1 boolean 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; m n
 " o checkRootAdminUser q setRdsEnabled s java/lang/String u _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; w x
 " y ACTION {   } _set '(Ljava/lang/String;Ljava/lang/Object;)V  �
 " � _boolean (Ljava/lang/Object;)Z � � coldfusion/runtime/Cast �
 � � enabled � disabled � LOGAUDIT � &(Ljava/lang/String;)Ljava/lang/Object; m �
 " � logaudit � msg � java/lang/StringBuilder �   � (Ljava/lang/String;)V  �
 � � _autoscalarize � �
 " � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � append -(Ljava/lang/String;)Ljava/lang/StringBuilder; � �
 � �  RDS security. � toString ()Ljava/lang/String; � �
 h � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 9 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � (Specifies whether RDS is enabled or not. � 
Parameters � REQUIRED � Yes � TYPE � HINT � Specify true or false. � NAME � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this ,Lcfsecurity2ecfc637258255$funcSETRDSENABLED; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     t�    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� vY2S�    �       
 � �    � �  �  *    d+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
-� N-PR� X� ^-`� J-� N--� N-bd� Xf� h� l� ^-`� J-� N--
� pr� h� lW-� N--� pt� hY-� vY2S� zS� lW-|~� �-� vY2S� z� �� -|�� �� -|�� �-`� J-� N-�� ��-� 9Y� vY�S� hY� �Y�� �-|� �� �� ��� �� �S� �� �W-�� J�    �   �   d � �    d � �   d � �   d � �   d � �   d � �   d � �   d - .   d  �   d  � 	  d  � 
  d  �   d 1 �  �  * J    O Y Y [ [ X X X X O O k } }   | | t t t t k k � � � � � � � � � � � � � � � � � � � �
 �
 �
 �
 �
 � �99>>>>>>JJ55     �   #     *� 
�    �        � �    �   �   �     �� �Y� hY�SYtSY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� hY� �Y� hY�SY�SY�SY4SY�SY�SY�SY�S� �SS� ߳ ��    �       � � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc $cfsecurity2ecfc637258255$funcGETUSER  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   U  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   ACCESSMANAGER  SECURITY ! USER # coldfusion/runtime/CfJspPage % pageContext #Lcoldfusion/runtime/NeoPageContext; ' (	 & ) getOut ()Ljavax/servlet/jsp/JspWriter; + , javax/servlet/jsp/JspContext .
 / - parent Ljavax/servlet/jsp/tagext/Tag; 1 2	 & 3 USERNAME 5 string 7 getVariable  (I)Lcoldfusion/runtime/Variable; 9 : %coldfusion/runtime/ArgumentCollection <
 = ; 3coldfusion/tagext/validation/CFTypeValidatorFactory ? STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; A B	 @ C _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G 

		  I _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V K L
 & M _setCurrentLineNo (I)V O P
 & Q 	StructNew ()Ljava/util/Map; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 	component _ CFIDE.adminapi.accessmanager a CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; c d
 W e java g  coldfusion.server.ServiceFactory i getSecurityService k java/lang/Object m _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; o p
 & q _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; s t
 & u checkRootAdminUser w arguments.username y 	IsDefined (Ljava/lang/String;)Z { |
 W } getAuthorizedUser  String � java/lang/String � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 & � JavaCast 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 W � coldfusion/runtime/CFBoolean � t_true Lcoldfusion/runtime/CFBoolean; � �	 � � _structSetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 & � PASSWORD � DESCRIPTION � 	ENABLEDDS � FILEPERMISSIONS � SERVICES � EXPOSEDSERVICES � 
user.roles � ROLES � ALLOWCLIENTCERTAUTH � _autoscalarize � t
 & � getAuthorizedUsers � 
	  � getUser � metaData Ljava/lang/Object; � �	  � struct � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � :Get all users or get single user by specifying a username. � 
Parameters � REQUIRED � TYPE � HINT � -Specifies the username of the user to return. � NAME � username � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this &Lcfsecurity2ecfc637258255$funcGETUSER; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� �Y6S�    �       
 � �    � �  �  �    K+� � :+� ,� :	+� :
+ � :+"� :+$� :-� *� 0:-� 4:*68� >� D� H:-J� N
-	B� R� X� ^-	C� R� X� ^-	D� R-`b� f� ^-	E� R--	E� R-hj� fl� n� r� ^-	G� R--� vx� n� rW-	I� R-z� ~�U-	K� R--� v�� nY-	K� R-�-� �Y6S� �� �SY� �S� r� ^-
� �Y6S-� �Y6S� �� �-
� �Y�S-� �Y�S� �� �-
� �Y�S-� �Y�S� �� �-
� �Y�S-� �Y�S� �� �-
� �Y�S-� �Y�S� �� �-
� �Y�S-� �Y�S� �� �-	R� R-�� ~� !-
� �Y�S-� �Y�S� �� �-
� �Y�S-� �Y�S� �� �-
� ��� -	[� R--� v�� n� r�-�� N�    �   �   K � �    K � �   K � �   K � �   K � �   K � �   K � �   K 1 2   K  �   K  � 	  K  � 
  K  �   K ! �   K # �   K 5 �  �  � v  	> _	B h	B h	B h	B h	B _	B n	C w	C w	C w	C w	C n	C }	D �	D �	D �	D �	D �	D �	D �	D �	D }	D �	E �	E �	E �	E �	E �	E �	E �	E �	E �	E �	E �	E �	G �	G �	G �	G �	G �	I �	I �	I �	I �	K �	K �	K �	K 	K 	K �	K �	K	K	K �	K �	K �	K �	K �	K+	L+	L+	L+	L	LI	MI	MI	MI	M=	Mg	Ng	Ng	Ng	N[	N�	O�	O�	O�	Oy	O�	P�	P�	P�	P�	P�	Q�	Q�	Q�	Q�	Q�	R�	R�	R�	R�	T�	T�	T�	T�	T�	R	V	V	V	V	V	W	W	W	W	W1	[1	[0	[0	[0	[0	[0	[ �	I _	A     �   #     *� 
�    �        � �    �   �   �     �� �Y� nY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� nY� �Y� nY�SY�SY�SY8SY�SY�SY�SY�S� �SS� ڳ ��    �       � � �    � �  �   !     ��    �        � �        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc637258255$funcDISABLERDSSERVLET  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   SUCCESS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   WEBX  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 coldfusion/runtime/CFBoolean 7 t_true Lcoldfusion/runtime/CFBoolean; 9 :	 8 ; set (Ljava/lang/Object;)V = > coldfusion/runtime/Variable @
 A ?   C 

		 E *coldfusion/runtime/TransientVariableHolder G &(Lcoldfusion/runtime/NeoPageContext;)V  I
 H J 

			
			 L _setCurrentLineNo (I)V N O
 " P GetPageContext %()Lcoldfusion/runtime/NeoPageContext; R S coldfusion/runtime/CFPage U
 V T 
getRequest X java/lang/Object Z _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; \ ]
 " ^ getRealPath ` /WEB-INF b _String &(Ljava/lang/Object;)Ljava/lang/String; d e coldfusion/runtime/Cast g
 h f web.xml j concat &(Ljava/lang/String;)Ljava/lang/String; l m java/lang/String o
 p n 
FileExists (Ljava/lang/String;)Z r s
 V t 
				 v PATH x _set '(Ljava/lang/String;Ljava/lang/Object;)V z {
 " | 
			 ~ java/lang/StringBuilder � SERVER � 
COLDFUSION � ROOTDIR � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 " � (Ljava/lang/String;)V  �
 � � FS � _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; � �
 " � append -(Ljava/lang/String;)Ljava/lang/StringBuilder; � �
 � � wwwroot � WEB-INF � toString ()Ljava/lang/String; � �
 [ � 

			 � path � 	IsDefined � s
 V � $class$coldfusion$tagext$lang$LockTag Ljava/lang/Class; coldfusion.tagext.lang.LockTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 " � coldfusion/tagext/lang/LockTag � 
rdsservlet � setName � �
 � � 	EXCLUSIVE � setType � �
 � � 
setTimeout � O
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 
doStartTag ()I � �
 � � 
					 � "class$coldfusion$tagext$io$FileTag coldfusion.tagext.io.FileTag � � �	  � coldfusion/tagext/io/FileTag � READ � 	setAction � �
 � � cffile � file � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 " � setFile � �
 � � webxml � setVariable � �
 � � setAddnewline � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 " � WEBXML � XmlParse 0(Ljava/lang/String;)Lcoldfusion/xml/XmlNodeList; � �
 V � I � _Object (I)Ljava/lang/Object; � �
 h  web-app servlet-mapping _arrayGetAt D(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;)Ljava/lang/Object;
 " _Map #(Ljava/lang/Object;)Ljava/util/Map;

 h XMLNAME 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �
 " _compare '(Ljava/lang/Object;Ljava/lang/String;)D
 " XMLCHILDREN _resolve
 " 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
 " XMLTEXT 
RDSServlet! _List $(Ljava/lang/Object;)Ljava/util/List;#$
 h% _int (Ljava/lang/Object;)I'(
 h) ArrayDeleteAt (Ljava/util/List;I)Z+,
 V- _double (Ljava/lang/Object;)D/0
 h1 (D)Ljava/lang/Object; �3
 h4 ArrayLen6(
 V7 '(Ljava/lang/Object;Ljava/lang/Object;)D9
 ": doAfterBody< �
 �= doEndTag? �
 �@ doCatch (Ljava/lang/Throwable;)VBC
 �D 	doFinallyF 
 �G 
						I WRITEK outputM 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; �O
 "P ToStringR e
 VS \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object; �U
 "V 	setOutputX >
 �Y f_false[ :	 8\ unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;^_ coldfusion/runtime/NeoExceptiona
b` t0 [Ljava/lang/String; Anyfde	 h findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)Ijk
bl CFCATCHn bindp {
 Hq unbinds 
 Ht 
	v disableRDSServletx metaData Ljava/lang/Object;z{	 | boolean~ false� &coldfusion/runtime/AttributeCollection� name� access� private� 
returntype� hint� 2Disables the servlet that performs RDS processing.� 
Parameters� ([Ljava/lang/Object;)V �
�� getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc637258255$funcDISABLERDSSERVLET; LocalVariableTable Code getName 	getAccess getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t12 ,Lcoldfusion/runtime/TransientVariableHolder; lock18  Lcoldfusion/tagext/lang/LockTag; mode18 file17 Lcoldfusion/tagext/io/FileTag; t16 t17 t18 Ljava/lang/Throwable; t19 t20 lock20 mode20 file19 t24 t25 t26 t27 t28 t29 #Lcoldfusion/runtime/AbortException; t30 Ljava/lang/Exception; __cfcatchThrowable2 t32 t33 LineNumberTable java/lang/Throwable� !coldfusion/runtime/AbortException� java/lang/Exception� <clinit> 	getOutput 1       � �    � �   de   z{   	 �� �   "     �}�   �       ��   � � �   "     y�   �       ��   � � �         �   �       ��   � � �   "     �   �       ��   �� �   #     � p�   �       ��   �� �  % 
 "  �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
� <� B-2� 6D� B-F� 6� HY-� &� K:-M� 6-^� Q--^� Q--^� Q--^� Q-� WY� [� _a� [YcS� _� ik� q� u� ]-w� 6-y-_� Q--_� Q--_� Q-� WY� [� _a� [YcS� _� ik� q� }-� 6� �-`� Q-� �Y-�� pY�SY�S� �� i� �-�� �� i� ��� �-�� �� i� ��� �-�� �� i� �k� �� �� u� m-w� 6-y� �Y-�� pY�SY�S� �� i� �-�� �� i� ��� �-�� �� i� ��� �-�� �� i� �k� �� �� }-� 6-�� 6-d� Q-�� ��B-w� 6-� �� �� �:-e� Q�� ��� �� �� �� �Y6��-Ҷ 6-� �� �� �:-f� Q۶ ���-y� �� i� � �� �� �� �� �� :���#�-Ҷ 6-h� Q--�� �� i� �� B-��� }� �--� [YSYSY-�� �S�	�� pYS���� �---� [YSYSY-�� �S�	�� pYS����� pY S�"��� 4-o� Q--� [YSYS�	�&-�� ��*�.W� N-�-�� ��2c�5� }-�� �-i� Q-� [YSYS�	�8��;�t|����-w� 6�>��Y�A� :� &���� � #:�E� � :� �:�H�-Ҷ 6-� �� �� �:-v� Q�� ��� �� �� �� �Y6� �-J� 6-� �� �� �:-w� QL� ���-y� �� i� � ��N-w� Q--�Q�T�W�Z� �� �� �� :� K� ��-Ҷ 6�>��w�A� :� &� ��� � #:�E� � :� �:�H�-� 6� -w� 6
�]� B-� 6-� 6� d� j:�:�c:�i�m�    7           o�r-w� 6
�]� B-� 6� �� � : �  �:!�u�!-2� 6-
�Q�-w� 6� !(�����������(�����������Q������ �Q������ ��� h�T���T���T���T��QT� h�Y���Y���Y���Y��QY� h����������������Q��T������� �  V "  ���    ���   ��{   ���   ���   ���   ��{   � - .   � �   � � 	  � � 
  � �   ���   ���   �� �   ���   ��{   ��{   ���   ���   ��{   ���   �� �   ���   ��{   ��{   ���   ���   ��{   ���   ���   ���   ���    ��{ !�  � �  X <Y >Y >Y >Y >Y <Y <Y LZ NZ NZ NZ NZ LZ LZ �^ �^ �^ �^ �^ �^ ^ ^ ^ ^ �^ �^ ^ ^ ^ ^ w^ w^ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_````1`1`1`1`=`=`B`B`B`B`N`N`S`S`S`S`_`_```````|a|a|a|a�a�a�a�a�a�a�a�a�a�a�a�a�a�a�a�a�a�axaxaxaxauaua` w^�d�d�d�deeeeSfSf^f^f^f^fpfpf;f�h�h�h�h�h�h�h�h�h�i�i�i�i�i�k�k�k�k�k�k�k�k�k�k	m	mmmmm�m�m/m/m�m�mFmFmbobohohoYoYoYoYororororoXoXoXop�m�k�i�i�i�i�i�i�i�i�i�i�i�i�i�i�i�i�i�i�i�i�i�i�i�i�g�e8v8v?v?v}w}w�w�w�w�w�w�w�w�w�w�wew v8z8z8z8z6z6z.y�d�}�}�}�}�}�} [\����������    �   #     *� 
�   �       ��   �  �   �     |�� �� �ո �� �� pYgS�i��Y� [Y�SYySY�SY�SYNSY�SY�SYSY�SY	�SY
�SY� [S���}�   �       |��   � � �   "     ��   �       ��        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 8cfsecurity2ecfc637258255$funcGETALLSECUREPROFILESETTINGS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; K L
 " M checkRootAdminUser O java/lang/Object Q _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; S T
 " U java W  coldfusion.server.ServiceFactory Y getSecurityService [ getAllSecureProfileSettings ] 
	 _ java/lang/String a metaData Ljava/lang/Object; c d	  e false g &coldfusion/runtime/AttributeCollection i name k access m public o output q hint s )Returns all settings from Secure Profile. u 
Parameters w ([Ljava/lang/Object;)V  y
 j z getMetadata ()Ljava/lang/Object; this :Lcfsecurity2ecfc637258255$funcGETALLSECUREPROFILESETTINGS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       c d     | }  �   "     � f�    �        ~     � �  �   !     ^�    �        ~     � �  �         �    �        ~     � �  �   #     � b�    �        ~     � �  �  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-T� :-<>� D� J-2� 6-V� :--
� NP� R� VW-W� :--W� :-XZ� D\� R� V� J-X� :--� N^� R� V�-`� 6�    �   z    � ~      � � �    � � d    � � �    � � �    � � �    � � d    � - .    �  �    �  � 	   �  � 
   �  �  �   � %   S < T E T E T G T G T D T D T D T D T < T < T ^ V ^ V ] V ] V ] V n W ~ W ~ W � W � W } W } W v W v W v W v W n W � X � X � X � X � X � X � X ] U     �   #     *� 
�    �        ~     �   �   f     H� jY
� RYlSY^SYnSYpSYrSYhSYtSYvSYxSY	� RS� {� f�    �       H ~     � �  �   !     h�    �        ~         ����  -� 
SourceFile /CFIDE/adminapi/security.cfc 0cfsecurity2ecfc637258255$funcDELETEDISABLEDCFTAG  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   TARGET  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACCESSMANAGER ! AENABLEDCFFUNCTIONS # 	TARGETPOS % SECURITY ' 
TARGETTEMP ) WEBAPP + ARRAYPOS - coldfusion/runtime/CfJspPage / pageContext #Lcoldfusion/runtime/NeoPageContext; 1 2	 0 3 getOut ()Ljavax/servlet/jsp/JspWriter; 5 6 javax/servlet/jsp/JspContext 8
 9 7 parent Ljavax/servlet/jsp/tagext/Tag; ; <	 0 = 	DIRECTORY ? getVariable  (I)Lcoldfusion/runtime/Variable; A B %coldfusion/runtime/ArgumentCollection D
 E C _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; G H
  I TAG K 
		
		
		 M _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V O P
 0 Q / S set (Ljava/lang/Object;)V U V coldfusion/runtime/Variable X
 Y W 
		 [ _setCurrentLineNo (I)V ] ^
 0 _ ArrayNew (I)Ljava/util/List; a b coldfusion/runtime/CFPage d
 e c GETDISABLEDCFTAGS g _get &(Ljava/lang/String;)Ljava/lang/Object; i j
 0 k getDisabledCFTags m java/lang/Object o _autoscalarize q j
 0 r 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; t u
 0 v _List $(Ljava/lang/Object;)Ljava/util/List; x y coldfusion/runtime/Cast {
 | z ArrayToList $(Ljava/util/List;)Ljava/lang/String; ~ 
 e � U ^
 Y �   � 

         � 	component � CFIDE.adminapi.accessmanager � CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; � �
 e � java �  coldfusion.server.ServiceFactory � getSecurityService � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; i �
 0 � checkAdminRoles � coldfusion.sandboxsecurity � 
		
		 � GETSECURABLECFTAGS � getSecurableCFTags � java/lang/String � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 0 � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 | � ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I � �
 e � _boolean (J)Z � �
 | � 
			 � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 0 � coldfusion/tagext/lang/ThrowTag � cfthrow � message � SECURITY_INVALIDTAG � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 0 � 
setMessage (Ljava/lang/String;)V � �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 0 � CONTEXTS � _resolve � �
 0 � q �
 0 � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 | � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 e � throw � setCalledName � �
 � � SANDBOX_NOT_FOUND � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0  	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object;
 e GETTAGPERMISSIONPOSITION getTagPermissionPosition C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; �

 0 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �
 0 * _compare '(Ljava/lang/Object;Ljava/lang/String;)D
 0 Left '(Ljava/lang/String;I)Ljava/lang/String;
 e *- RemoveChars ((Ljava/lang/String;II)Ljava/lang/String;
 e _Object (I)Ljava/lang/Object; !
 |" _int (Ljava/lang/Object;)I$%
 |& ListDeleteAt(
 e) ListLen (Ljava/lang/String;)I+,
 e- (Ljava/lang/Object;D)D/
 00 concat &(Ljava/lang/String;)Ljava/lang/String;23
 �4 _structSetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V67
 08 _LhsResolve: �
 0; _arraySetAt=7
 0> LOGAUDIT@ logauditB msgD java/lang/StringBuilderF  removed tag H  �
GJ append -(Ljava/lang/String;)Ljava/lang/StringBuilder;LM
GN = from the list of disabled tags in the sandbox for directory P .R toString ()Ljava/lang/String;TU
 pV )([Ljava/lang/Object;[Ljava/lang/Object;)V X
 EY b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; t[
 0\ 
	^ deleteDisabledCFTag` metaData Ljava/lang/Object;bc	 d voidf falseh &coldfusion/runtime/AttributeCollectionj namel accessn publicp outputr 
returntypet hintv <Removes a tag from the list of disabled tags in the sandbox.x 
Parametersz REQUIRED| true~ HINT� =Specifies the sandbox directory for which the tag is enabled.� NAME� 	directory� ([Ljava/lang/Object;)V �
k� ,Specifies the name of the tag to be enabled.� tag� getMetadata ()Ljava/lang/Object; this 2Lcfsecurity2ecfc637258255$funcDELETEDISABLEDCFTAG; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw34 !Lcoldfusion/tagext/lang/ThrowTag; throw35 LineNumberTable <clinit> 	getOutput 1       � �   bc   	 �� �   "     �e�   �       ��   �U �   "     a�   �       ��   �� �         �   �       ��   �U �   "     g�   �       ��   �� �   -     � �Y@SYLS�   �       ��   �� �  
�    +� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :+.� :-� 4� ::-� >:*@� F� J:*L� F� J:-N� RT� Z-\� R-� `-� f� Z-\� R-�� `-�� `-h� ln-� pY-@� sS� w� }� �� Z-\� R� �-\� R
�� Z-\� R� �-\� R�� Z-�� R-�� `-��� �� Z-\� R-�� `--�� `-��� ��� p� �� Z-\� R-�� `--� ��� pY�S� �W-�� R-�� `-�� `-�� `-�� l�-� p� w� }� �-� �YLS� �� �� ��� ��� O-�� R-� �� �� �:-�� `��-Ҷ s� �� ֶ �� �� � �-\� R-\� R-�� `--� �Y�S� �-� � � �-� �Y@S� �� �� ��� G-� �� �� �:-�� `�� ���-�� s� ��� ֶ �� �� � �-�� `--� �Y�S� �� pY-� �SY-@� sS��� Z-�� `-� l	-� pY-� �SY-@� sS� w� Z
---� �� �� �YS�� Z-
� ���� � �-�� `-
� � ����� �-�� `-
� � ��� Z-�� `-� � �-L� s� �� ��#� Z-�� `-� � �-� �'�*� Z-�� `-� � ��.�#��1�� 
� Z� %
� Z
-
� � �-� � ��5� Z� 
� Z---� �� �� �YS-
� �9-� �Y�S�<� pY-� �SY-@� sS-� �?-\� R-�� `-A� lC-� EY� �YES� pY�GYI�K-� �YLS� �� ��OQ�O-� �Y@S� �� ��OS�O�WS�Z�]W-_� R�   �   �   ��    ��   �c   ��   ��   ��   �c    ; <    �    � 	   � 
   �    !�    #�    %�    '�    )�    +�    -�    ?�    K�   ��   �� �  �/  z �~ �~ �~ �~ �~ �~ �~ � � � � � � � � � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ������������!�#�#�#�#�!�!�0�:�:�<�<�9�9�9�9�0�0�L�^�^�`�`�]�]�U�U�U�U�L�L�����������������������������������������������������������������C�C�R�R�C�C�C�C�^�^�^�^�B�B�B�B�B�B���������x�B���������������������������������������������*�*�&�&�&�&�$�E�E�K�K�`�`�`�`�i�i�`�`�m�m�������������������������x������������������������������������������������������������������������������������������������
���)�)�)�)�'�`�`�E�3�3�H�H�H�H�/�Q�Q�f�f�o�o�v�v�v�v�Q�B�����������������������������������������������������    �   #     *� 
�   �       ��   �  �   �     ��� ĳ ƻkY� pYmSYaSYoSYqSYsSYiSYuSYgSYwSY	ySY
{SY� pY�kY� pY}SYSY�SY�SY�SY�S��SY�kY� pY}SYSY�SY�SY�SY�S��SS���e�   �       ���   �U �   "     i�   �       ��        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc -cfsecurity2ecfc637258255$funcENABLERDSSERVLET  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   SUCCESS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   WEBX  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 coldfusion/runtime/CFBoolean 7 t_true Lcoldfusion/runtime/CFBoolean; 9 :	 8 ; set (Ljava/lang/Object;)V = > coldfusion/runtime/Variable @
 A ?   C 

		 E *coldfusion/runtime/TransientVariableHolder G &(Lcoldfusion/runtime/NeoPageContext;)V  I
 H J 
			 L _setCurrentLineNo (I)V N O
 " P GetPageContext %()Lcoldfusion/runtime/NeoPageContext; R S coldfusion/runtime/CFPage U
 V T 
getRequest X java/lang/Object Z _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; \ ]
 " ^ getRealPath ` /WEB-INF b _String &(Ljava/lang/Object;)Ljava/lang/String; d e coldfusion/runtime/Cast g
 h f web.xml j concat &(Ljava/lang/String;)Ljava/lang/String; l m java/lang/String o
 p n 
FileExists (Ljava/lang/String;)Z r s
 V t 
				 v PATH x _set '(Ljava/lang/String;Ljava/lang/Object;)V z {
 " | java/lang/StringBuilder ~ SERVER � 
COLDFUSION � ROOTDIR � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 " � (Ljava/lang/String;)V  �
  � FS � _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; � �
 " � append -(Ljava/lang/String;)Ljava/lang/StringBuilder; � �
  � wwwroot � WEB-INF � toString ()Ljava/lang/String; � �
 [ � 	
		
			 � path � 	IsDefined � s
 V � 
				
				 � DISABLERDSSERVLET � _get � �
 " � disableRDSServlet � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 " � $class$coldfusion$tagext$lang$LockTag Ljava/lang/Class; coldfusion.tagext.lang.LockTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 " � coldfusion/tagext/lang/LockTag � 
rdsservlet � setName � �
 � � 	EXCLUSIVE � setType � �
 � � 
setTimeout � O
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 
doStartTag ()I � �
 � � 
					 � "class$coldfusion$tagext$io$FileTag coldfusion.tagext.io.FileTag � � �	  � coldfusion/tagext/io/FileTag � READ � 	setAction � �
 � � cffile � file � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 " � setFile � �
 � � webxml � setVariable � �
 � � setAddnewline � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 " � WEBXML XmlParse 0(Ljava/lang/String;)Lcoldfusion/xml/XmlNodeList;
 V LEN web-app	 _arrayGetAt C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object;
 " _Map #(Ljava/lang/Object;)Ljava/util/Map;
 h XMLCHILDREN 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �
 " ArrayLen (Ljava/lang/Object;)I
 V _Object (D)Ljava/lang/Object;
 h xmlChildren  1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; �"
 "# _Xml 0(Ljava/lang/Object;)Lcoldfusion/xml/XmlNodeList;%&
 h' servlet-mapping) 
XmlElemNew L(Lcoldfusion/xml/XmlNodeList;Ljava/lang/String;)Lcoldfusion/xml/XmlNodeList;+,
 V- _arraySetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V/0
 "1 D(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;)Ljava/lang/Object;3
 "4 _LhsResolve6
 "7 (I)Ljava/lang/Object;9
 h: servlet-name< :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V/>
 "? 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;A
 "B XMLTEXTD 
RDSServletF _structSetAtH>
 "I url-patternK /CFIDE/main/ide.cfmM doAfterBodyO �
 �P doEndTagR �
 �S doCatch (Ljava/lang/Throwable;)VUV
 �W 	doFinallyY 
 �Z WRITE\ output^ ToString` e
 Va \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object; �c
 "d 	setOutputf >
 �g f_falsei :	 8j 

			
			l unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;no coldfusion/runtime/NeoExceptionq
rp t0 [Ljava/lang/String; Anyvtu	 x findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)Iz{
r| CFCATCH~ bind� {
 H� unbind� 
 H� 
	� enableRDSServlet� metaData Ljava/lang/Object;��	 � boolean� false� &coldfusion/runtime/AttributeCollection� name� access� private� 
returntype� hint� 1Enables the servlet that performs RDS processing.� 
Parameters� ([Ljava/lang/Object;)V �
�� getMetadata ()Ljava/lang/Object; this /Lcfsecurity2ecfc637258255$funcENABLERDSSERVLET; LocalVariableTable Code getName 	getAccess getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t12 ,Lcoldfusion/runtime/TransientVariableHolder; lock22  Lcoldfusion/tagext/lang/LockTag; mode22 I file21 Lcoldfusion/tagext/io/FileTag; t16 t17 t18 Ljava/lang/Throwable; t19 t20 lock24 mode24 file23 t24 t25 t26 t27 t28 t29 #Lcoldfusion/runtime/AbortException; t30 Ljava/lang/Exception; __cfcatchThrowable3 t32 t33 LineNumberTable java/lang/Throwable� !coldfusion/runtime/AbortException� java/lang/Exception� <clinit> 	getOutput 1       � �    � �   tu   ��   	 �� �   "     ���   �       ��   � � �   "     ��   �       ��   � � �         �   �       ��   � � �   "     ��   �       ��   �� �   #     � p�   �       ��   �� �  y 
 "  �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
� <� B-2� 6D� B-F� 6� HY-� &� K:-M� 6-�� Q--�� Q--�� Q--�� Q-� WY� [� _a� [YcS� _� ik� q� u� ]-w� 6-y-�� Q--�� Q--�� Q-� WY� [� _a� [YcS� _� ik� q� }-M� 6� �-�� Q-� Y-�� pY�SY�S� �� i� �-�� �� i� ��� �-�� �� i� ��� �-�� �� i� �k� �� �� u� m-w� 6-y� Y-�� pY�SY�S� �� i� �-�� �� i� ��� �-�� �� i� ��� �-�� �� i� �k� �� �� }-M� 6-�� 6-�� Q-�� ���-�� 6-�� Q-�� ��-� [� �W-�� 6-� �� �� �:-�� Qƶ �˶ �� �� �� �Y6�C-ݶ 6-� �� �� �:-�� Q� ���-y� �� i� � ��� �� �� �� � :����-ݶ 6-�� Q--� �� i�� B--�� Q--
��� pYS���c�� }-� [Y
SY!SY-� �S-�� Q--�$�(*�.�2--� [Y
SY!SY-� �S�5�� pYS�8� [Y�;S-�� Q--�$�(=�.�@---� [Y
SY!SY-� �S�5�� pYS�8�;�C�� pYESG�J--� [Y
SY!SY-� �S�5�� pYS�8� [Y�;S-�� Q--�$�(L�.�@---� [Y
SY!SY-� �S�5�� pYS�8�;�C�� pYESN�J-w� 6�Q����T� :� &���� � #:�X� � :� �:�[�-w� 6-� �� �� �:-�� Qƶ �˶ �� �� �� �Y6� �-ݶ 6-� �� �� �:-�� Q]� ���-y� �� i� � ��_-�� Q--�$�b�e�h� �� �� � :� K� ��-w� 6�Q��x�T� :� &� ��� � #:�X� � :� �:�[�-M� 6� -w� 6
�k� B-M� 6-m� 6� f� l:�:�s:�y�}�      9           ��-w� 6
�k� B-M� 6� �� � : �  �:!���!-2� 6-
�$�-�� 6� !H�����������H������������������������������������������������� h�
���
���
���
��
� h������������� h�b���b���b���b��b�
_b�bgb� �  V "  ���    ���   ���   ���   ���   ���   ���   � - .   � �   � � 	  � � 
  � �   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���    ��� !�  v  � <� >� >� >� >� <� <� L� N� N� N� N� L� L� �� �� �� �� �� �� � � � � �� �� � � � � w� w� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ������1�1�1�1�=�=�B�B�B�B�N�N�S�S�S�S�_�_�������|�|�|�|�������������������������������������x�x�x�x�u�u�� w���������������������/�/�6�6�s�s�~�~�~�~�����[����������������������������������� � �����������������-�-�-�-�6�6�,�,�,�,��I�I�O�O�U�U�?�?�v�v���������������������?�������������������������������������������������%�%�%�%�.�.�$�$�$�$���B�B�H�H�N�N�8�8�i�i�}�}�}�}�7������������2�2�>�>�>�>�]�]�\�\�\�\��������������������H�H�H�H�F�F� [�{�{�{�{�{�    �   #     *� 
�   �       ��   �  �   �     |�� �� �� �� �� pYwS�y��Y� [Y�SY�SY�SY�SY_SY�SY�SY�SY�SY	�SY
�SY� [S�����   �       |��   � � �   "     ��   �       ��        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 2cfsecurity2ecfc637258255$funcSETRDSSECURITYENABLED  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / USEADMINPASSWORD 1 boolean 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; m n
 " o checkRootAdminUser q setRdsSecurityEnabled s java/lang/String u _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; w x
 " y ACTION {   } _set '(Ljava/lang/String;Ljava/lang/Object;)V  �
 " � _boolean (Ljava/lang/Object;)Z � � coldfusion/runtime/Cast �
 � � enabled � disabled � LOGAUDIT � &(Ljava/lang/String;)Ljava/lang/Object; m �
 " � logaudit � msg � java/lang/StringBuilder �   � (Ljava/lang/String;)V  �
 � � _autoscalarize � �
 " � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � append -(Ljava/lang/String;)Ljava/lang/StringBuilder; � �
 � �  RDS security. � toString ()Ljava/lang/String; � �
 h � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 9 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � +Specifies whether RDS security is required. � 
Parameters � REQUIRED � Yes � TYPE � HINT � Specify true or false. � NAME � useAdminPassword � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 4Lcfsecurity2ecfc637258255$funcSETRDSSECURITYENABLED; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     t�    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� vY2S�    �       
 � �    � �  �  *    d+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
- ɶ N-PR� X� ^-`� J- ʶ N-- ʶ N-bd� Xf� h� l� ^-`� J- ̶ N--
� pr� h� lW- Ͷ N--� pt� hY-� vY2S� zS� lW-|~� �-� vY2S� z� �� -|�� �� -|�� �-`� J- ض N-�� ��-� 9Y� vY�S� hY� �Y�� �-|� �� �� ��� �� �S� �� �W-�� J�    �   �   d � �    d � �   d � �   d � �   d � �   d � �   d � �   d - .   d  �   d  � 	  d  � 
  d  �   d 1 �  �  * J   � O � Y � Y � [ � [ � X � X � X � X � O � O � k � } � } �  �  � | � | � t � t � t � t � k � k � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �9 �9 �> �> �> �> �> �> �J �J �5 �5 � � � � �     �   #     *� 
�    �        � �    �   �   �     �� �Y� hY�SYtSY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� hY� �Y� hY�SY�SY�SY4SY�SY�SY�SY�S� �SS� � ��    �       � � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc637258255$funcSETUSERDSPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / USEADMINPASSWORD 1 boolean 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; m n
 " o checkRootAdminUser q setRDSSecurityEnabled s java/lang/String u _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; w x
 " y LOGAUDIT { &(Ljava/lang/String;)Ljava/lang/Object; m }
 " ~ logaudit � msg � isapplication �  changed RDS password. � true � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 9 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � setUseRDSPassword � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � +Specifies whether RDS security is required. � 
Parameters � REQUIRED � Yes � TYPE � HINT � Specify true or false. � NAME � useAdminPassword � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc637258255$funcSETUSERDSPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� vY2S�    �       
 � �    � �  �  �    #+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
- �� N-PR� X� ^-`� J- �� N-- �� N-bd� Xf� h� l� ^-`� J- �� N--
� pr� h� lW- �� N--� pt� hY-� vY2S� zS� lW-`� J- Ķ N-|� �-� 9Y� vY�SY�S� hY�SY�S� �� �W-�� J�    �   �   # � �    # � �   # � �   # � �   # � �   # � �   # � �   # - .   #  �   #  � 	  #  � 
  #  �   # 1 �  �   � 0   � O � Y � Y � [ � [ � X � X � X � X � O � O � k � } � } �  �  � | � | � t � t � t � t � k � k � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �
 �
 � � � � � � � � � � �     �   #     *� 
�    �        � �    �   �   �     �� �Y� hY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� hY� �Y� hY�SY�SY�SY4SY�SY�SY�SY�S� �SS� �� ��    �       � � �    � �  �   !     ��    �        � �        ����  - y 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc637258255$funcGETCFIDEDIRECTORY  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   ! javax/servlet/jsp/JspContext #
 $ " parent Ljavax/servlet/jsp/tagext/Tag; & '	  ( 
		 * _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V , -
  . _setCurrentLineNo (I)V 0 1
  2 /CFIDE/ 4 
ExpandPath &(Ljava/lang/String;)Ljava/lang/String; 6 7 coldfusion/runtime/CFPage 9
 : 8 
	 < java/lang/String > getCFIDEDirectory @ metaData Ljava/lang/Object; B C	  D false F &coldfusion/runtime/AttributeCollection H java/lang/Object J name L access N private P output R hint T Returns full path for CFIDE V 
Parameters X ([Ljava/lang/Object;)V  Z
 I [ getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc637258255$funcGETCFIDEDIRECTORY; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       B C     ] ^  b   "     � E�    a        _ `    c d  b   !     A�    a        _ `    e f  b         �    a        _ `    g h  b   #     � ?�    a        _ `    i j  b   �  
   D+� � :+� ,� :	-� � %:-� ):-+� /-�� 3-5� ;�-=� /�    a   f 
   D _ `     D k l    D m C    D n o    D p q    D r s    D t C    D & '    D  u    D  u 	 v   & 	  � 4� 4� 3� 3� 3� 3� 3� 3�     b   #     *� 
�    a        _ `    w   b   f     H� IY
� KYMSYASYOSYQSYSSYGSYUSYWSYYSY	� KS� \� E�    a       H _ `    x d  b   !     G�    a        _ `        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 5cfsecurity2ecfc637258255$funcGETENABLESANDBOXSECURITY  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 

         1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G 
		 K java M  coldfusion.server.ServiceFactory O getSecurityService Q java/lang/Object S _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; U V
 " W _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; Y Z
 " [ checkAdminRoles ] 
enterprise _ Ucoldfusion.sandboxsecurity,coldfusion.serversettings,coldfusion.serversettingssummary a coldfusion/runtime/CFBoolean c f_false Lcoldfusion/runtime/CFBoolean; e f	 d g 
		
		 i java/lang/String k SANDBOXSECURITYENABLED m _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; o p
 " q 
	 s getEnableSandboxSecurity u metaData Ljava/lang/Object; w x	  y false { &coldfusion/runtime/AttributeCollection } name  access � public � output � hint � +Checks whether sandbox security is enabled. � 
Parameters � ([Ljava/lang/Object;)V  �
 ~ � getMetadata ()Ljava/lang/Object; this 7Lcfsecurity2ecfc637258255$funcGETENABLESANDBOXSECURITY; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       w x     � �  �   "     � z�    �        � �    � �  �   !     v�    �        � �    � �  �         �    �        � �    � �  �   #     � l�    �        � �    � �  �  C     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-�� :-<>� D� J-L� 6-�� :--�� :-NP� DR� T� X� J-L� 6-�� :--
� \^� TY`S� XW-L� 6-�� :--
� \^� TYbSY� hS� XW-j� 6-� lYnS� r�-t� 6�    �   z    � � �     � � �    � � x    � � �    � � �    � � �    � � x    � - .    �  �    �  � 	   �  � 
   �  �  �   � 0  � <� F� F� H� H� E� E� E� E� <� <� X� j� j� l� l� i� i� a� a� a� a� X� X� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��     �   #     *� 
�    �        � �    �   �   f     H� ~Y
� TY�SYvSY�SY�SY�SY|SY�SY�SY�SY	� TS� �� z�    �       H � �    � �  �   !     |�    �        � �        ����  -R 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc637258255$funcGETSECUREDFOLDERS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   AFILES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACCESSMANAGER ! SECURITY # I % WEBAPP ' coldfusion/runtime/CfJspPage ) pageContext #Lcoldfusion/runtime/NeoPageContext; + ,	 * - getOut ()Ljavax/servlet/jsp/JspWriter; / 0 javax/servlet/jsp/JspContext 2
 3 1 parent Ljavax/servlet/jsp/tagext/Tag; 5 6	 * 7 	DIRECTORY 9 getVariable  (I)Lcoldfusion/runtime/Variable; ; < %coldfusion/runtime/ArgumentCollection >
 ? = _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 
		 E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 * I / K set (Ljava/lang/Object;)V M N coldfusion/runtime/Variable P
 Q O _setCurrentLineNo (I)V S T
 * U ArrayNew (I)Ljava/util/List; W X coldfusion/runtime/CFPage Z
 [ Y M T
 Q ] 	component _ CFIDE.adminapi.accessmanager a CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; c d
 [ e java g  coldfusion.server.ServiceFactory i getSecurityService k java/lang/Object m _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; o p
 * q _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; s t
 * u checkAdminRoles w Ucoldfusion.sandboxsecurity,coldfusion.serversettings,coldfusion.serversettingssummary y coldfusion/runtime/CFBoolean { f_false Lcoldfusion/runtime/CFBoolean; } ~	 |  java/lang/String � CONTEXTS � _resolve D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 * � _autoscalarize � t
 * � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 * � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � _resolveAndAutoscalarize � �
 * � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 [ � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 * � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � &(Ljava/lang/String;)Ljava/lang/Object; � �
 * � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 * � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 * � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 * � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 [ � C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; � �
 * � CLASS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 * � java.io.FilePermission � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 * � _Object (Z)Ljava/lang/Object; � �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � coldfusion.vfs.VFilePermission � _List $(Ljava/lang/Object;)Ljava/util/List; � �
 � � ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z � �
 [ � _double (Ljava/lang/Object;)D � �
 � � (D)Ljava/lang/Object; � �
 � � ArrayLen (Ljava/lang/Object;)I
 [ (I)Ljava/lang/Object; �
 � '(Ljava/lang/Object;Ljava/lang/Object;)D �
 *	 
	 getSecuredFolders metaData Ljava/lang/Object;	  false &coldfusion/runtime/AttributeCollection name access public output hint 4Returns an array of secured folders for the sandbox.! 
Parameters# REQUIRED% true' HINT) GSpecifies the sandbox directory for which secured folders are returned.+ NAME- 	directory/ ([Ljava/lang/Object;)V 1
2 getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc637258255$funcGETSECUREDFOLDERS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw45 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �       45 9   "     ��   8       67   :; 9   "     �   8       67   <= 9         �   8       67   >? 9   (     
� �Y:S�   8       
67   @A 9  �    �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :-� .� 4:-� 8:*:� @� D:-F� JL� R-,� V-� \� R
--� V-� \� R� ^-/� V-`b� f� R-0� V--0� V-hj� fl� n� r� R-2� V--� vx� nYzSY� �S� rW-4� V--� �Y�S� �-� �� �� �-� �Y:S� �� �� ��� G-� �� �� �:-6� V�� ���-�� ø ��� Ƕ �� �� ҙ �-;� V--� �Y�S� �� nY-� �SY-:� �S� ո ٶ R� ^� �---� �� ܸ �� �Y�S� �� ��~�� �Y� � .W---� �� ܸ �� �Y�S� �� ��~�� � � #-C� V-
� �� �--� �� ܸ �W-� �� �c� � R-� �->� V-� ����
�t|���G-
� ��-� J�   8   �   �67    �BC   �D   �EF   �GH   �IJ   �K   � 5 6   � L   � L 	  � L 
  � L   � !L   � #L   � %L   � 'L   � 9L   �MN O  j �  ( l+ n+ n+ n+ n+ l+ s, }, }, |, |, |, |, s, �- �- �- �- �- �- �- �- �. �. �/ �/ �/ �/ �/ �/ �/ �/ �/ �/ �0 �0 �0 �0 �0 �0 �0 �0 �0 �0 �0 �0 �2 �2 �2 �2 �2 �2 �2 �2 �2 �4 �444 �4 �4 �4 �44444 �4 �4 �4 �4 �4 �4W6W6W6W646 �4�;�;�;�;�;�;�;�;�;�;�;�;x;�>�A�A�A�A�A�A�A�A�A�A�A�A�A�AAA�A�A�A�A�A�A"C"C"C"C.C.C+C+C"C"C"C�A=>=>=>=>F>F>=>=>=>=>;>N>N>[>[>[>[>N>N>�>uGuGuGuGuG l*    9   #     *� 
�   8       67   P  9   �     ��� �� ��Y
� nYSYSYSYSYSYSY SY"SY$SY	� nY�Y� nY&SY(SY*SY,SY.SY0S�3SS�3��   8       �67   Q; 9   "     �   8       67        ����  -a 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc637258255$funcGETDISABLEDCFTAGS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   	ADISABLED  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  AENABLEDTAGS ! ACCESSMANAGER # AENABLED % ANEWENABLED ' SECURITY ) WEBAPP + coldfusion/runtime/CfJspPage - pageContext #Lcoldfusion/runtime/NeoPageContext; / 0	 . 1 getOut ()Ljavax/servlet/jsp/JspWriter; 3 4 javax/servlet/jsp/JspContext 6
 7 5 parent Ljavax/servlet/jsp/tagext/Tag; 9 :	 . ; 	DIRECTORY = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G 
		 I _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V K L
 . M / O set (Ljava/lang/Object;)V Q R coldfusion/runtime/Variable T
 U S _setCurrentLineNo (I)V W X
 . Y ArrayNew (I)Ljava/util/List; [ \ coldfusion/runtime/CFPage ^
 _ ] 

         a 	component c CFIDE.adminapi.accessmanager e CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; g h
 _ i java k  coldfusion.server.ServiceFactory m getSecurityService o java/lang/Object q _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; s t
 . u _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; w x
 . y checkAdminRoles { Ucoldfusion.sandboxsecurity,coldfusion.serversettings,coldfusion.serversettingssummary } coldfusion/runtime/CFBoolean  f_false Lcoldfusion/runtime/CFBoolean; � �	 � � java/lang/String � CONTEXTS � _resolve D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � _autoscalarize � x
 . � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � _resolveAndAutoscalarize � �
 . � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 _ � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 . � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � &(Ljava/lang/String;)Ljava/lang/Object; � �
 . � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 . � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 . � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 _ � ARRAYPOS � GETTAGPERMISSIONPOSITION � w �
 . � getTagPermissionPosition � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 . � TARGET � C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; � �
 . � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � * � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 . � Left '(Ljava/lang/String;I)Ljava/lang/String; � �
 _ � *-  	_contains '(Ljava/lang/String;Ljava/lang/String;)Z
 . RemoveChars ((Ljava/lang/String;II)Ljava/lang/String;
 _ ListToArray $(Ljava/lang/String;)Ljava/util/List;

 _ _List $(Ljava/lang/Object;)Ljava/util/List;
 � 
textnocase asc 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z
 _  
	 getDisabledCFTags metaData Ljava/lang/Object;	   false" &coldfusion/runtime/AttributeCollection$ name& access( public* output, hint. AReturns an array of tags that have been disabled for the sandbox.0 
Parameters2 REQUIRED4 true6 HINT8 ESpecifies the sandbox directory for which disabled tags are returned.: NAME< 	directory> ([Ljava/lang/Object;)V @
%A getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc637258255$funcGETDISABLEDCFTAGS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw31 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �       CD H   "     �!�   G       EF   IJ H   "     �   G       EF   KL H         �   G       EF   MN H   (     
� �Y>S�   G       
EF   OP H  � 
   +� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :-� 2� 8:-� <:*>� D� H:-J� NP� V-J� N-�� Z-� `� V-J� N-�� Z-� `� V-J� N
-�� Z-� `� V-J� N-�� Z-� `� V-J� N-�� Z-� `� V-b� N-�� Z-df� j� V-J� N- � Z-- � Z-ln� jp� r� v� V-J� N-� Z--� z|� rY~SY� �S� vW-J� N-� Z--� �Y�S� �-� �� �� �-� �Y>S� �� �� ��� G-� �� �� �:-� Z�� ���-Ķ Ǹ ��� ˶ �� �� ֙ �-	� Z--� �Y�S� �� rY-� �SY->� �S� ٸ ݶ V-�-� Z-� ��-� rY-� �SY->� �S� � �-�---߶ Ƕ � �� �Y�S� �� �-� ��� ��� � D-� Z-� Ǹ �� ��� '
-� Z-� Z-� Ǹ ��	�� V-� Z-
� ���W-
� ��-� N�   G   �   EF    QR   S   TU   VW   XY   Z    9 :    [    [ 	   [ 
   [    ![    #[    %[    '[    )[    +[    =[   \] ^   �  � |� ~� ~� ~� ~� |� |� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �������������$ 6 6 8 8 5 5 - - - - $ $ YYggllXXXX������������������������				%	%							�	??NNWW????5kkggggd�������������������������������������������������������    H   #     *� 
�   G       EF   _  H   �     ��� �� ��%Y
� rY'SYSY)SY+SY-SY#SY/SY1SY3SY	� rY�%Y� rY5SY7SY9SY;SY=SY?S�BSS�B�!�   G       �EF   `J H   "     #�   G       EF        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc ,cfsecurity2ecfc637258255$funcISSECUREPROFILE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; K L
 " M checkAdminRoles O java/lang/Object Q :coldfusion.serversettings,coldfusion.serversettingssummary S coldfusion/runtime/CFBoolean U f_false Lcoldfusion/runtime/CFBoolean; W X	 V Y _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; [ \
 " ] java _  coldfusion.server.ServiceFactory a getSecurityService c isSecureProfile e 
	 g java/lang/String i metaData Ljava/lang/Object; k l	  m false o &coldfusion/runtime/AttributeCollection q name s access u public w output y hint { <Checks whether secure profile is selected while installation } 
Parameters  ([Ljava/lang/Object;)V  �
 r � getMetadata ()Ljava/lang/Object; this .Lcfsecurity2ecfc637258255$funcISSECUREPROFILE; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       k l     � �  �   "     � n�    �        � �    � �  �   !     f�    �        � �    � �  �         �    �        � �    � �  �   #     � j�    �        � �    � �  �  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-9� :-<>� D� J-2� 6-;� :--
� NP� RYTSY� ZS� ^W-<� :--<� :-`b� Dd� R� ^� J-=� :--� Nf� R� ^�-h� 6�    �   z    � � �     � � �    � � l    � � �    � � �    � � �    � � l    � - .    �  �    �  � 	   �  � 
   �  �  �   � )   8 < 9 E 9 E 9 G 9 G 9 D 9 D 9 D 9 D 9 < 9 < 9 ^ ; ^ ; l ; l ; q ; q ; ] ; ] ; ] ; y < � < � < � < � < � < � < � < � < � < � < y < � = � = � = � = � = � = � = ] :     �   #     *� 
�    �        � �    �   �   f     H� rY
� RYtSYfSYvSYxSYzSYpSY|SY~SY�SY	� RS� �� n�    �       H � �    � �  �   !     p�    �        � �        ����  - 
SourceFile /CFIDE/adminapi/security.cfc 2cfsecurity2ecfc637258255$funcSETDISABLEDDATASOURCE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ALLDSNS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACCESSMANAGER ! SECURITY # DISABLEDDSNS % ADDDB ' WEBAPP ) DB + KEY - coldfusion/runtime/CfJspPage / pageContext #Lcoldfusion/runtime/NeoPageContext; 1 2	 0 3 getOut ()Ljavax/servlet/jsp/JspWriter; 5 6 javax/servlet/jsp/JspContext 8
 9 7 parent Ljavax/servlet/jsp/tagext/Tag; ; <	 0 = 	DIRECTORY ? getVariable  (I)Lcoldfusion/runtime/Variable; A B %coldfusion/runtime/ArgumentCollection D
 E C _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; G H
  I 
DATASOURCE K 
		 M _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V O P
 0 Q / S set (Ljava/lang/Object;)V U V coldfusion/runtime/Variable X
 Y W _setCurrentLineNo (I)V [ \
 0 ] ArrayNew (I)Ljava/util/List; _ ` coldfusion/runtime/CFPage b
 c a coldfusion/runtime/CFBoolean e t_true Lcoldfusion/runtime/CFBoolean; g h	 f i   k GETDISABLEDDATASOURCES m _get &(Ljava/lang/String;)Ljava/lang/Object; o p
 0 q getDisabledDatasources s java/lang/Object u _autoscalarize w p
 0 x 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; z {
 0 | 	component ~ CFIDE.adminapi.accessmanager � CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; � �
 c � java �  coldfusion.server.ServiceFactory � getSecurityService � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; o �
 0 � checkAdminRoles � coldfusion.sandboxsecurity � java/lang/String � CONTEXTS � _resolve D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 0 � w �
 0 � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � _resolveAndAutoscalarize � �
 0 � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 c � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 0 � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 0 � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 0 � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 c � CFIDE.adminapi.datasource � getDatasources � <<All Datasources>> � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 0 � _Object (Z)Ljava/lang/Object; � �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � DB_NOT_FOUND � I  ArrayLen (Ljava/lang/Object;)I
 c (I)Ljava/lang/Object; �
 � _set '(Ljava/lang/String;Ljava/lang/Object;)V	

 0 C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; �
 0 CLASS 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �
 0 #coldfusion.sql.DataSourcePermission _List $(Ljava/lang/Object;)Ljava/util/List;
 � _int
 � ArrayDeleteAt (Ljava/util/List;I)Z
 c  _double (Ljava/lang/Object;)D"#
 �$ (D)Ljava/lang/Object; �&
 �' (Ljava/lang/Object;D)D �)
 0* StructDelete, �
 c- '(Ljava/lang/Object;Ljava/lang/Object;)D �/
 00 ListToArray $(Ljava/lang/String;)Ljava/util/List;23
 c4 java/util/List6 iterator ()Ljava/util/Iterator;897: java/lang/Integer< getClass ()Ljava/lang/Class;>?
 v@ isArray ()ZBC
 �D coldfusion/sql/QueryTableF class$coldfusion$sql$QueryTable coldfusion.sql.QueryTableIH �	 K _cast 7(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;MN
 �O getMetaData ()Ljava/sql/ResultSetMetaData;QR
GS getRowVector ()Ljava/util/Vector;UV coldfusion/sql/imq/imqTableX
YW absolute (I)Z[\
G] java/util/Map_ keySet ()Ljava/util/Set;ab`c java/util/Setef: java/util/Iteratorh next ()Ljava/lang/Object;jkil coldfusion/sql/imq/Rown getColumnList ()[Ljava/lang/String;pq
Gr _queryRowDataToStruct T(Ljava/lang/Object;[Ljava/lang/String;Ljava/lang/Object;)Lcoldfusion/runtime/Struct;tu
 0v relativex\
Gy 
PERMISSION{ 	StructNew ()Ljava/util/Map;}~
 c _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V��
 0� TARGET� ACTION� ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z��
 c� hasNext�Ci� _LhsResolve� �
 0� _arraySetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V��
 0� LOGAUDIT� logaudit� msg� java/lang/StringBuilder�  disables use of datasource �  �
�� append -(Ljava/lang/String;)Ljava/lang/StringBuilder;��
�� " in the sandbox for the directory � .� toString ()Ljava/lang/String;��
 v� )([Ljava/lang/Object;[Ljava/lang/Object;)V �
 E� b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; z�
 0� 	
	� setDisabledDatasource� metaData Ljava/lang/Object;��	 � void� true� &coldfusion/runtime/AttributeCollection� name� access� public� output� 
returntype� hint� -Disables use of a data source in the sandbox.� 
Parameters� REQUIRED� HINT� FSpecifies the sandbox directory for which the data source is disabled.� NAME� 	directory� ([Ljava/lang/Object;)V �
�� 1Specifies the name of the data source to disable.� 
datasource� getMetadata this 4Lcfsecurity2ecfc637258255$funcSETDISABLEDDATASOURCE; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw42 !Lcoldfusion/tagext/lang/ThrowTag; throw43 t23 Ljava/util/Iterator; t24 Lcoldfusion/sql/QueryTable; t25 #Lcoldfusion/sql/QueryTableMetaData; t26 LineNumberTable <clinit> 	getOutput 1       � �   H �   ��   	 �k �   "     ���   �       ��   �� �   "     ��   �       ��   �� �         �   �       ��   �� �   "     ��   �       ��   �q �   -     � �Y@SYLS�   �       ��   �� �  w    -+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :+.� :-� 4� ::-� >:*@� F� J:*L� F� J:-N� RT� Z-|� ^-� d� Z� j� Z
l� Z-� ^-n� rt-� vY-@� yS� }� Zl� Zl� Z-�� ^-�� �� Z-�� ^--�� ^-��� ��� v� �� Z-�� ^--� ��� vY�S� �W-�� ^--� �Y�S� �-� �� �� �-� �Y@S� �� �� ��� G-� �� �� �:-�� ^ɶ ���-ն y� �ɸ ٶ �� �� � �-�� ^--� �Y�S� �� vY-� �SY-@� yS� � � Z-�� ^-�� �� Z
-�� ^-�� ^--� ��� v� �� � Z-L� y� ��~� �Y� �� /W-�� ^--
� �� �-� �YLS� �� �� ��� �� �� G-� �� �� �:-�� ^ɶ ���-�� y� �ɸ ٶ �� �� � �--�� ^-� ����� a---� y�� �� �YS�� ��� "-�� ^--� ��-� y��!W--� y�%g�(�-� y��+����-� �YLS� �� ���-��� >-�� ^--
� �� �--� y�� ��.W--� y�%c�(�-� y-�� ^-� ����1�t|����-�� ^--
� �� �-� �YLS� �� ��.W:::-
� �:� �� � ��5�; :� ��=� � ��5�; :���� �A�E� ��; :����7� ��; :����G� -�L�P�G:�T:�Z�; :�^W��~� ��d �g :� ��m :� ��o� �s�w:�zW� Z-|-�� ^���-|� �YS��-|� �Y�S-� ���-|� �Y�Sl��-�� ^-� ��-|� y��W�� ��\� � 
�^W-� �Y�S��� vY-� �SY-@� yS-� ���-N� R-�� ^-�� r�-� EY� �Y�S� vY��Y���-� �YLS� �� ������-� �Y@S� �� ��������S����W-�� R�   �     -��    -��   -��   -��   -��   -��   -��   - ; <   - �   - � 	  - � 
  - �   - !�   - #�   - %�   - '�   - )�   - +�   - -�   - ?�   - K�   -��   -��   -��   -    -   -�   "H  w �{ �{ �{ �{ �{ �{ �| �| �| �| �| �| �| �| �} �} �} �} �} �} �~ �~ �~ �~ �~ �~ � � � � � � � � � � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��������������/�/�=�=�.�.�.�L�L�[�[�L�L�L�L�g�g�g�g�K�K�K�K�K�K�����������K�����������������������������	�	�������"�"�!�!�!�!�!�!��7�7�=�=�7�7�7�7�Y�Y�Y�Y�b�b�b�b�X�X�X�X�X�X�X�X�7�7�������7��������������������������������������/�/�/�/�9�9�/�/�/�/�+�A�A�H�H���R�R�a�a�o�o�o�o�k�����������������������������������������������������������������k������������������������������������*�*�*�*��A�A�A�A�3�M�M�M�M�V�V�M�M�M��R�{�{�����������������{� �z��������������������������������������������������    �   #     *� 
�   �       ��     �   �     ��� �� �J� ��L��Y� vY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� vY��Y� vY�SY�SY�SY�SY�SY�S��SY��Y� vY�SY�SY�SY�SY�SY�S��SS�߳��   �       ���   � �   "     ��   �       ��        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 9cfsecurity2ecfc637258255$funcSETALLOWCONCURRENTADMINLOGIN  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / ADMINCONCLOGIN 1 boolean 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; m n
 " o checkRootAdminUser q setAllowConcurrentAdminLogin s java/lang/String u _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; w x
 " y LOGAUDIT { &(Ljava/lang/String;)Ljava/lang/Object; m }
 " ~ logaudit � msg � java/lang/StringBuilder � * set concurrent login sessions allowed to  � (Ljava/lang/String;)V  �
 � � _autoscalarize � }
 " � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � append -(Ljava/lang/String;)Ljava/lang/StringBuilder; � �
 � � . � toString ()Ljava/lang/String; � �
 h � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 9 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � USpecifies whether concurrent login sessions are allowed for ColdFusion Administrator. � 
Parameters � REQUIRED � Yes � TYPE � HINT � True or False � NAME � adminconclogin � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this ;Lcfsecurity2ecfc637258255$funcSETALLOWCONCURRENTADMINLOGIN; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     t�    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� vY2S�    �       
 � �    � �  �  �    .+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
-.� N-PR� X� ^-`� J-/� N--/� N-bd� Xf� h� l� ^-`� J-1� N--
� pr� h� lW-2� N--� pt� hY-� vY2S� zS� lW-`� J-5� N-|� �-� 9Y� vY�S� hY� �Y�� �-2� �� �� ��� �� �S� �� �W-�� J�    �   �   . � �    . � �   . � �   . � �   . � �   . � �   . � �   . - .   .  �   .  � 	  .  � 
  .  �   . 1 �  �   � 8   , O . X . X . Z . Z . W . W . W . W . O . O . j / z / z / | / | / y / y / r / r / r / r / j / j / � 1 � 1 � 1 � 1 � 1 � 2 � 2 � 2 � 2 � 2 � 2 � 2 � 0 � 5 � 5 5 5 5 5 5 5 5 5 5 5 � 5 � 5 � 5 � 5 � 5 � 5     �   #     *� 
�    �        � �    �   �   �     �� �Y� hY�SYtSY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� hY� �Y� hY�SY�SY�SY4SY�SY�SY�SY�S� �SS� ѳ ��    �       � � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 3cfsecurity2ecfc637258255$funcCREATEDEFAULTSANDBOXES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - 

         / _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 1 2
   3 _setCurrentLineNo (I)V 5 6
   7 	component 9 CFIDE.adminapi.accessmanager ; CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; = > coldfusion/runtime/CFPage @
 A ? set (Ljava/lang/Object;)V C D coldfusion/runtime/Variable F
 G E 
		 I _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; K L
   M checkAdminRoles O java/lang/Object Q coldfusion.sandboxsecurity S _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; U V
   W *coldfusion/runtime/TransientVariableHolder Y &(Lcoldfusion/runtime/NeoPageContext;)V  [
 Z \ SETSECURITYSANDBOX ^ &(Ljava/lang/String;)Ljava/lang/Object; K `
   a setSecuritySandbox c /* e 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; g h
   i unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable; k l coldfusion/runtime/NeoException n
 o m t0 [Ljava/lang/String; java/lang/String s any u q r	  w findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I y z
 o { ex } bind '(Ljava/lang/String;Ljava/lang/Object;)V  �
 Z � unbind � 
 Z � GETCFIDEDIRECTORY � getCFIDEDirectory � t1 � r	  � GETWEBINFDIRECTORY � getWebInfDirectory � t2 � r	  � LOGAUDIT � logaudit � %coldfusion/runtime/ArgumentCollection � msg �  created default sandboxes. � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 � � b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; g �
   � 
		
	 � createDefaultSandboxes � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � jCreates the default sandboxes needed to secure the ColdFusion Administrator and the WEB-INF system folder. � 
Parameters � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 5Lcfsecurity2ecfc637258255$funcCREATEDEFAULTSANDBOXES; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t11 ,Lcoldfusion/runtime/TransientVariableHolder; t12 #Lcoldfusion/runtime/AbortException; t13 Ljava/lang/Exception; __cfcatchThrowable4 Ljava/lang/Throwable; t15 t16 t17 t18 t19 __cfcatchThrowable5 t21 t22 t23 t24 t25 __cfcatchThrowable6 t27 t28 LineNumberTable !coldfusion/runtime/AbortException � java/lang/Exception � java/lang/Throwable � <clinit> 	getOutput 1       q r    � r    � r    � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   #     � t�    �        � �    � �  �  � 
   Y+� � :+� ,� :	+� :
-� $� *:-� .:-0� 4
-u� 8-:<� B� H-J� 4-v� 8--
� NP� RYTS� XW-J� 4� ZY-� $� ]:-y� 8-_� bd-� RYfS� jW� J� P:�:� p:� x� |�              ~� �� �� � :� �:� ��� ZY-� $� ]:-~� 8-_� bd-� RY-~� 8-�� b�-� R� jS� jW� L� R:�:� p:� �� |�                ~� �� �� � :� �:� ��� ZY-� $� ]:-�� 8-_� bd-� RY-�� 8-�� b�-� R� jS� jW� L� R:�:� p:� �� |�                ~� �� �� � :� �:� ��-J� 4-�� 8-�� b�-� �Y� tY�S� RY�S� �� �W-�� 4�  � � � � � � � � � � � � � � � � � � � �47 �4< �4u �7ru �uzu ���� ���� ���	 ��	 �		 �  �  $   Y � �    Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y + ,   Y  �   Y  � 	  Y  � 
  Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �  �   � 9  t 4u >u >u @u @u =u =u =u =u 4u 4u Xv Xv fv fv Wv Wv Wv Wv �y �y �y �y �y �y �y ux~~~~~~~~~ �}�������������������� uw)�)�E�E�)�)�)�)�     �   #     *� 
�    �        � �    �   �   �     x� tYvS� x� tYvS� �� tYvS� �� �Y� RY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� RS� ĳ ��    �       x � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc637258255$funcVALIDATEDIRECTORY  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   NEWDIR  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - 	DIRECTORY / getVariable  (I)Lcoldfusion/runtime/Variable; 1 2 %coldfusion/runtime/ArgumentCollection 4
 5 3 _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; 7 8
  9 
		 ; _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V = >
   ? _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; A B
   C set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G 

		 K _setCurrentLineNo (I)V M N
   O _String &(Ljava/lang/Object;)Ljava/lang/String; Q R coldfusion/runtime/Cast T
 U S Trim &(Ljava/lang/String;)Ljava/lang/String; W X coldfusion/runtime/CFPage Z
 [ Y Right '(Ljava/lang/String;I)Ljava/lang/String; ] ^
 [ _ /* a _compare '(Ljava/lang/Object;Ljava/lang/String;)D c d
   e concat g X java/lang/String i
 j h 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; A l
   m Left o ^
 [ p / r 	
	 t validateDirectory v metaData Ljava/lang/Object; x y	  z false | &coldfusion/runtime/AttributeCollection ~ java/lang/Object � name � access � private � output � hint � 8Ensure that the directory starts with / and ends with /* � 
Parameters � REQUIRED � true � HINT � &Specifies the directory to be secured. � NAME � 	directory � ([Ljava/lang/Object;)V  �
  � getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc637258255$funcVALIDATEDIRECTORY; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       x y     � �  �   "     � {�    �        � �    � �  �   !     w�    �        � �    � �  �         �    �        � �    � �  �   (     
� jY0S�    �       
 � �    � �  �  `     �+� � :+� ,� :	+� :
-� $� *:-� .:*0� 6� ::-<� @
-0� D� J-L� @-Ӷ P-Ӷ P-0� D� V� \� `b� f�� 
-0� D� Vb� k� J-ٶ P-
� n� V� qs� f�� 
s-
� n� V� k� J-
� n�-u� @�    �   z    � � �     � � �    � � y    � � �    � � �    � � �    � � y    � + ,    �  �    �  � 	   �  � 
   � / �  �   � >  � D� F� F� F� F� D� D� e� e� e� e� e� e� e� e� q� q� e� e� u� u� �� �� �� �� �� �� �� �� �� �� � e� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� e�     �   #     *� 
�    �        � �    �   �   �     u� Y
� �Y�SYwSY�SY�SY�SY}SY�SY�SY�SY	� �Y� Y� �Y�SY�SY�SY�SY�SY�S� �SS� �� {�    �       u � �    � �  �   !     }�    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc :cfsecurity2ecfc637258255$funcGETFUNCTIONPERMISSIONPOSITION  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   PERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  APOS ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 WEBAPP 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; ; <
  = 	DIRECTORY ? 
		 A _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V C D
 $ E _setCurrentLineNo (I)V G H
 $ I ArrayNew (I)Ljava/util/List; K L coldfusion/runtime/CFPage N
 O M set (Ljava/lang/Object;)V Q R coldfusion/runtime/Variable T
 U S Q H
 U W java Y  coldfusion.server.ServiceFactory [ CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ] ^
 O _ getSecurityService a java/lang/Object c _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; e f
 $ g 

		 i java/lang/String k CONTEXTS m _resolve D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; o p
 $ q _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; s t
 $ u _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; w x
 $ y 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; { |
 O } I  _Object (I)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 $ � C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; w �
 $ � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � CLASS � _resolveAndAutoscalarize 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 $ � %coldfusion.runtime.FunctionPermission � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 $ � _double (Ljava/lang/Object;)D � �
 � � (D)Ljava/lang/Object; � �
 � � 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; s �
 $ � ArrayLen (Ljava/lang/Object;)I � �
 O � '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 $ � 
	 � getFunctionPermissionPosition � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � private � output � hint � 4Returns the index in the function permissions array. � 
Parameters � REQUIRED � true � HINT � DSpecifies the name of the web application using the secured sandbox. � NAME � webapp � ([Ljava/lang/Object;)V  �
 � � @Specifies the sandbox directory for which the index is returned. � 	directory � getMetadata ()Ljava/lang/Object; this <Lcfsecurity2ecfc637258255$funcGETFUNCTIONPERMISSIONPOSITION; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   -     � lY4SY@S�    �        � �    � �  �  t    z+� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:*4� :� >:*@� :� >:-B� F
-	 � J-� P� V-B� F� X-B� F-	"� J--	"� J-Z\� `b� d� h� V-j� F
-	&� J--� lYnS� r� dY-4� vSY-@� vS� z� ~� V-�� �� �� H--
-�� v� �� �� lY�S� ��� ��� -�� v� V-�-�� v� �c� �� �-�� v-	(� J-
� �� �� �� ��t|����-� ��-�� F�    �   �   z � �    z � �   z � �   z � �   z � �   z � �   z � �   z / 0   z  �   z  � 	  z  � 
  z  �   z ! �   z 3 �   z ? �  �  J R  	 d	  n	  n	  m	  m	  m	  m	  d	  d	  }	! }	! }	! �	" �	" �	" �	" �	" �	" �	" �	" �	" �	" �	" �	" �	" �	& �	& �	& �	& �	& �	& �	& �	& �	& �	& �	& �	& �	& �	( �	( �	( �	( �	(	+	+ �	+ �	+	+	+%	-%	-%	-%	-#	- �	+1	(1	(1	(1	(:	(:	(1	(1	(1	(1	(.	(B	(B	(O	(O	(O	(O	(B	(B	( �	(i	1i	1i	1i	1i	1 �	$     �   #     *� 
�    �        � �    �   �   �     �� �Y
� dY�SY�SY�SY�SY�SY�SY�SY�SY�SY	� dY� �Y� dY�SY�SY�SY�SY�SY�S� �SY� �Y� dY�SY�SY�SY�SY�SY�S� �SS� ׳ ��    �       � � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 4cfsecurity2ecfc637258255$funcGETUSESINGLERDSPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 

         1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G 
		 K java M  coldfusion.server.ServiceFactory O getSecurityService Q java/lang/Object S _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; U V
 " W _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; Y Z
 " [ checkAdminRoles ] :coldfusion.serversettings,coldfusion.serversettingssummary _ coldfusion/runtime/CFBoolean a f_false Lcoldfusion/runtime/CFBoolean; c d	 b e getUseSingleRdsPassword g 
	 i java/lang/String k getUseSingleRDSPassword m metaData Ljava/lang/Object; o p	  q boolean s false u &coldfusion/runtime/AttributeCollection w name y access { public } output  
returntype � hint � ^Indicates whether or not a user is is required in addition to a password for logging in to RDS � 
Parameters � ([Ljava/lang/Object;)V  �
 x � getMetadata ()Ljava/lang/Object; this 6Lcfsecurity2ecfc637258255$funcGETUSESINGLERDSPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       o p   	  � �  �   "     � r�    �        � �    � �  �   !     n�    �        � �    � �  �         �    �        � �    � �  �   !     t�    �        � �    � �  �   #     � l�    �        � �    � �  �       �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
- ݶ :-<>� D� J-L� 6- ޶ :-- ޶ :-NP� DR� T� X� J-L� 6- � :--
� \^� TY`SY� fS� XW- � :--� \h� T� X�-j� 6�    �   z    � � �     � � �    � � p    � � �    � � �    � � �    � � p    � - .    �  �    �  � 	   �  � 
   �  �  �   � *   � < � F � F � H � H � E � E � E � E � < � < � X � j � j � l � l � i � i � a � a � a � a � X � X � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �     �   #     *� 
�    �        � �    �   �   r     T� xY� TYzSYnSY|SY~SY�SYvSY�SYtSY�SY	�SY
�SY� TS� �� r�    �       T � �    � �  �   !     v�    �        � �        ����  - 
SourceFile /CFIDE/adminapi/security.cfc )cfsecurity2ecfc637258255$funcSETENABLERDS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - FLAG / boolean 1 getVariable  (I)Lcoldfusion/runtime/Variable; 3 4 %coldfusion/runtime/ArgumentCollection 6
 7 5 3coldfusion/tagext/validation/CFTypeValidatorFactory 9 BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; ; <	 : = _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; ? @
  A 

         C _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V E F
   G _setCurrentLineNo (I)V I J
   K 	component M CFIDE.adminapi.accessmanager O CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; Q R coldfusion/runtime/CFPage T
 U S set (Ljava/lang/Object;)V W X coldfusion/runtime/Variable Z
 [ Y 
		 ] _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; _ `
   a checkRootAdminUser c java/lang/Object e _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; g h
   i checkAdminRoles k 
standalone m *coldfusion/runtime/TransientVariableHolder o &(Lcoldfusion/runtime/NeoPageContext;)V  q
 p r _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; t u
   v _boolean (Ljava/lang/Object;)Z x y coldfusion/runtime/Cast {
 | z ENABLERDSSERVLET ~ _ u
   � enableRDSServlet � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
   � DISABLERDSSERVLET � disableRDSServlet � unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable; � � coldfusion/runtime/NeoException �
 � � t0 [Ljava/lang/String; java/lang/String � any � � �	  � findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I � �
 � � ex � bind '(Ljava/lang/String;Ljava/lang/Object;)V � �
 p � unbind � 
 p � 
	 � setEnableRDS � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � +Specifies whether to enable or disable RDS. � 
Parameters � REQUIRED � true � TYPE � HINT � Specify true or false. � NAME � flag � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this +Lcfsecurity2ecfc637258255$funcSETENABLERDS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t12 ,Lcoldfusion/runtime/TransientVariableHolder; t13 #Lcoldfusion/runtime/AbortException; t14 Ljava/lang/Exception; __cfcatchThrowable1 Ljava/lang/Throwable; t16 t17 LineNumberTable !coldfusion/runtime/AbortException � java/lang/Exception � java/lang/Throwable � <clinit> 	getOutput 1       � �    � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� �Y0S�    �       
 � �    � �  �  �    T+� � :+� ,� :	+� :
-� $� *:-� .:*02� 8� >� B:-D� H
-F� L-NP� V� \-^� H-G� L--
� bd� f� jW-^� H-H� L--
� bl� fYnS� jW-^� H� pY-� $� s:-0� w� }� %-M� L-� ��-� f� �W� -Q� L-�� ��-� f� �W� M� S:�:� �:� �� ��                  �� �� �� � :� �:� ��-�� H�  � � � � � � � � � �9  �69 9>9   �   �   T � �    T � �   T � �   T � �   T � �   T � �   T � �   T + ,   T  �   T  � 	  T  � 
  T / �   T � �   T � �   T � �   T � �   T � �   T � �  �   � )  D GF QF QF SF SF PF PF PF PF GF GF kG kG jG jG jG jG �H �H �H �H �H �H �H �H �K �K �M �M �M �M �M �Q �Q �Q �Q �Q �K �J �I     �   #     *� 
�    �        � �      �   �     �� �Y�S� �� �Y� fY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� fY� �Y� fY�SY�SY�SY2SY�SY�SY�SY�S� �SS� ճ ��    �       � � �    �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 0cfsecurity2ecfc637258255$funcENABLESECUREPROFILE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; K L
 " M checkRootAdminUser O java/lang/Object Q _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; S T
 " U java W  coldfusion.server.ServiceFactory Y getSecurityService [ enableSecureProfile ] 
	 _ java/lang/String a metaData Ljava/lang/Object; c d	  e false g &coldfusion/runtime/AttributeCollection i name k access m public o output q hint s @Enables secure profile and applies all required settings for it. u 
Parameters w ([Ljava/lang/Object;)V  y
 j z getMetadata ()Ljava/lang/Object; this 2Lcfsecurity2ecfc637258255$funcENABLESECUREPROFILE; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       c d     | }  �   "     � f�    �        ~     � �  �   !     ^�    �        ~     � �  �         �    �        ~     � �  �   #     � b�    �        ~     � �  �  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-B� :-<>� D� J-2� 6-D� :--
� NP� R� VW-E� :--E� :-XZ� D\� R� V� J-F� :--� N^� R� V�-`� 6�    �   z    � ~      � � �    � � d    � � �    � � �    � � �    � � d    � - .    �  �    �  � 	   �  � 
   �  �  �   � %   A < B E B E B G B G B D B D B D B D B < B < B ^ D ^ D ] D ] D ] D n E ~ E ~ E � E � E } E } E v E v E v E v E n E � F � F � F � F � F � F � F ] C     �   #     *� 
�    �        ~     �   �   f     H� jY
� RYlSY^SYnSYpSYrSYhSYtSYvSYxSY	� RS� {� f�    �       H ~     � �  �   !     h�    �        ~         ����  - � 
SourceFile /CFIDE/adminapi/security.cfc -cfsecurity2ecfc637258255$funcGETALLADMINROLES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 

         1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G 
		 K java M  coldfusion.server.ServiceFactory O getSecurityService Q java/lang/Object S _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; U V
 " W _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; Y Z
 " [ checkRootAdminUser ] getAllAdminRoles _ 
	 a java/lang/String c metaData Ljava/lang/Object; e f	  g &coldfusion/runtime/AttributeCollection i name k 
Parameters m ([Ljava/lang/Object;)V  o
 j p getMetadata ()Ljava/lang/Object; this /Lcfsecurity2ecfc637258255$funcGETALLADMINROLES; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1       e f     r s  w   "     � h�    v        t u    x y  w   !     `�    v        t u    z {  w   #     � d�    v        t u    | }  w  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-�� :-<>� D� J-L� 6-�� :--�� :-NP� DR� T� X� J-L� 6-�� :--
� \^� T� XW-L� 6-�� :--� \`� T� X�-b� 6�    v   z    � t u     � ~     � � f    � � �    � � �    � � �    � � f    � - .    �  �    �  � 	   �  � 
   �  �  �   � &  � <� F� F� H� H� E� E� E� E� <� <� X� j� j� l� l� i� i� a� a� a� a� X� X� �� �� �� �� �� �� �� �� �� �� �� �� ��     w   #     *� 
�    v        t u    �   w   C     %� jY� TYlSY`SYnSY� TS� q� h�    v       % t u        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc -cfsecurity2ecfc637258255$funcSETSECUREDIPPORT  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ST  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  SUCCESS ! ACCESSMANAGER # SECURITY % I ' WEBAPP ) ARRAYPOS + coldfusion/runtime/CfJspPage - pageContext #Lcoldfusion/runtime/NeoPageContext; / 0	 . 1 getOut ()Ljavax/servlet/jsp/JspWriter; 3 4 javax/servlet/jsp/JspContext 6
 7 5 parent Ljavax/servlet/jsp/tagext/Tag; 9 :	 . ; 	DIRECTORY = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G IP I PORT K get (I)Ljava/lang/Object; M N
 C O PORTTYPE Q single S put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; U V
 C W 
		 Y _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V [ \
 . ] / _ set (Ljava/lang/Object;)V a b coldfusion/runtime/Variable d
 e c coldfusion/runtime/CFBoolean g t_true Lcoldfusion/runtime/CFBoolean; i j	 h k _setCurrentLineNo (I)V m n
 . o ArrayNew (I)Ljava/util/List; q r coldfusion/runtime/CFPage t
 u s a n
 e w 	StructNew ()Ljava/util/Map; y z
 u { 	component } CFIDE.adminapi.accessmanager  CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; � �
 u � java �  coldfusion.server.ServiceFactory � getSecurityService � java/lang/Object � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
 . � checkAdminRoles � coldfusion.sandboxsecurity � single,higher,lower,range � java/lang/String � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � ListFind '(Ljava/lang/String;Ljava/lang/String;)I � �
 u � _boolean (J)Z � �
 � � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 . � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � WRONG_PORT_TYPE � _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; � �
 . � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 . � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 . � Len (Ljava/lang/Object;)I � �
 u � BADIP � CONTEXTS � _resolve � �
 . � � �
 . � _arrayGetAt � V
 . � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 u � SANDBOX_NOT_FOUND � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � 
 u C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; �
 . CLASS 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �
 .	 java.net.SocketPermission _compare '(Ljava/lang/Object;Ljava/lang/String;)D
 . TARGET * _List $(Ljava/lang/Object;)Ljava/util/List;
 � _int �
 � ArrayDeleteAt (Ljava/util/List;I)Z
 u _double (Ljava/lang/Object;)D !
 �" _Object (D)Ljava/lang/Object;$%
 �& ArrayLen( �
 u)$ N
 �+ '(Ljava/lang/Object;Ljava/lang/Object;)D-
 .. java/lang/StringBuilder0  �
12 :4 append -(Ljava/lang/String;)Ljava/lang/StringBuilder;67
18 
FORMATPORT: � �
 .< 
formatPort> 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;@A
 .B toString ()Ljava/lang/String;DE
 �F _structSetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)VHI
 .J ACTIONL connect,resolveN ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)ZPQ
 uR _LhsResolveT �
 .U _arraySetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)VWX
 .Y LOGAUDIT[ logaudit] msg_  restricted the ip address a : that cf tags can access in the sandbox for the directory c .e )([Ljava/lang/Object;[Ljava/lang/Object;)V g
 Ch b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object;@j
 .k 	
	m setSecuredIPPorto metaData Ljava/lang/Object;qr	 s falseu &coldfusion/runtime/AttributeCollectionw namey access{ public} output hint� DRestrict the IP addresses and ports that ColdFusion tags can access.� 
Parameters� REQUIRED� true� HINT� NSpecifies the sandbox directory for which the IP address and port are secured.� NAME� 	directory� ([Ljava/lang/Object;)V �
x� %Specifies the IP address to restrict.� Specifies the port to restrict.� DEFAULT� �Specifies the port type:<ul><li>single - Single port</li><li>higher - The specified port and higher</li><li>lower - The specified port and lower</li><li>range - Specified range of ports</li></ul>� portType� getMetadata ()Ljava/lang/Object; this /Lcfsecurity2ecfc637258255$funcSETSECUREDIPPORT; LocalVariableTable Code getName 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw49 !Lcoldfusion/tagext/lang/ThrowTag; throw50 throw51 LineNumberTable <clinit> 	getOutput 1       � �   qr    �� �   "     �t�   �       ��   �E �   "     p�   �       ��   �� �         �   �       ��   �� �   7     � �Y>SYJSYLSYRS�   �       ��   �� �  �    �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :-� 2� 8:-� <:*>� D� H:*J� D� H:*L� D� H:� P� RT� XW� D:-Z� ^`� f� l� f-E� p-� v� f� x
-H� p� |� f� x-K� p-~�� �� f-L� p--L� p-��� ��� �� �� f-M� p--� ��� �Y�S� �W-O� p�-� �YRS� �� �� ��� ��� G-� �� �� �:-Q� p¶ ���-ζ Ҹ �¸ ֶ �� �� � �-T� p-� �YJS� �� 典 ��� G-� �� �� �:-V� p¶ ���-� Ҹ �¸ ֶ �� �� � �-Y� p--� �Y�S� �-� � � �-� �Y>S� �� �� ��� G-� �� �� �:-[� p¶ ���-�� Ҹ �¸ ֶ �� �� � �-_� p--� �Y�S� �� �Y-� �SY->� �S� ��� f� x� �---� �� �� �YS�
��� I---� �� �� �YS�
��� !-i� p--� �-� ��W-� �#c�'� f-� �-c� p-� �*�,�/�t|���[� x� �---� �� �� �YS�
��� �---� �� �� �YS�
�1Y-J� Ҹ ��35�9-t� p-;�=?-� �Y-L� �SY-R� �S�C� ��9�G�/�~�� !-v� p--� �-� ��W-� �#c�'� f-� �-p� p-� �*�,�/�t|���-
� �YS�K-
� �YS�1Y-J� Ҹ ��35�9-}� p-;�=?-� �Y-L� �SY-R� �S�C� ��9�G�K-
� �YMSO�K-� p-� �-
� �SW-� �Y�S�V� �Y-� �SY->� �S-� �Z-Z� ^-�� p-\�=^-� CY� �Y`S� �Y�1Yb�3-� �YJS� �� ��9d�9-� �Y>S� �� ��9f�9�GS�i�lW-n� ^�   �   �   ���    ���   ��r   ���   ���   ���   ��r   � 9 :   � �   � � 	  � � 
  � �   � !�   � #�   � %�   � '�   � )�   � +�   � =�   � I�   � K�   � Q�   ���   ���   ��� �  �;  = �A �A �C �C �C �C �C �C �D �D �D �D �D �D �E �E �E �E �E �E �E �E �F �F �H �H �H �H �H �H �I �I �K �K �K �K �K �K �K �K �K �KLLLLLLLLLLLL4M4MBMBM3M3M3MPOPOROROROROPOPOPOPOPOPO�Q�QpQPO�T�T�T�T�T�T�T�T�V�V�V�T"Y"Y1Y1Y"Y"Y"Y"Y=Y=Y=Y=Y!Y!Y!Y!Y!Y!Yz[z[z[z[W[!Y�_�_�_�_�_�_�_�_�_�_�_�_�_�c�e�e�e�e�e�egggg!g!g4i4i4i4i=i=i=i=i3i3i3ig�eLcLcLcLcUcUcLcLcLcLcJc]c]cjcjcjcjc]c]c�c�p�r�r�r�r�r�r�t�t�t�t�t�t�t�t�t�t�t�t t t	t	t�t�t�t�t�t�t�t�t0v0v0v0v9v9v9v9v/v/v/v�t�rHpHpHpHpQpQpHpHpHpHpFpYpYpfpfpfpfpYpYp�p�|�|�|�|�|�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�~�~�~�~�~��/�/�8�8�?�?�?�?�� �BW�W�z�z���������������������������������v�v�W�W�W�W�    �   #     *� 
�   �       ��   �  �  N    0�� �� ��xY
� �YzSYpSY|SY~SY�SYvSY�SY�SY�SY	� �Y�xY� �Y�SY�SY�SY�SY�SY�S��SY�xY� �Y�SY�SY�SY�SY�SYJS��SY�xY� �Y�SY�SY�SY�SY�SYLS��SY�xY� �Y�SYvSY�SYTSY�SY�SY�SY�S��SS���t�   �      0��   �E �   "     v�   �       ��        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 5cfsecurity2ecfc637258255$funcGETTAGPERMISSIONPOSITION  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   PERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  APOS ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 WEBAPP 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; ; <
  = 	DIRECTORY ? 
		 A _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V C D
 $ E _setCurrentLineNo (I)V G H
 $ I ArrayNew (I)Ljava/util/List; K L coldfusion/runtime/CFPage N
 O M set (Ljava/lang/Object;)V Q R coldfusion/runtime/Variable T
 U S Q H
 U W java Y  coldfusion.server.ServiceFactory [ CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ] ^
 O _ getSecurityService a java/lang/Object c _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; e f
 $ g 

		 i java/lang/String k CONTEXTS m _resolve D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; o p
 $ q _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; s t
 $ u _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; w x
 $ y 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; { |
 O } I  _Object (I)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 $ � C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; w �
 $ � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � CLASS � _resolveAndAutoscalarize 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 $ � &coldfusion.tagext.GenericTagPermission � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 $ � _double (Ljava/lang/Object;)D � �
 � � (D)Ljava/lang/Object; � �
 � � 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; s �
 $ � ArrayLen (Ljava/lang/Object;)I � �
 O � '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 $ � 
	 � getTagPermissionPosition � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � private � output � hint � +Returns the index in the permissions array. � 
Parameters � REQUIRED � true � HINT � DSpecifies the name of the web application using the secured sandbox. � NAME � webapp � ([Ljava/lang/Object;)V  �
 � � @Specifies the sandbox directory for which the index is returned. � 	directory � getMetadata ()Ljava/lang/Object; this 7Lcfsecurity2ecfc637258255$funcGETTAGPERMISSIONPOSITION; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   -     � lY4SY@S�    �        � �    � �  �  t    z+� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:*4� :� >:*@� :� >:-B� F
-�� J-� P� V-B� F� X-B� F-�� J--�� J-Z\� `b� d� h� V-j� F
-	� J--� lYnS� r� dY-4� vSY-@� vS� z� ~� V-�� �� �� H--
-�� v� �� �� lY�S� ��� ��� -�� v� V-�-�� v� �c� �� �-�� v-	� J-
� �� �� �� ��t|����-� ��-�� F�    �   �   z � �    z � �   z � �   z � �   z � �   z � �   z � �   z / 0   z  �   z  � 	  z  � 
  z  �   z ! �   z 3 �   z ? �  �  J R  � d� n� n� m� m� m� m� d� d� }� }� }� �� �� �� �� �� �� �� �� �� �� �� �� �� �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �			 �	 �			%	
%	
%	
%	
#	
 �	1	1	1	1	:	:	1	1	1	1	.	B	B	O	O	O	O	B	B	 �	i	i	i	i	i	 �	      �   #     *� 
�    �        � �    �   �   �     �� �Y
� dY�SY�SY�SY�SY�SY�SY�SY�SY�SY	� dY� �Y� dY�SY�SY�SY�SY�SY�S� �SY� �Y� dY�SY�SY�SY�SY�SY�S� �SS� ׳ ��    �       � � �    � �  �   !     ��    �        � �        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc -cfsecurity2ecfc637258255$funcSETDISABLEDCFTAG  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   TARGET  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACCESSMANAGER ! 	TARGETPOS # SECURITY % 
TARGETTEMP ' WEBAPP ) ARRAYPOS + coldfusion/runtime/CfJspPage - pageContext #Lcoldfusion/runtime/NeoPageContext; / 0	 . 1 getOut ()Ljavax/servlet/jsp/JspWriter; 3 4 javax/servlet/jsp/JspContext 6
 7 5 parent Ljavax/servlet/jsp/tagext/Tag; 9 :	 . ; 	DIRECTORY = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G TAG I 
		
		
		 K _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V M N
 . O / Q set (Ljava/lang/Object;)V S T coldfusion/runtime/Variable V
 W U 
		 Y _setCurrentLineNo (I)V [ \
 . ] ArrayNew (I)Ljava/util/List; _ ` coldfusion/runtime/CFPage b
 c a S \
 W e   g 

         i 	component k CFIDE.adminapi.accessmanager m CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; o p
 c q java s  coldfusion.server.ServiceFactory u getSecurityService w java/lang/Object y _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; { |
 . } 
		        
		  _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
 . � checkAdminRoles � coldfusion.sandboxsecurity � 
		
		 � GETSECURABLECFTAGS � &(Ljava/lang/String;)Ljava/lang/Object; � �
 . � getSecurableCFTags � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _List $(Ljava/lang/Object;)Ljava/util/List; � � coldfusion/runtime/Cast �
 � � ArrayToList $(Ljava/util/List;)Ljava/lang/String; � �
 c � java/lang/String � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I � �
 c � _boolean (J)Z � �
 � � 
			 � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 . � coldfusion/tagext/lang/ThrowTag � cfthrow � message � SECURITY_INVALIDTAG � _autoscalarize � �
 . � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 . � 
setMessage (Ljava/lang/String;)V � �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 . � 

	
	
		 � CONTEXTS � _resolve � �
 . � � �
 . � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 c � throw � setCalledName � �
 � � SANDBOX_NOT_FOUND � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; 
 c GETTAGPERMISSIONPOSITION getTagPermissionPosition C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; �
 .	 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �
 . * _compare '(Ljava/lang/Object;Ljava/lang/String;)D
 . *- LCase &(Ljava/lang/String;)Ljava/lang/String;
 c concat
 � Left '(Ljava/lang/String;I)Ljava/lang/String;
 c RemoveChars ((Ljava/lang/String;II)Ljava/lang/String;!"
 c# _Object (I)Ljava/lang/Object;%&
 �' (Ljava/lang/Object;D)D)
 .* 
ListAppend 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;,-
 c. _structSetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V01
 .2 _LhsResolve4 �
 .5 _arraySetAt71
 .8 LOGAUDIT: logaudit< msg> java/lang/StringBuilder@  disabled use of a tag B  �
AD append -(Ljava/lang/String;)Ljava/lang/StringBuilder;FG
AH  in the sandbox for directory J .L toString ()Ljava/lang/String;NO
 zP )([Ljava/lang/Object;[Ljava/lang/Object;)V R
 CS b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; �U
 .V 
	X setDisabledCFTagZ metaData Ljava/lang/Object;\]	 ^ void` falseb &coldfusion/runtime/AttributeCollectiond namef accessh publicj outputl 
returntypen hintp %Disables use of a tag in the sandbox.r 
Parameterst REQUIREDv truex HINTz HSpecifies the sandbox directory for which the specified tag is disabled.| NAME~ 	directory� ([Ljava/lang/Object;)V �
e� Specifies the tag to disable.� tag� getMetadata ()Ljava/lang/Object; this /Lcfsecurity2ecfc637258255$funcSETDISABLEDCFTAG; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw32 !Lcoldfusion/tagext/lang/ThrowTag; throw33 LineNumberTable <clinit> 	getOutput 1       � �   \]   	 �� �   "     �_�   �       ��   �O �   "     [�   �       ��   �� �         �   �       ��   �O �   "     a�   �       ��   �� �   -     � �Y>SYJS�   �       ��   �� �  
i    �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :-� 2� 8:-� <:*>� D� H:*J� D� H:-L� PR� X-Z� P-6� ^-� d� X-Z� P� f-Z� P
h� X-Z� P� f-Z� Ph� X-j� P-;� ^-ln� r� X-Z� P-<� ^--<� ^-tv� rx� z� ~� X-�� P->� ^--� ��� zY�S� ~W-�� P-@� ^-@� ^-@� ^-�� ��-� z� �� �� �-� �YJS� �� �� ��� ��� O-�� P-� �� �� �:-A� ^��-˶ θ �� Ҷ �� �� �� �-Z� P-� P-F� ^--� �Y�S� �-� � �� �-� �Y>S� �� �� ��� G-� �� �� �:-H� ^�� ���-�� θ ��� Ҷ �� �� �� �-L� ^--� �Y�S� �� zY-� �SY->� �S� ��� X-P� ^-� �-� zY-� �SY->� �S� �� X
---� �
� �� �YS�� X-
� ���� 9
� X
-
� � �-W� ^-J� θ ���� X� �-Y� ^-
� � �� ��� �-[� ^-
� � ��$� X-\� ^-� � �-\� ^-J� θ ��� ��(� X-� ���+�� B-a� ^-� � �-a� ^-J� θ ���/� X
-� � ��� X---� �
� �� �YS-
� �3-� �Y�S�6� zY-� �SY->� �S-� �9-Z� P-m� ^-;� �=-� CY� �Y?S� zY�AYC�E-� �YJS� �� ��IK�I-� �Y>S� �� ��IM�I�QS�T�WW-Y� P�   �   �   ���    ���   ��]   ���   ���   ���   ��]   � 9 :   � �   � � 	  � � 
  � �   � !�   � #�   � %�   � '�   � )�   � +�   � =�   � I�   ���   ��� �  �)  1 �5 �5 �5 �5 �5 �5 �5 �6 �6 �6 �6 �6 �6 �6 �6 �6 �7 �7 �7 �8 �8 �8 �8 �8 �8 �8 �9 �9 �9 �: �: �: �: �: �: �: �; �; �; �; �; �; �; �; �; �; �;
<<<<<<<<<<<
<
<?>?>M>M>>>>>>>>>q@q@q@q@q@q@q@q@q@q@�@�@�@�@q@q@q@q@q@q@�A�A�A�A�Aq@FFFFFFFFFFFF F F F F F FYHYHYHYH6H F�L�L�L�L�L�L�L�L�L�L�L�LzL�P�P�P�P�P�P�P�P�P�P�P�Q�Q�Q�Q�Q�Q�QTT	T	TVVVVVWWWW.W.W.W.W.W.W.W.WWWWWWJYJYJYJYSYSYJYJYWYWYk[k[k[k[t[t[u[u[k[k[k[k[b[�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\|\�^�^�^�^�a�a�a�a�a�a�a�a�a�a�a�a�a�a�a�a�a�b�b�b�b�b�b�b�b�b�b�b�^JYJYT�g�ggggg�gkk0k0k9k9k@k@k@k@kk EXmXm{m{m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�mwmwmXmXmXmXm    �   #     *� 
�   �       ��   �  �   �     ��� �� ��eY� zYgSY[SYiSYkSYmSYcSYoSYaSYqSY	sSY
uSY� zY�eY� zYwSYySY{SY}SYSY�S��SY�eY� zYwSYySY{SY�SYSY�S��SS���_�   �       ���   �O �   "     c�   �       ��        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 'cfsecurity2ecfc637258255$funcDELETEUSER  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / USERNAME 1 getVariable  (I)Lcoldfusion/runtime/Variable; 3 4 %coldfusion/runtime/ArgumentCollection 6
 7 5 _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; 9 :
  ; 
        
         = _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V ? @
 " A _setCurrentLineNo (I)V C D
 " E 	component G CFIDE.adminapi.accessmanager I CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; K L coldfusion/runtime/CFPage N
 O M set (Ljava/lang/Object;)V Q R coldfusion/runtime/Variable T
 U S 		                    
		 W java Y  coldfusion.server.ServiceFactory [ getSecurityService ] java/lang/Object _ _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; a b
 " c 
		 e _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; g h
 " i checkRootAdminUser k 

		 m deleteAuthorizedUser o java/lang/String q _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; s t
 " u LOGAUDIT w &(Ljava/lang/String;)Ljava/lang/Object; g y
 " z logaudit | msg ~ java/lang/StringBuilder �  removed the user  � (Ljava/lang/String;)V  �
 � � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � append -(Ljava/lang/String;)Ljava/lang/StringBuilder; � �
 � � . � toString ()Ljava/lang/String; � �
 ` � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 7 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � 
deleteUser � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � Removes the user. � 
Parameters � REQUIRED � true � HINT � -Specifies the username of the user to delete. � NAME � username � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this )Lcfsecurity2ecfc637258255$funcDELETEUSER; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� rY2S�    �       
 � �    � �  �  �    B+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*2� 8� <:->� B
-	�� F-HJ� P� V-X� B-	�� F--	�� F-Z\� P^� `� d� V-f� B-	�� F--
� jl� `� dW-n� B-	�� F--� jp� `Y-� rY2S� vS� dW-f� B-	�� F-x� {}-� 7Y� rYS� `Y� �Y�� �-� rY2S� v� �� ��� �� �S� �� �W-�� B�    �   �   B � �    B � �   B � �   B � �   B � �   B � �   B � �   B - .   B  �   B  � 	  B  � 
  B  �   B 1 �  �   � 9  	� L	� V	� V	� X	� X	� U	� U	� U	� U	� L	� L	� h	� z	� z	� |	� |	� y	� y	� q	� q	� q	� q	� h	� h	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	�	�	�	�	�	�	�	�	�(	�(	�
	�
	� �	� �	� �	� �	�     �   #     *� 
�    �        � �    �   �   �     �� �Y� `Y�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� `Y� �Y� `Y�SY�SY�SY�SY�SY�S� �SS� ʳ ��    �       � � �    � �  �   !     ��    �        � �        ����  -a 
SourceFile /CFIDE/adminapi/security.cfc 3cfsecurity2ecfc637258255$funcGETDISABLEDCFFUNCTIONS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   TARGET  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   	ADISABLED  PERMISSIONS ! AENABLEDFUNCTIONS # ACCESSMANAGER % SECURITY ' I ) WEBAPP + ARRAYPOS - coldfusion/runtime/CfJspPage / pageContext #Lcoldfusion/runtime/NeoPageContext; 1 2	 0 3 getOut ()Ljavax/servlet/jsp/JspWriter; 5 6 javax/servlet/jsp/JspContext 8
 9 7 parent Ljavax/servlet/jsp/tagext/Tag; ; <	 0 = 	DIRECTORY ? getVariable  (I)Lcoldfusion/runtime/Variable; A B %coldfusion/runtime/ArgumentCollection D
 E C _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; G H
  I 
		 K _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V M N
 0 O / Q set (Ljava/lang/Object;)V S T coldfusion/runtime/Variable V
 W U _setCurrentLineNo (I)V Y Z
 0 [ ArrayNew (I)Ljava/util/List; ] ^ coldfusion/runtime/CFPage `
 a _ S Z
 W c   e 

         g 	component i CFIDE.adminapi.accessmanager k CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; m n
 a o java q  coldfusion.server.ServiceFactory s getSecurityService u java/lang/Object w _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; y z
 0 { _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; } ~
 0  checkAdminRoles � Ucoldfusion.sandboxsecurity,coldfusion.serversettings,coldfusion.serversettingssummary � coldfusion/runtime/CFBoolean � f_false Lcoldfusion/runtime/CFBoolean; � �	 � � 
		
		 � java/lang/String � CONTEXTS � _resolve D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 0 � _autoscalarize � ~
 0 � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � _resolveAndAutoscalarize � �
 0 � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 a � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 0 � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � &(Ljava/lang/String;)Ljava/lang/Object; � �
 0 � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 0 � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 0 � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 a � GETFUNCTIONPERMISSIONPOSITION � } �
 0 � getFunctionPermissionPosition � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 0 � * � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 0 � Left '(Ljava/lang/String;I)Ljava/lang/String; � �
 a � *-  	_contains '(Ljava/lang/String;Ljava/lang/String;)Z
 0 RemoveChars ((Ljava/lang/String;II)Ljava/lang/String;
 a ListToArray $(Ljava/lang/String;)Ljava/util/List;

 a _List $(Ljava/lang/Object;)Ljava/util/List;
 � 
textnocase asc 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z
 a 
	 getDisabledCFFunctions metaData Ljava/lang/Object;	   false" &coldfusion/runtime/AttributeCollection$ name& access( public* output, hint. FReturns an array of functions that have been disabled for the sandbox.0 
Parameters2 REQUIRED4 true6 HINT8 JSpecifies the sandbox directory for which disabled functions are returned.: NAME< 	directory> ([Ljava/lang/Object;)V @
%A getMetadata ()Ljava/lang/Object; this 5Lcfsecurity2ecfc637258255$funcGETDISABLEDCFFUNCTIONS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw36 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �       CD H   "     �!�   G       EF   IJ H   "     �   G       EF   KL H         �   G       EF   MN H   (     
� �Y@S�   G       
EF   OP H  � 	   +� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :+.� :-� 4� ::-� >:*@� F� J:-L� PR� X-L� P-%� \-� b� X-L� P-&� \-� b� X-L� P� d-L� P� d-L� P-)� \-� b� X-L� P
f� X-h� P-+� \-jl� p� X-L� P-,� \--,� \-rt� pv� x� |� X-L� P--� \--� ��� xY�SY� �S� |W-�� P-0� \--� �Y�S� �-� �� �� �-� �Y@S� �� �� ��� G-� �� �� �:-2� \�� ���-̶ ϸ ��� Ӷ �� �� ޙ �-6� \--� �Y�S� �� xY-� �SY-@� �S� � � X-9� \-� ��-� xY-� �SY-@� �S� � X
---� �� � �� �YS� �� X-
� ��� ��� � D-?� \-
� �� �� ��� '-C� \-C� \-
� �� ��	�� X-E� \-� ���W-� ��-� P�   G   �   EF    QR   S   TU   VW   XY   Z    ; <    [    [ 	   [ 
   [    ![    #[    %[    '[    )[    +[    -[    ?[   \] ^   �  " �$ �$ �$ �$ �$ �$ �$ �% �% �% �% �% �% �% �% �% �& �& �& �& �& �& �& �& �& �' �' �' �( �( �( �) �) �) �) �) �) �) �) �) �* �* �* �* �* �* �*	+++++++++	+	+%,7,7,9,9,6,6,.,.,.,.,%,%,Z-Z-h-h-m-m-Y-Y-Y-Y-�0�0�0�0�0�0�0�0�0�0�0�0�0�0�0�0�0�0�2�2�2�2�2�06666&6&6666666�6?9?9N9N9W9W9?9?9?9?969j;j;f;f;f;f;d;�<�<�<�<�?�?�?�?�?�?�?�?�?�?�?�?�?�?�C�C�C�C�C�C�C�C�C�C�C�C�C�C�C�C�C�?�?�<�E�E�E�E�E�E�E�E�E�E�E�F�F�F�F�F�/    H   #     *� 
�   G       EF   _  H   �     ��� �� ��%Y
� xY'SYSY)SY+SY-SY#SY/SY1SY3SY	� xY�%Y� xY5SY7SY9SY;SY=SY?S�BSS�B�!�   G       �EF   `J H   "     #�   G       EF        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc -cfsecurity2ecfc637258255$funcSETSECUREDFOLDER  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ST  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACT ! ACCESSMANAGER # ADDNEWFOLDER % SECURITY ' VFSFILEFACTORY ) PERMISSIONCLASS + WEBAPP - FILEPOS / VFILE 1 coldfusion/runtime/CfJspPage 3 pageContext #Lcoldfusion/runtime/NeoPageContext; 5 6	 4 7 getOut ()Ljavax/servlet/jsp/JspWriter; 9 : javax/servlet/jsp/JspContext <
 = ; parent Ljavax/servlet/jsp/tagext/Tag; ? @	 4 A 	DIRECTORY C getVariable  (I)Lcoldfusion/runtime/Variable; E F %coldfusion/runtime/ArgumentCollection H
 I G _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; K L
  M FOLDER O get (I)Ljava/lang/Object; Q R
 I S FILEREAD U true W put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; Y Z
 I [ 	FILEWRITE ] FILEEXECUTE _ 
FILEDELETE a 
		 c _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V e f
 4 g / i set (Ljava/lang/Object;)V k l coldfusion/runtime/Variable n
 o m _setCurrentLineNo (I)V q r
 4 s ArrayNew (I)Ljava/util/List; u v coldfusion/runtime/CFPage x
 y w 	StructNew ()Ljava/util/Map; { |
 y } k r
 o    � coldfusion/runtime/CFBoolean � t_true Lcoldfusion/runtime/CFBoolean; � �	 � � f_false � �	 � � java � coldfusion.vfs.VFSFileFactory � CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; � �
 y � 	component � CFIDE.adminapi.accessmanager �  coldfusion.server.ServiceFactory � getSecurityService � java/lang/Object � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 4 � _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
 4 � checkIfVFile � _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; � �
 4 � checkAdminRoles � coldfusion.sandboxsecurity � java/lang/String � CONTEXTS � _resolve D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 4 � � �
 4 � _arrayGetAt � Z
 4 � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � _resolveAndAutoscalarize � �
 4 � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 y � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 4 � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 4 � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 4 � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 4 � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; 
 y TARGET <<ALL FILES>> _set '(Ljava/lang/String;Ljava/lang/Object;)V	
 4
 _boolean (Ljava/lang/Object;)Z
 � coldfusion.vfs.VFilePermission getFileObject getAbsolutePath _structSetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V
 4 ram:///- java.io.FilePermission _compare '(Ljava/lang/Object;Ljava/lang/String;)D
 4  _Object (Z)Ljava/lang/Object;"#
 �$ ISRAMALLFILES& � �
 4( isRAMAllFiles* 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;,-
 4. I0" R
 �2 C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; �4
 45 CLASS7 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �9
 4: '(Ljava/lang/Object;Ljava/lang/Object;)D<
 4= _List $(Ljava/lang/Object;)Ljava/util/List;?@
 �A _int (Ljava/lang/Object;)ICD
 �E ArrayDeleteAt (Ljava/util/List;I)ZGH
 yI _double (Ljava/lang/Object;)DKL
 �M (D)Ljava/lang/Object;"O
 �P ArrayLenRD
 yS readU ,W 
ListAppend J(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;YZ
 y[ write] execute_ deletea ACTIONc _arraySetAte
 4f ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Zhi
 yj (Ljava/lang/Object;D)Dl
 4m _LhsResolveo �
 4p :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)Ver
 4s 
	u setSecuredFolderw metaData Ljava/lang/Object;yz	 { void} false &coldfusion/runtime/AttributeCollection� name� access� public� output� 
returntype� hint� 2Makes a folder accessible for the secured sandbox.� 
Parameters� REQUIRED� HINT� @Specifies the sandbox directory for which the folder is enabled.� NAME� 	directory� ([Ljava/lang/Object;)V �
�� 9Specifies the directory path of the folder to be enabled.� folder� DEFAULT� Allow read permission.� fileRead� Allow write permission.� 	fileWrite� Allow execute permission.� fileExecute� Allow delete permission.� 
fileDelete� getMetadata ()Ljava/lang/Object; this /Lcfsecurity2ecfc637258255$funcSETSECUREDFOLDER; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw46 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �   yz   	 �� �   "     �|�   �       ��   �� �   "     x�   �       ��   �� �         �   �       ��   �� �   "     ~�   �       ��   �� �   B     $� �YDSYPSYVSY^SY`SYbS�   �       $��   �� �  �    	/+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :+.� :+0� :+2� :-� 8� >:-� B:*D� J� N:*P� J� N:� T� VX� \W� J:� T� ^X� \W� J:� T� `X� \W� J:� T� bX� \W� J:-d� hj� p-T� t-� z� p
-U� t� ~� p� ��� p� �� p� �� p�� p-[� t-��� �� p-]� t-��� �� p-^� t--^� t-��� ��� �� �� p-a� t--� ��� �Y-P� �S� �� p-c� t--� ��� �Y�S� �W-e� t--� �Y�S� �-� �� �� �-� �YDS� Ÿ ɶ ��� G-� �� �� �:-g� t� ���-�� �� �� � �� �� �� �-k� t--� �Y�S� �� �Y-� �SY-D� �S� ��� p-�-� ��� c� p-� �YPS-p� t--p� t--� �� �Y-� �YPS� �S� �� �� ��-�� � p-� �YPS� ��!�~�%Y�� 7W-y� t-'�)+-� �Y-� �YPS� �S�/���%��8-1�3��---1� ��6� �� �Y8S�;-� ��>�~�� �-� �Y�� >W-�� t-'�)+-� �Y---1� ��6� �� �YS�;S�/�� %-�� t--� ��B-1� ��F�JW� K---1� ��6� �� �YS�;�!�� "-�� t--� ��B-1� ��F�JW-1-1� ��Nc�Q�-1� �-|� t-� ��T�3�>�t|����-V� ��� !-�� t-� �� �VX�\� p-^� ��� !-�� t-� �� �^X�\� p-`� ��� !-�� t-� �� �`X�\� p-b� ��� !-�� t-� �� �bX�\� p-
� �Y8S-� ��-
� �YS-� �YPS� Ŷ-
� �YdS-� ��-1�3�� �---1� ��6� �� �Y8S�;-� ��>�~��%Y�� =W---1� ��6� �� �YS�;-� �YPS� Ÿ>�~��%�� %-� �Y-1� �S-
� ��g� �� p-1-1� ��Nc�Q�-1� �-�� t-� ��T�3�>�t|���,-� ��� -�� t-� ��B-
� ��kW�B-1-�� t-� ��T�3��---1� ��6� �� �Y8S�;-� ��>�~�� �-� ��� e-�� t-'�)+-� �Y---1� ��6� �� �YS�;S�/�� "-�� t--� ��B-1� ��F�JW� [---1� ��6� �� �YS�;-� �YPS� Ÿ>�~�� "-�� t--� ��B-1� ��F�JW-1-1� ��Ng�Q�-1� ���n����-V� ��� !-Ķ t-� �� �VX�\� p-^� ��� !-ƶ t-� �� �^X�\� p-`� ��� !-ȶ t-� �� �`X�\� p-b� ��� !-ʶ t-� �� �bX�\� p-
� �Y8S-� ��-
� �YS-� ��-
� �YdS-� ��-϶ t-� ��B-
� ��kW-� �Y�S�q� �Y-� �SY-D� �S-� ��t-v� h�   �     	/��    	/��   	/�z   	/��   	/��   	/��   	/�z   	/ ? @   	/ �   	/ � 	  	/ � 
  	/ �   	/ !�   	/ #�   	/ %�   	/ '�   	/ )�   	/ +�   	/ -�   	/ /�   	/ 1�   	/ C�   	/ O�   	/ U�   	/ ]�   	/ _�   	/ a�   	/�� �  	r\  K �N �N �O �O �P �P �Q �QSSSSSST%T%T$T$T$T$TT,U5U5U5U5U,U;V;VAWCWCWCWCWAWHXJXJXJXJXHXPYRYRYRYRYPYXZZZZZZZZZXZ_[i[i[k[k[h[h[h[h[_[s]}]}]]]|]|]|]|]s]�^�^�^�^�^�^�^�^�^�^�^�^�a�a�a�a�a�a�a�a�a�c�c�c�c�c�c�c�e�eee�e�e�e�eeeee�e�e�e�e�e�eNgNgNgNg+g�eykyk�k�k�k�kxkxkxkxkxkxkok�l�l�l�l�l�m�m�o�o�o�o�o�p�p�p�p�p�p�p�p�p�p�pqqqqquuuuu�m%y%y4y4y%y%y%y%yPyPyayayPyPyPyPyPyPyPyPy%y%y�|�|�|�|�|�~�~�~�~�~�~�~�~�������������������������������������������4�4�0�0�N�N�a�a�a�a�j�j�j�j�`�`�`�0�0����~||||||||�|�|||||||||x|�|�|�|�|�|�|�|�|�|��������������������������������������������������������������
�
�����(�(�+�+������
�4�4�I�I�I�I�R�R�U�U�I�I�I�I�@�4�k�k�k�k�^���������t���������������������������������������������������������������7�7�?�?�?�?�.�J�J�J�J�H���T�T�T�T�^�^�T�T�T�T�P�f�f�t�t�t�t�f�f�������������������������������������������������������������,�,�(�(���X�X�X�X�a�a�a�a�W�W�W��v�v�r�r�����r�r�����������������������r����������������������������������������������������������0�0�0�0�9�9�<�<�0�0�0�0�'��E�E�Z�Z�Z�Z�c�c�f�f�Z�Z�Z�Z�Q�E�o�o�������������������������{�o�������������������������������������������������%y����	�	�	�	�	�	�	�	���R    �   #     *� 
�   �       ��   �  �  �    �Ѹ ׳ ٻ�Y� �Y�SYxSY�SY�SY�SY�SY�SY~SY�SY	�SY
�SY� �Y��Y� �Y�SYXSY�SY�SY�SY�S��SY��Y� �Y�SYXSY�SY�SY�SY�S��SY��Y� �Y�SY�SY�SYXSY�SY�SY�SY�S��SY��Y� �Y�SY�SY�SYXSY�SY�SY�SY�S��SY��Y� �Y�SY�SY�SYXSY�SY�SY�SY�S��SY��Y� �Y�SY�SY�SYXSY�SY�SY�SY�S��SS���|�   �      ���   �� �   "     ��   �       ��        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc -cfsecurity2ecfc637258255$funcSETADMINPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / PASSWORD 1 string 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C get (I)Ljava/lang/Object; E F
 9 G ISHASHED I false K put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; M N
 9 O boolean Q BOOL_VALIDATOR S >	 < T _validateArgWithValidator V B
  W 

         Y _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V [ \
 " ] _setCurrentLineNo (I)V _ `
 " a 	component c CFIDE.adminapi.accessmanager e CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; g h coldfusion/runtime/CFPage j
 k i set (Ljava/lang/Object;)V m n coldfusion/runtime/Variable p
 q o 
		 s java u  coldfusion.server.ServiceFactory w getSecurityService y java/lang/Object { _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; } ~
 "  _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
 " � checkRootAdminUser � setAdminPassword � java/lang/String � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 " � _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; � �
 " � LOGAUDIT � � �
 " � logaudit � msg �  changed admin password. � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 9 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � +Sets the ColdFusion Administrator password. � 
Parameters � REQUIRED � Yes � TYPE � HINT � Administrator password. � NAME � password � ([Ljava/lang/Object;)V  �
 � � ;Set it to true if the password sent is already hashed once. � no � DEFAULT � isHashed � getMetadata ()Ljava/lang/Object; this /Lcfsecurity2ecfc637258255$funcSETADMINPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   -     � �Y2SYJS�    �        � �    � �  �  �    I+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:� H� JL� PW*JR� :� U� X:-Z� ^
- �� b-df� l� r-t� ^- �� b-- �� b-vx� lz� |� �� r-t� ^- �� b--
� ��� |� �W- �� b--� ��� |Y-� �Y2S� �SY-J� �S� �W-t� ^- �� b-�� ��-� 9Y� �Y�S� |Y�S� �� �W-�� ^�    �   �   I � �    I � �   I � �   I � �   I � �   I � �   I � �   I - .   I  �   I  � 	  I  � 
  I  �   I 1 �   I I �  �   � 2   � U � U � v � � � � � � � � �  �  �  �  � v � v � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �5 �5 � � � � �     �   #     *� 
�    �        � �    �   �   �     ƻ �Y
� |Y�SY�SY�SY�SY�SYLSY�SY�SY�SY	� |Y� �Y� |Y�SY�SY�SY4SY�SY�SY�SY�S� �SY� �Y
� |Y�SY�SY�SY�SY�SYRSY�SYLSY�SY	�S� �SS� ʳ ��    �       � � �    � �  �   !     L�    �        � �        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc 5cfsecurity2ecfc637258255$funcSETDEFAULTFILEPERMISSION  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ST  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  NEWDIR ! ACCESSMANAGER # SECURITY % I ' WILDCARDFOUND ) WEBAPP + coldfusion/runtime/CfJspPage - pageContext #Lcoldfusion/runtime/NeoPageContext; / 0	 . 1 getOut ()Ljavax/servlet/jsp/JspWriter; 3 4 javax/servlet/jsp/JspContext 6
 7 5 parent Ljavax/servlet/jsp/tagext/Tag; 9 :	 . ; 	DIRECTORY = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G 
		 I _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V K L
 . M / O set (Ljava/lang/Object;)V Q R coldfusion/runtime/Variable T
 U S _setCurrentLineNo (I)V W X
 . Y ArrayNew (I)Ljava/util/List; [ \ coldfusion/runtime/CFPage ^
 _ ] coldfusion/runtime/CFBoolean a f_false Lcoldfusion/runtime/CFBoolean; c d	 b e 	StructNew ()Ljava/util/Map; g h
 _ i _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; k l
 . m Q X
 U o 

         q 	component s CFIDE.adminapi.accessmanager u CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; w x
 _ y java {  coldfusion.server.ServiceFactory } getSecurityService  java/lang/Object � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
 . � checkAdminRoles � coldfusion.sandboxsecurity � java/lang/String � CONTEXTS � _resolve D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � k �
 . � _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 _ � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � Trim &(Ljava/lang/String;)Ljava/lang/String; � �
 _ � Right '(Ljava/lang/String;I)Ljava/lang/String; � �
 _ � \ � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 . � _Object (Z)Ljava/lang/Object; � �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � FILESEP � java.lang.System � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 . � � l
 . � getProperty � file.separator � concat � �
 � � C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � CLASS � _resolveAndAutoscalarize 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � java.io.FilePermission � TARGET � <<ALL FILES>> � _structSetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 . � t_true � d	 b � E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 . � - � ACTION � read,write,execute,delete � _List $(Ljava/lang/Object;)Ljava/util/List; � �
 � � ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z � �
 _ � _double (Ljava/lang/Object;)D � �
 � � (D)Ljava/lang/Object; � �
 � � ArrayLen (Ljava/lang/Object;)I 
 _ (I)Ljava/lang/Object; �
 � '(Ljava/lang/Object;Ljava/lang/Object;)D �
 . DIRECTORYPERMISSIONEXISTS
 2(Lcoldfusion/runtime/Variable;I)Ljava/lang/Object; k
 . LICENSE getAppServerPlatform APPSERVER_SUNONE 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; �
 . ROOT_WEBINF_DIR GetPageContext %()Lcoldfusion/runtime/NeoPageContext;
 _ getServletContext getRealPath  WEB-INF" java/lang/StringBuilder$ (Ljava/lang/String;)V &
%' FS) append -(Ljava/lang/String;)Ljava/lang/StringBuilder;+,
%- classes/ toString ()Ljava/lang/String;12
 �3 read5 lib7 _LhsResolve9 �
 .: _arraySetAt< �
 .= 
	? setDefaultFilePermissionA metaData Ljava/lang/Object;CD	 E voidG falseI &coldfusion/runtime/AttributeCollectionK nameM accessO privateQ outputS 
returntypeU hintW IRemoves the wildcard and sets the permission for only the defined folder.Y 
Parameters[ REQUIRED] true_ HINTa .Specifies the directory to receive permission.c NAMEe 	directoryg ([Ljava/lang/Object;)V i
Lj getMetadata ()Ljava/lang/Object; this 7Lcfsecurity2ecfc637258255$funcSETDEFAULTFILEPERMISSION; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1      CD   	 lm q   "     �F�   p       no   r2 q   "     B�   p       no   st q         �   p       no   u2 q   "     H�   p       no   vw q   (     
� �Y>S�   p       
no   xy q  � 	   �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :-� 2� 8:-� <:*>� D� H:-J� NP� V-J� N-Z� Z-� `� V-J� N� f� V-J� N
-\� Z� j� V-J� N->� n� V-J� N� p-r� N-_� Z-tv� z� V-J� N-`� Z--`� Z-|~� z�� �� �� V-J� N-a� Z--� ��� �Y�S� �W-J� N-d� Z--� �Y�S� �� �Y-� �SY->� nS� �� �� V-h� Z-h� Z->� n� �� �� ��� ��~�� �Y� �� 0W-h� Z-h� Z->� n� �� �� �P� ��~�� �� �� -j� Z->� n� �� �� V� R-�-m� Z-|�� z� �-o� Z->� n� �� �-o� Z--�� ��� �Y�S� �� �� Ͷ V� p� �---� �� и �� �Y�S� �ܸ ��� �---� �� и �� �Y�S� �� ��� �---� �� и �� �Y�S-� �� �� � V
-|� Z� j� V-
� �Y�Sܶ �-
� �Y�S-� �� �� Ͷ �-
� �Y�S� �-�� Z-� �� �-
� �� �W-� �� �c� �� V-� �-s� Z-� ����	�t|����-� f� �� p� q---� �� и �� �Y�S� �ܸ ��� >---� �� и �� �Y�S� �-� ��	�~�� -� � ħ 7- �� �X-� �-�� Z-� ����	�t|���n-� �� ��� �Y� �� W-� n� ��� �� �� �
-�� Z� j� V-
� �Y�Sܶ �-
� �Y�S-� �� �-
� �Y�S� �-�� Z-� �� �-
� �� �W
-�� Z� j� V-
� �Y�Sܶ �-
� �Y�S-� �� �� Ͷ �-
� �Y�S� �-�� Z-� �� �-
� �� �W-�� Z--� �� �� �-� �YS��	�~��k--�� Z--�� Z--�� Z-�� �� �!� �Y#S� �� �
-�� Z� j� V-
� �Y�Sܶ �-
� �Y�S�%Y-� n� ��(-*� n� ��.0�.�4� �-
� �Y�S6� �-�� Z-� �� �-
� �� �W
-�� Z� j� V-
� �Y�Sܶ �-
� �Y�S�%Y-� n� ��(-*� n� ��.0�.-*� n� ��.�.�4� �-
� �Y�S6� �-�� Z-� �� �-
� �� �W
-�� Z� j� V-
� �Y�Sܶ �-
� �Y�S�%Y-� n� ��(-*� n� ��.8�.�4� �-
� �Y�S6� �-�� Z-� �� �-
� �� �W
-�� Z� j� V-
� �Y�Sܶ �-
� �Y�S�%Y-� n� ��(-*� n� ��.8�.-*� n� ��.�.�4� �-
� �Y�S6� �-ö Z-� �� �-
� �� �W-� �Y�S�;� �Y-� �SY->� nS-� ��>-@� N�   p   �   �no    �z{   �|D   �}~   ��   ���   ��D   � 9 :   � �   � � 	  � � 
  � �   � !�   � #�   � %�   � '�   � )�   � +�   � =� �  �=  W |Y ~Y ~Y ~Y ~Y |Y |Y �Z �Z �Z �Z �Z �Z �Z �Z �Z �[ �[ �[ �[ �[ �[ �[ �\ �\ �\ �\ �\ �\ �\ �] �] �] �] �] �] �] �^ �^ �^ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_`````````````=a=aKaKa<a<a<a<addddydyd�d�dcdcdcdcdcdcdZd�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�hjjjjjjjj�jmm m mmmmmm1o1o1o1o1o1o1o1oEoEoSoSoDoDoDoDo1o1o1o1o(o�hbsououkuku�u�u�w�w�w�w�w�w�y�y�y�y�y�y�y�z�z�z�z�z�|�|�|�|�|�}�}�}�}�}*�*�*�*��6�6�6�6�?�?�6�6�6��wkuKsKsKsKsTsTsKsKsKsKsIs\s\sisisisis\s\sbs��������������������������������������������������������������������������������+�+�+�+�+�+�+�+�A�A�A�A�A�A�A�A�+�+�_�_�_�_�V�q�q�q�q�e���������v������������������������������������������������������������������������������������������+�&�&�%�%�7�7�%�%�o�o�g�g�����_�_�_�_�T����������������������������������������������������������������������������������-�-�-�-�!�B�B�B�B�O�O�O�O�\�\�b�b�b�b�o�o�>�>�>�>�2���������z������������������������������������������������������������������������������������1�1�1�1�(�C�C�C�C�7�X�X�X�X�e�e�e�e�r�r�x�x�x�x�����T�T�T�T�H�����������������������������%�����������������������Zb    q   #     *� 
�   p       no   �  q   �     ��LY� �YNSYBSYPSYRSYTSYJSYVSYHSYXSY	ZSY
\SY� �Y�LY� �Y^SY`SYbSYdSYfSYhS�kSS�k�F�   p       �no   �2 q   "     J�   p       no        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc 2cfsecurity2ecfc637258255$funcSETDISABLEDCFFUNCTION  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   TARGET  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACCESSMANAGER ! 	TARGETPOS # SECURITY % I ' 
TARGETTEMP ) WEBAPP + ARRAYPOS - coldfusion/runtime/CfJspPage / pageContext #Lcoldfusion/runtime/NeoPageContext; 1 2	 0 3 getOut ()Ljavax/servlet/jsp/JspWriter; 5 6 javax/servlet/jsp/JspContext 8
 9 7 parent Ljavax/servlet/jsp/tagext/Tag; ; <	 0 = 	DIRECTORY ? getVariable  (I)Lcoldfusion/runtime/Variable; A B %coldfusion/runtime/ArgumentCollection D
 E C _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; G H
  I FUNCTIONNAME K 

				
		 M _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V O P
 0 Q / S set (Ljava/lang/Object;)V U V coldfusion/runtime/Variable X
 Y W 
		 [ (I)V U ]
 Y ^ _setCurrentLineNo ` ]
 0 a ArrayNew (I)Ljava/util/List; c d coldfusion/runtime/CFPage f
 g e   i 

         k 	component m CFIDE.adminapi.accessmanager o CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; q r
 g s java u  coldfusion.server.ServiceFactory w getSecurityService y java/lang/Object { _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; } ~
 0  _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
 0 � checkAdminRoles � coldfusion.sandboxsecurity � 
		
		 � GETSECURABLECFFUNCTIONS � &(Ljava/lang/String;)Ljava/lang/Object; � �
 0 � getSecurableCFFunctions � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � _List $(Ljava/lang/Object;)Ljava/util/List; � � coldfusion/runtime/Cast �
 � � ArrayToList $(Ljava/util/List;)Ljava/lang/String; � �
 g � java/lang/String � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 0 � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I � �
 g � _boolean (J)Z � �
 � � 
			 � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 0 � coldfusion/tagext/lang/ThrowTag � cfthrow � message � SECURITY_INVALIDFUNCTION � _autoscalarize � �
 0 � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 0 � 
setMessage (Ljava/lang/String;)V � �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 0 � Trim &(Ljava/lang/String;)Ljava/lang/String; � �
 g � _structSetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 0 � CONTEXTS � _resolve � �
 0 � � �
 0 � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 g � throw � setCalledName � �
 � � SANDBOX_NOT_FOUND 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; �
 0 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object;
 g GETFUNCTIONPERMISSIONPOSITION
 getFunctionPermissionPosition C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; �
 0 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �
 0 * _compare '(Ljava/lang/Object;Ljava/lang/String;)D
 0 *- LCase �
 g concat �
 �  Left '(Ljava/lang/String;I)Ljava/lang/String;"#
 g$ RemoveChars ((Ljava/lang/String;II)Ljava/lang/String;&'
 g( _Object (I)Ljava/lang/Object;*+
 �, (Ljava/lang/Object;D)D.
 0/ 
ListAppend 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;12
 g3 :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V �5
 06 _LhsResolve8 �
 09 _arraySetAt;5
 0< LOGAUDIT> logaudit@ msgB java/lang/StringBuilderD   disabled the use of a function F  �
EH append -(Ljava/lang/String;)Ljava/lang/StringBuilder;JK
EL  in the sandbox for directory N .P toString ()Ljava/lang/String;RS
 |T )([Ljava/lang/Object;[Ljava/lang/Object;)V V
 EW b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; �Y
 0Z 
	\ setDisabledCFFunction^ metaData Ljava/lang/Object;`a	 b voidd falsef &coldfusion/runtime/AttributeCollectionh namej accessl publicn outputp 
returntyper hintt .Disables the use of a function in the sandbox.v 
Parametersx REQUIREDz true| HINT~ MSpecifies the sandbox directory for which the specified function is disabled.� NAME� 	directory� ([Ljava/lang/Object;)V �
i� "Specifies the function to disable.� functionName� getMetadata ()Ljava/lang/Object; this 4Lcfsecurity2ecfc637258255$funcSETDISABLEDCFFUNCTION; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw37 !Lcoldfusion/tagext/lang/ThrowTag; throw38 LineNumberTable <clinit> 	getOutput 1       � �   `a   	 �� �   "     �c�   �       ��   �S �   "     _�   �       ��   �� �         �   �       ��   �S �   "     e�   �       ��   �� �   -     � �Y@SYLS�   �       ��   �� �  
�    +� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :+.� :-� 4� ::-� >:*@� F� J:*L� F� J:-N� RT� Z-\� R� _-\� R-a� b-� h� Z-\� R� _-\� R
j� Z-\� R� _-\� Rj� Z-l� R-f� b-np� t� Z-\� R-g� b--g� b-vx� tz� |� �� Z-\� R-h� b--� ��� |Y�S� �W-�� R-j� b-j� b-j� b-�� ��-� |� �� �� �-� �YLS� �� �� ��� ��� O-�� R-� �� �� �:-k� b��-˶ θ �� Ҷ �� �� �� �-\� R-�� R-� �Y@S-n� b-� �Y@S� �� �� � �-�� R-q� b--� �Y�S� �-� � � �-� �Y@S� �� �� ��� H-� �� �� �:-s� b�� ��-� θ ��� Ҷ �� �� �� �-w� b--� �Y�S� �� |Y-� �SY-@� �S��	� Z-{� b-� �-� |Y-� �SY-@� �S� �� Z
---� �� �� �YS�� Z-
� ���� 9
� Z
-
� � �-�� b-L� θ ���!� Z� �-�� b-
� � ��%��� �-�� b-
� � ��)� Z-�� b-� � �-�� b-L� θ ��� ��-� Z-� ���0�� .
-�� b-
� � �-�� b-L� θ ���4� Z---� �� �� �YS-
� �7-� �Y�S�:� |Y-� �SY-@� �S-� �=-\� R-�� b-?� �A-� EY� �YCS� |Y�EYG�I-� �YLS� �� ��MO�M-� �Y@S� �� ��MQ�M�US�X�[W-]� R�   �   �   ��    ��   �a   ��   ��   ��   �a    ; <    �    � 	   � 
   �    !�    #�    %�    '�    )�    +�    -�    ?�    K�   ��   �� �  �+  [ �_ �_ �_ �_ �_ �_ �_ �` �` �` �a �a �a �a �a �a �a �a �a �b �b �b �c �c �c �c �c �c �c �d �d �d �e �e �e �e �e �e �efffffffffff g2g2g4g4g1g1g)g)g)g)g g gUhUhchchThThThTh�j�j�j�j�j�j�j�j�j�j�j�j�j�j�j�j�j�j�j�j�k�k�k�k�k�j"n"n"n"n"n"n"n"nnnJqJqYqYqJqJqJqJqeqeqeqeqIqIqIqIqIqIq�s�s�s�ssIq�w�w�w�w�w�w�w�w�w�w�w�w�w{{{{{{{{{{�{2|2|.|.|.|.|,|MMSS`�`�`�`�^�h�h�h�h�x�x�x�x�x�x�x�x�h�h�h�h�f����������������������������������������������������������������������������������������������������������������M3�3�H�H�H�H�/�Q�Q�f�f�o�o�v�v�v�v�Q�Ip����������������������������������������������������    �   #     *� 
�   �       ��   �  �   �     ��� �� ��iY� |YkSY_SYmSYoSYqSYgSYsSYeSYuSY	wSY
ySY� |Y�iY� |Y{SY}SYSY�SY�SY�S��SY�iY� |Y{SY}SYSY�SY�SY�S��SS���c�   �       ���   �S �   "     g�   �       ��        ����  -# 
SourceFile /CFIDE/adminapi/security.cfc $cfsecurity2ecfc637258255$funcSETSEED  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  
SEEDLENGTH ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 SEED 3 string 5 getVariable  (I)Lcoldfusion/runtime/Variable; 7 8 %coldfusion/runtime/ArgumentCollection :
 ; 9 3coldfusion/tagext/validation/CFTypeValidatorFactory = STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; ? @	 > A _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; C D
  E 

         G _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V I J
 $ K _setCurrentLineNo (I)V M N
 $ O 	component Q CFIDE.adminapi.accessmanager S CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; U V coldfusion/runtime/CFPage X
 Y W set (Ljava/lang/Object;)V [ \ coldfusion/runtime/Variable ^
 _ ] 
		 a java c  coldfusion.server.ServiceFactory e getSecurityService g java/lang/Object i _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; k l
 $ m LOGAUDIT o _get &(Ljava/lang/String;)Ljava/lang/Object; q r
 $ s logaudit u java/lang/String w msg y $ has set the ColdFusion server seed. { )([Ljava/lang/Object;[Ljava/lang/Object;)V  }
 ; ~ 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 $ � 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; q �
 $ � checkRootAdminUser � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 $ � Len (Ljava/lang/Object;)I � �
 Y � _Object (I)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _autoscalarize � �
 $ � _compare (Ljava/lang/Object;D)D � �
 $ � (Z)Ljava/lang/Object; � �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 $ � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � WRONGSEEDLENGTH � � r
 $ � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 $ � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 $ � setSeed � 
		
	 � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint �  Sets the ColdFusion server seed. � 
Parameters � REQUIRED � Yes � TYPE � HINT � Server seed. � NAME � seed  ([Ljava/lang/Object;)V 
 � getMetadata ()Ljava/lang/Object; this &Lcfsecurity2ecfc637258255$funcSETSEED; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw12 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �    � �     
   "     � �   	           
   !     ۰   	           
         �   	           
   (     
� xY4S�   	       
    
  �    �+� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:*46� <� B� F:-H� L
- �� P-RT� Z� `-b� L- �� P-- �� P-df� Zh� j� n� `-b� L- �� P-p� tv-� ;Y� xYzS� jY|S� � �W-b� L- �� P--
� ��� j� nW- �� P-� xY4S� �� �� �� `-� ��� ��|� �Y� �� W-� �� ��t|� �� �� G-� �� �� �:- �� P�� ���-Ķ Ƹ ��� ζ �� �� ٙ �- �� P--� ��� jY-� xY4S� �S� nW-ݶ L�   	   �   �    �   � �   �   �   �   � �   � / 0   �    �  	  �  
  �    � !   � 3   �    2 L   � W � a � a � c � c � ` � ` � ` � ` � W � W � s � � � � � � � � � � � � � | � | � | � | � s � s � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �* �* �0 �0 �* �* �* �* � � �i �i �F � �� �� �� �� �� �� �� � � �    
   #     *� 
�   	          !  
   �     ��� �� �� �Y
� jY�SY�SY�SY�SY�SY�SY�SY�SY�SY	� jY� �Y� jY�SY�SY�SY6SY�SY�SY�SYS�SS�� �   	       �   " 
   !     �   	               ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 4cfsecurity2ecfc637258255$funcSETUSESINGLERDSPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / USESINGLERDSPASSWORD 1 boolean 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k 
		
		 m _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; o p
 " q checkRootAdminUser s setUseSingleRdsPassword u java/lang/String w _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; y z
 " { LOGAUDIT } &(Ljava/lang/String;)Ljava/lang/Object; o 
 " � logaudit � msg � java/lang/StringBuilder � & changed using single RDS password to  � (Ljava/lang/String;)V  �
 � � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � append -(Ljava/lang/String;)Ljava/lang/StringBuilder; � �
 � � . � toString ()Ljava/lang/String; � �
 h � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 9 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � setUseSingleRDSPassword � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � VSets whether or not to allow a user id in addition to a password for logging in to RDS � 
Parameters � REQUIRED � true � TYPE � NAME � useSingleRDSPassword � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 6Lcfsecurity2ecfc637258255$funcSETUSESINGLERDSPASSWORD; LocalVariableTable Code getName 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   (     
� xY2S�    �       
 � �    � �  �  �    =+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
- � N-PR� X� ^-`� J- � N-- � N-bd� Xf� h� l� ^-n� J- � N--
� rt� h� lW- �� N--� rv� hY-� xY2S� |S� lW-`� J- � N-~� ��-� 9Y� xY�S� hY� �Y�� �-� xY2S� |� �� ��� �� �S� �� �W-�� J�    �   �   = � �    = � �   = � �   = � �   = � �   = � �   = � �   = - .   =  �   =  � 	  =  � 
  =  �   = 1 �  �   � 8   � O � Y � Y � [ � [ � X � X � X � X � O � O � k � } � } �  �  � | � | � t � t � t � t � k � k � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �	 �	 � � � � � � �# �# � � � � � � � � � � �     �   #     *� 
�    �        � �    �   �   �     u� �Y
� hY�SY�SY�SY�SY�SY�SY�SY�SY�SY	� hY� �Y� hY�SY�SY�SY4SY�SY�S� �SS� ʳ ��    �       u � �    � �  �   !     ��    �        � �        ����  - 
SourceFile /CFIDE/adminapi/security.cfc 4cfsecurity2ecfc637258255$funcGETSECURABLECFFUNCTIONS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
AFUNCTIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   ACCESSMANAGER  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 ArrayNew (I)Ljava/util/List; ; < coldfusion/runtime/CFPage >
 ? = set (Ljava/lang/Object;)V A B coldfusion/runtime/Variable D
 E C 

         G 	component I CFIDE.adminapi.accessmanager K CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; M N
 ? O 
		 Q _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; S T
 " U checkAdminRoles W java/lang/Object Y coldfusion.sandboxsecurity [ _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; ] ^
 " _ _autoscalarize a T
 " b _List $(Ljava/lang/Object;)Ljava/util/List; d e coldfusion/runtime/Cast g
 h f M ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z k l
 ? m CreateObject(COM) o CreateObject(CORBA) q CreateObject(Java) s CreateObject(.NET) u CreateObject(WebService) w DirectoryExists y 
ExpandPath { FileOpen } 
FileExists  FileCopy � FileMove � 
FileDelete � FileRead � 
FileUpload � FileUploadAll � 	FileWrite � FileSetAttribute � FileSetAccessmode � FileSetLastModified � GetFileInfo � DirectoryCreate � DirectoryCopy � DirectoryList � DirectoryDelete � DirectoryRename � GetDirectoryFromPath � GetFileFromPath � GetGatewayHelper � GetPrinterInfo � GetProfileString � GetTempDirectory � GetTempFile � GetTemplatePath � GetBaseTemplatePath � LoadCFObject � SaveCFObject � SendGatewayMessage � SetProfileString � CreateDynamicProxy � CacheGetAllIds � CacheGetSession � CacheRemoveAll � CacheRegionNew � CacheRegionRemove � CacheSetProperties � RemoveCachedQuery � GetCpuUsage � GetSystemFreeMemory � GetSystemTotalMemory � GetTotalSpace � GetFreeSpace � GetPageContext � 
textnocase � asc � 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z � �
 ? �  
	 � java/lang/String � getSecurableCFFunctions � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � (Returns an array of securable functions. � 
Parameters � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 6Lcfsecurity2ecfc637258255$funcGETSECURABLECFFUNCTIONS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �    "     � �                  !     �                        �              	    #     � �              
       M+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-�� :-� @� F-H� 6-�� :-JL� P� F-R� 6-�� :--� VX� ZY\S� `W-R� 6-�� :-
� c� ij� nW-�� :-
� c� ip� nW-�� :-
� c� ir� nW- � :-
� c� it� nW-� :-
� c� iv� nW-� :-
� c� ix� nW-� :-
� c� iz� nW-� :-
� c� i|� nW-� :-
� c� i~� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-	� :-
� c� i�� nW-
� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW-� :-
� c� i�� nW- � :-
� c� i�� nW-!� :-
� c� i�� nW-"� :-
� c� i�� nW-#� :-
� c� i�� nW-%� :-
� c� i�� nW-(� :-
� c� i�� nW-)� :-
� c� i�� nW-*� :-
� c� i¸ nW-+� :-
� c� iĸ nW-,� :-
� c� iƸ nW--� :-
� c� iȸ nW-.� :-
� c� iʸ nW-7� :-
� c� i̸ nW-8� :-
� c� iθ nW-9� :-
� c� iи nW-:� :-
� c� iҸ nW-;� :-
� c� iԸ nW-<� :-
� c� iָ nW->� :-
� c� i�ڸ �W-
� c�-� 6�      z   M     M   M �   M   M   M   M �   M - .   M    M  	  M  
  M    .  � <� F� F� E� E� E� E� <� <� U� _� _� a� a� ^� ^� ^� ^� U� U� y� y� �� �� x� x� x� x� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �  �  �  �  �  �  �  �  �  � � � � � � � � �!!!!**!!!7777@@777MMMMVVMMMccccllcccyyyy��yyy����������	�	�	�	�	�	�	�	�	�
�
�
�
�
�
�
�
�
�������������������������))))22)))????HH???UUUU^^UUUkkkkttkkk������������������������������������������������������$$1111::111GGGGPPGGG]]]]ff]]]ssss||sss���������� � � � � � � � � �!�!�!�!�!�!�!�!�!�"�"�"�"�"�"�"�"�"�#�#�#�#�#�#�#�#�#�%�%�%�% % %�%�%�%(((((((((#)#)#)#),),)#)#)#)9*9*9*9*B*B*9*9*9*O+O+O+O+X+X+O+O+O+e,e,e,e,n,n,e,e,e,{-{-{-{-�-�-{-{-{-�.�.�.�.�.�.�.�.�.�7�7�7�7�7�7�7�7�7�8�8�8�8�8�8�8�8�8�9�9�9�9�9�9�9�9�9�:�:�:�:�:�:�:�:�:�;�;�;�;;;�;�;�;<<<<<<<<<+>+>+>+>4>4>6>6>+>+>+><?<?<?<?<? ��       #     *� 
�                   f     H� �Y
� ZY�SY�SY�SY�SY�SY�SY�SY�SY�SY	� ZS� �� �          H        !     �                   ����  -� 
SourceFile /CFIDE/adminapi/security.cfc 2cfsecurity2ecfc637258255$funcSETALLOWEDIPADDRESSES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   IPUTILS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   ACCESSMANAGER  SECURITY ! IPLIST # MGR % IPADDR ' coldfusion/runtime/CfJspPage ) pageContext #Lcoldfusion/runtime/NeoPageContext; + ,	 * - getOut ()Ljavax/servlet/jsp/JspWriter; / 0 javax/servlet/jsp/JspContext 2
 3 1 parent Ljavax/servlet/jsp/tagext/Tag; 5 6	 * 7 DEBUGIP 9 string ; getVariable  (I)Lcoldfusion/runtime/Variable; = > %coldfusion/runtime/ArgumentCollection @
 A ? 3coldfusion/tagext/validation/CFTypeValidatorFactory C STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; E F	 D G _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; I J
  K 
		 M _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V O P
 * Q _setCurrentLineNo (I)V S T
 * U ArrayNew (I)Ljava/util/List; W X coldfusion/runtime/CFPage Z
 [ Y set (Ljava/lang/Object;)V ] ^ coldfusion/runtime/Variable `
 a _   c 
        	 e 	component g CFIDE.adminapi.accessmanager i CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; k l
 [ m _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; o p
 * q checkRootAdminUser s java/lang/Object u _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; w x
 * y java {  coldfusion.server.ServiceFactory } getSecurityService  
		
		 � -coldfusion.servicelayer.ExposedServiceManager � getInstance � _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; � �
 * � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � ListToArray $(Ljava/lang/String;)Ljava/util/List; � �
 [ � I � _Object (I)Ljava/lang/Object; � �
 � � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 * � _arrayGetAt C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; � �
 * � Trim &(Ljava/lang/String;)Ljava/lang/String; � �
 [ � *coldfusion/runtime/TransientVariableHolder � &(Lcoldfusion/runtime/NeoPageContext;)V  �
 � � VALIDATEDIPADDR � getExpandedIPNValidate � � p
 * � IPVALID � coldfusion/runtime/CFBoolean � t_true Lcoldfusion/runtime/CFBoolean; � �	 � � unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable; � � coldfusion/runtime/NeoException �
 � � t0 [Ljava/lang/String; java/lang/String � any � � �	  � findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I � �
 � � ex � bind � �
 � � f_false � �	 � � unbind � 
 � � _boolean (Ljava/lang/Object;)Z � �
 � � getAllowedIPList � ListFind '(Ljava/lang/String;Ljava/lang/String;)I � �
 [ � (J)Z � �
 � � (Z)Ljava/lang/Object; � �
 � � setAllowedIPList � 
ListAppend 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 [ � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 * � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V coldfusion/tagext/GenericTag
 cfthrow message	 	INVALIDIP concat �
 � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
 * 
setMessage
 � 	hasEndTag (Z)V
 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z
 * _double (Ljava/lang/Object;)D 
 �! (D)Ljava/lang/Object; �#
 �$ ArrayLen (Ljava/lang/Object;)I&'
 [( _compare '(Ljava/lang/Object;Ljava/lang/Object;)D*+
 *, LOGAUDIT. o �
 *0 logaudit2 msg4 java/lang/StringBuilder6 d added a list of one or more client IP addresses that should be allowed to invoke exposed services: 8 
7: _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object;<=
 *> append -(Ljava/lang/String;)Ljava/lang/StringBuilder;@A
7B .D toString ()Ljava/lang/String;FG
 vH )([Ljava/lang/Object;[Ljava/lang/Object;)V J
 AK 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object;MN
 *O 
	Q setAllowedIPAddressesS metaData Ljava/lang/Object;UV	 W voidY false[ &coldfusion/runtime/AttributeCollection] name_ accessa publicc outpute 
returntypeg hinti aSets a list of one or more client IP addresses that should be allowed to invoke exposed services.k 
Parametersm REQUIREDo Yesq TYPEs HINTu List of IP addresses.w NAMEy debugip{ ([Ljava/lang/Object;)V }
^~ getMetadata ()Ljava/lang/Object; this 4Lcfsecurity2ecfc637258255$funcSETALLOWEDIPADDRESSES; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t17 ,Lcoldfusion/runtime/TransientVariableHolder; t18 #Lcoldfusion/runtime/AbortException; t19 Ljava/lang/Exception; __cfcatchThrowable7 Ljava/lang/Throwable; t21 t22 throw54 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable !coldfusion/runtime/AbortException� java/lang/Exception� java/lang/Throwable� <clinit> 	getOutput 1       � �    � �   UV   	 �� �   "     �X�   �       ��   �G �   "     T�   �       ��   �� �         �   �       ��   �G �   "     Z�   �       ��   �� �   (     
� �Y:S�   �       
��   �� �  #    �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :-� .� 4:-� 8:*:<� B� H� L:-N� R-	�� V-� \� b-N� Rd� b-f� R-	�� V-hj� n� b-N� R-	�� V--� rt� v� zW-N� R-	�� V--	�� V-|~� n�� v� z� b-�� R-	�� V-|�� n� b
-	�� V--� r�� v� z� b-	�� V-:� �� �� �� b-�� �� ���-	�� V--�� �� �� �� �� b� �Y-� .� �:-�-	�� V--
� r�� vY-� �S� z� �-�� �� �� S� Y:�:� �:� Ǹ ˪   &           �� �-�� Ӷ �� �� � :� �:� ֩-�� �Y� ڙ :W-	�� V-	�� V--� r�� v� z� �-�� �� �� ��� ��� � ڙ N-	�� V--� r�� vY-	�� V-	�� V--� r�� v� z� �-�� �� �� �S� zW� f-�� �� ��� X-� �� �� �:-	�� V �
-� �� �-� �� �� ����� �-�-�� ��"c�%� �-�� �-	�� V-� ��)� ��-�t|���-N� R-	¶ V-/�13-� AY� �Y5S� vY�7Y9�;-� �Y:S�?� ��CE�C�IS�L�PW-R� R� �������������������� �   �   ���    ���   ��V   ���   ���   ���   ��V   � 5 6   � �   � � 	  � � 
  � �   � !�   � #�   � %�   � '�   � 9�   ���   ���   ���   ���   ���   ��V   ��� �  J �  	� o	� y	� y	� x	� x	� x	� x	� o	� o	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� 	�
	�
	�	�	�		�		�		�		� 	�	�	�	�	�	�	�	�	�9	�9	�9	�9	�9	�9	�9	�9	�0	�K	�K	�K	�K	�H	�a	�a	�^	�^	�^	�^	�^	�^	�^	�^	�U	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	�s	�	�	�	�	�(	�(	�'	�'	�'	�'	�:	�:	�:	�:	�'	�'	�'	�'	�'	�'	�'	�'	�	�	�]	�]	�z	�z	�y	�y	�y	�y	��	��	��	��	�y	�y	�\	�\	�\	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�$	�$	�$	�$	�	�	�H	� 	�M	�M	�p	�p	�v	�v	�v	�v	�v	�v	��	��	�l	�l	�M	�M	�M	�M	�    �   #     *� 
�   �       ��   �  �   �     �� �Y�S� �� �� ��^Y� vY`SYTSYbSYdSYfSY\SYhSYZSYjSY	lSY
nSY� vY�^Y� vYpSYrSYtSY<SYvSYxSYzSY|S�SS��X�   �       ���   �G �   "     \�   �       ��        ����  -t 
SourceFile /CFIDE/adminapi/security.cfc 3cfsecurity2ecfc637258255$funcGETDISABLEDDATASOURCES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ALLDSNS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACCESSMANAGER ! SECURITY # I % WEBAPP ' DB ) coldfusion/runtime/CfJspPage + pageContext #Lcoldfusion/runtime/NeoPageContext; - .	 , / getOut ()Ljavax/servlet/jsp/JspWriter; 1 2 javax/servlet/jsp/JspContext 4
 5 3 parent Ljavax/servlet/jsp/tagext/Tag; 7 8	 , 9 	DIRECTORY ; getVariable  (I)Lcoldfusion/runtime/Variable; = > %coldfusion/runtime/ArgumentCollection @
 A ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; C D
  E 
		 G _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V I J
 , K / M set (Ljava/lang/Object;)V O P coldfusion/runtime/Variable R
 S Q _setCurrentLineNo (I)V U V
 , W ArrayNew (I)Ljava/util/List; Y Z coldfusion/runtime/CFPage \
 ] [   _ O V
 S a 	component c CFIDE.adminapi.accessmanager e CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; g h
 ] i java k  coldfusion.server.ServiceFactory m getSecurityService o java/lang/Object q _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; s t
 , u _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; w x
 , y checkAdminRoles { Ucoldfusion.sandboxsecurity,coldfusion.serversettings,coldfusion.serversettingssummary } coldfusion/runtime/CFBoolean  f_false Lcoldfusion/runtime/CFBoolean; � �	 � � CFIDE.adminapi.datasource � getDatasources � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 ] � java/lang/String � CONTEXTS � _resolve D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 , � _autoscalarize � x
 , � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 , � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � _resolveAndAutoscalarize � �
 , � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 ] � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 , � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � &(Ljava/lang/String;)Ljava/lang/Object; � �
 , � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 , � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 , � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 , � C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; � �
 , � CLASS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 , � #coldfusion.sql.DataSourcePermission � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 , � _Object (Z)Ljava/lang/Object; � �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � TARGET � * � 	StructNew ()Ljava/util/Map; � �
 ] � StructDelete  �
 ] _double (Ljava/lang/Object;)D
 � (D)Ljava/lang/Object; �
 � ArrayLen (Ljava/lang/Object;)I

 ] (I)Ljava/lang/Object; �
 � '(Ljava/lang/Object;Ljava/lang/Object;)D �
 , StructKeyList #(Ljava/util/Map;)Ljava/lang/String;
 ] ListToArray $(Ljava/lang/String;)Ljava/util/List;
 ] _List $(Ljava/lang/Object;)Ljava/util/List;
 � 
textnocase  asc" 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z$%
 ]& 
	( getDisabledDatasources* metaData Ljava/lang/Object;,-	 . array0 false2 &coldfusion/runtime/AttributeCollection4 name6 access8 public: output< 
returntype> hint@ IReturns an array of data sources that have been disabled for the sandbox.B 
ParametersD REQUIREDF trueH HINTJ MSpecifies the sandbox directory for which disabled data sources are returned.L NAMEN 	directoryP ([Ljava/lang/Object;)V R
5S getMetadata ()Ljava/lang/Object; this 5Lcfsecurity2ecfc637258255$funcGETDISABLEDDATASOURCES; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw41 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �   ,-   	 UV Z   "     �/�   Y       WX   [\ Z   "     +�   Y       WX   ]^ Z         �   Y       WX   _\ Z   "     1�   Y       WX   `a Z   (     
� �Y<S�   Y       
WX   bc Z  �    R+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :-� 0� 6:-� ::*<� B� F:-H� LN� T-L� X-� ^� T
`� T`� T� b-Q� X-df� j� T-R� X--R� X-ln� jp� r� v� T-T� X--� z|� rY~SY� �S� vW-V� X-d�� j� T
-W� X-W� X--� z�� r� v� �� T-Y� X--� �Y�S� �-� �� �� �-� �Y<S� �� �� ��� G-� �� �� �:-[� X�� ���-̶ ϸ ��� Ӷ �� �� ޙ �-`� X--� �Y�S� �� rY-� �SY-<� �S� � �� T� b� �---� �� � �� �Y�S� �� ��~�� �Y� �� .W---� �� � �� �Y�S� ��� ��~�� � �� 
-i� X� �� T� �� ]---� �� � �� �Y�S� �� ��� 7-n� X--
� �� �---� �� � �� �Y�S� � ��W-� ��c�	� T-� �-c� X-� �����t|����
-q� X-q� X--
� �� ���� T-r� X-
� ��!#�'W-
� ��-)� L�   Y   �   RWX    Rde   Rf-   Rgh   Rij   Rkl   Rm-   R 7 8   R n   R n 	  R n 
  R n   R !n   R #n   R %n   R 'n   R )n   R ;n   Rop q  b �  H tK vK vK vK vK tK {L �L �L �L �L �L �L {L �M �M �M �M �M �M �N �N �N �N �N �N �O �O �Q �Q �Q �Q �Q �Q �Q �Q �Q �Q �R �R �R �R �R �R �R �R �R �R �R �R �T �T �T �T �T �T �T �T �TVVVVVVVV �V!W!W W W W W W WW>Y>YMYMY>Y>Y>Y>YYYYYYYYY=Y=Y=Y=Y=Y=Y�[�[�[�[s[=Y�`�`�`�`�`�`�`�`�`�`�`�`�`�c�f�f�f�fff�f�f�f�f.f.f*f*fFfFf*f*f*f*f�f�fciciciciZiijslslolol�l�l�n�n�n�n�n�n�n�n�n�n�n�n�nolol�f�c�c�c�c�c�c�c�c�c�c�c�c�c�c�c�c�c�c�c�cqqqqqqqqqqqqq-r-r-r-r6r6r9r9r-r-r-r@s@s@s@s@s tJ    Z   #     *� 
�   Y       WX   r  Z   �     ��� �� ��5Y� rY7SY+SY9SY;SY=SY3SY?SY1SYASY	CSY
ESY� rY�5Y� rYGSYISYKSYMSYOSYQS�TSS�T�/�   Y       �WX   s\ Z   "     3�   Y       WX        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc +cfsecurity2ecfc637258255$funcSETRDSPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / PASSWORD 1 string 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; m n
 " o checkRootAdminUser q setRdsPassword s java/lang/String u _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; w x
 " y LOGAUDIT { &(Ljava/lang/String;)Ljava/lang/Object; m }
 " ~ logaudit � msg �  changed RDS password. � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 9 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � setRDSPassword � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � Sets the RDS password. � 
Parameters � REQUIRED � Yes � TYPE � HINT � RDS password. � NAME � password � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this -Lcfsecurity2ecfc637258255$funcSETRDSPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   (     
� vY2S�    �       
 � �    � �  �  o    +� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
- �� N-PR� X� ^-`� J- �� N-- �� N-bd� Xf� h� l� ^-`� J- �� N--
� pr� h� lW- �� N--� pt� hY-� vY2S� zS� lW-`� J- �� N-|� �-� 9Y� vY�S� hY�S� �� �W-�� J�    �   �    � �     � �    � �    � �    � �    � �    � �    - .     �     � 	    � 
    �    1 �  �   � .   � O � Y � Y � [ � [ � X � X � X � X � O � O � k � } � } �  �  � | � | � t � t � t � t � k � k � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �     �   #     *� 
�    �        � �    �   �   �     �� �Y
� hY�SY�SY�SY�SY�SY�SY�SY�SY�SY	� hY� �Y� hY�SY�SY�SY4SY�SY�SY�SY�S� �SS� �� ��    �       � � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 'cfsecurity2ecfc637258255$funcFORMATPORT  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   NEWPORT  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - PORT / getVariable  (I)Lcoldfusion/runtime/Variable; 1 2 %coldfusion/runtime/ArgumentCollection 4
 5 3 _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; 7 8
  9 PORTTYPE ; 
		 = _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V ? @
   A _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; C D
   E set (Ljava/lang/Object;)V G H coldfusion/runtime/Variable J
 K I range M _compare '(Ljava/lang/Object;Ljava/lang/String;)D O P
   Q _setCurrentLineNo (I)V S T
   U [0-9].[0-9]. W _String &(Ljava/lang/Object;)Ljava/lang/String; Y Z coldfusion/runtime/Cast \
 ] [ REFind :(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Integer; _ ` coldfusion/runtime/CFPage b
 c a _boolean (Ljava/lang/Object;)Z e f
 ] g - i   k all m Replace \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String; o p
 c q Val (Ljava/lang/String;)D s t
 c u _Object (D)Ljava/lang/Object; w x
 ] y higher { (D)Ljava/lang/String; Y }
 ] ~ concat &(Ljava/lang/String;)Ljava/lang/String; � � java/lang/String �
 � � lower � 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; C �
   � 
	 � 
formatPort � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � java/lang/Object � name � access � private � hint � +Format a port based on the specified range. � 
Parameters � REQUIRED � Yes � HINT � Specifies the port number. � NAME � port � ([Ljava/lang/Object;)V  �
 � � USpecifies the range designation:<ul><li>single</li><li>higher</li><li>lower</li></ul> � portType � getMetadata ()Ljava/lang/Object; this )Lcfsecurity2ecfc637258255$funcFORMATPORT; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   -     � �Y0SY<S�    �        � �    � �  �      y+� � :+� ,� :	+� :
-� $� *:-� .:*0� 6� ::*<� 6� ::->� B
-0� F� L-<� FN� R�� [-ڶ VX-0� F� ^� d� h� 
-0� F� L� .
-߶ V-߶ V-0� F� ^jln� r� v� z� L� �-<� F|� R�� 6
-� V-� V-0� F� ^jln� r� v� j� �� L� a-<� F�� R�� 6
j-� V-� V-0� F� ^jln� r� v� � �� L� 
-� V-0� F� ^� v� z� L-
� ��-�� B�    �   �   y � �    y � �   y � �   y � �   y � �   y � �   y � �   y + ,   y  �   y  � 	  y  � 
  y / �   y ; �  �  � |  � T� V� V� V� V� T� _� _� e� e� v� v� x� x� x� x� �� �� v� v� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� v� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�
�����,�,�,�,�5�5�7�7�9�9�,�,�,�,�,�,�,�,������V�V�V�V�V�V�V�V�M�
�
� �� �� _�h�h�h�h�h� T�     �   #     *� 
�    �        � �    �   �   �     �� �Y� �Y�SY�SY�SY�SY�SY�SY�SY� �Y� �Y� �Y�SY�SY�SY�SY�SY�S� �SY� �Y� �Y�SY�SY�SY�SY�SY�S� �SS� �� ��    �       � � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 1cfsecurity2ecfc637258255$funcDISABLESECUREPROFILE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; K L
 " M checkRootAdminUser O java/lang/Object Q _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; S T
 " U java W  coldfusion.server.ServiceFactory Y getSecurityService [ disableSecureProfile ] 
	 _ java/lang/String a metaData Ljava/lang/Object; c d	  e false g &coldfusion/runtime/AttributeCollection i name k access m public o output q hint s ]Disables secure profile and reverts all required settings from secure value to default value. u 
Parameters w ([Ljava/lang/Object;)V  y
 j z getMetadata ()Ljava/lang/Object; this 3Lcfsecurity2ecfc637258255$funcDISABLESECUREPROFILE; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       c d     | }  �   "     � f�    �        ~     � �  �   !     ^�    �        ~     � �  �         �    �        ~     � �  �   #     � b�    �        ~     � �  �  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-K� :-<>� D� J-2� 6-M� :--
� NP� R� VW-N� :--N� :-XZ� D\� R� V� J-O� :--� N^� R� V�-`� 6�    �   z    � ~      � � �    � � d    � � �    � � �    � � �    � � d    � - .    �  �    �  � 	   �  � 
   �  �  �   � %   J < K E K E K G K G K D K D K D K D K < K < K ^ M ^ M ] M ] M ] M n N ~ N ~ N � N � N } N } N v N v N v N v N n N � O � O � O � O � O � O � O ] L     �   #     *� 
�    �        ~     �   �   f     H� jY
� RYlSY^SYnSYpSYrSYhSYtSYvSYxSY	� RS� {� f�    �       H ~     � �  �   !     h�    �        ~         ����  - � 
SourceFile /CFIDE/adminapi/security.cfc /cfsecurity2ecfc637258255$funcGETWEBINFDIRECTORY  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   ! javax/servlet/jsp/JspContext #
 $ " parent Ljavax/servlet/jsp/tagext/Tag; & '	  ( 
		 * _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V , -
  . %class$coldfusion$tagext$lang$ParamTag Ljava/lang/Class; coldfusion.tagext.lang.ParamTag 2 forName %(Ljava/lang/String;)Ljava/lang/Class; 4 5 java/lang/Class 7
 8 6 0 1	  : _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; < =
  > coldfusion/tagext/lang/ParamTag @ _setCurrentLineNo (I)V B C
  D sep F setName (Ljava/lang/String;)V H I
 A J cfparam L default N java P java.lang.System R CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; T U coldfusion/runtime/CFPage W
 X V getProperty Z java/lang/Object \ file.separator ^ _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; ` a
  b _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object; d e
  f 
setDefault (Ljava/lang/Object;)V h i
 A j 	hasEndTag (Z)V l m coldfusion/tagext/GenericTag o
 p n _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z r s
  t DIR v GetPageContext %()Lcoldfusion/runtime/NeoPageContext; x y
 X z getServletContext | getRealPath ~ 	/WEB-INF/ � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
  � _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � Trim &(Ljava/lang/String;)Ljava/lang/String; � �
 X � Right '(Ljava/lang/String;I)Ljava/lang/String; � �
 X � SEP � _compare '(Ljava/lang/Object;Ljava/lang/Object;)D � �
  � concat � � java/lang/String �
 � � 
	 � getWebInfDirectory � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � private � output � hint � Returns full path for WEB-INF � 
Parameters � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 1Lcfsecurity2ecfc637258255$funcGETWEBINFDIRECTORY; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; param30 !Lcoldfusion/tagext/lang/ParamTag; LineNumberTable <clinit> 	getOutput 1       0 1    � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   #     � ��    �        � �    � �  �  � 
   %+� � :+� ,� :	-� � %:-� ):-+� /-� ;� ?� A:
-�� E
G� K
MO-�� E--�� E-QS� Y[� ]Y_S� c� g� k
� q
� u� �-+� /-w-�� E--�� E--�� E-� {}� ]� c� ]Y�S� c� �-�� E-�� E-w� �� �� �� �-�� �� ��~� -w-w� �� �-�� �� �� �� �-w� ��-�� /�    �   p   % � �    % � �   % � �   % � �   % � �   % � �   % � �   % & '   %  �   %  � 	  % � � 
 �   � ?  � D� D� _� _� a� a� ^� ^� n� n� V� V� V� V� ,� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ������ �� �� �� �� �� ������� ��     �   #     *� 
�    �        � �    �   �   n     P3� 9� ;� �Y
� ]Y�SY�SY�SY�SY�SY�SY�SY�SY�SY	� ]S� �� ��    �       P � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 2cfsecurity2ecfc637258255$funcGETALLEXPOSEDSERVICES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 

         1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G 
		 K java M  coldfusion.server.ServiceFactory O getSecurityService Q java/lang/Object S _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; U V
 " W _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; Y Z
 " [ checkRootAdminUser ] getAllExposedServices _ 
	 a java/lang/String c metaData Ljava/lang/Object; e f	  g &coldfusion/runtime/AttributeCollection i name k 
Parameters m ([Ljava/lang/Object;)V  o
 j p getMetadata ()Ljava/lang/Object; this 4Lcfsecurity2ecfc637258255$funcGETALLEXPOSEDSERVICES; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1       e f     r s  w   "     � h�    v        t u    x y  w   !     `�    v        t u    z {  w   #     � d�    v        t u    | }  w  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-�� :-<>� D� J-L� 6-�� :--�� :-NP� DR� T� X� J-L� 6-�� :--
� \^� T� XW-L� 6-�� :--� \`� T� X�-b� 6�    v   z    � t u     � ~     � � f    � � �    � � �    � � �    � � f    � - .    �  �    �  � 	   �  � 
   �  �  �   � &  � <� F� F� H� H� E� E� E� E� <� <� X� j� j� l� l� i� i� a� a� a� a� X� X� �� �� �� �� �� �� �� �� �� �� �� �� ��     w   #     *� 
�    v        t u    �   w   C     %� jY� TYlSY`SYnSY� TS� q� h�    v       % t u        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc 0cfsecurity2ecfc637258255$funcDELETESECUREDIPPORT  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ST  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  SUCCESS ! ACCESSMANAGER # ADDWILDCARD % SECURITY ' I ) WEBAPP + coldfusion/runtime/CfJspPage - pageContext #Lcoldfusion/runtime/NeoPageContext; / 0	 . 1 getOut ()Ljavax/servlet/jsp/JspWriter; 3 4 javax/servlet/jsp/JspContext 6
 7 5 parent Ljavax/servlet/jsp/tagext/Tag; 9 :	 . ; 	DIRECTORY = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G IP I PORT K get (I)Ljava/lang/Object; M N
 C O PORTTYPE Q single S put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; U V
 C W 
		 Y _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V [ \
 . ] / _ set (Ljava/lang/Object;)V a b coldfusion/runtime/Variable d
 e c coldfusion/runtime/CFBoolean g t_true Lcoldfusion/runtime/CFBoolean; i j	 h k _setCurrentLineNo (I)V m n
 . o ArrayNew (I)Ljava/util/List; q r coldfusion/runtime/CFPage t
 u s 	StructNew ()Ljava/util/Map; w x
 u y a n
 e { 	component } CFIDE.adminapi.accessmanager  CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; � �
 u � java �  coldfusion.server.ServiceFactory � getSecurityService � java/lang/Object � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
 . � checkAdminRoles � coldfusion.sandboxsecurity � java/lang/String � CONTEXTS � _resolve D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � _autoscalarize � �
 . � _arrayGetAt � V
 . � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � _resolveAndAutoscalarize � �
 . � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 u � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 . � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � &(Ljava/lang/String;)Ljava/lang/Object; � �
 . � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 . � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 . � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 u � C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; � �
 . � CLASS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � java.net.SocketPermission � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 . � TARGET � java/lang/StringBuilder  �
 : append -(Ljava/lang/String;)Ljava/lang/StringBuilder;
	 
FORMATPORT � �
 . 
formatPort 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;
 . toString ()Ljava/lang/String;
 � '(Ljava/lang/Object;Ljava/lang/Object;)D �
 . _List $(Ljava/lang/Object;)Ljava/util/List;
 � _int (Ljava/lang/Object;)I !
 �" ArrayDeleteAt (Ljava/util/List;I)Z$%
 u& _double (Ljava/lang/Object;)D()
 �* _Object (D)Ljava/lang/Object;,-
 �. ArrayLen0!
 u1, N
 �3 f_false5 j	 h6 _boolean (Ljava/lang/Object;)Z89
 �: _structSetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V<=
 .> *@ ACTIONB connect,resolveD ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)ZFG
 uH _LhsResolveJ �
 .K _arraySetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)VMN
 .O LOGAUDITQ logauditS msgU  removed a IP W F from the list of disabled functions in the sandbox for the directory Y .[ )([Ljava/lang/Object;[Ljava/lang/Object;)V ]
 C^ b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object;`
 .a 	
	c deleteSecuredIPPorte metaData Ljava/lang/Object;gh	 i falsek &coldfusion/runtime/AttributeCollectionm nameo accessq publics outputu hintw ?Removes a specified IP address and port from restricted status.y 
Parameters{ REQUIRED} true HINT� ESpecifies the sandbox directory for which the restriction is removed.� NAME� 	directory� ([Ljava/lang/Object;)V �
n�  Specifies the target IP address.� Specifies the target port.� DEFAULT� �Specifies the port type:<ul><li>single - Single port</li><li>higher - The specified port and higher</li><li>lower - The specified port and lower</li><li>range - Specified range of ports</li></ul>� portType� getMetadata ()Ljava/lang/Object; this 2Lcfsecurity2ecfc637258255$funcDELETESECUREDIPPORT; LocalVariableTable Code getName 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw52 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �   gh    �� �   "     �j�   �       ��   � �   "     f�   �       ��   �� �         �   �       ��   �� �   7     � �Y>SYJSYLSYRS�   �       ��   �� �  	�    �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :-� 2� 8:-� <:*>� D� H:*J� D� H:*L� D� H:� P� RT� XW� D:-Z� ^`� f� l� f-�� p-� v� f
-�� p� z� f� |� l� f-�� p-~�� �� f-�� p--�� p-��� ��� �� �� f-�� p--� ��� �Y�S� �W-�� p--� �Y�S� �-� �� �� �-� �Y>S� �� �� ��� G-� �� �� �:-�� p˶ ���-׶ ڸ �˸ ޶ �� �� � �-�� p--� �Y�S� �� �Y-� �SY->� �S� � � f� |� �---� �� � �� �Y�S� ��� ��� �---� �� � �� �Y S� ��Y-J� ڸ ���
-�� p-�-� �Y-L� �SY-R� �S�� ��
���~�� !-�� p--� ��-� ��#�'W-� ��+c�/� f-� �-�� p-� ��2�4��t|���� |� G---� �� � �� �Y�S� ��� ��� �7� f� =-� ��+c�/� f-� �-�� p-� ��2�4��t|����-� ��;� T-
� �Y�S��?-
� �Y SA�?-
� �YCSE�?-�� p-� ��-
� ��IW-� �Y�S�L� �Y-� �SY->� �S-� ��P-Z� ^-Ŷ p-R�T-� CY� �YVS� �Y�YX�-� �YJS� �� ��
Z�
-� �Y>S� �� ��
\�
�S�_�bW-d� ^�   �   �   ���    ���   ��h   ���   ���   ���   ��h   � 9 :   � �   � � 	  � � 
  � �   � !�   � #�   � %�   � '�   � )�   � +�   � =�   � I�   � K�   � Q�   ��� �  *
  � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ���� �� �� �� �� ��	�����������	�6�6�D�D�5�5�5�S�S�b�b�S�S�S�S�n�n�n�n�R�R�R�R�R�R�����������R��������������������������������)�)�7�7�3�3�T�T�T�T�`�`�m�m�~�~�����m�m�m�m�P�P�3�3�����������������������3�����������������������������������������������#�#�/�/�/�/�-�5��:�:�:�:�C�C�:�:�:�:�8�K�K�X�X�X�X�K�K���r�r���������~���������������������������������������r����������������������� ����/�/�5�5�5�5�5�5�J�J�P�P�P�P�P�P�e�e�+�+�����    �   #     *� 
�   �       ��   �  �  N    0�� �� ûnY
� �YpSYfSYrSYtSYvSYlSYxSYzSY|SY	� �Y�nY� �Y~SY�SY�SY�SY�SY�S��SY�nY� �Y~SY�SY�SY�SY�SYJS��SY�nY� �Y~SY�SY�SY�SY�SYLS��SY�nY� �Y~SYlSY�SYTSY�SY�SY�SY�S��SS���j�   �      0��   � �   "     l�   �       ��        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc ?cfsecurity2ecfc637258255$funcGETALLSECUREPROFILESETTINGSINARRAY  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; K L
 " M checkRootAdminUser O java/lang/Object Q _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; S T
 " U java W  coldfusion.server.ServiceFactory Y getSecurityService [ "getAllSecureProfileSettingsInArray ] 
	 _ java/lang/String a metaData Ljava/lang/Object; c d	  e false g &coldfusion/runtime/AttributeCollection i name k access m public o output q hint s )Returns all settings from Secure Profile. u 
Parameters w ([Ljava/lang/Object;)V  y
 j z getMetadata ()Ljava/lang/Object; this ALcfsecurity2ecfc637258255$funcGETALLSECUREPROFILESETTINGSINARRAY; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       c d     | }  �   "     � f�    �        ~     � �  �   !     ^�    �        ~     � �  �         �    �        ~     � �  �   #     � b�    �        ~     � �  �  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-]� :-<>� D� J-2� 6-_� :--
� NP� R� VW-`� :--`� :-XZ� D\� R� V� J-a� :--� N^� R� V�-`� 6�    �   z    � ~      � � �    � � d    � � �    � � �    � � �    � � d    � - .    �  �    �  � 	   �  � 
   �  �  �   � %   \ < ] E ] E ] G ] G ] D ] D ] D ] D ] < ] < ] ^ _ ^ _ ] _ ] _ ] _ n ` ~ ` ~ ` � ` � ` } ` } ` v ` v ` v ` v ` n ` � a � a � a � a � a � a � a ] ^     �   #     *� 
�    �        ~     �   �   f     H� jY
� RYlSY^SYnSYpSYrSYhSYtSYvSYxSY	� RS� {� f�    �       H ~     � �  �   !     h�    �        ~         ����  -0 
SourceFile /CFIDE/adminapi/security.cfc cfsecurity2ecfc637258255  coldfusion/runtime/CFComponent  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   REQUEST Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   THIS   	   FACTORY   	    LICENSE " " 	  $ FS & & 	  ( com.macromedia.SourceModTime  h���� pageContext #Lcoldfusion/runtime/NeoPageContext; - .	  / getOut ()Ljavax/servlet/jsp/JspWriter; 1 2 javax/servlet/jsp/JspContext 4
 5 3 parent Ljavax/servlet/jsp/tagext/Tag; 7 8	  9 Cp1252 ; setPageEncoding (Ljava/lang/String;)V = > !coldfusion/runtime/NeoPageContext @
 A ? LOCALE C REQUEST.LOCALE E _setCurrentLineNo (I)V G H
  I java K java.util.Locale M CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; O P coldfusion/runtime/CFPage R
 S Q 
getDefault U java/lang/Object W _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; Y Z
  [ getLanguage ] checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V _ `
  a  coldfusion.server.ServiceFactory c set (Ljava/lang/Object;)V e f coldfusion/runtime/Variable h
 i g _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; k l
  m getLicenseService o java.io.File q _Map #(Ljava/lang/Object;)Ljava/util/Map; s t coldfusion/runtime/Cast v
 w u java/lang/String y SEPARATORCHAR { _resolveAndAutoscalarize 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; } ~
   	VARIABLES � 
LOCALEFILE � java/lang/StringBuilder � resources/adminapi_ �  >
 � � 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; } �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 w � append -(Ljava/lang/String;)Ljava/lang/StringBuilder; � �
 � � .cfm � toString ()Ljava/lang/String; � �
 X � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
  � USERNAMEPASSWORDDELIM � | � E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V � �
  � (class$coldfusion$tagext$lang$ImportedTag Ljava/lang/Class; "coldfusion.tagext.lang.ImportedTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
  � "coldfusion/tagext/lang/ImportedTag � l10n � /CFIDE/adminapi/customtags � admin � setName :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V � �
 � � &coldfusion/runtime/AttributeCollection � id � sandbox_not_found � var � file � ([Ljava/lang/Object;)V  �
 � � setAttributecollection (Ljava/util/Map;)V � �  coldfusion/tagext/lang/ModuleTag �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 
doStartTag ()I � �
 � � 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
  � sandbox not found. � write � > java/io/Writer �
 � � doAfterBody � �
 � � _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
  � doEndTag � � #javax/servlet/jsp/tagext/TagSupport �
 � � doCatch (Ljava/lang/Throwable;)V � �
 � � 	doFinally � 
 � � sandbox_already_exists � sandbox already exists.  cannot_delete_system_sandboxes *Not authorized to delete system sandboxes. wrong_port_type Awrong port type, valid options are: single, higher, lower, range. security_invalidfunction
 ?This function can not be added to the restricted function list. security_invalidTag 5This tag can not be added to the restricted tag list. error_invalidDirectory =Invalid Directory, please check your directory and try again. db_not_found Database not found. badIP Invalid IP address. 	invalidip Invalid IP Address:  wrongSeedLength" (Seed must be beween 8 and 500 characters$ _factor2 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;&'
 ( _factor3*'
 + _factor4-'
 . _factor50'
 1 _factor63'
 4 _factor76'
 7 deleteDisabledDatasource Lcoldfusion/runtime/UDFMethod; 5cfsecurity2ecfc637258255$funcDELETEDISABLEDDATASOURCE;
< 	9:	 > DELETEDISABLEDDATASOURCE@ registerUDF 3(Ljava/lang/String;Lcoldfusion/runtime/UDFMethod;)VBC
 D setSecuritySandbox /cfsecurity2ecfc637258255$funcSETSECURITYSANDBOXG
H 	F:	 J SETSECURITYSANDBOXL setDisabledCFTag -cfsecurity2ecfc637258255$funcSETDISABLEDCFTAGO
P 	N:	 R SETDISABLEDCFTAGT setRdsSecurityEnabled 2cfsecurity2ecfc637258255$funcSETRDSSECURITYENABLEDW
X 	V:	 Z SETRDSSECURITYENABLED\ 
deleteUser 'cfsecurity2ecfc637258255$funcDELETEUSER_
` 	^:	 b 
DELETEUSERd checkRdsPassword -cfsecurity2ecfc637258255$funcCHECKRDSPASSWORDg
h 	f:	 j CHECKRDSPASSWORDl getUseAdminPassword 0cfsecurity2ecfc637258255$funcGETUSEADMINPASSWORDo
p 	n:	 r GETUSEADMINPASSWORDt getEnableSandboxSecurity 5cfsecurity2ecfc637258255$funcGETENABLESANDBOXSECURITYw
x 	v:	 z GETENABLESANDBOXSECURITY| setAdminPassword -cfsecurity2ecfc637258255$funcSETADMINPASSWORD
� 	~:	 � SETADMINPASSWORD� setRDSPassword +cfsecurity2ecfc637258255$funcSETRDSPASSWORD�
� 	�:	 � SETRDSPASSWORD� isRAMAllFiles *cfsecurity2ecfc637258255$funcISRAMALLFILES�
� 	�:	 � ISRAMALLFILES� getAllAdminRoles -cfsecurity2ecfc637258255$funcGETALLADMINROLES�
� 	�:	 � GETALLADMINROLES� getAllExposedServices 2cfsecurity2ecfc637258255$funcGETALLEXPOSEDSERVICES�
� 	�:	 � GETALLEXPOSEDSERVICES� deleteDisabledCFTag 0cfsecurity2ecfc637258255$funcDELETEDISABLEDCFTAG�
� 	�:	 � DELETEDISABLEDCFTAG� setDisabledDatasource 2cfsecurity2ecfc637258255$funcSETDISABLEDDATASOURCE�
� 	�:	 � SETDISABLEDDATASOURCE� deleteDisabledCFFunction 5cfsecurity2ecfc637258255$funcDELETEDISABLEDCFFUNCTION�
� 	�:	 � DELETEDISABLEDCFFUNCTION� setRdsEnabled *cfsecurity2ecfc637258255$funcSETRDSENABLED�
� 	�:	 � SETRDSENABLED� disableRDSServlet .cfsecurity2ecfc637258255$funcDISABLERDSSERVLET�
� 	�:	 � DISABLERDSSERVLET� getUseSingleRDSPassword 4cfsecurity2ecfc637258255$funcGETUSESINGLERDSPASSWORD�
� 	�:	 � GETUSESINGLERDSPASSWORD� setUseRDSPassword .cfsecurity2ecfc637258255$funcSETUSERDSPASSWORD�
� 	�:	 � SETUSERDSPASSWORD� setDisabledCFFunction 2cfsecurity2ecfc637258255$funcSETDISABLEDCFFUNCTION�
� 	�:	 � SETDISABLEDCFFUNCTION� 
formatPort 'cfsecurity2ecfc637258255$funcFORMATPORT�
� 	�:	 � 
FORMATPORT� setAllowConcurrentAdminLogin 9cfsecurity2ecfc637258255$funcSETALLOWCONCURRENTADMINLOGIN�
� 	�:	 � SETALLOWCONCURRENTADMINLOGIN� isSecureProfile ,cfsecurity2ecfc637258255$funcISSECUREPROFILE�
� 	�:	 � ISSECUREPROFILE� setSecuredFolder -cfsecurity2ecfc637258255$funcSETSECUREDFOLDER�
  	�:	  SETSECUREDFOLDER getDisabledDatasources 3cfsecurity2ecfc637258255$funcGETDISABLEDDATASOURCES
 	:	 
 GETDISABLEDDATASOURCES validateDirectory .cfsecurity2ecfc637258255$funcVALIDATEDIRECTORY
 	:	  VALIDATEDIRECTORY setUseSingleRDSPassword 4cfsecurity2ecfc637258255$funcSETUSESINGLERDSPASSWORD
 	:	  SETUSESINGLERDSPASSWORD getDisabledCFTags .cfsecurity2ecfc637258255$funcGETDISABLEDCFTAGS
  	:	 " GETDISABLEDCFTAGS$ "getAllSecureProfileSettingsInArray ?cfsecurity2ecfc637258255$funcGETALLSECUREPROFILESETTINGSINARRAY'
( 	&:	 * "GETALLSECUREPROFILESETTINGSINARRAY, getEnableRDS )cfsecurity2ecfc637258255$funcGETENABLERDS/
0 	.:	 2 GETENABLERDS4 getDefaultSecuritySandbox 6cfsecurity2ecfc637258255$funcGETDEFAULTSECURITYSANDBOX7
8 	6:	 : GETDEFAULTSECURITYSANDBOX< isInternalSandBox .cfsecurity2ecfc637258255$funcISINTERNALSANDBOX?
@ 	>:	 B ISINTERNALSANDBOXD deleteSecuredFolder 0cfsecurity2ecfc637258255$funcDELETESECUREDFOLDERG
H 	F:	 J DELETESECUREDFOLDERL getAllSecureProfileSettings 8cfsecurity2ecfc637258255$funcGETALLSECUREPROFILESETTINGSO
P 	N:	 R GETALLSECUREPROFILESETTINGST createDefaultSandboxes 3cfsecurity2ecfc637258255$funcCREATEDEFAULTSANDBOXESW
X 	V:	 Z CREATEDEFAULTSANDBOXES\ isAllowConcurrentAdminLogin 8cfsecurity2ecfc637258255$funcISALLOWCONCURRENTADMINLOGIN_
` 	^:	 b ISALLOWCONCURRENTADMINLOGINd disableSecureProfile 1cfsecurity2ecfc637258255$funcDISABLESECUREPROFILEg
h 	f:	 j DISABLESECUREPROFILEl deleteAllowedIPAddresses 5cfsecurity2ecfc637258255$funcDELETEALLOWEDIPADDRESSESo
p 	n:	 r DELETEALLOWEDIPADDRESSESt setSeed $cfsecurity2ecfc637258255$funcSETSEEDw
x 	v:	 z SETSEED| getDisabledCFFunctions 3cfsecurity2ecfc637258255$funcGETDISABLEDCFFUNCTIONS
� 	~:	 � GETDISABLEDCFFUNCTIONS� getUser $cfsecurity2ecfc637258255$funcGETUSER�
� 	�:	 � GETUSER� enableSecureProfile 0cfsecurity2ecfc637258255$funcENABLESECUREPROFILE�
� 	�:	 � ENABLESECUREPROFILE� enableRDSServlet -cfsecurity2ecfc637258255$funcENABLERDSSERVLET�
� 	�:	 � ENABLERDSSERVLET� getCFIDEDirectory .cfsecurity2ecfc637258255$funcGETCFIDEDIRECTORY�
� 	�:	 � GETCFIDEDIRECTORY� getWebInfDirectory /cfsecurity2ecfc637258255$funcGETWEBINFDIRECTORY�
� 	�:	 � GETWEBINFDIRECTORY� setUser $cfsecurity2ecfc637258255$funcSETUSER�
� 	�:	 � SETUSER� getSecuredIPPorts .cfsecurity2ecfc637258255$funcGETSECUREDIPPORTS�
� 	�:	 � GETSECUREDIPPORTS� setSecuredIPPort -cfsecurity2ecfc637258255$funcSETSECUREDIPPORT�
� 	�:	 � SETSECUREDIPPORT� getTagPermissionPosition 5cfsecurity2ecfc637258255$funcGETTAGPERMISSIONPOSITION�
� 	�:	 � GETTAGPERMISSIONPOSITION� getFunctionPermissionPosition :cfsecurity2ecfc637258255$funcGETFUNCTIONPERMISSIONPOSITION�
� 	�:	 � GETFUNCTIONPERMISSIONPOSITION� setAllowedIPAddresses 2cfsecurity2ecfc637258255$funcSETALLOWEDIPADDRESSES�
� 	�:	 � SETALLOWEDIPADDRESSES� getSecurableCFFunctions 4cfsecurity2ecfc637258255$funcGETSECURABLECFFUNCTIONS�
� 	�:	 � GETSECURABLECFFUNCTIONS� isLoginUserIdRequired 2cfsecurity2ecfc637258255$funcISLOGINUSERIDREQUIRED�
� 	�:	 � ISLOGINUSERIDREQUIRED� deleteSecuritySandbox 2cfsecurity2ecfc637258255$funcDELETESECURITYSANDBOX�
� 	�:	 � DELETESECURITYSANDBOX� getSecuritySandboxes 1cfsecurity2ecfc637258255$funcGETSECURITYSANDBOXES�
� 	�:	 � GETSECURITYSANDBOXES� getAllRuntimePermissions 5cfsecurity2ecfc637258255$funcGETALLRUNTIMEPERMISSIONS�
  	�:	  GETALLRUNTIMEPERMISSIONS setDefaultFilePermission 5cfsecurity2ecfc637258255$funcSETDEFAULTFILEPERMISSION
 	:	 
 SETDEFAULTFILEPERMISSION checkAdminPassword /cfsecurity2ecfc637258255$funcCHECKADMINPASSWORD
 	:	  CHECKADMINPASSWORD getUseRDSPassword .cfsecurity2ecfc637258255$funcGETUSERDSPASSWORD
 	:	  GETUSERDSPASSWORD getSecurableCFTags /cfsecurity2ecfc637258255$funcGETSECURABLECFTAGS
  	:	 " GETSECURABLECFTAGS$ getSecuredFolders .cfsecurity2ecfc637258255$funcGETSECUREDFOLDERS'
( 	&:	 * GETSECUREDFOLDERS, setUseAdminPassword 0cfsecurity2ecfc637258255$funcSETUSEADMINPASSWORD/
0 	.:	 2 SETUSEADMINPASSWORD4 setLoginUserIdRequired 3cfsecurity2ecfc637258255$funcSETLOGINUSERIDREQUIRED7
8 	6:	 : SETLOGINUSERIDREQUIRED< setEnableSandboxSecurity 5cfsecurity2ecfc637258255$funcSETENABLESANDBOXSECURITY?
@ 	>:	 B SETENABLESANDBOXSECURITYD setEnableRDS )cfsecurity2ecfc637258255$funcSETENABLERDSG
H 	F:	 J SETENABLERDSL deleteSecuredIPPort 0cfsecurity2ecfc637258255$funcDELETESECUREDIPPORTO
P 	N:	 R DELETESECUREDIPPORTT getAllowedIPList -cfsecurity2ecfc637258255$funcGETALLOWEDIPLISTW
X 	V:	 Z GETALLOWEDIPLIST\ metaData Ljava/lang/Object;^_	 ` _implicitMethods Ljava/util/Map;bc	 d displaynamef securityh extendsj basel hintn -Manages passwords, RDS, and sandbox security.p Namer 	Functionst	<`	H`	``	P`	X`	h`	p`	x`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	 `	�`	`	`	`	 `	(`	0`	8`	@`	H`	P`	X`	``	h`	p`	�`	x`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	`	 `	�`	 `	`	`	(`	0`	@`	8`	P`	H`	X` 
Properties� getMetadata ()Ljava/lang/Object; this Lcfsecurity2ecfc637258255; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; registerUDFs __factorParent out Ljavax/servlet/jsp/JspWriter; value _setImplicitMethods implicitMethods 
getExtends runPage LineNumberTable module1 $Lcoldfusion/tagext/lang/ImportedTag; mode1 I t6 Ljava/lang/Throwable; t7 t8 t9 t10 t11 module2 mode2 t14 t15 t16 t17 t18 t19 module3 mode3 t22 t23 t24 t25 t26 t27 module4 mode4 t30 t31 t32 t33 t34 t35 module5 mode5 t38 t39 t40 t41 t42 t43 module6 mode6 t46 t47 t48 t49 t50 t51 module7 mode7 t54 t55 t56 t57 t58 t59 module8 mode8 t62 t63 t64 t65 t66 t67 module9 mode9 t70 t71 t72 t73 t74 t75 module10 mode10 t78 t79 t80 t81 t82 t83 module11 mode11 t86 t87 t88 t89 t90 t91 java/lang/Throwable+ _getImplicitMethods ()Ljava/util/Map; <clinit> 1     L                 "     &     � �   9:   F:   N:   V:   ^:   f:   n:   v:   ~:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   :   :   :   :   &:   .:   6:   >:   F:   N:   V:   ^:   f:   n:   v:   ~:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   :   :   :   :   &:   .:   6:   >:   F:   N:   V:   ^_   
bc    �� �   "     �a�   �       ��      �   u     C*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )�   �        C��     C��    C��  �  �  �    �*A�?�E*M�K�E*U�S�E*]�[�E*e�c�E*m�k�E*u�s�E*}�{�E*����E*����E*����E*����E*����E*����E*����E*����E*ŲöE*Ͳ˶E*ղӶE*ݲ۶E*��E*���E*���E*����E*��E*��E*��E*��E*%�#�E*-�+�E*5�3�E*=�;�E*E�C�E*M�K�E*U�S�E*]�[�E*e�c�E*m�k�E*u�s�E*}�{�E*����E*����E*����E*����E*����E*����E*����E*����E*ŲöE*Ͳ˶E*ղӶE*ݲ۶E*��E*���E*���E*����E*��E*��E*��E*��E*%�#�E*-�+�E*5�3�E*=�;�E*E�C�E*M�K�E*U�S�E*]�[�E�   �      ���      �   #     *� 
�   �       ��   3' �   >     *�   �   *    ��     � 8    ��    �_  6' �   >     *�   �   *    ��     � 8    ��    �_  � � �   -     +�e�   �       ��     �c  � � �   "     m�   �       ��   �� �   �     `*� 0� 6L*� :N*� 0<� B*-+�)� �*-+�,� �*-+�/� �*-+�2� �*-+�5� �*-+�8� ��   �   *    `��     `��    `�_    ` 7 8 �       -' �   >     *�   �   *    ��     � 8    ��    �_  0' �   >     *�   �   *    ��     � 8    ��    �_  &' �  (  \  
<**� DF*� J**� J**� J*LN� TV� X� \^� X� \� b*� !*	� J*Ld� T� j*� %*
� J***� !� np� X� \� j*� )**� J*Lr� T� x� zY|S� �� j*�� zY�S� �Y�� �*� zYDS� �� �� ��� �� �� �**� � zY�S�� �*� �+� �� �:*� J���� �� �Y� XY�SY�SY�SY�SY�SY*�� zY�S� �S� ϶ �� �� �Y6� 5*,� �M,� �� ���� � :� �:*,� �M�� �� :� #�� � #:		� �� � :
� 
�:� ��*� �+� �� �:*� J���� �� �Y� XY�SY�SY�SY�SY�SY*�� zY�S� �S� ϶ �� �� �Y6� 6*,� �M,� �� ���� � :� �:*,� �M�� �� :� #�� � #:� �� � :� �:� ��*� �+� �� �:*� J���� �� �Y� XY�SYSY�SYSY�SY*�� zY�S� �S� ϶ �� �� �Y6� 6*,� �M,� �� ���� � :� �:*,� �M�� �� :� #�� � #:� �� � :� �:� ��*� �+� �� �:*� J���� �� �Y� XY�SYSY�SYSY�SY*�� zY�S� �S� ϶ �� �� �Y6� 6*,� �M,	� �� ���� � :� �:*,� �M�� �� : � # �� � #:!!� �� � :"� "�:#� ��#*� �+� �� �:$*� J$���� �$� �Y� XY�SYSY�SYSY�SY*�� zY�S� �S� ϶ �$� �$� �Y6%� 6*$%,� �M,� �$� ���� � :&� &�:'*%,� �M�'$� �� :(� #(�� � #:)$)� �� � :*� *�:+$� ��+*� �+� �� �:,*� J,���� �,� �Y� XY�SYSY�SYSY�SY*�� zY�S� �S� ϶ �,� �,� �Y6-� 6*,-,� �M,� �,� ���� � :.� .�:/*-,� �M�/,� �� :0� #0�� � #:1,1� �� � :2� 2�:3,� ��3*� �+� �� �:4*� J4���� �4� �Y� XY�SYSY�SYSY�SY*�� zY�S� �S� ϶ �4� �4� �Y65� 6*45,� �M,� �4� ���� � :6� 6�:7*5,� �M�74� �� :8� #8�� � #:949� �� � ::� :�:;4� ��;*� �+� �� �:<*� J<���� �<� �Y� XY�SYSY�SYSY�SY*�� zY�S� �S� ϶ �<� �<� �Y6=� 6*<=,� �M,� �<� ���� � :>� >�:?*=,� �M�?<� �� :@� #@�� � #:A<A� �� � :B� B�:C<� ��C*� �	+� �� �:D*� JD���� �D� �Y� XY�SYSY�SYSY�SY*�� zY�S� �S� ϶ �D� �D� �Y6E� 6*DE,� �M,� �D� ���� � :F� F�:G*E,� �M�GD� �� :H� #H�� � #:IDI� �� � :J� J�:KD� ��K*� �
+� �� �:L*� JL���� �L� �Y� XY�SYSY�SYSY�SY*�� zY�S� �S� ϶ �L� �L� �Y6M� 6*LM,� �M,!� �L� ���� � :N� N�:O*M,� �M�OL� �� :P� #P�� � #:QLQ� �� � :R� R�:SL� ��S*� �+� �� �:T*� JT���� �T� �Y� XY�SY#SY�SY#SY�SY*�� zY�S� �S� ϶ �T� �T� �Y6U� 6*TU,� �M,%� �T� ���� � :V� V�:W*U,� �M�WT� �� :X� #X�� � #:YTY� �� � :Z� Z�:[T� ��[*� XHcf,fkf,=��,���,=��,���,���,���,;>,>C>,^j,dgj,^y,dgy,jvy,y~y,�,,�8D,>AD,�8S,>AS,DPS,SXS,���,���,�,,�-,-,*-,-2-,���,���,���,���,��,��,�,,���,���,}��,���,}��,���,���,���,c�,���,X��,���,X��,���,���,���,>Z],]b],3}�,���,3}�,���,���,���,58,8=8,Xd,^ad,Xs,^as,dps,sxs,�		,			,�	3	?,	9	<	?,�	3	N,	9	<	N,	?	K	N,	N	S	N,	�	�	�,	�	�	�,	�

,


,	�

),


),

&
),
)
.
), �  � \  
<��    
<� 8   
<��   
<�_   
<��   
<��   
<��   
<�_   
<�_   
<�� 	  
<�� 
  
<�_   
<��   
<��   
<��   
<�_   
<�_   
<��   
<��   
<�_   
<��   
<��   
<��   
<�_   
<�_   
<��   
<��   
<�_   
<��   
<��   
<��   
<�_   
<�_    
<�� !  
<�� "  
<�_ #  
<�� $  
<�� %  
<�� &  
<�_ '  
<�_ (  
<�� )  
<�� *  
<�_ +  
<�� ,  
<�� -  
<�� .  
<�_ /  
<�_ 0  
< � 1  
<� 2  
<_ 3  
<� 4  
<� 5  
<� 6  
<_ 7  
<_ 8  
<� 9  
<	� :  
<
_ ;  
<� <  
<� =  
<� >  
<_ ?  
<_ @  
<� A  
<� B  
<_ C  
<� D  
<� E  
<� F  
<_ G  
<_ H  
<� I  
<� J  
<_ K  
<� L  
<� M  
<� N  
<_ O  
<_ P  
< � Q  
<!� R  
<"_ S  
<#� T  
<$� U  
<%� V  
<&_ W  
<'_ X  
<(� Y  
<)� Z  
<*_ [�  z �                              E 	 E 	 G 	 G 	 D 	 D 	 D 	 D 	 : 	 Z 
 Z 
 Y 
 Y 
 Y 
 Y 
 O 
 z  z  |  |  y  y  r  r  r  r  n  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  :     ! ! ! !  � � � � � � � � � � � � � � � � � � � � � � � � � � � d p p { { � � � � > K K V V a a a a  & & 1 1 < < < < �         � � � � � � � � � � � � � � � � � � � 	� 	� 	� 	� 	� 	� 	� 	� 	_  -. �   "     �e�   �       ��   /  �  - 	   ��� �� ��<Y�=�?�HY�I�K�PY�Q�S�XY�Y�[�`Y�a�c�hY�i�k�pY�q�s�xY�y�{��Y������Y������Y������Y������Y������Y������Y������Y������Y���û�Y�ɳ˻�Y�ѳӻ�Y�ٳۻ�Y����Y����Y����Y����� Y���Y�	��Y���Y��� Y�!�#�(Y�)�+�0Y�1�3�8Y�9�;�@Y�A�C�HY�I�K�PY�Q�S�XY�Y�[�`Y�a�c�hY�i�k�pY�q�s�xY�y�{��Y������Y������Y������Y������Y������Y������Y������Y������Y���û�Y�ɳ˻�Y�ѳӻ�Y�ٳۻ�Y����Y����Y����Y����� Y���Y�	��Y���Y��� Y�!�#�(Y�)�+�0Y�1�3�8Y�9�;�@Y�A�C�HY�I�K�PY�Q�S�XY�Y�[� �Y� XYgSYiSYkSYmSYoSYqSYsSYiSYuSY	D� XY�vSY�wSY�xSY�ySY�zSY�{SY�|SY�}SY�~SY	�SY
��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY ��SY!��SY"��SY#��SY$��SY%��SY&��SY'��SY(��SY)��SY*��SY+��SY,��SY-��SY.��SY/��SY0��SY1��SY2��SY3��SY4��SY5��SY6��SY7��SY8��SY9��SY:��SY;��SY<��SY=��SY>��SY?��SY@��SYA��SYB��SYC��SSY
�SY� XS� ϳa�   �      ���  �  " �������	�	�11 � � � �! ! (�(�/ �/ �6 �6 �=�=�D�D�K�K�RzRzYwYw`�`�g g nXnXu[u[| �| �� �� ������ ,� ,�K�K� 8� 8�H�H����� �� ������ \� \��������������� S� S�t�t� #� #� J� J	�	�"" � �	>	> A A$�$�+�+�2�2�9	`9	`@@G�G�N=N=U	U	\	�\	�c�c�j"j"q qq qxWxW77��������� �� �� �� ��(�(� e� e����� v� v�����D�D�	��	� *' �   >     *�   �   *    ��     � 8    ��    �_        *    +����  -� 
SourceFile /CFIDE/adminapi/security.cfc 0cfsecurity2ecfc637258255$funcDELETESECUREDFOLDER  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   PERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   ACCESSMANAGER  SECURITY ! VFSFILEFACTORY # PERMISSIONCLASS % WEBAPP ' VFILE ) coldfusion/runtime/CfJspPage + pageContext #Lcoldfusion/runtime/NeoPageContext; - .	 , / getOut ()Ljavax/servlet/jsp/JspWriter; 1 2 javax/servlet/jsp/JspContext 4
 5 3 parent Ljavax/servlet/jsp/tagext/Tag; 7 8	 , 9 	DIRECTORY ; getVariable  (I)Lcoldfusion/runtime/Variable; = > %coldfusion/runtime/ArgumentCollection @
 A ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; C D
  E FOLDER G 
		 I _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V K L
 , M / O set (Ljava/lang/Object;)V Q R coldfusion/runtime/Variable T
 U S _setCurrentLineNo (I)V W X
 , Y ArrayNew (I)Ljava/util/List; [ \ coldfusion/runtime/CFPage ^
 _ ] 	component a CFIDE.adminapi.accessmanager c CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; e f
 _ g java i  coldfusion.server.ServiceFactory k getSecurityService m java/lang/Object o _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; q r
 , s coldfusion/runtime/CFBoolean u f_false Lcoldfusion/runtime/CFBoolean; w x	 v y   { coldfusion.vfs.VFSFileFactory } _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;  �
 , � checkAdminRoles � coldfusion.sandboxsecurity � checkIfVFile � _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; � �
 , � java/lang/String � CONTEXTS � _resolve D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 , � � �
 , � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 , � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � _resolveAndAutoscalarize � �
 , � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 _ � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 , � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 , � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 , � _boolean (Ljava/lang/Object;)Z � �
 � � coldfusion.vfs.VFilePermission � getFileObject � getAbsolutePath � _structSetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 , � java.io.FilePermission � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 , � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 _ � I � _Object (I)Ljava/lang/Object; � �
 � � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 , � C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; � �
 , � CLASS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �
 , _compare '(Ljava/lang/Object;Ljava/lang/Object;)D
 , (Z)Ljava/lang/Object; �
 �	 TARGET _List $(Ljava/lang/Object;)Ljava/util/List;
 � _int (Ljava/lang/Object;)I
 � ArrayDeleteAt (Ljava/util/List;I)Z
 _ _double (Ljava/lang/Object;)D
 � (D)Ljava/lang/Object; �
 � ArrayLen 
 _! _LhsResolve# �
 ,$ _arraySetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V&'
 ,( LOGAUDIT*  �
 ,, logaudit. msg0 java/lang/StringBuilder2  made folder 4  �
36 append -(Ljava/lang/String;)Ljava/lang/StringBuilder;89
3: / inaccessible in the sandbox for the directory < .> toString ()Ljava/lang/String;@A
 pB )([Ljava/lang/Object;[Ljava/lang/Object;)V D
 AE 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object;GH
 ,I 	
	K deleteSecuredFolderM metaData Ljava/lang/Object;OP	 Q voidS falseU &coldfusion/runtime/AttributeCollectionW nameY access[ public] output_ 
returntypea hintc 1Makes a folder inaccessible to a secured sandbox.e 
Parametersg REQUIREDi truek HINTm ?Specifies the sandbox directory for which a folder is disabled.o NAMEq 	directorys ([Ljava/lang/Object;)V u
Xv 9Specifies the path of the folder to be made inaccessible.x folderz getMetadata ()Ljava/lang/Object; this 2Lcfsecurity2ecfc637258255$funcDELETESECUREDFOLDER; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw47 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �   OP   	 |} �   "     �R�   �       ~   �A �   "     N�   �       ~   �� �         �   �       ~   �A �   "     T�   �       ~   �� �   -     � �Y<SYHS�   �       ~   �� �  n    �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :-� 0� 6:-� ::*<� B� F:*H� B� F:-J� NP� V
-� Z-� `� V-� Z-bd� h� V-�� Z--�� Z-jl� hn� p� t� V� z� V|� V-� Z-j~� h� V-� Z--� ��� pY�S� tW-� Z--� ��� pY-H� �S� t� V-�� Z--� �Y�S� �-� �� �� �-� �Y<S� �� �� ��� G-� �� �� �:-�� Z�� ���-˶ �� ��� ϶ �� �� ڙ �-� �� ޙ V� V-� �YHS-�� Z--�� Z--� ��� pY-� �YHS� �S� t�� p� t� � 
� V
-� Z--� �Y�S� �� pY-� �SY-<� �S� �� � V-�� �� �� �--
-� �� �� �� �Y S�-� ���~��
Y� ޙ <W--
-� �� �� �� �YS�-� �YHS� ���~��
� ޙ !-� Z--
� ��-� ���W-�-� ��c�� �-� �-� Z-
� ��"� ���t|���5-� �Y�S�%� pY-� �SY-<� �S-
� ��)-J� N-� Z-+�-/-� AY� �Y1S� pY�3Y5�7-� �YHS� �� ��;=�;-� �Y<S� �� ��;?�;�CS�F�JW-L� N�   �   �   �~    ���   ��P   ���   ���   ���   ��P   � 7 8   � �   � � 	  � � 
  � �   � !�   � #�   � %�   � '�   � )�   � ;�   � G�   ��� �  � �  � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � ��� �� �� ����-�-������B�B�Q�Q�B�B�B�B�]�]�]�]�A�A�A�A�A�A���������w�A���������������������������������������++@@II******!\\\\Yj
j
f
f
�
�
f
f
f
f
�
�
�
�
�
�
�
�
�
�
f
f
�����������f
���������Y44IIRRYYYY4 ��qq��������������������qqqq    �   #     *� 
�   �       ~   �  �   �     ��� �� ��XY� pYZSYNSY\SY^SY`SYVSYbSYTSYdSY	fSY
hSY� pY�XY� pYjSYlSYnSYpSYrSYtS�wSY�XY� pYjSYlSYnSYySYrSY{S�wSS�w�R�   �       �~   �A �   "     V�   �       ~        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc -cfsecurity2ecfc637258255$funcCHECKRDSPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / PASSWORD 1 string 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; m n
 " o checkRootAdminUser q checkRdsPassword s java/lang/String u _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; w x
 " y 
	 { metaData Ljava/lang/Object; } ~	   false � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � Checks RDS password. � 
Parameters � REQUIRED � Yes � TYPE � HINT � Administrator password. � NAME � password � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this /Lcfsecurity2ecfc637258255$funcCHECKRDSPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       } ~     � �  �   "     � ��    �        � �    � �  �   !     t�    �        � �    � �  �         �    �        � �    � �  �   (     
� vY2S�    �       
 � �    � �  �  "     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
- �� N-PR� X� ^-`� J- �� N-- �� N-bd� Xf� h� l� ^-`� J- �� N--
� pr� h� lW- �� N--� pt� hY-� vY2S� zS� l�-|� J�    �   �    � � �     � � �    � � ~    � � �    � � �    � � �    � � ~    � - .    �  �    �  � 	   �  � 
   �  �    � 1 �  �   � (   � O � Y � Y � [ � [ � X � X � X � X � O � O � k � } � } �  �  � | � | � t � t � t � t � k � k � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �     �   #     *� 
�    �        � �    �   �   �     �� �Y
� hY�SYtSY�SY�SY�SY�SY�SY�SY�SY	� hY� �Y� hY�SY�SY�SY4SY�SY�SY�SY�S� �SS� �� ��    �       � � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 8cfsecurity2ecfc637258255$funcISALLOWCONCURRENTADMINLOGIN  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; K L
 " M checkRootAdminUser O java/lang/Object Q _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; S T
 " U java W  coldfusion.server.ServiceFactory Y getSecurityService [ isAllowConcurrentAdminLogin ] 
	 _ java/lang/String a metaData Ljava/lang/Object; c d	  e false g &coldfusion/runtime/AttributeCollection i name k access m public o output q hint s 4Checks whether concurrent login sessions are allowed u 
Parameters w ([Ljava/lang/Object;)V  y
 j z getMetadata ()Ljava/lang/Object; this :Lcfsecurity2ecfc637258255$funcISALLOWCONCURRENTADMINLOGIN; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       c d     | }  �   "     � f�    �        ~     � �  �   !     ^�    �        ~     � �  �         �    �        ~     � �  �   #     � b�    �        ~     � �  �  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-$� :-<>� D� J-2� 6-&� :--
� NP� R� VW-'� :--'� :-XZ� D\� R� V� J-(� :--� N^� R� V�-`� 6�    �   z    � ~      � � �    � � d    � � �    � � �    � � �    � � d    � - .    �  �    �  � 	   �  � 
   �  �  �   � %   # < $ E $ E $ G $ G $ D $ D $ D $ D $ < $ < $ ^ & ^ & ] & ] & ] & n ' ~ ' ~ ' � ' � ' } ' } ' v ' v ' v ' v ' n ' � ( � ( � ( � ( � ( � ( � ( ] %     �   #     *� 
�    �        ~     �   �   f     H� jY
� RYlSY^SYnSYpSYrSYhSYtSYvSYxSY	� RS� {� f�    �       H ~     � �  �   !     h�    �        ~         ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 2cfsecurity2ecfc637258255$funcISLOGINUSERIDREQUIRED  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   SECURITY  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - 
		 / _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 1 2
   3 _setCurrentLineNo (I)V 5 6
   7 java 9  coldfusion.server.ServiceFactory ; CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; = > coldfusion/runtime/CFPage @
 A ? getSecurityService C java/lang/Object E _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; G H
   I set (Ljava/lang/Object;)V K L coldfusion/runtime/Variable N
 O M _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; Q R
   S isAdminUserIdRequired U 
	 W java/lang/String Y isLoginUserIdRequired [ metaData Ljava/lang/Object; ] ^	  _ false a &coldfusion/runtime/AttributeCollection c name e access g public i output k hint m �Checks whether or not a user id is required in addition to a password in order to login. If this returns true, a user id must be passed to the login function in addition to a password. o 
Parameters q ([Ljava/lang/Object;)V  s
 d t getMetadata ()Ljava/lang/Object; this 4Lcfsecurity2ecfc637258255$funcISLOGINUSERIDREQUIRED; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       ] ^     v w  {   "     � `�    z        x y    | }  {   !     \�    z        x y    ~   {         �    z        x y    � �  {   #     � Z�    z        x y    � �  {  ^     �+� � :+� ,� :	+� :
-� $� *:-� .:-0� 4
-r� 8--r� 8-:<� BD� F� J� P-0� 4-s� 8--
� TV� F� J�-X� 4�    z   p    � x y     � � �    � � ^    � � �    � � �    � � �    � � ^    � + ,    �  �    �  � 	   �  � 
 �   V    q 4 r D r D r F r F r C r C r < r < r < r < r 4 r 4 r f s f s e s e s e s e s e s     {   #     *� 
�    z        x y    �   {   f     H� dY
� FYfSY\SYhSYjSYlSYbSYnSYpSYrSY	� FS� u� `�    z       H x y    � }  {   !     b�    z        x y        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc 5cfsecurity2ecfc637258255$funcDELETEDISABLEDCFFUNCTION  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   TARGET  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACCESSMANAGER ! AENABLEDCFFUNCTIONS # 	TARGETPOS % SECURITY ' 
TARGETTEMP ) WEBAPP + ARRAYPOS - coldfusion/runtime/CfJspPage / pageContext #Lcoldfusion/runtime/NeoPageContext; 1 2	 0 3 getOut ()Ljavax/servlet/jsp/JspWriter; 5 6 javax/servlet/jsp/JspContext 8
 9 7 parent Ljavax/servlet/jsp/tagext/Tag; ; <	 0 = 	DIRECTORY ? getVariable  (I)Lcoldfusion/runtime/Variable; A B %coldfusion/runtime/ArgumentCollection D
 E C _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; G H
  I FUNCTIONNAME K 
		
		 M _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V O P
 0 Q / S set (Ljava/lang/Object;)V U V coldfusion/runtime/Variable X
 Y W 
		 [ _setCurrentLineNo (I)V ] ^
 0 _ ArrayNew (I)Ljava/util/List; a b coldfusion/runtime/CFPage d
 e c GETDISABLEDCFFUNCTIONS g _get &(Ljava/lang/String;)Ljava/lang/Object; i j
 0 k getDisabledCFFunctions m java/lang/Object o _autoscalarize q j
 0 r 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; t u
 0 v _List $(Ljava/lang/Object;)Ljava/util/List; x y coldfusion/runtime/Cast {
 | z ArrayToList $(Ljava/util/List;)Ljava/lang/String; ~ 
 e � U ^
 Y �   � 

         � 	component � CFIDE.adminapi.accessmanager � CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; � �
 e � java �  coldfusion.server.ServiceFactory � getSecurityService � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; i �
 0 � checkAdminRoles � coldfusion.sandboxsecurity � GETSECURABLECFFUNCTIONS � getSecurableCFFunctions � java/lang/String � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 0 � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 | � ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I � �
 e � _boolean (J)Z � �
 | � 
			 � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 0 � coldfusion/tagext/lang/ThrowTag � cfthrow � message � SECURITY_INVALIDFUNCTION � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 0 � 
setMessage (Ljava/lang/String;)V � �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 0 � CONTEXTS � _resolve � �
 0 � q �
 0 � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 | � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 e � throw � setCalledName � �
 � � SANDBOX_NOT_FOUND � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; 
 e GETFUNCTIONPERMISSIONPOSITION getFunctionPermissionPosition C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; �
 0	 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �
 0 * _compare '(Ljava/lang/Object;Ljava/lang/String;)D
 0 Left '(Ljava/lang/String;I)Ljava/lang/String;
 e *- RemoveChars ((Ljava/lang/String;II)Ljava/lang/String;
 e _Object (I)Ljava/lang/Object;
 |  _int (Ljava/lang/Object;)I"#
 |$ ListDeleteAt&
 e' ListLen (Ljava/lang/String;)I)*
 e+ (Ljava/lang/Object;D)D-
 0. concat &(Ljava/lang/String;)Ljava/lang/String;01
 �2 _structSetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V45
 06 _LhsResolve8 �
 09 _arraySetAt;5
 0< LOGAUDIT> logaudit@ msgB java/lang/StringBuilderD  removed a function F  �
EH append -(Ljava/lang/String;)Ljava/lang/StringBuilder;JK
EL F from the list of disabled functions in the sandbox for the directory N .P toString ()Ljava/lang/String;RS
 pT )([Ljava/lang/Object;[Ljava/lang/Object;)V V
 EW b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; tY
 0Z 	
	\ deleteDisabledCFFunction^ metaData Ljava/lang/Object;`a	 b voidd falsef &coldfusion/runtime/AttributeCollectionh namej accessl publicn outputp 
returntyper hintt ERemove a function from the list of disabled functions in the sandbox.v 
Parametersx REQUIREDz true| HINT~ BSpecifies the sandbox directory for which the function is enabled.� NAME� 	directory� ([Ljava/lang/Object;)V �
i� -Specifies the name of the function to enable.� functionName� getMetadata ()Ljava/lang/Object; this 7Lcfsecurity2ecfc637258255$funcDELETEDISABLEDCFFUNCTION; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw39 !Lcoldfusion/tagext/lang/ThrowTag; throw40 LineNumberTable <clinit> 	getOutput 1       � �   `a   	 �� �   "     �c�   �       ��   �S �   "     _�   �       ��   �� �         �   �       ��   �S �   "     e�   �       ��   �� �   -     � �Y@SYLS�   �       ��   �� �  
�    +� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :+.� :-� 4� ::-� >:*@� F� J:*L� F� J:-N� RT� Z-\� R-�� `-� f� Z-\� R-�� `-�� `-h� ln-� pY-@� sS� w� }� �� Z-\� R� �-\� R
�� Z-\� R� �-\� R�� Z-�� R-�� `-��� �� Z-\� R-�� `--�� `-��� ��� p� �� Z-\� R-�� `--� ��� pY�S� �W-N� R-�� `-�� `-�� `-�� l�-� p� w� }� �-� �YLS� �� �� ��� ��� O-�� R-� �� �� �:-�� `��-ж s� �� Զ �� �� � �-\� R-N� R-�� `--� �Y�S� �-� � �� �-� �Y@S� �� �� ��� G-� �� �� �:-�� `�� ���-�� s� ��� Զ �� �� � �-�� `--� �Y�S� �� pY-� �SY-@� sS� ��� Z-Ķ `-� l-� pY-� �SY-@� sS� w� Z
---� �
� �� �YS�� Z-
� ���� � �-̶ `-
� � ����� �-ж `-
� � ��� Z-Ѷ `-� � �-L� s� �� ��!� Z-Ҷ `-� � �-� �%�(� Z-ֶ `-� � ��,�!��/�� 
� Z� %
� Z
-
� � �-� � ��3� Z� 
� Z---� �
� �� �YS-
� �7-� �Y�S�:� pY-� �SY-@� sS-� �=-\� R-� `-?� lA-� EY� �YCS� pY�EYG�I-� �YLS� �� ��MO�M-� �Y@S� �� ��MQ�M�US�X�[W-]� R�   �   �   ��    ��   �a   ��   ��   ��   �a    ; <    �    � 	   � 
   �    !�    #�    %�    '�    )�    +�    -�    ?�    K�   ��   �� �  �/  � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ������������!�#�#�#�#�!�!�0�:�:�<�<�9�9�9�9�0�0�L�^�^�`�`�]�]�U�U�U�U�L�L�����������������������������������������������������������������C�C�R�R�C�C�C�C�^�^�^�^�B�B�B�B�B�B���������x�B���������������������������������������������*�*�&�&�&�&�$�E�E�K�K�`�`�`�`�i�i�`�`�m�m�������������������������x������������������������������������������������������������������������������������������������
���)�)�)�)�'�`�`�E�3�3�H�H�H�H�/�Q�Q�f�f�o�o�v�v�v�v�Q�B�����������������������������������������������������    �   #     *� 
�   �       ��   �  �   �     ��� ³ ĻiY� pYkSY_SYmSYoSYqSYgSYsSYeSYuSY	wSY
ySY� pY�iY� pY{SY}SYSY�SY�SY�S��SY�iY� pY{SY}SYSY�SY�SY�S��SS���c�   �       ���   �S �   "     g�   �       ��        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 5cfsecurity2ecfc637258255$funcGETALLRUNTIMEPERMISSIONS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ALLRUNTIMEPERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   ACCESSMANAGER  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 

         1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G 
		 K _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; M N
 " O checkAdminRoles Q java/lang/Object S coldfusion.sandboxsecurity U _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; W X
 " Y ArrayNew (I)Ljava/util/List; [ \
 C ] _autoscalarize _ N
 " ` _List $(Ljava/lang/Object;)Ljava/util/List; b c coldfusion/runtime/Cast e
 f d getClassLoader h ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z j k
 C l setContextClassLoader n  enableContextClassLoaderOverride p createSecurityManager r getenv.* t shutdownHooks v modifyThread x 
stopThread z getProtectionDomain | readFileDescriptor ~ writeFileDescriptor � accessClassInPackage.* � defineClassInPackage.* � accessDeclaredMembers � queuePrintJob � getStackTrace � "setDefaultUncaughtExceptionHandler � preferences � 
textnocase � asc � 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z � �
 C � 
	 � java/lang/String � getAllRuntimePermissions � metaData Ljava/lang/Object; � �	  � array � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � $Get array of all runtime permissions � 
Parameters � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 7Lcfsecurity2ecfc637258255$funcGETALLRUNTIMEPERMISSIONS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   #     � ��    �        � �    � �  �      ;+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6-8� :-<>� D� J-L� 6-;� :--� PR� TYVS� ZW
-=� :-� ^� J->� :-
� a� gi� mW-?� :-
� a� go� mW-@� :-
� a� gq� mW-A� :-
� a� gs� mW-B� :-
� a� gu� mW-C� :-
� a� gw� mW-D� :-
� a� gy� mW-E� :-
� a� g{� mW-F� :-
� a� g}� mW-G� :-
� a� g� mW-H� :-
� a� g�� mW-I� :-
� a� g�� mW-J� :-
� a� g�� mW-K� :-
� a� g�� mW-L� :-
� a� g�� mW-M� :-
� a� g�� mW-N� :-
� a� g�� mW-O� :-
� a� g�� mW-Q� :-
� a� g��� �W-
� a�-�� 6�    �   z   ; � �    ; � �   ; � �   ; � �   ; � �   ; � �   ; � �   ; - .   ;  �   ;  � 	  ;  � 
  ;  �  �  : �  7 <8 F8 F8 H8 H8 E8 E8 E8 E8 <8 <8 `; `; n; n; _; _; _; u= = = ~= ~= ~= ~= u= �> �> �> �> �> �> �> �> �> �? �? �? �? �? �? �? �? �? �@ �@ �@ �@ �@ �@ �@ �@ �@ �A �A �A �A �A �A �A �A �A �B �B �B �B �B �B �B �B �B �C �C �C �CCC �C �C �CDDDDDDDDD'E'E'E'E0E0E'E'E'E=F=F=F=FFFFF=F=F=FSGSGSGSG\G\GSGSGSGiHiHiHiHrHrHiHiHiHIIII�I�IIII�J�J�J�J�J�J�J�J�J�K�K�K�K�K�K�K�K�K�L�L�L�L�L�L�L�L�L�M�M�M�M�M�M�M�M�M�N�N�N�N�N�N�N�N�NOOOOOOOOOQQQQ"Q"Q$Q$QQQQ*S*S*S*S*S _9     �   #     *� 
�    �        � �    �   �   r     T� �Y� TY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� TS� �� ��    �       T � �    � �  �   !     ��    �        � �        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc 2cfsecurity2ecfc637258255$funcDELETESECURITYSANDBOX  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   THISAPP  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   AC  ACCESSMANAGER ! SECURITY # THISAPPCONTEXT % THISPATLIST ' THISDIR ) WEBAPP + coldfusion/runtime/CfJspPage - pageContext #Lcoldfusion/runtime/NeoPageContext; / 0	 . 1 getOut ()Ljavax/servlet/jsp/JspWriter; 3 4 javax/servlet/jsp/JspContext 6
 7 5 parent Ljavax/servlet/jsp/tagext/Tag; 9 :	 . ; 	DIRECTORY = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G 
	
		 I _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V K L
 . M / O set (Ljava/lang/Object;)V Q R coldfusion/runtime/Variable T
 U S _setCurrentLineNo (I)V W X
 . Y _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; [ \
 . ] _String &(Ljava/lang/Object;)Ljava/lang/String; _ ` coldfusion/runtime/Cast b
 c a Trim &(Ljava/lang/String;)Ljava/lang/String; e f coldfusion/runtime/CFPage h
 i g &(Ljava/lang/String;)Ljava/lang/Object; [ k
 . l   n 	component p CFIDE.adminapi.accessmanager r CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; t u
 i v java x  coldfusion.server.ServiceFactory z getSecurityService | java/lang/Object ~ _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _get � \
 . � checkAdminRoles � coldfusion.sandboxsecurity � java/lang/String � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � /* � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 . � _Object (Z)Ljava/lang/Object; � �
 c � _boolean (Ljava/lang/Object;)Z � �
 c � GETCFIDEDIRECTORY � � k
 . � getCFIDEDirectory � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 . � GETWEBINFDIRECTORY � getWebInfDirectory � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 . � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � CANNOT_DELETE_SYSTEM_SANDBOXES � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 . � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 . � CONTEXTS � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 c � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 i � _resolve � �
 . � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 . � IsStruct � �
 i � RESULT � StructDelete %(Ljava/util/Map;Ljava/lang/String;Z)Z � �
 i � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 . � SANDBOX_NOT_FOUND � security.constraints � 	IsDefined (Ljava/lang/String;)Z
 i CONSTRAINTS THISAPPCONST StructKeyArray +(Ljava/util/Map;)Lcoldfusion/runtime/Array;	

 i I (I)Ljava/lang/Object; �
 c C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; �
 . 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; �
 . url-pattern-list 9(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; �
 . D _int (Ljava/lang/Object;)I 
 c! ,# 	ListGetAt 9(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;%&
 i' ListDeleteAt)&
 i* _arraySetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V,-
 .. _double (Ljava/lang/Object;)D01
 c2 (D)Ljava/lang/Object; �4
 c5 ListLen (Ljava/lang/String;)I78
 i9 Len; 
 i< (Ljava/lang/Object;D)D �>
 .? � �
 iA ArrayLenC 
 iD 
		F LOGAUDITH logauditJ msgL java/lang/StringBuilderN 9 removed security sandbox restrictions for the directory P  �
OR append -(Ljava/lang/String;)Ljava/lang/StringBuilder;TU
OV .X toString ()Ljava/lang/String;Z[
 \ )([Ljava/lang/Object;[Ljava/lang/Object;)V ^
 C_ b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; �a
 .b 
	d deleteSecuritySandboxf metaData Ljava/lang/Object;hi	 j voidl truen &coldfusion/runtime/AttributeCollectionp namer accesst publicv outputx 
returntypez hint| 6Removes security sandbox restrictions for a directory.~ 
Parameters� REQUIRED� HINT� >Specifies the directory of the security sandbox to be removed.� NAME� 	directory� ([Ljava/lang/Object;)V �
q� getMetadata ()Ljava/lang/Object; this 4Lcfsecurity2ecfc637258255$funcDELETESECURITYSANDBOX; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw28 !Lcoldfusion/tagext/lang/ThrowTag; throw29 LineNumberTable <clinit> 	getOutput 1       � �   hi   	 �� �   "     �k�   �       ��   �[ �   "     g�   �       ��   �� �         �   �       ��   �[ �   "     m�   �       ��   �� �   (     
� �Y>S�   �       
��   �� �  �    �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :-� 2� 8:-� <:*>� D� H:-J� NP� V
-'� Z-� ^� d� j� V-(� Z->� m� d� j� Vo� Vo� Vo� V-,� Z-qs� w� V--� Z---� Z-y{� w}� � �� V-/� Z--� ��� Y�S� �W-� �Y>S� ��� ��~�� �Y� �� 6W-� �Y>S� �-2� Z-�� ��-� � �� ��~�� �Y� �� 6W-� �Y>S� �-3� Z-�� ��-� � �� ��~�� �� �� G-� �� �� �:-5� Zö ���-϶ m� dø Ӷ �� �� ޙ �-;� Z--� �Y�S� �� �-
� ^� d� � �-=� Z-� �Y�S� �-
� ^� � � �-� �Y�S� �-
� ^� � V-�-@� Z--� ^� �-� ^� d� �� �� �-�� m� ��� G-� �� �� �:-D� Zö ���-�� m� dø Ӷ �� �� ޙ �-J� Z- ��z-L� Z-� �YS� �� �]-N� Z--� �YS� �� �-
� ^� d� �3--� �YS� �-
� ^� � �-Q� Z--� m� �� V-�� ���-U� Z---� m��� ��-W� Z----� m��� �� �d-� Y--� m�SYS�� V-�� �� �-]� Z-� ^� d-� m�"$�(-� ^� ��~�� R-_� Z-� ^� d-� m�"$�+� V-� Y--� m�SYS-� ^�/� _--� m�3c�6� �-� m-[� Z-� Y--� m�SYS�� d�:�� ��t|���--f� Z-f� Z-� ^� d� j�=���@�� )-h� Z--� m� �--� m�� d�BW--� m�3c�6� �-� m-S� Z-� ^�E�� ��t|���"-G� N-q� Z-I� �K-� CY� �YMS� Y�OYQ�S-� �Y>S� �� d�WY�W�]S�`�cW-e� N�   �   �   ���    ���   ��i   ���   ���   ���   ��i   � 9 :   � �   � � 	  � � 
  � �   � !�   � #�   � %�   � '�   � )�   � +�   � =�   ���   ��� �  �w  " |& ~& ~& ~& ~& |& �' �' �' �' �' �' �' �' �' �' �( �( �( �( �( �( �( �( �( �( �) �) �) �) �) �) �* �* �* �* �* �* �+ �+ �+ �+ �+ �+ �, �, �, �, �, �, �, �, �, �, �- �- �- �- �- �- �- �- �- �- �- �-	/	//////11-1-11111C2C2Y2Y2Y2Y2C2C2C2C22222}3}3�3�3�3�3}3}3}3}333�5�5�51;;;;;;;; ; ;)=)=8=8=)=)=)=)=I?I?X?X?I?I?I?I?G?o@o@o@o@x@x@x@x@�@�@n@n@n@n@d@�B�B�B�B�B�B�D�D�D�D�D�B)= ;�J�J�J�J�L�L�L�LNNNN&N&N&N&NNN9P9PIPIP9P9P9P9P5P_Q_Q_Q_Q^Q^Q^Q^QUQsSsSsSsSoS�U�U�U�U�U�U�W�W�W�W�W�W�W�W�W�W�Y�Y�Y�Y�Y�Y�Y�Y�Y�[�[�[�[�[]]]]
]
]
]
]]]]]]]]]5_5_5_5_>_>_>_>_H_H_5_5_5_5_,_^`^`k`k`o`o`o`o`Q`xa][[[[�[�[[[[[{[�[�[�[�[�[�[�[�[�[�[�[�[�[�[�[�f�f�f�f�f�f�f�f�f�f	h	h	h	hhhhhhhhhh�f�W�U+S+S+S+S5S5S+S+S+S+S'S=S=SKSKSKSKS=S=SoSN�L�J |%uquq�q�q�q�q�q�q�q�q�q�q�q�ququququq    �   #     *� 
�   �       ��   �  �   �     ��� �� ��qY� YsSYgSYuSYwSYySYoSY{SYmSY}SY	SY
�SY� Y�qY� Y�SYoSY�SY�SY�SY�S��SS���k�   �       ���   �[ �   "     o�   �       ��        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc $cfsecurity2ecfc637258255$funcSETUSER  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / USERNAME 1 string 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C PASSWORD E get (I)Ljava/lang/Object; G H
 9 I DESCRIPTION K   M put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; O P
 9 Q _validateArgWithValidator S B
  T ROLES V _setCurrentLineNo (I)V X Y
 " Z ArrayNew (I)Ljava/util/List; \ ] coldfusion/runtime/CFPage _
 ` ^ array b ARRAY_VALIDATOR d >	 < e ALLOWRDSACCESS g false i boolean k BOOL_VALIDATOR m >	 < n ALLOWADMINACCESS p ALLOWADMINAPIACCESS r SERVICES t 	ENABLEDDS v FILEPERMISSIONS x ISHASHED z ALLOWCLIENTCERTAUTH | 

         ~ _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V � �
 " � 	component � CFIDE.adminapi.accessmanager � CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; � �
 ` � set (Ljava/lang/Object;)V � � coldfusion/runtime/Variable �
 � � java �  coldfusion.server.ServiceFactory � getSecurityService � java/lang/Object � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 " � 
		
		 � _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
 " � checkRootAdminUser � 
		
		
		 � _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; � �
 " � ArrayLen (Ljava/lang/Object;)I � �
 ` � 1 � _double (Ljava/lang/String;)D � � coldfusion/runtime/Cast �
 � � _Object (D)Ljava/lang/Object; � �
 � � I � bindPageVariable P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable; � �
 " � 
			 � _arrayGetAt 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 " � IsSimpleValue (Ljava/lang/Object;)Z � �
 ` � 
				 � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 " � coldfusion/tagext/lang/ThrowTag � 2The roles argument can contain only simple values. � 
setMessage (Ljava/lang/String;)V � �
 � � cfadminapivalidationerror � setType � �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 " � 
		 � CFLOOP � checkRequestTimeout � �
 " � _checkCondition (DDD)Z � �
 " � 

		  setAuthorizedUser java/lang/String _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object;
 " LOGAUDIT
 � �
 " logaudit msg java/lang/StringBuilder  added/edited user   �
 _String &(Ljava/lang/Object;)Ljava/lang/String;
 � append -(Ljava/lang/String;)Ljava/lang/StringBuilder;
 .  toString ()Ljava/lang/String;"#
 �$ )([Ljava/lang/Object;[Ljava/lang/Object;)V &
 9' 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object;)*
 "+ 		
	- setUser/ metaData Ljava/lang/Object;12	 3 void5 &coldfusion/runtime/AttributeCollection7 name9 access; public= output? 
returntypeA hintC Add or Update a new user.E 
ParametersG REQUIREDI trueK TYPEM HINTO %Specifies the username for this user.Q NAMES usernameU ([Ljava/lang/Object;)V W
8X %Specifies the password for this user.Z password\ $Specifies a description of the user.^ DEFAULT` descriptionb %Administrative roles assigned to userd [runtime expression]f rolesh =Specifies whether or not RDS access is allowed for this user.j allowrdsaccessl XSpecifies whether or not CF Administrator and Admin API access is allowed for this user.n allowadminaccessp CSpecifies whether or not Admin API access is allowed for this user.r allowadminapiaccesst $Services  user is allowed to access.v servicesx !datasources to allowed to access.z 	enabledds| Files to allowed to access.~ filepermissions� ;Set it to true if the password sent is already hashed once.� isHashed� allowclientcertauth� getMetadata ()Ljava/lang/Object; this &Lcfsecurity2ecfc637258255$funcSETUSER; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t24 D t26 t28 t30 throw53 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �   12   	 �� �   "     �4�   �       ��   �# �   "     0�   �       ��   �� �         �   �       ��   �# �   "     6�   �       ��   �� �   f     H�Y2SYFSYLSYWSYhSYqSYsSYuSYwSY	ySY
{SY}S�   �       H��   �� �  ,     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:*F4� :� @� D:� J� LN� RW*L4� :� @� U:� J� W-	d� [-� a� RW*Wc� :� f� U:� J� hj� RW*hl� :� o� U:� J� qj� RW*ql� :� o� U:� J� sj� RW*sl� :� o� U:� J� u-	h� [-� a� RW*uc� :� f� U:� J� w-	i� [-� a� RW*wc� :� f� U:	� J� y-	j� [-� a� RW*yc	� :� f� U:
� J� {j� RW*{l
� :� o� U:� J� }j� RW*}l� :� o� U:-� �
-	m� [-��� �� �-� �-	n� [--	n� [-��� ��� �� �� �-�� �-	p� [--
� ��� �� �W-�� �9-	s� [-W� �� ��9�� �9� �:-�+� �:� �� �-ö �-	t� [-W-�� �� Ǹ ��� G-Ͷ �-� �� �� �:-	u� [� �� �� �� �� �-ö �-�� �c\9� �:� ��� �� ���o-� �-	z� [--� �� �Y-�Y2S�	SY-�YFS�	SY-�YLS�	SY-�YqS�	SY-�YhS�	SY-�YsS�	SY-�YwS�	SY-�YyS�	SY-�YWS�	SY	-�YuS�	SY
-�Y{S�	SY-�Y}S�	S� �W-�� �-	�� [-�-� 9Y�YS� �Y�Y�-�Y2S�	��!��%S�(�,W-.� ��   �  $   ���    ���   ��2   ���   ���   ���   ��2   � - .   � �   � � 	  � � 
  � �   � 1�   � E�   � K�   � V�   � g�   � p�   � r�   � t�   � v�   � x�   � z�   � |�   ���   ���   ���   ���   ��� �  6 �  	` h	c h	c �	d �	d �	d �	d �	d �	d �	e �	e �	f �	f	g	g@	h@	h?	h?	h?	h?	hs	is	ir	ir	ir	ir	i�	j�	j�	j�	j�	j�	j�	k�	k�	l�	l	m&	m&	m(	m(	m%	m%	m%	m%	m	m	m8	nJ	nJ	nL	nL	nI	nI	nA	nA	nA	nA	n8	n8	nm	pm	pl	pl	pl	pl	p�	s�	s�	s�	s�	s�	s�	s�	s�	t�	t�	t�	t�	t�	t�	t�	t�	t�	t�	u�	u	u	u�	u�	tM	s�	sa	za	zq	zq	z�	{�	{�	|�	|�	}�	}�	~�	~�	�	�	��	��	��	�	�	�	�	�*	�*	�=	�=	�`	z`	z`	z`	y`	�`	��	��	��	��	��	��	��	��	��	��	�	�	�`	�`	�`	�`	�    �   #     *� 
�   �       ��   �  �  �    �Ѹ ׳ ٻ8Y� �Y:SY0SY<SY>SY@SYjSYBSY6SYDSY	FSY
HSY� �Y�8Y� �YJSYLSYNSY4SYPSYRSYTSYVS�YSY�8Y� �YJSYLSYNSY4SYPSY[SYTSY]S�YSY�8Y
� �YPSY_SYJSYjSYNSY4SYaSYNSYTSY	cS�YSY�8Y
� �YPSYeSYJSYjSYNSYcSYaSYgSYTSY	iS�YSY�8Y
� �YPSYkSYJSYjSYNSYlSYaSYjSYTSY	mS�YSY�8Y
� �YPSYoSYJSYjSYNSYlSYaSYjSYTSY	qS�YSY�8Y
� �YPSYsSYJSYjSYNSYlSYaSYjSYTSY	uS�YSY�8Y
� �YPSYwSYJSYjSYNSYcSYaSYgSYTSY	yS�YSY�8Y
� �YPSY{SYJSYjSYNSYcSYaSYgSYTSY	}S�YSY	�8Y
� �YPSYSYJSYjSYNSYcSYaSYgSYTSY	�S�YSY
�8Y
� �YPSY�SYJSYjSYNSYlSYaSYjSYTSY	�S�YSY�8Y� �YJSYjSYNSYlSYaSYjSYTSY�S�YSS�Y�4�   �      ���   �# �   !     j�   �       ��        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 0cfsecurity2ecfc637258255$funcSETUSEADMINPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / USEADMINPASSWORD 1 boolean 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; m n
 " o checkRootAdminUser q setAdminSecurityEnabled s java/lang/String u _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; w x
 " y LOGAUDIT { &(Ljava/lang/String;)Ljava/lang/Object; m }
 " ~ logaudit � msg �  enabled using admin password. � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 9 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � setUseAdminPassword � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � @Specifies whether ColdFusion Administrator security is required. � 
Parameters � REQUIRED � Yes � TYPE � HINT � True or False � NAME � useAdminPassword � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 2Lcfsecurity2ecfc637258255$funcSETUSEADMINPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� vY2S�    �       
 � �    � �  �  i    +� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
-g� N-PR� X� ^-`� J-h� N--h� N-bd� Xf� h� l� ^-`� J-j� N--
� pr� h� lW-k� N--� pt� hY-� vY2S� zS� lW-`� J-n� N-|� �-� 9Y� vY�S� hY�S� �� �W-�� J�    �   �    � �     � �    � �    � �    � �    � �    � �    - .     �     � 	    � 
    �    1 �  �   � .   e O g X g X g Z g Z g W g W g W g W g O g O g j h z h z h | h | h y h y h r h r h r h r h j h j h � j � j � j � j � j � k � k � k � k � k � k � k � i � n � n � n � n � n � n � n � n     �   #     *� 
�    �        � �    �   �   �     �� �Y� hY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� hY� �Y� hY�SY�SY�SY4SY�SY�SY�SY�S� �SS� �� ��    �       � � �    � �  �   !     ��    �        � �        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc )cfsecurity2ecfc637258255$funcGETENABLERDS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   SUCCESS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   ACCESSMANAGER  WEBX ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 
		 3 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 5 6
 $ 7 coldfusion/runtime/CFBoolean 9 f_false Lcoldfusion/runtime/CFBoolean; ; <	 : = set (Ljava/lang/Object;)V ? @ coldfusion/runtime/Variable B
 C A   E 

         G _setCurrentLineNo (I)V I J
 $ K 	component M CFIDE.adminapi.accessmanager O CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; Q R coldfusion/runtime/CFPage T
 U S _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; W X
 $ Y checkRootAdminUser [ java/lang/Object ] _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; _ `
 $ a checkAdminRoles c 
standalone e *coldfusion/runtime/TransientVariableHolder g &(Lcoldfusion/runtime/NeoPageContext;)V  i
 h j 
			 l GetPageContext %()Lcoldfusion/runtime/NeoPageContext; n o
 U p 
getRequest r getRealPath t /WEB-INF v _String &(Ljava/lang/Object;)Ljava/lang/String; x y coldfusion/runtime/Cast {
 | z web.xml ~ concat &(Ljava/lang/String;)Ljava/lang/String; � � java/lang/String �
 � � 
FileExists (Ljava/lang/String;)Z � �
 U � 
				 � PATH � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 $ � java/lang/StringBuilder � SERVER � 
COLDFUSION � ROOTDIR � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 $ � (Ljava/lang/String;)V  �
 � � FS � _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; � �
 $ � append -(Ljava/lang/String;)Ljava/lang/StringBuilder; � �
 � � wwwroot � WEB-INF � toString ()Ljava/lang/String; � �
 ^ � 

			 � path � 	IsDefined � �
 U � $class$coldfusion$tagext$lang$LockTag Ljava/lang/Class; coldfusion.tagext.lang.LockTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 $ � coldfusion/tagext/lang/LockTag � 
rdsservlet � setName � �
 � � 	EXCLUSIVE � setType � �
 � � 
setTimeout � J
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 
doStartTag ()I � �
 � � 
					 � "class$coldfusion$tagext$io$FileTag coldfusion.tagext.io.FileTag � � �	  � coldfusion/tagext/io/FileTag � READ � 	setAction � �
 � � cffile � file � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 $ � setFile � �
 � � webxml � setVariable � �
 � � setAddnewline �
 � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z
 $ WEBXML XmlParse 0(Ljava/lang/String;)Lcoldfusion/xml/XmlNodeList;

 U I _Object (I)Ljava/lang/Object;
 | web-app servlet-mapping _arrayGetAt D(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;)Ljava/lang/Object;
 $ _Map #(Ljava/lang/Object;)Ljava/util/Map;
 | XMLNAME  6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �"
 $# _compare '(Ljava/lang/Object;Ljava/lang/String;)D%&
 $' XMLCHILDREN) _resolve+"
 $, 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;.
 $/ XMLTEXT1 
RDSServlet3 t_true5 <	 :6 _double (Ljava/lang/Object;)D89
 |: (D)Ljava/lang/Object;<
 |= ArrayLen (Ljava/lang/Object;)I?@
 UA '(Ljava/lang/Object;Ljava/lang/Object;)D%C
 $D doAfterBodyF �
 �G doEndTagI �
 �J doCatch (Ljava/lang/Throwable;)VLM
 �N 	doFinallyP 
 �Q 
						S WRITEU outputW � X
 $Y ToString[ y
 U\ \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object; �^
 $_ 	setOutputa @
 �b unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;de coldfusion/runtime/NeoExceptiong
hf t0 [Ljava/lang/String; Anyljk	 n findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)Ipq
hr CFCATCHt bindv �
 hw unbindy 
 hz 
	| getEnableRDS~ metaData Ljava/lang/Object;��	 � boolean� false� &coldfusion/runtime/AttributeCollection� name� access� public� 
returntype� hint� Checks whether RDS is enabled.� 
Parameters� ([Ljava/lang/Object;)V �
�� getMetadata ()Ljava/lang/Object; this +Lcfsecurity2ecfc637258255$funcGETENABLERDS; LocalVariableTable Code getName 	getAccess getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t13 ,Lcoldfusion/runtime/TransientVariableHolder; lock14  Lcoldfusion/tagext/lang/LockTag; mode14 file13 Lcoldfusion/tagext/io/FileTag; t17 t18 t19 Ljava/lang/Throwable; t20 t21 lock16 mode16 file15 t25 t26 t27 t28 t29 t30 #Lcoldfusion/runtime/AbortException; t31 Ljava/lang/Exception; __cfcatchThrowable0 t33 t34 LineNumberTable java/lang/Throwable� !coldfusion/runtime/AbortException� java/lang/Exception� <clinit> 	getOutput 1       � �    � �   jk   ��   	 �� �   "     ���   �       ��   � � �   "     �   �       ��   � � �         �   �       ��   � � �   "     ��   �       ��   �� �   #     � ��   �       ��   �� �  � 
 #  !+� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:-4� 8
� >� D-4� 8F� D-H� 8-� L-NP� V� D-4� 8-� L--� Z\� ^� bW-4� 8-� L--� Zd� ^YfS� bW-4� 8� hY-� (� k:-m� 8-� L--� L--� L--� L-� qs� ^� bu� ^YwS� b� }� �� �� ]-�� 8-�-� L--� L--� L-� qs� ^� bu� ^YwS� b� }� �� �-m� 8� �- � L-� �Y-�� �Y�SY�S� �� }� �-�� �� }� ��� �-�� �� }� ��� �-�� �� }� �� �� �� �� m-�� 8-�� �Y-�� �Y�SY�S� �� }� �-�� �� }� ��� �-�� �� }� ��� �-�� �� }� �� �� �� �-m� 8-�� 8-$� L-�� ��#-�� 8-� �� �� �:-%� LͶ �Ҷ �� �� �� �Y6��-� 8-� �� �� �:-&� L�� ���-�� �� }� �� ��� �� ��� :�d��-� 8-(� L--	� �� }�� D-�� �� �--� ^YSYSY-� �S��� �Y!S�$�(�� b---� ^YSYSY-� �S��� �Y*S�-��0�� �Y2S�$4�(�� 
�7� D� Q--� ��;c�>� �-� �-)� L-� ^YSYS��B��E�t|���-�� 8�H��x�K� :� &���� � #:�O� � :� �:�R�-� 8-� �� �� �:-6� LͶ �Ҷ �� �� �� �Y6� �-T� 8-� �� �� �:-7� LV� ���-�� �� }� �� ��X-7� L--�Z�]�`�c�� ��� :� K� ��-� 8�H��w�K� :� &� ��� � #:�O� � :� �:�R�-m� 8� -�� 8
� >� D-m� 8-m� 8� f� l:�:�i:  �o�s�      9           u �x-�� 8
� >� D-m� 8� �� � :!� !�:"�{�"-4� 8-
�Z�-}� 8� !��B��6B�<?B���Q��6Q�<?Q�BNQ�QVQ��M�"AM�GJM��\�"A\�GJ\�MY\�\a\� �����6��<��"A��G��� �����6��<��"A��G��� �����6��<��"A��G����������� �  ` #  !��    !��   !��   !��   !��   !��   !��   ! / 0   ! �   ! � 	  ! � 
  ! �   ! !�   !��   !��   !�   !��   !��   !��   !��   !��   !��   !��   !�   !��   !��   !��   !��   !��   !��   !��   !��   !��    !�� !  !�� "�     D F F F F D D T V V V V T T c m m o o l l l l c c � � � � � � � � � � � � � � � � � � � � � � � � � � � �CC;;XX3333aa3333))� � � � � � � � � � � � � � � � � � � � � � | | | | { { �!�!�!�!�!�!�!�!!!!!!!!!!!!!!!!!-!-!�!�!�!�!�!�!{  �P$P$O$O$x%x%%%�&�&�&�&�&�&�&�&�&((((((((($)$)$)$) )8+8+>+>+D+D+.+.+_+_+u-u-{-{-�-�-k-k-�-�-j-j-�-�-�/�/�/�/�/�0j-.+�)�)�)�)�)�)�)�)�)�)�)�)�)�)�)�)�)�)�)�)�)�)�) )'`%�6�6�6�6�7�7�7�7�7�7�7�7�7�7�7�7�7j6�:�:�:�:�:�:x9O$�=�=�=�=�=�= �@@@@@    �   #     *� 
�   �       ��   �  �   �     |�� ó �� ó �� �YmS�o��Y� ^Y�SYSY�SY�SYXSY�SY�SY�SY�SY	�SY
�SY� ^S�����   �       |��   � � �   "     ��   �       ��        ����  -K 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc637258255$funcGETSECUREDIPPORTS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   PERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SOCKETARRAY  ACCESSMANAGER ! SECURITY # I % WEBAPP ' coldfusion/runtime/CfJspPage ) pageContext #Lcoldfusion/runtime/NeoPageContext; + ,	 * - getOut ()Ljavax/servlet/jsp/JspWriter; / 0 javax/servlet/jsp/JspContext 2
 3 1 parent Ljavax/servlet/jsp/tagext/Tag; 5 6	 * 7 	DIRECTORY 9 getVariable  (I)Lcoldfusion/runtime/Variable; ; < %coldfusion/runtime/ArgumentCollection >
 ? = _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 
		 E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 * I / K set (Ljava/lang/Object;)V M N coldfusion/runtime/Variable P
 Q O _setCurrentLineNo (I)V S T
 * U ArrayNew (I)Ljava/util/List; W X coldfusion/runtime/CFPage Z
 [ Y M T
 Q ] 	component _ CFIDE.adminapi.accessmanager a CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; c d
 [ e java g  coldfusion.server.ServiceFactory i getSecurityService k java/lang/Object m _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; o p
 * q _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; s t
 * u checkAdminRoles w Ucoldfusion.sandboxsecurity,coldfusion.serversettings,coldfusion.serversettingssummary y coldfusion/runtime/CFBoolean { f_false Lcoldfusion/runtime/CFBoolean; } ~	 |  java/lang/String � CONTEXTS � _resolve D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
 * � _autoscalarize � t
 * � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 * � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � _resolveAndAutoscalarize � �
 * � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 [ � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 * � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � &(Ljava/lang/String;)Ljava/lang/Object; � �
 * � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 * � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � 	_emptyTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 * � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 * � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 [ � C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; � �
 * � CLASS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 * � java.net.SocketPermission � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 * � _List $(Ljava/lang/Object;)Ljava/util/List; � �
 � � TARGET � ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z � �
 [ � _double (Ljava/lang/Object;)D � �
 � � _Object (D)Ljava/lang/Object; � �
 � � ArrayLen (Ljava/lang/Object;)I � �
 [ � (I)Ljava/lang/Object; � �
 � � '(Ljava/lang/Object;Ljava/lang/Object;)D �
 * 
	 getSecuredIPPorts metaData Ljava/lang/Object;		 
 false &coldfusion/runtime/AttributeCollection name access public output hint 2Returns an array of secured ports for the sandbox. 
Parameters REQUIRED true  HINT" ESpecifies the sandbox directory for which secured ports are returned.$ NAME& 	directory( ([Ljava/lang/Object;)V *
+ getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc637258255$funcGETSECUREDIPPORTS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw48 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �   	    -. 2   "     ��   1       /0   34 2   "     �   1       /0   56 2         �   1       /0   78 2   (     
� �Y:S�   1       
/0   9: 2  S    [+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :-� .� 4:-� 8:*:� @� D:-F� JL� R
-� V-� \� R- � V-� \� R� ^-"� V-`b� f� R-#� V--#� V-hj� fl� n� r� R-%� V--� vx� nYzSY� �S� rW-'� V--� �Y�S� �-� �� �� �-� �Y:S� �� �� ��� G-� �� �� �:-)� V�� ���-�� ø ��� Ƕ �� �� ҙ �
--� V--� �Y�S� �� nY-� �SY-:� �S� ո ٶ R� ^� l--
-� �� ܸ �� �Y�S� �� ��� 3-5� V-� �� �--
-� �� ܸ �� �Y�S� � �W-� �� �c� �� R-� �-1� V-
� �� �� ��t|���s-� ��-� J�   1   �   [/0    [;<   [=	   [>?   [@A   [BC   [D	   [ 5 6   [ E   [ E 	  [ E 
  [ E   [ !E   [ #E   [ %E   [ 'E   [ 9E   [FG H  * �   l n n n n l s } } | | | | s �  �  �  �  �  �  �  �  �! �! �" �" �" �" �" �" �" �" �" �" �# �# �# �# �# �# �# �# �# �# �# �# �% �% �% �% �% �% �% �% �% �' �''' �' �' �' �''''' �' �' �' �' �' �'W)W)W)W)4) �'�-�-�-�-�-�-�-�-�-�-�-�-x-�1�3�3�3�3�3�3�5�5�5�5�5�5�5�5�5�5�5�311111111111"1"1/1/1/1/1"1"1�1I9I9I9I9I9 l    2   #     *� 
�   1       /0   I  2   �     ��� �� ��Y
� nYSYSYSYSYSYSYSYSYSY	� nY�Y� nYSY!SY#SY%SY'SY)S�,SS�,��   1       �/0   J4 2   "     �   1       /0        