/**
 *  The MIT License
 *
 *  Copyright (c) 2010 Simone Vicentini (vizio360)
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */
package jframe.graphics
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	public class MovieClipToBitmap
	{
		/**
		 * @param mc MovieClip to create the BitmapData sequence from.
		 * @param frameWidth Width of the single BitmapData generated from a frame.
		 * @param frameHeight Height of the single BitmapData generated from a frame.
		 * @param scale (optional - default is 1) Scale to be applied to the MC to make it fit the frameWidth, frameHeight specified.
		 * @param bitmapWidth (optional) Width of the BitmapData object to generate. If not specified it will be the same as frameWidth.
		 * @param bitmapHeight (optional) Height of the BitmapData object to generate. If not specified it will be the same as frameWidth.
		 * @param shoudHaveFrames (optional) Quantos frames deve ter a animação
		 *
		 * @exampleText
		 * N.B. the MC frames will be always centered in the frameWidth frameHeight specified.
		 *
		 * If you don't specify bitmapWidth and bitmapHeight
		 * you can use this function also to create BitmapDatas that include multiple frames.
		 * e.g. You have a MC with 30 frames and you want to create 3 BitmapDatas which contain
		 * 10 frames each. If the targetWidth is 100 and the targetHeight is 100 you can specify
		 * bitmapWidth as 500 and bitmapHeight as 200 to obtain 2 BitmapDatas with 10 frames each.
		 * BitmapData with multiple frames will always be generate from left to right.
		 *
		 * @return A vector of the bitmapDatas generated.
		 */
		public static function createBitmapFrameSequence(mc:MovieClip, frameWidth:Number, frameHeight:Number, scale:Number = 1, bitmapWidth:int = -1, bitmapHeight:int = -1, shoudHaveFrames:int = 0):Vector.<BitmapData>
		{
			var outputBitmapDatas:Vector.<BitmapData> = new Vector.<BitmapData>();
			var totalFrames:int = mc.totalFrames;
			
			if (bitmapWidth < 1 && bitmapHeight < 1)
			{
				bitmapWidth = frameWidth;
				bitmapHeight = frameHeight;
			}
			else if (!(bitmapWidth >= 1 && bitmapHeight >= 1))
			{
				throw new Error("Inconsistency in the definition of the bitmap size!!! Width and Height need to be >= 1");
			}
			
			var numberOfFramesPerBitmap:int;
			numberOfFramesPerBitmap = Math.floor(bitmapWidth / frameWidth) * Math.floor(bitmapHeight / frameHeight);
			
			var numberOfBitmapsNeeded:int;
			numberOfBitmapsNeeded = Math.ceil(totalFrames / numberOfFramesPerBitmap);
			
			var incressFrame:int = 1;
			var initFrameIncress:int = 1;
			
			if (shoudHaveFrames > 0)
			{
				numberOfFramesPerBitmap = Math.ceil(numberOfBitmapsNeeded / shoudHaveFrames)
				numberOfBitmapsNeeded = shoudHaveFrames;
				/**
				 * Diminui por dois para... sei lah, por algum motivo
				 */
				incressFrame = Math.ceil(totalFrames / (shoudHaveFrames - 1));
				var frameI:int = Math.abs(totalFrames - Math.ceil(shoudHaveFrames * (incressFrame - 1)));
				initFrameIncress = frameI;
			}
			
			var currentFrame:int = 1;
			for (var i:int = 0; i < numberOfBitmapsNeeded; i++)
			{
				var x:int = 0;
				var y:int = 0;
				var bmp:BitmapData = new BitmapData(bitmapWidth, bitmapHeight, true, 0x00FFFFFF);
				bmp.lock();
				for (var frame:int = 0; frame < 1; frame++)
				{
					mc.gotoAndStop(currentFrame);
					
					var mcRect:Rectangle = mc.getRect(null);
					
					var matrix:Matrix = new Matrix();
					var scaledClipWidth:Number = frameWidth * (1 / scale);
					var scaledClipHeight:Number = frameHeight * (1 / scale);
					
					matrix.translate(-mcRect.x + ((scaledClipWidth - mcRect.width) / 2), -mcRect.y + ((scaledClipHeight - mcRect.height) / 2));
					matrix.scale(scale, scale);
					
					bmp.draw(mc, matrix, null, null, null, true);
					
					if (x + frameWidth >= bmp.width)
					{
						x = 0;
						y += frameHeight;
					}
					else
					{
						x += frameWidth;
					}
					currentFrame += incressFrame;
					trace( "currentFrame : " + currentFrame );
				}
				bmp.unlock();
				outputBitmapDatas.push(bmp);
			}
			return outputBitmapDatas;
		}
	}
}