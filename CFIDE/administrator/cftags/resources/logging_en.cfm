����  -� 
SourceFile 4/CFIDE/administrator/cftags/resources/logging_en.cfm cflogging_en2ecfm863803033  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   
ATTRIBUTES Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   CALLER   	   ENCODEFORHTMLSMART   	    BSUCCESS " " 	  $ com.macromedia.SourceModTime  h���� pageContext #Lcoldfusion/runtime/NeoPageContext; ) *	  + getOut ()Ljavax/servlet/jsp/JspWriter; - . javax/servlet/jsp/JspContext 0
 1 / parent Ljavax/servlet/jsp/tagext/Tag; 3 4	  5 	ISO8859_1 7 setPageEncoding (Ljava/lang/String;)V 9 : !coldfusion/runtime/NeoPageContext <
 = ; 3class$coldfusion$tagext$lang$ProcessingDirectiveTag Ljava/lang/Class; -coldfusion.tagext.lang.ProcessingDirectiveTag A forName %(Ljava/lang/String;)Ljava/lang/Class; C D java/lang/Class F
 G E ? @	  I _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; K L
  M -coldfusion/tagext/lang/ProcessingDirectiveTag O _setCurrentLineNo (I)V Q R
  S setSuppresswhitespace (Z)V U V
 P W 	hasEndTag Y V coldfusion/tagext/GenericTag [
 \ Z 
doStartTag ()I ^ _
 P ` $class$coldfusion$tagext$io$SilentTag coldfusion.tagext.io.SilentTag c b @	  e coldfusion/tagext/io/SilentTag g
 h ` 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; j k
  l doAfterBody n _
 \ o _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; q r
  s doEndTag u _ #javax/servlet/jsp/tagext/TagSupport w
 x v doCatch (Ljava/lang/Throwable;)V z {
 \ | 	doFinally ~ 
 \  	__HTSWT_0 Lcoldfusion/util/FastHashtable; � �	  � java/lang/String � ID � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
  � __caseValue 4(Lcoldfusion/util/FastHashtable;Ljava/lang/Object;)I � �
  � ColdFusion Administrator � write � : java/io/Writer �
 � � $Server has been updated successfully � 'Click the button on the right to update � ALERT! � &Important notice about last submission � 8Click arrow on left to return without submitting changes � Submit Changes � Delete � Cancel � Are you sure you want to delete � ,Invalid log file or log file does not exist. � 
Invalid log file specified.
 � $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag � � @	  � coldfusion/tagext/io/OutputTag �
 � ` %
Unable to delete log file. <br />
 � _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
  � encodeForHTMLSmart � java/lang/Object � CFCATCH � MESSAGE � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � <br />
 � DETAIL �
 � o coldfusion/tagext/QueryLoop �
 � v
 � |
 �  	Log Files � (
Debugging &amp; Logging &gt; Log Files � �
ColdFusion creates several log files that can help you troubleshoot applications and track events.  Use this page to search, view, download, archive, and delete log files.
 � �
The log viewer needs application variables enabled in order to work. Because you have disabled application variables, you will
not be able to use the log viewer to display and search log files.
 � Available Log Files � Actions � 	File Name � Type � Size � Last Modified � Search/View log file � Download log file � Archive log file � Enable logging � Disable logging � Delete log file � .Are you sure you want to delete this log file? � View Log Files � No log files found. � &You have entered a bad directory name. � Logging Settings  /
Debugging &amp; Logging &gt; Logging Settings Log directory Browse Server=Enter the directory where error log files should be written or click Browse Server to select from the directory tree. The drive you specify must have sufficient disk space and security privileges for the ColdFusion system service. You must shut down and restart the ColdFusion Services for this change to take effect.  Maximum file size (in kilobytes)
 �Enter the maximum file size that ColdFusion should use for log files. When a file reaches this size, it is automatically archived.You must shut down and restart the ColdFusion Services for this change to take effect.
 Maximum number of archives �Enter the maximum number of log archives ColdFusion should create. After reaching this limit, files are deleted in order of oldest to newest.
 'Use operating system logging facilities �When enabled, some ColdFusion log messages will be written using your operating system's logging facility. Regardless of this setting, all ColdFusion log messages are also always written to the standard ColdFusion log files.
 !Log slow pages taking longer than seconds �
To help diagnose potential problems or bottlenecks in your site, you can have ColdFusion log the names of any pages that take longer than a specified length of time to return. When enabled, any output is written to the server.log file. Log all CORBA calls {
Logs all CORBA calls to help diagnose configuration issues. When enabled, any output is written to the server.log file.
 "Enable logging for scheduled tasks  .
Logs ColdFusion Executive task scheduling.
" :Unable to update information. Check logs for more details.$ JUnable to update information for the setting Log directory. Invalid input.& DMaximum log file size must be a positive number less than 999999 kb.( 
Error saving changes.<br />
* EncodeForHTML &(Ljava/lang/String;)Ljava/lang/String;,-
 . <The Log Directory cannot be blank. Please enter a Directory.0 false2 set (Ljava/lang/Object;)V45 coldfusion/runtime/Variable7
86 coldfusion/runtime/SwitchTable:
; 	 ENABLE_LOGGING_TASKS= addStringCase 5(Ljava/lang/String;I)Lcoldfusion/runtime/SwitchTable;?@
;A LOG_NOT_DELETEDC 	LOG_CORBAE INVALIDLOGFILEG STORE_LOG_FILEI LOGFILEPATH_INSTRUCTIONSK 
PAGENAMEQ2M VIEW_LOG_FILESO ACTIONSQ LOG_TASKS_INSTRUCTIONSS LOG_CORBA_INSTRUCTIONSU SEARCH_VIEW_LOG_FILEW DELETEY DELETE_LOGFILE_CONFIRMATION[ ERROR_MAXFLESIZEMSG] NOLOGSFOUND_ TYPEa BUTTON_BROWSEc LOG_DIRECTORYe MAX_ARCHIVESg DELETE_LOG_FILEi IMPORTANT_NOTICEk CLICK_NORMALm ENABLE_LOGGINGo DISABLE_LOGGINGq PAGEHEADER_LOGFILESs SIZEu CLICK_RETURNw PAGEHEADER_LOGSETTINGSy BADDIR{ SUBMIT_CHANGES} LOGBLURB FILENAME� 
USE_OS_FAC� ARE_YOU_SURE_DELETE� CANCEL� LASTMODIFIED� LOG_SLOW_PAGES� ALERT� NEEDAPPVARS� LOG_SLOW_PAGES_INSTRUCTIONS� SECONDS� MAXFILEBACKUPS_INSTRUCTIONS� LOGGING_SETTING_ERROR� SS_ERROR_VALIDATION� DEFAULT_PAGENAME� USE_OS_FAC_INSTRUCTIONS� STATMESS� LOG_BAD_FILENAME� LOG_DIR_ERROR_VALIDATION� AVAILABLE_LOG_FILES� LOGDIR_JSERROR� MAXFILESIZE_INSTRUCTIONS� DOWNLOAD_LOG_FILE� PAGENAME_LOGGINGSETTINGS� MAX_FILE_SIZE� 
� _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V��
 �
 P |
 P  metaData Ljava/lang/Object;��	 � &coldfusion/runtime/AttributeCollection� 	Functions� 
Properties� ([Ljava/lang/Object;)V �
�� getMetadata ()Ljava/lang/Object; this Lcflogging_en2ecfm863803033; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; runPage out Ljavax/servlet/jsp/JspWriter; value processingdirective3 /Lcoldfusion/tagext/lang/ProcessingDirectiveTag; mode3 I silent0  Lcoldfusion/tagext/io/SilentTag; mode0 t8 Ljava/lang/Throwable; t9 t10 t11 t12 t13 output1  Lcoldfusion/tagext/io/OutputTag; mode1 t16 t17 t18 t19 output2 mode2 t22 t23 t24 t25 t26 t27 t28 t29 LineNumberTable java/lang/Throwable� <clinit> 1     	                 "     ? @    b @    � �    � @   ��    �� �   "     ���   �       ��      �   i     7*+,� **+,� � **+,� � **+,� � !**#+,� � %�   �        7��     7��    7��  �� �  	�    �*� ,� 2L*� 6N*� ,8� >*� J-� N� P:*� T� X� ]� aY6�h*� f� N� h:*� T� ]� iY6� /*+� mL� p���� � :� �:	*+� tL�	� y� :
� &�4
�� � #:� }� � :� �:� ��� �**� � �Y�S� �� ��  �       7   �   �   �        #  ,  5  >  G  P  Y  G  P  Y  b  k  t  }  �  �  �  �  �  �  �  �  �  �  �  �  �  �        #  -  7  A  K  U  _  i  s  }  �  �  �  �  �  �  �  �  �+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ��w+�� ��n+�� ��e+�� ��\*� �� N� �:*0� T� ]� �Y6� �+�� �+*2� T**� !� ��*� �Y**� � �Y�SY�S� �S� Ǹ Ͷ �+϶ �+*3� T**� !� ��*� �Y**� � �Y�SY�S� �S� Ǹ Ͷ �+϶ �� Қ�y� �� :� &���� � #:� ֨ � :� �:� ש�n+ٶ ��e+۶ ��\+ݶ ��S+߶ ��J+� ��A+� ��8+� ��/+� ��&+� ��+� ��+�� ��+� ��+� ���+� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+� ���+� ���+� ���+� ���+	� ���+� ��~+� ��t+� ��j+� ��`+� ��V+� ��L+� ��B+� ��8+� ��.+� ��$+� ��+!� ��+#� ��+%� �� �+'� �� �+)� �� �*� �� N� �:* �� T� ]� �Y6� l++� �+* �� T**� � �Y�SY�S� �� ͸/� �+϶ �+* �� T**� � �Y�SY�S� �� ͸/� �+϶ �� Қ��� �� :� &� ��� � #:� ֨ � :� �:� ש� +1� �� *� %3�9� *+���� p���� y� :� #�� � #:��� � :� �:����   e z }� } � }� Z � �� � � �� Z � �� � � �� � � �� � � ��W���W������O[�UX[��Oj�UXj�[gj�joj� 5 ��� ����O��U������� 5 ��� ����O��U��������������� �  .   ���    ���   ���   � 3 4   ���   ���   ���   ���   ���   ��� 	  ��� 
  ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ��� �  � m @  �  �  �  � � � � � � �   " $ &! (* *3 ,o 2o 2� 2� 2o 2o 2o 2o 2h 2� 3� 3� 3� 3� 3� 3� 3� 3� 3< 0< 0* 63 8< ;E ?N DW F` Hi Jr L{ N� P� R� T� V� X� Z� \� ^� `� b� d� f� i� k m o q$ t. v8 yB {L ~V �` �j �t �~ �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � � � � � � �� �� �~ �� �� �� �� �� �� �� � �         �   #     *� 
�   �       ��   �  �  #    B� H� Jd� H� f�� H� ��;Y�<>1�BD�BF/�BH
�BJ�BL%�BN�BP�BR�BT2�BV0�BX�BZ�B\�B^5�B`�Bb�Bd$�Bf#�Bh(�Bj�Bl�Bn�Bp�Br�Bt�Bv�Bx�Bz"�B| �B~�B��B��B�*�B�	�B��B��B�,�B��B��B�.�B�-�B�)�B�6�B�3�B��B�+�B��B��B�4�B��B�7�B�'�B��B�!�B�&�B� ���Y� �Y�SY� �SY�SY� �S�ų��   �      ��         &    '