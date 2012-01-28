package rufus.core 
{
	/**
	 * Required methods for every Level setup
	 * 
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public interface ILevel 
	{
		function getTilemap() : String;
		function setup() : void;
	}
	
}