set name=NamazNews
set provision_dev=NamazNewsAdhoc
set provision_dist=NamazNewsDist
set native_folder=-extdir "native"
rem -extdir "native"
set dist_xml_name=NamazNews-withnative-app-dist
set dev_xml_name=NamazNews-withnative-app
set android_xml_name=NamazNews-app-android


set contents= Data AppIconsForPublish
rem "AppIconsForPublish"
set ios_contents=Default.png Default@2x.png Default-568h@2x.png Default-568h-Portrait@2x.png Default-Landscape.png Default-Landscape@2x~ipad.png Default-Landscape~ipad.png Default-Portrait.png Default-Portrait@2x~ipad.png Default-Portrait~ipad.png
set ios_dev_certificate=ios_development.p12
set ios_dist_certificate=%certfolder%\MTeam IOS Certificate.p12
set ios_pass=NewPass123$
set ios_dist_mobprevision=%provision_dist%.mobileprovision
set ios_dev_mobprevision=%provision_dev%.mobileprovision
set ios_targ_dev=ipa-ad-hoc
set ios_targ_dist=ipa-app-store
set ios_targ_dev_remote=ipa-debug -connect %pcip%
rem -useLegacyAOT yes   -useLegacyAOT no
rem ipa-ad-hoc    ipa-app-store   ipa-debug -connect 192.168.0.15
rem    ipa-ad-hoc � an iOS package for ad hoc distribution.

rem    ipa-app-store � an iOS package for Apple App store distribution.

rem    ipa-debug � an iOS package with extra debugging information. (The SWF files in the application must also be compiled with debugging support.)

rem    ipa-test � an iOS package compiled without optimization or debugging information.

rem    ipa-debug-interpreter � functionally equivalent to a debug package, but compiles more quickly. However, the ActionScript bytecode is interpreted and not translated to machine code. As a result, code execution is slower in an interpreter package.

rem    ipa-debug-interpreter-simulator � functionally equivalent to ipa-debug-interpreter, but packaged for the iOS simulator. Macintosh-only. If you use this option, you must also include the -platformsdk option, specifying the path to the iOS Simulator SDK.

rem    ipa-test-interpreter � functionally equivalent to a test package, but compiles more quickly. However, the ActionScript bytecode is interpreted and not translated to machine code. As a result, code execution is slower in an interpreter package.

rem    ipa-test-interpreter-simulator � functionally equivalent to ipa-test-interpreter, but packaged for the iOS simulator. Macintosh-only. If you use this option, you must also include the -platformsdk option, specifying the path to the iOS Simulator SDK.


set android_certificate=%certfolder%\MTeam Certification File.p12
set android_pass=NewPass123$
set android_target=apk-captive-runtime
rem :apk-debug -connect 192.168.0.15         apk-captive-runtime
rem :apk � an Android package. A package produced with this target can only be installed on an Android device, not an emulator.
rem :apk?captive?runtime � an Android package that includes both the application and a captive version of the AIR runtime. A package produced with this target can only be installed on an Android device, not an emulator.
rem :apk-debug � an Android package with extra debugging information. (The SWF files in the application must also be compiled with debugging support.)
rem :apk-emulator � an Android package for use on an emulator without debugging support. (Use the apk-debug target to permit debugging on both emulators and devices.)
rem :apk-profile � an Android package that supports application performance and memory profiling.


set /p os_type=Select your OS: 1-Android  2-iOS  3-Widnows%=%

if %os_type% == 1 goto android_export
if %os_type% == 2 goto ios_export
if %os_type% == 3 goto window_export

:android_export
	set /p export_type=1-with embeded air  2-whitout air  3-remote debug%=%

	if %export_type% == 1 goto androidexport
	if %export_type% == 2 goto androidexport_whitout_air
	if %export_type% == 3 goto androiddebug
	
	
	:androidexport
		copy "AppIconsForPublish-and" "AppIconsForPublish"
		rem android export V
		"%aircompiler%\bin\adt.bat" -package -target %android_target%  -storetype pkcs12 -storepass %android_pass% -keystore "%android_certificate%" "%name%.apk" "%android_xml_name%.xml" "%name%.swf" %contents% %native_folder%
		exit

	:androidexport_whitout_air
		copy "AppIconsForPublish-and" "AppIconsForPublish"
		rem android export V
		"%aircompiler%\bin\adt.bat" -package -target apk  -storetype pkcs12 -storepass %android_pass% -keystore "%android_certificate%" "%name%_no_air.apk" "%android_xml_name%.xml" "%name%.swf" %contents% %native_folder%
		exit
		
	:androiddebug
		copy "AppIconsForPublish-and" "AppIconsForPublish"
		rem android export V
		"%aircompiler%\bin\adt.bat" -package -target apk-debug -connect %pcip% -storetype pkcs12 -storepass %android_pass% -keystore "%android_certificate%" "%name%-remote_debug.apk" "%android_xml_name%.xml" "%name%.swf" %contents% %native_folder%
		exit

:ios_export
	set /p export_type=1-Dev  2-Dist  3-remote debug%=%

	if %export_type% == 1 goto iosdev
	if %export_type% == 2 goto iosdist
	if %export_type% == 3 goto iosdev_debug
	
	

	:iosdev
		copy "AppIconsForPublish-ios" "AppIconsForPublish"
		rem IOS  Dev export V
		"%aircompiler%\bin\adt.bat" -package -target %ios_targ_dev%  -keystore "%ios_dev_certificate%" -storetype pkcs12 -storepass %ios_pass%  -provisioning-profile  "%ios_dev_mobprevision%"  "%name%-dev.ipa" "%dev_xml_name%.xml"  "%name%.swf"  %contents% %ios_contents% %native_folder%
		

	:iosdist
		copy "AppIconsForPublish-ios" "AppIconsForPublish"
		rem IOS Dist export V
		"%aircompiler%\bin\adt.bat" -package -target %ios_targ_dist%  -keystore "%ios_dist_certificate%" -storetype pkcs12 -storepass %ios_pass%  -provisioning-profile  "%ios_dist_mobprevision%"  "%name%-dist.ipa" "%dist_xml_name%.xml"  "%name%.swf"  %contents% %ios_contents% %native_folder%
		

	:iosdev_debug
		copy "AppIconsForPublish-ios" "AppIconsForPublish"
		rem IOS  Dev export V
		"%aircompiler%\bin\adt.bat" -package -target %ios_targ_dev_remote%  -keystore "%ios_dev_certificate%" -storetype pkcs12 -storepass %ios_pass%  -provisioning-profile  "%ios_dev_mobprevision%"  "%name%-dev-remote.ipa" "%dev_xml_name%.xml"  "%name%.swf"  %contents% %ios_contents% %native_folder%





:window_export

	:preview
	set dAA3=1024x768:1024x768
	rem debugger V
	"%aircompiler%\bin\adl.exe" -profile mobileDevice -screensize %dAA3% "%name%-app.xml"
	pause
	exit



