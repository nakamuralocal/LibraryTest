package Statics
{
	import Views.Views.Vic_00_00_StartMenu;
	
	import mx.utils.ObjectUtil;

	public class Sta_UseViews
	{
		public static const FIRST_VIEW:String = LABEL_00_00;
		
		public static var LABEL_00_00:String = "Vic_00_00";
		public static var CLASS_00_00:Class = Vic_00_00_StartMenu;
		
		public var obj_UseView:Object = new Object();
		
		public function Sta_UseViews()
		{
			var ary_Excludes:Array = [
				"obj_UseView"
				];
			
			var ary_ViewObject:Array = ObjectUtil.getClassInfo(Sta_UseViews,ary_Excludes, {includeReadOnly:false}).properties;
			
			for (var i:uint = 0 ; i < ary_ViewObject.length ; i += 2)
			{
				var reg_Label:String = Sta_UseViews[ary_ViewObject[i+1]];
				var reg_Class:Class = Sta_UseViews[ary_ViewObject[i]];
				obj_UseView[reg_Label] = reg_Class;
			}
			
		}
	}
}