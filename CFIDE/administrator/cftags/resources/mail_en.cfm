����  -e 
SourceFile 1/CFIDE/administrator/cftags/resources/mail_en.cfm cfmail_en2ecfm1829096987  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   
ATTRIBUTES Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   CALLER   	   BSUCCESS   	    com.macromedia.SourceModTime  h���� pageContext #Lcoldfusion/runtime/NeoPageContext; % &	  ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
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
  � ColdFusion Administrator � write � 6 java/io/Writer �
 � � $Server has been updated successfully � 'Click the button on the right to update � ALERT! � &Important notice about last submission � 8Click arrow on left to return without submitting changes � Submit Changes � Mail Settings � #Connection Verification Successful. � Connection Verification Failed! � Server Settings &gt; Mail � Mail Server Settings � Mail Server � � Specifies the server for
sending SMTP mail messages. You can specify an Internet address (for
example, mail.company.com) or the IP address of the mail server (for example,
127.0.0.1).
 � 	User name � Password � b
If your mail server requires authentication, you can specify a
user name and password to use.
 � Sign the mail � ;
Select this check box to have ColdFusion Sign the Mail.
 � Browse Server � Keystore � �
"Location of the Keystore" - Keystore containing the private key and certificate. The supported type is JKS (java key store) and pkcs12.
     � KeystorePassword � !
Password of the Keystore.
     � KeyAlias � �
     Alias of the key with which the certificate and private key is stored in Keystore. If it is not specified then the first entry in the Keystore will be picked up.
     � KeyPassword � �
Password with which the private key is stored. If it is not specified, KeystorePassword will be used as KeyPassword as well.
     � Verify mail server connection � v Select this check box
to have ColdFusion verify that it can connect to this mail server when you
submit this form.  � Server Port � V The default port number for
mail servers. The standard SMTP mail server port is 25.  � Backup Mail Servers ��
  <br>Specifies backup servers for sending SMTP mail messages. Use a comma to separate
    the names of multiple servers. To specify a port number other than the default,
    use a colon (for example, mail.company.com:123). If your mail server requires
    authentication different from the default server, you can specify a user name and password in the format <strong>
            user:password@mail.company.com</strong>.
     � "Maintain connection to mail server � y Select
this check box to keep the connection to a mail server open for reuse
after delivering a message (recommended). � Connection Timeout(in seconds) � T Specifies the time that ColdFusion should wait for a response from the mail server. � ,Enable SSL socket connections to mail server � USelect this check box to enable SSL encryption on the connections to the mail server. � $Enable TLS connection to mail server � e Select this check box to enable Transport Level Security (TLS) on the connection to the mail server. � Mail Spool Settings � Spool Interval(in seconds) � E Specifies the time the
mail spooler waits to process spooled mail.  � Mail
Delivery Threads � �
Specifies the maximum number of simultaneous threads that ColdFusion uses to deliver
spooled mail. A higher number indicates an increase in the volume of mail
messages that are delivered.
 � #Spool mail messages
  for delivery � to � Disk � Memory � � Select this check
box to spool messages for delivery by the mail spooler (recommended). When
not selected, the mail spooler attempts to deliver messages during page
processing. � Spooling to disk is more robust, because
the messages are written to disk and are delivered even if you restart
ColdFusion. Spooling to memory substantially increases performance,
but it requires additional memory and places the messages in volatile
storage.  � -Maximum
number of messages spooled to memory � {
Specifies the maximum number of messages that ColdFusion holds in memory before switching
to spooling messages to disk.  � 9Allow downloading the attachments for undelivered emails.  � Select this check
box to allow downloading attachments for undelivered emails. It is recommended not to enable it in case undelivered email functionality is not being used.  View Undelivered Mail Mail Logging Settings Error Log Severity Debug
 Information Warning :
Select the type of SMTP-related error messages to log.
 )Log all mail messages sent
by ColdFusion \ Select this check box
to save the To, From, and Subject fields of messages to a log file.  Mail Charset Setting '<strong>Default CFMail Charset</strong> Subject Sender To 	File Size  Date" Delete$ Respool& message(s) successfully deleted( !message(s) successfully respooled* )Server Settings > Mail > Undelivered Mail, 6
Server port must be numeric and greater than zero.
. 8
Timeout value must be numeric and greater than zero.
0 9
Spool interval must be numeric and greater than zero.
2 Q
Maximum number of simultaneous threads must be numeric and greater than zero.
4 W
Maximum number of messages spooled to memomy must be numeric and greater than zero.
6 $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag98 <	 ; coldfusion/tagext/io/OutputTag=
> \ )
Unable to update mail settings.<br />
@ CFCATCHB MESSAGED _String &(Ljava/lang/Object;)Ljava/lang/String;FG coldfusion/runtime/CastI
JH EncodeForHTML &(Ljava/lang/String;)Ljava/lang/String;LM
 N <br />
