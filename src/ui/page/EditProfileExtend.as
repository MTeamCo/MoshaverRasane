package ui.page
	//ui.page.EditProfileExtend
{
	import Aroos.ui.pages.editProfile.EditProfile;
	
	import contents.Contents;
	import contents.PageData;
	
	import flash.text.SoftKeyboardType;
	
	import picContest.services.types.VUser;
	
	public class EditProfileExtend extends EditProfile
	{
		public function EditProfileExtend()
		{
			super();
		}
		override public function setUp(pageData:PageData):void
		{
			var profile:VUser ;
			field_mail.setUp(Contents.lang.t.user_mail,profile.EMailAddress,SoftKeyboardType.EMAIL,false,false,true,1,1,languageFrame,0,null,false);
			if(field_phone)
			{
				field_phone.setUp(Contents.lang.t.phone_number,profile.MobileNo,SoftKeyboardType.NUMBER,false,false,true,1,1,languageFrame,0,null,false);
			}
		}
	}
}