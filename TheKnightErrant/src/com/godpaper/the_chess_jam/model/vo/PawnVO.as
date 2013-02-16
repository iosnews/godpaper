/**
 *  GODPAPER Confidential,Copyright 2013. All rights reserved.
 *
 *  Permission is hereby granted, free of charge, to any person obtaining
 *  a copy of this software and associated documentation files (the "Software"),
 *  to deal in the Software without restriction, including without limitation
 *  the rights to use, copy, modify, merge, publish, distribute, sub-license,
 *  and/or sell copies of the Software, and to permit persons to whom the
 *  Software is furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included
 *  in all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 *  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 *  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 *  IN THE SOFTWARE.
 */
package com.godpaper.the_chess_jam.model.vo
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	import com.godpaper.as3.consts.DefaultConstants;
	import com.godpaper.as3.impl.AbstractChessVO;
	import com.godpaper.as3.utils.LogUtil;
	
	import mx.logging.ILogger;
	
	
	/**
	 * PawnVO.as class.   	
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Feb 16, 2013 12:52:44 AM
	 */   	 
	public class PawnVO extends AbstractChessVO
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  CONSTANTS
		//----------------------------------
		private static const LOG:ILogger = LogUtil.getLogger(PawnVO);
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
		public function PawnVO(width:int, height:int, rowIndex:int, colIndex:int, flag:uint=1, identifier:String="")
		{
			super(width, height, rowIndex, colIndex, flag, identifier);
		}     	
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		/**
		 * @inheritDoc
		 */		
		override public function initialization(rowIndex:int, colIndex:int, flag:uint=0, identifier:String=""):void
		{
			//* -
			//* -
			//about occupies.
			//Notice:serveral admental(backword,forward,pass by)
			//right or left direction.
			trace(flag,DefaultConstants.FLAG_RED,flag==DefaultConstants.FLAG_RED);
			//serveral admental
			if(flag==DefaultConstants.FLAG_RED)//index-backward
			{
				if(colIndex>0 && rowIndex>0 )
				{
					this.occupies.setBitt(rowIndex-1,colIndex,true);
				}
			}else//index-forward
			{
				if(rowIndex<7 && colIndex<7)
				{
					this.occupies.setBitt(rowIndex+1,colIndex,true);
				}
			}
			//about legal moves.
			if(flag==DefaultConstants.FLAG_RED)
			{
				this.moves = this.occupies.xor(this.occupies.and(chessPiecesModel.redPieces));
			}
			if(flag==DefaultConstants.FLAG_BLUE)
			{
				this.moves = this.occupies.xor(this.occupies.and(chessPiecesModel.bluePieces));
			}
			//about attacked captures.
			if(flag==DefaultConstants.FLAG_RED)
			{
				this.captures = this.moves.and(chessPiecesModel.bluePieces);
			}
			if(flag==DefaultConstants.FLAG_BLUE)
			{
				this.captures = this.moves.and(chessPiecesModel.redPieces);
			}
			//
			LOG.debug("[{0},{1}] occupies:{2}",colIndex,rowIndex,this.occupies.dump());
			LOG.debug("[{0},{1}] moves:{2}",colIndex,rowIndex,this.moves.dump());
			LOG.debug("[{0},{1}] captures:{2}",colIndex,rowIndex,this.captures.dump());
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