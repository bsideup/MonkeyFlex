////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2005-2007 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package mx.utils
{

import flash.utils.ByteArray;
import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;


/**
 *  The ObjectUtil class is an all-static class with methods for
 *  working with Objects within Flex.
 *  You do not create instances of ObjectUtil;
 *  instead you simply call static methods such as the 
 *  <code>ObjectUtil.isSimple()</code> method.
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
public class ObjectUtil
{

    /**
    *  Array of properties to exclude from debugging output.
    *  
    *  @langversion 3.0
    *  @playerversion Flash 9
    *  @playerversion AIR 1.1
    *  @productversion Flex 3
    */
    private static var defaultToStringExcludes:Array = ["password", "credentials"];

    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    
    /**
     *  Copies the specified Object and returns a reference to the copy.
     *  The copy is made using a native serialization technique. 
     *  This means that custom serialization will be respected during the copy.
     *
     *  <p>This method is designed for copying data objects, 
     *  such as elements of a collection. It is not intended for copying 
     *  a UIComponent object, such as a TextInput control. If you want to create copies 
     *  of specific UIComponent objects, you can create a subclass of the component and implement 
     *  a <code>clone()</code> method, or other method to perform the copy.</p>
     * 
     *  @param value Object that should be copied.
     * 
     *  @return Copy of the specified Object.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */ 
    public static function copy(value:Object):Object
    {
        var buffer:ByteArray = new ByteArray();
        buffer.writeObject(value);
        buffer.position = 0;
        var result:Object = buffer.readObject();
        return result;
    }
   
    /**
     *  Returns <code>true</code> if the object reference specified
     *  is a simple data type. The simple data types include the following:
     *  <ul>
     *    <li><code>String</code></li>
     *    <li><code>Number</code></li>
     *    <li><code>uint</code></li>
     *    <li><code>int</code></li>
     *    <li><code>Boolean</code></li>
     *    <li><code>Date</code></li>
     *    <li><code>Array</code></li>
     *  </ul>
     *
     *  @param value Object inspected.
     *
     *  @return <code>true</code> if the object specified
     *  is one of the types above; <code>false</code> otherwise.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static function isSimple(value:Object):Boolean
    {
        var type:String = typeof(value);
        switch (type)
        {
            case "number":
            case "string":
            case "boolean":
            {
                return true;
            }

            case "object":
            {
                return (value is Date) || (value is Array);
            }
        }

        return false;
    }

    /**
     *  Compares two numeric values.
     * 
     *  @param a First number.
     * 
     *  @param b Second number.
     *
     *  @return 0 is both numbers are NaN. 
     *  1 if only <code>a</code> is a NaN.
     *  -1 if only <code>b</code> is a NaN.
     *  -1 if <code>a</code> is less than <code>b</code>.
     *  1 if <code>a</code> is greater than <code>b</code>.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static function numericCompare(a:Number, b:Number):int
    {
        if (isNaN(a) && isNaN(b))
            return 0;

        if (isNaN(a))
            return 1;

        if (isNaN(b))
           return -1;

        if (a < b)
            return -1;

        if (a > b)
            return 1;

        return 0;
    }

    /**
     *  Compares two String values.
     * 
     *  @param a First String value.
     * 
     *  @param b Second String value.
     *
     *  @param caseInsensitive Specifies to perform a case insensitive compare, 
     *  <code>true</code>, or not, <code>false</code>.
     *
     *  @return 0 is both Strings are null. 
     *  1 if only <code>a</code> is null.
     *  -1 if only <code>b</code> is null.
     *  -1 if <code>a</code> precedes <code>b</code>.
     *  1 if <code>b</code> precedes <code>a</code>.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static function stringCompare(a:String, b:String,
                                         caseInsensitive:Boolean = false):int
    {
        if (a == null && b == null)
            return 0;

        if (a == null)
          return 1;

        if (b == null)
           return -1;

        // Convert to lowercase if we are case insensitive.
        if (caseInsensitive)
        {
            a = a.toLocaleLowerCase();
            b = b.toLocaleLowerCase();
        }

        var result:int = a.localeCompare(b);
        
        if (result < -1)
            result = -1;
        else if (result > 1)
            result = 1;

        return result;
    }

    /**
     *  Compares the two Date objects and returns an integer value 
     *  indicating if the first Date object is before, equal to, 
     *  or after the second item.
     *
     *  @param a Date object.
     *
     *  @param b Date object.
     *
     *  @return 0 if <code>a</code> and <code>b</code> are equal
     *  (or both are <code>null</code>);
     *  -1 if <code>a</code> is before <code>b</code>
     *  (or <code>b</code> is <code>null</code>);
     *  1 if <code>a</code> is after <code>b</code>
     *  (or <code>a</code> is <code>null</code>).     
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static function dateCompare(a:Date, b:Date):int
    {
        if (a == null && b == null)
            return 0;

        if (a == null)
          return 1;

        if (b == null)
           return -1;

        var na:Number = a.getTime();
        var nb:Number = b.getTime();
        
        if (na < nb)
            return -1;

        if (na > nb)
            return 1;

        return 0;
    }

    /**
     *  @private
     *  This method will append a newline and the specified number of spaces
     *  to the given string.
     */
    private static function newline(str:String, n:int = 0):String
    {
        var result:String = str;
        result += "\n";
        
        for (var i:int = 0; i < n; i++)
        {
            result += " ";
        }
        return result;
    }

    /**
     *  Returns <code>true</code> if the object is an instance of a dynamic class.
     *
     *  @param obj The object.
     *
     *  @return <code>true</code> if the object is an instance of a dynamic class.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static function isDynamicObject(obj:Object):Boolean
    {
        try
        {
            // this test for checking whether an object is dynamic or not is 
            // pretty hacky, but it assumes that no-one actually has a 
            // property defined called "wootHackwoot"
            obj["wootHackwoot"];
        }
        catch (e:Error)
        {
            // our object isn't from a dynamic class
            return false;
        }
        return true;
    }
    
    /**
     *  @private
     */
    private static function internalHasMetadata(metadataInfo:Object, propName:String, metadataName:String):Boolean
    {
        if (metadataInfo != null)
        {
            var metadata:Object = metadataInfo[propName];
            if (metadata != null)
            {
                if (metadata[metadataName] != null)
                    return true;
            }
        }
        return false;
    }

    /**
     *  @private
     */
    private static function recordMetadata(properties:XMLList):Object
    {
        var result:Object = null;

        try
        {
            for each (var prop:XML in properties)
            {
                var propName:String = prop.attribute("name").toString();
                var metadataList:XMLList = prop.metadata;

                if (metadataList.length() > 0)
                {
                    if (result == null)
                        result = {};

                    var metadata:Object = {};
                    result[propName] = metadata;

                    for each (var md:XML in metadataList)
                    {
                        var mdName:String = md.attribute("name").toString();
                        
                        var argsList:XMLList = md.arg;
                        var value:Object = {};

                        for each (var arg:XML in argsList)
                        {
                            var argKey:String = arg.attribute("key").toString();
                            if (argKey != null)
                            {
                                var argValue:String = arg.attribute("value").toString();
                                value[argKey] = argValue;
                            }
                        }

                        var existing:Object = metadata[mdName];
                        if (existing != null)
                        {
                            var existingArray:Array;
                            if (existing is Array)
                                existingArray = existing as Array;
                            else
                            {
                                existingArray = [existing];
                                delete metadata[mdName];
                            }
                            existingArray.push(value);
                            existing = existingArray;
                        }
                        else
                        {
                            existing = value;
                        }
                        metadata[mdName] = existing;
                    }
                }
            }
        }
        catch(e:Error)
        {
        }
        
        return result;
    }


    /**
     *  @private
     */
    private static function getCacheKey(o:Object, excludes:Array = null, options:Object = null):String
    {
        var key:String = getQualifiedClassName(o);

        if (excludes != null)
        {
            for (var i:uint = 0; i < excludes.length; i++)
            {
                var excl:String = excludes[i] as String;
                if (excl != null)
                    key += excl;
            }
        }

        if (options != null)
        {
            for (var flag:String in options)
            {
                key += flag;
                var value:String = options[flag] as String;
                if (value != null)
                    key += value;
            }
        }
        return key;
    }
    
    /**
     * @private
     */
    private static function byteArrayCompare(a:ByteArray, b:ByteArray):int
    {
        var result:int = 0;
        
        if (a == b)
            return result;
            
        if (a.length != b.length)
        {
            if (a.length < b.length)
                result = -1;
            else
                result = 1;
        }
        else
        {
            for (var i:int = 0; i < a.length; i++)
            {
                result = numericCompare(a[i], b[i]);
                if (result != 0)
                {
                    i = a.length;
                }
            }
        }
        return result;
    }
    
    /**
     * @private
     * This is the "find" for our union-find algorithm when doing object searches.
     * The dictionary keeps track of sets of equal objects
     */
    private static function getRef(o:Object, refs:Dictionary):Object
    {
        var oRef:Object = refs[o]; 
        while (oRef && oRef != refs[oRef])
        {
            oRef = refs[oRef];
        }
        if (!oRef)
            oRef = o;
        if (oRef != refs[o])
            refs[o] = oRef;
        
        return oRef
    }
    
    /**
     * @private
     */
    private static var refCount:int = 0;

    /**
     * @private
     */ 
    private static var CLASS_INFO_CACHE:Object = {};
}

}
