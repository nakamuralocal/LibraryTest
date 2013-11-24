package Controllers.Views
{
	import Events.Oev_FreeAddGroup;
	
	import Views.Views.Viw_00_00_StartMenu;
	
	import mx.core.IMXMLObject;
	import mx.events.FlexEvent;
	
	public class Vic_00_00_StartMenu implements IMXMLObject
	{
		public function Vic_00_00_StartMenu()
		{
		}
		
		public function initialized(document:Object, id:String):void
		{
			view = document as Viw_00_00_StartMenu;
			view.addEventListener(FlexEvent.CREATION_COMPLETE , complete_CreationView);
		}
		
		private var view:Viw_00_00_StartMenu;
		
		private function complete_CreationView(evt:FlexEvent):void
		{
			init();
		}
		
		private function init():void
		{
			view.fat_Grade.viewCon.addEventListener(Oev_FreeAddGroup.CHANGE_DATA , create_GradeCheckBox);
			view.fat_SubGrade.viewCon.addEventListener(Oev_FreeAddGroup.CHANGE_DATA , create_GradeCheckBox);
		}
		
		private function create_GradeCheckBox(evt:Oev_FreeAddGroup):void
		{
			//trace("Event Catch from : " + evt.currentTarget.id);
			
			var ary_Grade:Array = view.fat_Grade.viewCon.ary_Data;
			var ary_SubGrade:Array = view.fat_SubGrade.viewCon.ary_Data;
			
			view.tcb_GradeCheck.viewCon.init(ary_Grade,ary_SubGrade);
		}
	}
}