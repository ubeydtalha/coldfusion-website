����  -� 
SourceFile 2/CFIDE/administrator/cftags/resources/setup_en.cfm cfsetup_en2ecfm162246523  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   
ATTRIBUTES Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   CALLER   	   BSUCCESS   	    com.macromedia.SourceModTime  h���` pageContext #Lcoldfusion/runtime/NeoPageContext; % &	  ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	  1 	ISO8859_1 3 setPageEncoding (Ljava/lang/String;)V 5 6 !coldfusion/runtime/NeoPageContext 8
 9 7 3class$coldfusion$tagext$lang$ProcessingDirectiveTag Ljava/lang/Class; -coldfusion.tagext.lang.ProcessingDirectiveTag = forName %(Ljava/lang/String;)Ljava/lang/Class; ? @ java/lang/Class B
 C A ; <	  E _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; G H
  I -coldfusion/tagext/lang/ProcessingDirectiveTag K _setCurrentLineNo (I)V M N
  O setSuppresswhitespace (Z)V Q R
 L S 	hasEndTag U R coldfusion/tagext/GenericTag W
 X V 
doStartTag ()I Z [
 L \ $class$coldfusion$tagext$io$SilentTag coldfusion.tagext.io.SilentTag _ ^ <	  a coldfusion/tagext/io/SilentTag c
 d \ 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; f g
  h doAfterBody j [
 X k _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; m n
  o doEndTag q [ #javax/servlet/jsp/tagext/TagSupport s
 t r doCatch (Ljava/lang/Throwable;)V v w
 X x 	doFinally z 
 X { 	__HTSWT_0 Lcoldfusion/util/FastHashtable; } ~	   java/lang/String � ID � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
  � __caseValue 4(Lcoldfusion/util/FastHashtable;Ljava/lang/Object;)I � �
  � Example Applications � write � 6 java/io/Writer �
 � � back � next � ~Please select a language for the online help in the ColdFusion Administrator and for the example applications (if applicable). � Language � �Would you like to install the example applications? For security reasons, the example applications should not be installed on production servers. � 7<b>Yes</b>, I want to install the example applications. � =<b>No</b>, I do not want to install the example applications. � IExample applications cannot be installed on Windows without ODBC support. � Finish Setup � Ok � Finishing setup: � %Installing ODBC datasource support... �  Installing administrator help... � "Installing example applications... � Installing windows libraries... � Finishing setup wizard... � Setup complete. � ODBC � �Would you like to install support for ODBC data sources, such as Microsoft Access? If you select "Yes," ColdFusion MX installs an additional driver and set of services for connecting to ODBC. � 0<b>Yes</b>, I want to install the ODBC services. � 6<b>No</b>, I do not want to install the ODBC services. � *You must supply an administrator password. � 2The administrator password and confirm must match. � -If you enable RDS you must supply a password. � (The RDS password and confirm must match. � Security Settings � $ColdFusion MX administrator password � password � confirm � KThe Remote Development Services were not installed. Click next to continue. � �Please enter a password for the Remote Development Services (RDS). If you wish to disable RDS, please consult the installation guide. � 
Enable RDS � %You entered an invalid serial number. � Serial Number � Submit � Continue in Trial Mode � oWelcome to ColdFusion MX. This wizard will guide you through the steps necessary to complete your installation. � NIf you purchased a license for ColdFusion MX, please enter your serial number. � Serial number � MIf you did not purchase a license, you can use the Trial Edition for 30 days. � Error � 0Setup encountered errors while installing files. � $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag � � <	  � coldfusion/tagext/io/OutputTag �
 � \ '
Unable to set admin password.<br />
 � CFCATCH � MESSAGE � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � <br />
 � DETAIL � 
  _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V
 
 � k coldfusion/tagext/QueryLoop
 r
 x
 � { %
Unable to set RDS password.<br />
 *
Unable to configure RDS service.<br />
 &
Unable to set serial number.<br />
 false set (Ljava/lang/Object;)V coldfusion/runtime/Variable
 coldfusion/runtime/SwitchTable
 	 SUBMIT addStringCase 5(Ljava/lang/String;I)Lcoldfusion/runtime/SwitchTable; 
! SETUP_ERRORS# 	DOC_TITLE% FINISH_DESC' SECURITY_DESC) TRIAL+ INSTALLING_EXAMPLES- INSTALL_ODBC/ ADMIN_PW_ERROR1 CONFIRM3 SERIAL_ENTER5 FINISH_TITLE7 ODBC_YES9 LANGUAGE; NEXT= OK? ODBC_NOA ERROR_LABELC EXAMPLES_NOE 
ODBC_TITLEG INSTALL_EXAMPLESI SERIAL_INVALIDK ADMIN_PW_LABELM ADMIN_PW_MISMATCHO REGISTER_DLLQ EXAMPLES_YESS 
TRIAL_DESCU SECURITY_NORDSW PASSWORDY ADMIN_PW_REQUIRED[ RDS_CONFIG_ERROR] 	ENABLERDS_ SETUP_COMPLETEa RDS_PW_ERRORc SERIAL_DESCe LANGUAGE_SELECTg LICENSE_ERRORi SERIAL_NUMBERk SECURITY_TITLEm CANT_INSTALL_EXAMPLESo 	ODBC_DESCq INSTALL_HELPs RDS_PW_MISMATCHu FINISH_SETUPw BACKy RDS_PW_REQUIRED{ SERIAL_TITLE}
 L x
 L { metaData Ljava/lang/Object;��	 � &coldfusion/runtime/AttributeCollection� java/lang/Object� 	Functions� 
Properties� ([Ljava/lang/Object;)V �
�� getMetadata ()Ljava/lang/Object; this Lcfsetup_en2ecfm162246523; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; runPage out Ljavax/servlet/jsp/JspWriter; value processingdirective5 /Lcoldfusion/tagext/lang/ProcessingDirectiveTag; mode5 I silent0  Lcoldfusion/tagext/io/SilentTag; mode0 t8 Ljava/lang/Throwable; t9 t10 t11 t12 t13 output1  Lcoldfusion/tagext/io/OutputTag; mode1 t16 t17 t18 t19 output2 mode2 t22 t23 t24 t25 output3 mode3 t28 t29 t30 t31 output4 mode4 t34 t35 t36 t37 t38 t39 t40 t41 LineNumberTable java/lang/Throwable� <clinit> 1                      ; <    ^ <    } ~    � <   ��    �� �   "     ���   �       ��      �   ]     +*+,� **+,� � **+,� � **+,� � !�   �        +��     +��    +��  �� �  Y  *  q*� (� .L*� 2N*� (4� :*� F-� J� L:*� P� T� Y� ]Y6��*� b� J� d:*� P� Y� eY6� /*+� iL� l���� � :� �:	*+� pL�	� u� :
� &��
�� � #:� y� � :� �:� |�� �**� � �Y�S� �� ��  7       .   �   �   �   �   �   �   �        #  ,  5  >  G  P  Y  b  k  t  }  �  �  �  �  �  �  �  �  �  �  �  �  �  �          (  1  :  C  L    �  |+�� ��u+�� ��l+�� ��c+�� ��Z+�� ��Q+�� ��H+�� ��?+�� ��6+�� ��-+�� ��$+�� ��+�� ��+�� ��	+�� �� +�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+ö ���+Ŷ ���+Ƕ ���+ɶ ���+˶ ��y+Ͷ ��p+϶ ��g+Ѷ ��^+Ӷ ��U+ն ��L+׶ ��C+ٶ ��:+۶ ��1+ݶ ��(+߶ ��+� ��+� ��+� ��+� ���*� �� J� �:*7� P� Y� �Y6� Y+� �+**� � �Y�SY�S� �� �� �+�� �+**� � �Y�SY�S� �� �� �*+������	� :� &���� � #:�
� � :� �:���A*� �� J� �:*<� P� Y� �Y6� Z+� �+**� � �Y�SY�S� �� �� �+�� �+**� � �Y�SY�S� �� �� �*+������	� :� &���� � #:�
� � :� �:����*� �� J� �:*A� P� Y� �Y6� Z+� �+**� � �Y�SY�S� �� �� �+�� �+**� � �Y�SY�S� �� �� �*+������	� :� &�6�� � #:�
� � :� �:��� �*� �� J� �: *F� P � Y � �Y6!� Z+� �+**� � �Y�SY�S� �� �� �+�� �+**� � �Y�SY�S� �� �� �*+� ���� �	� :"� &� {"�� � #:# #�
� � :$� $�:% ��%� *� !�� *+�� l��� u� :&� #&�� � #:''�� � :(� (�:)���)� 0 e z }� } � }� Z � �� � � �� Z � �� � � �� � � �� � � ��J�������J���������������u��{~��u��{~�����������0<�69<��0K�69K�<HK�KPK�z�������z�������� 5 �O� ��O��uO�{0O�6�O��CO�ILO� 5 �^� ��^��u^�{0^�6�^��C^�IL^�O[^�^c^� �  � *  q��    q��   q��   q / 0   q��   q��   q��   q��   q��   q�� 	  q�� 
  q��   q��   q��   q��   q��   q��   q��   q��   q��   q��   q��   q��   q��   q��   q��   q��   q��   q��   q��   q��   q��   q��    q�� !  q�� "  q�� #  q�� $  q�� %  q�� &  q�� '  q�� (  q�� )�  � j @  � 
 � 
 � 
 � 
� � � � � � � � � �    ! * 3 < E N W `  i !r "{ #� $� %� &� '� (� )� *� +� ,� -� .� /� 0� 1 2 3 4 5& 6\ 9\ 9\ 9\ 9[ 9 : : : :~ :/ 7/ 7 > > > > >: ?: ?: ?: ?9 ?� <� <� C� C� C� C� C� D� D� D� D� D� A� A� H� H� H� H� H� I� I� I� I� I_ F_ F L L L L L L L � 
        �   #     *� 
�   �       ��   �  �  �    �>� D� F`� D� b� D� �Y�#�"$*�"&�"(�"*�",$�".�"0�"2+�"4�"6&�"8	�":�"<�">�"@
�"B�"D)�"F�"H�"J�"L!�"N�"P�"R�"T�"V(�"X�"Z�"\�"^-�"` �"b�"d,�"f%�"h�"j.�"l'�"n�"p�"r�"t�"v�"x�"z�"|�"~"�"� ���Y��Y�SY��SY�SY��S�����   �      ���         "    #