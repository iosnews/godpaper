package com.godpaper.as3.model.vos
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	import de.polygonal.ds.Array2;
	
	/**
	 * PositionVO.as class.   	
	 * @author Knight.zhou
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Jul 9, 2010 4:19:38 PM
	 */   	 
	public class PositionVO
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		public var board:Array2;
		public var color:int;
		public var marshalFaceToFace:Boolean;
		public var check:Boolean;
		//----------------------------------
		//  CONSTANTS
		//----------------------------------
		
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//-------------------------------------------------------------------------- 
		
		//--------------------------------------------------------------------------
		//
		//  Protected properties
		//
		//-------------------------------------------------------------------------- 
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		public function PositionVO()
		{
		}     	
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		/**
		 * Prints out all elements (for debug/demo purposes).
		 * 
		 * @return A human-readable representation of the structure.
		 */
		public function dump():String
		{
			var s:String = "PositionVO";
			s += "\n{";
			s += "\n" + "\t";
			s += "board:"+board.dump()+"\t";
			s += "\n" + "\t";
			s += "color:"+color.toString()+"\t";
			s += "\n" + "\t";
			s += "check:"+check.toString()+"\t";
			s += "\n" + "\t";
			s += "marshalFaceToFace:"+marshalFaceToFace.toString()+"\t";
			s += "\n}";
			return s;
		}
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
	}
	
}