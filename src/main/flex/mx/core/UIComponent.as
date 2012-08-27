package mx.core
{

	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;

	import mx.events.PropertyChangeEvent;
	import mx.styles.IStyleManager2;

	import tl.ioc.IoCHelper;

	[Event(name="propertyChange", type="mx.events.PropertyChangeEvent")]
	public class UIComponent extends EventDispatcher implements IStateClient2
	{
		[Inject]
		protected var _statesImpl : IStateClient2 = IoCHelper.resolve(IStateClient2, this);
		public var descriptor : ComponentDescriptor;
		public var document : *;

		public function UIComponent()
		{
		}

		public function get currentState() : String
		{
			return _statesImpl.currentState;
		}

		[Bindable(event="propertyChange")]
		public function set currentState( value : String ) : void
		{
			var oldValue : String = _statesImpl.currentState;
			if ( value == oldValue )
			{
				return;
			}

			_statesImpl.currentState = value;

			dispatchEvent( PropertyChangeEvent.createUpdateEvent( this, "currentState", oldValue, value ) );
		}

		[ArrayElementType("mx.states.State")]
		public function get states() : Array
		{
			return _statesImpl.states;
		}

		public function set states( value : Array ) : void
		{
			if ( value == _statesImpl.states )
			{
				return;
			}

			_statesImpl.states = value;
		}

		[ArrayElementType("mx.states.Transition")]
		public function get transitions() : Array
		{
			return _statesImpl.transitions;
		}

		public function set transitions( value : Array ) : void
		{
			if ( value == _statesImpl.transitions )
			{
				return;
			}

			_statesImpl.transitions = value;
		}

		public function hasState( stateName : String ) : Boolean
		{
			return _statesImpl.hasState( stateName );
		}


		public function get baselinePosition():Number
		{
			return 0;
		}

		protected function get currentCSSState():String { return null; }
		public function set enabled(value:Boolean):void {}
		public function set errorString(value:String):void {}
		public function set mouseEnabled(value:Boolean):void{}
		public function set mouseChildren(value:Boolean):void{}
		public function matchesCSSState(cssState:String):Boolean{return false;}

		protected function createChildren() : void
		{
		}

		protected function commitProperties() : void
		{
		}

		protected function measure() : void
		{
		}

		protected function updateDisplayList( unscaledWidth : Number, unscaledHeight : Number ) : void
		{
		}

		public function styleChanged( styleProp : String ) : void
		{
		}

		public function regenerateStyleCache( recursive : Boolean ) : void
		{
		}

		public function notifyStyleChangeInChildren( styleProp : String, recursive : Boolean ) : void
		{
		}

		public function get styleManager() : IStyleManager2
		{
			return null;
		}

		public function initialize() : void
		{
		}

		protected function keyDownHandler( event : KeyboardEvent ) : void
		{
		}

		protected function keyUpHandler( event : KeyboardEvent ) : void
		{
		}

		public function drawFocus(isFocused:Boolean):void {}

  public function addChild(child:DisplayObject):DisplayObject
  {
	  return null;
  }

  public function addChildAt(child:DisplayObject, index:int):DisplayObject
  {
	  return null;
  }

  public function removeChild(child:DisplayObject):DisplayObject
  {
	  return null;
  }

  public function removeChildAt(index:int):DisplayObject
  {
	  return null;
  }

  public function setChildIndex(child:DisplayObject, index:int):void {}

  public function swapChildren(child1:DisplayObject, child2:DisplayObject):void {}

  public function swapChildrenAt(index1:int, index2:int):void{}
	}
}