package ui.page
	//ui.page.RegisterPageExtend
{
	import Aroos.ui.pages.register.RegisterPage;
	
	import contents.Contents;
	import contents.PageData;
	
	import flash.text.ReturnKeyLabel;
	import flash.text.SoftKeyboardType;
	
	import picContest.Pic;
	import picContest.PicEvent;
	
	public class RegisterPageExtend extends RegisterPage
	{
		
		public function RegisterPageExtend()
		{
			super();
		}
		override protected function controlUserField():Boolean
		{
			return true ;
		}
		override protected function controlUserCodmeli():Boolean
		{
			return true;
		}
		override protected function controlPhoneField():Boolean
		{
			if(field_phone!=null && field_phone.text=='')
			{
				field_phone.colorChange(2);
				return false ;
			}
			return true ;
		}
	}
}