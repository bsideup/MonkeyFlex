////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2003-2007 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package mx.managers.systemClasses
{

import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;

use namespace mx_internal;

[ExcludeClass]

public class ChildManager //implements ISystemManagerChildManager
{

	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------

	/**
	 *  Constructor.
	 *
	 *  <p>This is the starting point for all Flex applications.
	 *  This class is set to be the root class of a Flex SWF file.
         *  Flash Player instantiates an instance of this class,
	 *  causing this constructor to be called.</p>
	 */
	public function ChildManager(systemManager:IFlexModuleFactory)
	{
		super();

	}

}

}


