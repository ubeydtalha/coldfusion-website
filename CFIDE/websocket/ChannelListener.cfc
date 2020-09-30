/*************************************************************************
 *
 * ADOBE CONFIDENTIAL
 * ___________________
 *
 *  Copyright 2011 Adobe Systems Incorporated
 *  All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains
 * the property of Adobe Systems Incorporated and its suppliers,
 * if any.  The intellectual and technical concepts contained
 * herein are proprietary to Adobe Systems Incorporated and its
 * suppliers and may be covered by U.S. and Foreign Patents,
 * patents in process, and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Adobe Systems Incorporated.
 **************************************************************************/
/**
 * Callback Handler for WebSocket Events. Should be used as a base component to all channel Listeners.
 * It lets you authenticate and authorize a client, perform preprocessing of messages prior to publishing, and decide if the message has to be sent to a client.  
 */
component
{

  /**
    * Invoked before you subscribe to a channel/subchannel. Used to check whether the requested
    * client should be allowed to subscribe to the given channel. Properties defined in the object susbcriberInfo can be used to take the authorization decision.
    * @param subscriberInfo: A struct that contains custom options passed in subscribe request. Also contains the object ConnectionInfo  
    *     as subkey 'connectionInfo'. 
    * @return a boolean value. If true, allows the requested client to subscribe.
    */   
   public boolean function allowSubscribe(Struct subscriberInfo)
   {
       return true;
   }


  /**
    * Invoked before publishing on a channel/subchannel. Used to check whether the requested
    * client should be allowed to publish on the given channel. Properties defined in the object publisherInfo can be used to take the authorization decision
    * @param publisherInfo: A struct that contains custom options passed in the publish request. Also contains the object ConnectionInfo  
    *     as subkey 'connectionInfo'. 
    * @return a boolean value. If true, allows the requested client to publish the message.
    */   
   public boolean function allowPublish(Struct publisherInfo)
   {
   	return true;
   }

  /**
    * Invoked before publishing the given message on requested channel/subchannel. Used to execute a business logic if required and to format messages.
    * @param message: The message object that needs to be published. 
    * @param publisherInfo: A struct that contains custom options passed in the publish request. Also contains the object ConnectionInfo  
    *     as subkey 'connectionInfo'. 
    * @return message: The message object that needs to be published after formating the original message if required.  
    */   
   public any function beforePublish( any message, Struct publisherInfo)
   {
  	return message;
   }

  /**
    * Invoked before sending the message to a subscribed client. Used to decide whether the message should be sent to a specific client or not.
    * This function is called for all clients subscribed to a channel separately. Properties defined in the object subscriberInfo and 
    * publisherInfo can help in finding client's interest in the message.
    * @param message: The message object that needs to be published. 
    * @param subscriberInfo: A struct that contains custom options passed in the subscribe request. Also contains the object ConnectionInfo  
    *     as subkey 'connectionInfo'. 
    * @param publisherInfo: A struct that contains custom options passed in the publish request. Also contains the object ConnectionInfo  
    *     as subkey 'connectionInfo'. 
    * @return a boolean value: If true, sends the message to the specific client.
    */   
  public boolean function canSendMessage(any message, Struct subscriberInfo, Struct publisherInfo)
  {
	return true;
  }

  /**
    * Invoked before sending the message to a subscribed client. Can be used to format the message as per client requirement prior to sending.
    * @param message: The message object that needs to be published. 
    * @param subscriberInfo: A struct that contains custom options passed in the subscribe request. Also contains the object ConnectionInfo  
    *     as subkey 'connectionInfo'. 
    * @return message: The message object that is returned.  
    */   
  public any function beforeSendMessage(any message, Struct subscriberInfo)
  {
    return message;
  }

  /**
    * Invoked after you unsubscribe to a channel/subchannel. Used to clear the settings if required.
    * @param subscriberInfo: A struct that contains custom options passed in subscribe request. Also contains the object ConnectionInfo  
    *     as subkey 'connectionInfo'. 
    * @return nothing.
    */   
  public function afterUnsubscribe(Struct subscriberInfo)
  {
  
  }

}