P DETAILR
> k coldfusion/tagext/QueryLoopU
V r
V x
> { 4
The mail server connection was not tested.<br />
Z +
Unable to retrieve mail settings.<br />
\ Error^ false` set (Ljava/lang/Object;)Vbc coldfusion/runtime/Variablee
fd coldfusion/runtime/SwitchTableh
i 	 BUTTON_BROWSEk addStringCase 5(Ljava/lang/String;I)Lcoldfusion/runtime/SwitchTable;mn
io SEVERITY_TIPq MESSAGE_RESPOOLEDs KEYPASSWORDu 
SERVER_TIPw KEYALIASy STATMESS{ VIEW_UNDELIVERED_MAIL} 	CONN_FAIL SCHEDULER_TIP� MESSAGE_DELETED� SS_ERROR_MAIL_TIMEOUT� SEVERITY_DEBUG� CLICK_NORMAL� KEYSTOREPASSWORD_TIP� SENDER� SUBMIT_CHANGES� MAXMESSAGESINMEMORY� SPOOLSETTINGS� KEYALIAS_TIP� SS_ERROR_MAIL_SCHEDULE� CHARSETSETTING� SERVER_PORT� LOGSENT� ALLOWDOWNLOAD_TIP� SPOOLTOMEMORY_TIP� FILESIZE� MAILLOGGING� SPOOLENABLE� LOGSENT_TIP� 	ENABLESSL� VERIFY� 
MAILSERVER� ENABLETLS_TIP� PAGEHEADER_UNDELIVEREDMAIL� USERNAME_TIP� BACKUPMAILSERVERS� 	SCHEDULER� 	ERROR_GET� SUBJECT� 	ENABLETLS� CONNECTIONTIMEOUT_SEC� DELETE� ERROR_UPDATE� SEVERITY_WARNING� KEYSTOREPASSWORD� SEVERITY� CONN_OK� SEVERITY_INFORMATION� KEYPASSWORD_TIP� IMPORTANT_NOTICE� MAXMESSAGESINMEMORY_TIP�  SS_ERROR_MAIL_MAXDELIVERYTHREADS� KEYSTORE_TIP� DEFAULT_PAGENAME� SIGN_TIP� PAGEHEADER_MAIL� CLICK_RETURN� !SS_ERROR_MAIL_MAXMESSAGESINMEMORY� MAINTAINCONNECTIONS� SEVERITY_ERROR� DATE� ALLOWDOWNLOAD� SS_ERROR_MAIL_SMTPPORT� SPOOLTO_MEMORY� SPOOLTO_DISK� 
CONNECTION� PORT_TIP� ALERT� 
VERIFY_TIP� MAILSERVERPASSWORD� MAXDELIVERYTHREADS_TIP� SPOOLTOMEMORY� MAXDELIVERYTHREADS SPOOLENABLE_TIP MAILSERVERUSERNAME TIMEOUT_TIP RESPOOL	 MAINTAINCONNECTIONS_TIP SIGN TO CHARSET ENABLESSL_TIP PAGENAME_MAILSET ERROR_NOTEST BACKUPMAILSERVERS_TIP KEYSTORE 
 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 
 !
 L x
 L { metaData Ljava/lang/Object;%&	 ' &coldfusion/runtime/AttributeCollection) java/lang/Object+ 	Functions- 
Properties/ ([Ljava/lang/Object;)V 1
*2 getMetadata ()Ljava/lang/Object; this Lcfmail_en2ecfm1829096987; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; runPage out Ljavax/servlet/jsp/JspWriter; value processingdirective3 /Lcoldfusion/tagext/lang/ProcessingDirectiveTag; mode3 I silent0  Lcoldfusion/tagext/io/SilentTag; mode0 t8 Ljava/lang/Throwable; t9 t10 t11 t12 t13 output1  Lcoldfusion/tagext/io/OutputTag; mode1 t16 t17 t18 t19 output2 mode2 t22 t23 t24 t25 t26 t27 t28 t29 LineNumberTable java/lang/Throwableb <clinit> 1                      ; <    ^ <    } ~   8 <   %&    45 9   "     �(�   8       67      9   ]     +*+,� **+,� � **+,� � **+,� � !�   8        +67     +:;    +<=  >5 9  �    f*� (� .L*� 2N*� (4� :*� F-� J� L:*� P� T� Y� ]Y6��*� b� J� d:*� P� Y� eY6� /*+� iL� l���� � :� �:	*+� pL�	� u� :
� &��
�� � #:� y� � :� �:� |�� �**� � �Y�S� �� ��  ,       V  i  r  {  �  �  �  �  �  �  �  �  �  �  �  �  �  �          &  /  8  A  J  S  \  e  n  w  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        "  +  4  =  F  O  X  b  l  v  �  �  �  �  �  �  �  �  �  �  �  �  �           *  4  >  H  R  \  f  p  D  N  "+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ��y+�� ��p+�� ��g+�� ��^+�� ��U+�� ��L+�� ��C+�� ��:+�� ��1+�� ��(+�� ��+�� ��+�� ��+�� ��+�� ���+ö ���+Ŷ ���+Ƕ ���+ɶ ���+˶ ���+Ͷ ���+϶ ���+Ѷ ���+Ӷ ���+ն ���+׶ ���+ٶ ���+۶ ���+ݶ ��}+߶ ��t+� ��k+� ��b+� ��Y+� ��P+� ��G+� ��>+�� ��5+� ��,+� ��#+� ��+�� ��+�� ��+�� ���+�� ���+�� ���+�� ���+� ���+� ���+� ���+� ���+	� ���+� ���+� ���+� ���+� ���+� ���+� ��v+� ��l+� ��b+� ��X+� ��N+� ��D+!� ��:+#� ��0+%� ��&+'� ��+)� ��++� ��+-� ���+/� ���+1� ���+3� ���+5� ���+7� ���*�<� J�>:* �� P� Y�?Y6� r+A� �+* �� P**� � �YCSYES� ��K�O� �+Q� �+* �� P**� � �YCSYSS� ��K�O� �+Q� ��T����W� :� &�c�� � #:�X� � :� �:�Y�� �+[� �� �*�<� J�>:*� P� Y�?Y6� r+]� �+*� P**� � �YCSYES� ��K�O� �+Q� �+*� P**� � �YCSYSS� ��K�O� �+Q� ��T����W� :� &� ��� � #:�X� � :� �:�Y�� +_� �� *� !a�g� *+�"� l��� u� :� #�� � #:�#� � :� �:�$��   e z }c } � }c Z � �c � � �c Z � �c � � �c � � �c � � �co�c�co�c�cccM��c���cM��c���c���c���c 5 �Dc ��Dc��Dc�8Dc>ADc 5 �Sc ��Sc��Sc�8Sc>AScDPScSXSc 8  .   f67    f?@   fA&   f / 0   fBC   fDE   fFG   fHE   fIJ   fK& 	  fL& 
  fMJ   fNJ   fO&   fPQ   fRE   fS&   fTJ   fUJ   fV&   fWQ   fXE   fY&   fZJ   f[J   f\&   f]&   f^J   f_J   f`& a  2 � @  �  �  �  � L U ^ g p y  � "� $� &� (� *� ,� .� 0� 6� 8� :� ?� A� E  G	 I M O$ S- U6 Y? [H _Q aZ ec gl ju l~ t� v� z� |� ~� �� �� �� �� �� �� �� �� �� � � � �  �) �2 �; �E �O �Y �c �m �w �� �� �� �� �� �� �� �� �� �� �� �� �� � � � �! �+ �5 �? �I �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �S �S �' �gggggggg_���������11 �         9   #     *� 
�   8       67   d  9      �>� D� F`� D� b:� D�<�iY�jl�pr?�ptL�pv�px�pz�p|�p~9�p�	�p�,�p�K�p�O�p�<�p��p��p�E�p��p�5�p�*�p��p�P�p�B�p��p�@�p�8�p�4�p�G�p�:�p�/�p�A�p�&�p��p��p�)�p�M�p��p� �p�+�p�U�p�D�p�(�p�$�p�I�p�S�p�>�p��p�;�p��p�=�p��p��p�6�p�Q�p��p��p��p�
�p��p�R�p�"�p�V�p�H�p�7�p�N�p�2�p�1�p��p��p��p��p��p�.�p 0�p-�p3�p�p%�p
J�p#�p�pF�pC�p'�p�pT�p!�p�p� ��*Y�,Y.SY�,SY0SY�,S�3�(�   8      �67         "    #