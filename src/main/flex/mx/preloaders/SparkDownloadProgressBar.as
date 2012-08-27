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

package mx.preloaders
{


/**
 *  The SparkDownloadProgressBar class displays download progress.
 *  It is used by the Preloader control to provide user feedback
 *  while the application is downloading and loading. 
 *
 *  <p>The download progress bar displays information about 
 *  two different phases of the application: 
 *  the download phase and the initialization phase. </p>
 *
 *  <p>In the Application container, use the 
 *  the <code>preloader</code> property to specify the name of your subclass.</p>
 *
 *  <p>You can implement a custom download progress bar component 
 *  by creating a subclass of the SparkDownloadProgressBar class. 
 *  Do not implement a download progress bar as an MXML component 
 *  because it loads too slowly.</p>
 *
 *  @see mx.core.Application
 *  @see mx.preloaders.IPreloaderDisplay
 *  @see mx.preloaders.Preloader
 *  
 *  @langversion 3.0
 *  @playerversion Flash 10
 *  @playerversion AIR 1.5
 *  @productversion Flex 4
 */
public class SparkDownloadProgressBar //extends Sprite implements IPreloaderDisplay
{

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------
    
    /**
     *  Constructor.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 10
     *  @playerversion AIR 1.5
     *  @productversion Flex 4
     */
    public function SparkDownloadProgressBar() 
    {
        super();
    }
    
}

}
