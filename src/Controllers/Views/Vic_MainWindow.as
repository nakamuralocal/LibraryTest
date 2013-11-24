package Controllers.Views
{
	import Models.Mod_Personal;
	
	import Statics.Sta_UseViews;
	
	import flash.events.IEventDispatcher;
	import flash.filesystem.File;
	
	import mx.core.IMXMLObject;
	import mx.events.FlexEvent;
	import mx.utils.ObjectUtil;
	
	public class Vic_MainWindow extends Vic_ApplyWindow implements IMXMLObject
	{
		public function Vic_MainWindow(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function initialized(document:Object, id:String):void
		{
			view = document as LibraryTest;
			view.addEventListener(FlexEvent.CREATION_COMPLETE , complete_CreationView);
		}
		
		private var view:LibraryTest;

		
		private function complete_CreationView(evt:FlexEvent):void
		{
			view.removeEventListener(FlexEvent.CREATION_COMPLETE , complete_CreationView);
			
			var temp_ViewManager:Sta_UseViews = new Sta_UseViews();
			obj_ViewManager = temp_ViewManager.obj_UseView;
			
			grp_ViewStage.width = view.width;
			grp_ViewStage.height = view.height - 24;
			view.addElement(grp_ViewStage);
			
			M_APP.change_View(Sta_UseViews.FIRST_VIEW);
			
			//test();
		}
		
		private function test():void
		{
			//save_test();
			load_test();
			
			trace(ObjectUtil.toString(ListMember));
		}
		
		public var ListMember:Array = new Array();
		
		private function load_test():void
		{
			M_JSON.load_JSON(ListMember , Mod_Personal , complete_load_JSON , File.desktopDirectory.nativePath , "Member");
		}
		
		private function complete_load_JSON():void
		{
			trace(ObjectUtil.toString(ListMember));
		}
		
		private function save_test():void
		{
			var reg_PersonalData:Mod_Personal = new Mod_Personal();
			
			reg_PersonalData = new Mod_Personal();
			reg_PersonalData.ID = "pre_01";
			reg_PersonalData.name = "中村 貴弘";
			reg_PersonalData.age = 36;
			reg_PersonalData.flg_Man = true;
			reg_PersonalData.Birthday = new Date(1977,10,13);
			//ListMember[reg_PersonalData.ID] = reg_PersonalData;
			ListMember.push(reg_PersonalData);
			
			reg_PersonalData = new Mod_Personal();
			reg_PersonalData.ID = "pre_02";
			reg_PersonalData.name = "takahiro nakamura";
			reg_PersonalData.age = 24;
			reg_PersonalData.flg_Man = true;
			reg_PersonalData.Birthday = new Date(2013,10,13);
			//ListMember[reg_PersonalData.ID] = reg_PersonalData;
			ListMember.push(reg_PersonalData);
			
			reg_PersonalData = new Mod_Personal();
			reg_PersonalData.ID = "pre_03";
			reg_PersonalData.name = "中村 ひろみ";
			reg_PersonalData.age = 18;
			reg_PersonalData.flg_Man = true;
			reg_PersonalData.Birthday = new Date(1999,5,13);
			//ListMember[reg_PersonalData.ID] = reg_PersonalData;
			ListMember.push(reg_PersonalData);
			
			M_JSON.save_JSON(ListMember , File.desktopDirectory.nativePath , "Member");
		}
				
	}
}