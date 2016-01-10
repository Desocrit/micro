package {
import flash.utils.Timer;
import flash.display.MovieClip;
import flash.events.KeyboardEvent;
import flash.events.TimerEvent
import flash.events.Event
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.AntiAliasType;
import flashx.textLayout.accessibility.TextAccImpl;
import flashx.textLayout.container.ContainerController;
import flashx.textLayout.elements.ParagraphElement;
import flashx.textLayout.elements.SpanElement;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.formats.TextLayoutFormat;
import flash.sensors.Accelerometer;
import flash.events.MouseEvent;
import flash.net.SharedObject;
import flash.ui.Mouse;
import flash.media.Sound;
import flash.media.SoundChannel;
public class Main extends MovieClip {
	//Variables
		//UI Variables
		public var IronBox:TextField = new TextField();
		public var MineralsBox:TextField = new TextField();
		public var Formatz:TextFormat = new TextFormat();
		public var Formaty:TextFormat = new TextFormat();
		public var myFont = new GoudyStout();
		public var timenumber:Number = 0;
		public var Timed:TextField = new TextField();
		public var HPBar:Array = new Array;
		public var AABar:Array = new Array;
		public var SpecBar:Array = new Array;
		public var eHPBar:Array = new Array;
		public var eAABar:Array = new Array;
		public var eSpecBar:Array = new Array;
		public var Queue:Number = -1;
		//Script Variables
		public var Difficulty:Number = 3;public var SavedData:SharedObject = SharedObject.getLocal("microsavegame");public var Level:Number;public var Achievement:Number=1;
		public var i:Number = 0; public var j:Number = 0; public var k:Number = 0;public var l:Number = 0;public var m:Number = 0;public var n:Number = 0;
		public var ResourceTimer:Timer = new Timer(1000);public var IconArray:Array = new Array();public var o: Number = 0;
		public var UnitName:Array=new Array("Marine","Shaman","Drone","Machinegunner","OgreWarlord","Hunter","Battlemage","Giant","SniperDrone","Archmage","Dragon","Reaper","Defiler");
		public var UnitHotkeys:Array = new Array(49,50,51,52,53,54,87,71,83,65,68,82);public var BossSpecial:Number = -1;
		public var UnitMinerals:Array = new Array(800,800,500,1200,1000,1500,2000,1800,2400,4000,4000,4000);public var Pussy:Boolean = false;
		public var UnitTier:Array = new Array(0,0,0,1,1,1,2,2,2,-1,-2,-3);public var AchieArray = new Array(0,0,0,0,0,0);
		public var UnitTimer:Array = new Array(3000,4000,3000,4000,5000,3000,4000,6000,5000,8000,8000,8000);public var AchiesArray:Array = new Array();
		public var BuildingTimer:Array = new Array(20000,5000,5000,5000,5000,5000,10000,15000,20000,20000);public var IconsArray:Array = new Array();
		public var UnitAuto:Array = new Array(1000,1800,2000,500,6000,4000,1001,3000,7500,2500,999,1005,5000,1200);public var TutProgress:int = 0;
	    public var UnitSpec:Array = new Array(5000,8000,10000,10000,5000,10000,10000,8000,10000,15000,15000,15000,10000,25000);public var AchieTimer:Timer = new Timer(100,1);
		public var UnitHP:Array = new Array(85,180,50,100,200,80,250,320,75,280,500,200,2500,12000);public var GameType=0;public var AchieTimer2:Timer = new Timer(100,1);
		public var UnitRange:Array = new Array(2,3,0,2,1,1,6,1,6,6,1,9,9);public var UnitSelected:Number=-1;public var Calculator:Array=new Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0);
		public var BuildingsA:Array = new Array(1,1,1,1,1,1,1,1,1,1,1);public var UnitsA:Array = new Array(1,1,1,1,1,1,1,1,1,1,1,1);
		public var MenuTrack1:Sound = new MenuMusic1();public var MenuTrack2:Sound = new MenuMusic2();public var MenuTrack3:Sound = new MenuMusic3();
		public var BattleTrack1:Sound = new BattleMusic1();public var BattleTrack2:Sound = new BattleMusic2();public var BattleTrack3:Sound = new BattleMusic3();
		public var MusicChannel:SoundChannel = new SoundChannel();public var BossArray:Array = new Array(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
		//Player 1 Variables
		public var Iron:Number = 70; public var Minerals:Number = 500; public var IronIncome:Number = 30; public var MineralsIncome:Number = 20; //Default 70(30) 500(20)
		public var BuildTimer:Timer = new Timer(3000); public var TrainTimer:Timer = new Timer(3000);
		public var BuildOrder:Number = -1; public var TrainOrder:Number = -1; public var TrainSlot:Number = -1;
		public var ToolsLevel:Number = 0; public var BarracksLevel:Number = 0; public var ShieldLevel:Number = 0; public var Tactics:Number = 0;
		public var Tier:Number = 1; public var Archmage:Boolean = false; public var Reaper:Boolean =  false; public var Dragon:Boolean = false;
		public var UnitType:Array = new Array(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
		public var HP:Array = new Array(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
		public var SpecialEffect:Array = new Array(0,0,0,0,0,0,0,0,0,0);
		public var Debuff:Array = new Array(0,0,0,0,0,0,0,0,0,0);	
		public var UnitArray:Array = new Array;
		public var UnitTarget:Array = new Array(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
		public var CellArray:Array = new Array(F0,F1,F2,F3,F4,F5,F6,F7,F8,F9);
		public var SpecialProgress:Array = new Array(0,0,0,0,0,0,0,0,0,0,0,0);
		public var AutoAttackCurrent:Array = new Array(0,0,0,0,0,0,0,0,0,0);
		public var AutoAttackMax:Array = new Array(0,0,0,0,0,0,0,0,0,0);
		public var UnitDebuff:Array = new Array(0,0,0,0,0,0,0,0,0,0);
		public var AutoAttacks:Vector.<Timer> = new Vector.<Timer>(); public var SpecialAttacks:Vector.<Timer> = new Vector.<Timer>();
		public var AttackTimer:Timer; public var SpecialTimer:Timer;
		public var SpecialActive:Boolean = false; public var Moving:Boolean = false; public var IsMoving:Boolean = false; 
		public var Reaped:Number = -1; public var LifeWard:Number = -1; public var DarkFlamed:Number = -1; public var DarkFlameTimer:Number = 0;
		//Player 2 Variables
		public var AIBuild:int = -1;
		public var AIBuildOrder:Array = new Array();
		public var AIBuildProgress:Number = 0;
		public var UnitPriority:Array = new Array();
		public var eIron:Number = 70; public var eMinerals:Number = 500; public var eIronIncome:Number = 30; public var eMineralsIncome:Number = 20;
		public var eBuildTimer:Timer = new Timer(3000); public var eTrainTimer:Timer = new Timer(3000);
		public var eBuildOrder:Number = -1; public var eTrainOrder:Number = -1; public var eTrainSlot:Number = -1;
		public var eToolsLevel:Number = 0; public var eBarracksLevel:Number = 0; public var eShieldLevel:Number = 0; public var eTactics:Number = 0;
		public var eTier:Number = 1; public var eArchmage:Boolean = false; public var eReaper:Boolean = false; public var eDragon:Boolean = false;
		public var eUnitType:Array = new Array(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
		public var eHP:Array = new Array(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
		public var eSpecialEffect:Array = new Array(0,0,0,0,0,0,0,0,0,0);
		public var eDebuff:Array = new Array(0,0,0,0,0,0,0,0,0,0);	
		public var eUnitArray:Array = new Array;
		public var eUnitTarget:Array = new Array(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
		public var eCellArray:Array = new Array(E0,E1,E2,E3,E4,E5,E6,E7,E8,E9);
		public var eSpecialProgress:Array = new Array(0,0,0,0,0,0,0,0,0,0,0,0);
		public var eAutoAttackCurrent:Array = new Array(0,0,0,0,0,0,0,0,0,0);
		public var eAutoAttackMax:Array = new Array(0,0,0,0,0,0,0,0,0,0);
		public var eUnitDebuff:Array = new Array(0,0,0,0,0,0,0,0,0,0);
		public var eAutoAttacks:Vector.<Timer> = new Vector.<Timer>(); public var eSpecialAttacks:Vector.<Timer> = new Vector.<Timer>();
		public var eAttackTimer:Timer; public var eSpecialTimer:Timer;
		public var eSpecialActive:Boolean = false; public var eMoving:Boolean = false; public var eIsMoving:Boolean = false; 
		public var eReaped:int = -1; public var eLifeWard:Number = -1; public var eDarkFlamed:Number = -1; public var eDarkFlameTimer:Number = 0;
		//Main
		public function Main() {
			//SavedData.data.LevelProgress = [4,4,4,4,4,4,4,4,4,4,0];SavedData.data.LevelAchies = [3,3,3,3,3,3,3,3,3,3,0];SavedData.data.TutProgress=2
			if(!SavedData.data.Active){SavedData.data.Active=1;SavedData.data.LevelProgress = [0,0,0,0,0,0,0,0,0,0,0];SavedData.data.LevelAchies = [0,0,0,0,0,0,0,0,0,0,0];
			SavedData.data.TutProgress=0;SavedData.data.Progress=0;SavedData.data.Sounds=1;SavedData.data.Sticky=0;SavedData.data.Auto=0;};
			MainMenu(0);if(SavedData.data.Sounds==1){PickSong(0);MusicChannel.addEventListener(Event.SOUND_COMPLETE,NextSong);}}
			
		//Menus
		//Main Menu
		function MainMenu(l:int){
			gotoAndStop(1);
			CampaignButton.addEventListener(MouseEvent.CLICK,CampaignMenu);
			SkirmishX.addEventListener(MouseEvent.CLICK,SkirmishMenu);
			ProfileZ.addEventListener(MouseEvent.CLICK, ProfileMenu);SettingsY.addEventListener(MouseEvent.CLICK, SettingsMenu);}
		function MainMenuCleanup(spr:int){
			SkirmishX.removeEventListener(MouseEvent.CLICK, SkirmishMenu);CampaignButton.removeEventListener(MouseEvent.CLICK, CampaignMenu);
			ProfileZ.removeEventListener(MouseEvent.CLICK, ProfileMenu);SettingsY.removeEventListener(MouseEvent.CLICK, SettingsMenu);}
		//Sound Looper (Menus)
		function NextSong (m:int){MusicChannel.removeEventListener(Event.SOUND_COMPLETE,NextSong);PickSong(0);MusicChannel.addEventListener(Event.SOUND_COMPLETE,NextSong);}
		function PickSong(z:int){
			var SongArray = new Array(MenuTrack1,MenuTrack2,MenuTrack3);MusicChannel = SongArray[int(Math.random()*3)].play();}
		//Settings Menu
		function SettingsMenu(m:int){
			MainMenuCleanup(0);gotoAndStop(9);ClearlyMad.gotoAndStop(1);ReallyMad.gotoAndStop(1);
			if(SavedData.data.Sounds==1){On1.gotoAndStop(2);Off1.gotoAndStop(1)}else{On1.gotoAndStop(1);Off1.gotoAndStop(2)};
			if(SavedData.data.Sticky==1){On2.gotoAndStop(2);Off2.gotoAndStop(1)}else{On2.gotoAndStop(1);Off2.gotoAndStop(2)};
			if(SavedData.data.Auto==1){On3.gotoAndStop(2);Off3.gotoAndStop(1)}else{On3.gotoAndStop(1);Off3.gotoAndStop(2)};
			Backd.addEventListener(MouseEvent.CLICK,Backe);ClearlyMad.addEventListener(MouseEvent.CLICK,ClearanceSale);ReallyMad.addEventListener(MouseEvent.CLICK,ClearOut);
			On1.addEventListener(MouseEvent.CLICK,O1n);Off1.addEventListener(MouseEvent.CLICK,O1ff);On2.addEventListener(MouseEvent.CLICK,O2n);
			Off2.addEventListener(MouseEvent.CLICK,O2ff);On3.addEventListener(MouseEvent.CLICK,O3n);Off3.addEventListener(MouseEvent.CLICK,O3ff);}
		function SettingsCleanup(l:int){
			Backd.removeEventListener(MouseEvent.CLICK,Backe);ClearlyMad.removeEventListener(MouseEvent.CLICK,ClearanceSale);On2.removeEventListener(MouseEvent.CLICK,O2n);
			ReallyMad.removeEventListener(MouseEvent.CLICK,ClearOut);On1.removeEventListener(MouseEvent.CLICK,O1n);Off1.removeEventListener(MouseEvent.CLICK,O1ff);
			Off2.removeEventListener(MouseEvent.CLICK,O2ff);On3.removeEventListener(MouseEvent.CLICK,O3n);Off3.removeEventListener(MouseEvent.CLICK,O3ff);}
		function Backe(pr:int){SettingsCleanup(0);MainMenu(0);}
		function O1n(k:int){if(On1.currentFrame==1){PickSong(0);MusicChannel.addEventListener(Event.SOUND_COMPLETE,NextSong)};On1.gotoAndStop(2);Off1.gotoAndStop(1);
		SavedData.data.Sounds=1;};function O1ff(k:int){Off1.gotoAndStop(2);On1.gotoAndStop(1);SavedData.data.Sounds=0;MusicChannel.stop()}
		function O2n(k:int){On2.gotoAndStop(2);Off2.gotoAndStop(1);SavedData.data.Sticky=1};function O2ff(k:int){Off2.gotoAndStop(2);On2.gotoAndStop(1);SavedData.data.Sticky=0}
		function O3n(k:int){On3.gotoAndStop(2);Off3.gotoAndStop(1);SavedData.data.Auto=1};function O3ff(k:int){Off3.gotoAndStop(2);On3.gotoAndStop(1);SavedData.data.Auto=0}
		function ClearanceSale (sk:int){if(ClearlyMad.currentFrame==1){ClearlyMad.gotoAndStop(ClearlyMad.currentFrame+1);ReallyMad.gotoAndStop(ReallyMad.currentFrame+1);}else{
			ClearlyMad.gotoAndStop(ClearlyMad.currentFrame-1);ReallyMad.gotoAndStop(ReallyMad.currentFrame-1);}}
		function ClearOut (cl:int){ClearlyMad.gotoAndStop(ClearlyMad.currentFrame-1);ReallyMad.gotoAndStop(ReallyMad.currentFrame-1);
			SavedData.data.Active=1;SavedData.data.LevelProgress = [0,0,0,0,0,0,0,0,0,0,0];SavedData.data.LevelAchies = [0,0,0,0,0,0,0,0,0,0,0];
			SavedData.data.TutProgress=0;SavedData.data.Progress=0;}
		//Achievements
		function ProfileMenu(m:int){
			if(IsMoving==true){IsMoving=false}else{MainMenuCleanup(0)};gotoAndStop(7);
			AchiesArray = new Array();AchiesArray=[Achies1,Achies2,Achies3,Achies4,Achies5,Achies6,Achies7,Achies8,Achies9,AchiesX];AchiesRight.gotoAndStop(2);
			for(i=0;i<10;i++){AchiesArray[i].gotoAndStop((i*4)+1);
			if(SavedData.data.LevelAchies[i+1]==1||SavedData.data.LevelAchies[i+1]==3){AchiesArray[i].gotoAndStop((AchiesArray[i].currentFrame)+1)}}
			AchiesSwitch.addEventListener(MouseEvent.CLICK,AchiesLeftT);AchiesSwitch2.addEventListener(MouseEvent.CLICK,AchiesRightT);
			AchiesRight.addEventListener(MouseEvent.CLICK,AchiesRightf);AchiesLeft.addEventListener(MouseEvent.CLICK,AchiesLeftf);
			Back777.addEventListener(MouseEvent.CLICK,Back666);}
		function AchiesRightf (m:int){if(AchiesRight.currentFrame<4){AchiesRight.gotoAndStop(AchiesRight.currentFrame+1)}else{AchiesRight.gotoAndStop(1);}AchiesCorrect(0);}
		function AchiesLeftf(m:int){if(AchiesRight.currentFrame>1){AchiesRight.gotoAndStop(AchiesRight.currentFrame-1)}else{AchiesRight.gotoAndStop(4);}AchiesCorrect(0);}
		function AchiesCorrect(z:int){
			for(i=0;i<10;i++){if(AchiesRight.currentFrame==1){if(SavedData.data.LevelProgress[i+1]==0){AchiesArray[i].gotoAndStop(41);}else{AchiesArray[i].gotoAndStop(42)}};
				if(AchiesRight.currentFrame==2||AchiesRight.currentFrame==3){if(SavedData.data.LevelAchies[i+1]==1||SavedData.data.LevelAchies[i+1]==3){
					AchiesArray[i].gotoAndStop((i*4)+(AchiesRight.currentFrame*2)-2);}else{AchiesArray[i].gotoAndStop((i*4)+(AchiesRight.currentFrame*2)-3)}}
				if(AchiesRight.currentFrame==4){if(SavedData.data.LevelProgress[i+1]<4){AchiesArray[i].gotoAndStop(43);}else{AchiesArray[i].gotoAndStop(44)}}}}
		function ProfileMenuCleanup(z:int){
			AchiesSwitch.removeEventListener(MouseEvent.CLICK,AchiesLeftT);AchiesSwitch2.removeEventListener(MouseEvent.CLICK,AchiesRightT);
			AchiesRight.removeEventListener(MouseEvent.CLICK,AchiesRightf);AchiesLeft.removeEventListener(MouseEvent.CLICK,AchiesLeftf);
			Back777.removeEventListener(MouseEvent.CLICK,Back666);}
		function AchiesRightT(spr:int){ProfileMenuCleanup(0);UnitGuide(0)};function AchiesLeftT(spr:int){ProfileMenuCleanup(0);StrucMenu(0)}
		function Back666(spr:int){ProfileMenuCleanup(0);MainMenu(0)}
		//Unit Guide
		function UnitGuide(l:int){gotoAndStop(8);UGText.gotoAndStop(1);TopText.gotoAndStop(1);Back123.addEventListener(MouseEvent.CLICK,Back321);
			TopLeft.addEventListener(MouseEvent.CLICK,LeftTop);BottomLeft.addEventListener(MouseEvent.CLICK,LeftBottom);
			BottomRight.addEventListener(MouseEvent.CLICK,RightBottom);TopRight.addEventListener(MouseEvent.CLICK,RightTop);}
		function Back321(l:int){UGCleanUp(0);MainMenu(7)};function LeftTop(z:int){UGCleanUp(0);IsMoving=true;ProfileMenu(6)}function RightTop(z:int){UGCleanUp(0);StrucMenu(6)}
		function LeftBottom(pr:int){if(UGText.currentFrame==1){UGText.gotoAndStop(12)}else{UGText.gotoAndStop(UGText.currentFrame-1)}}
		function RightBottom(pr:int){if(UGText.currentFrame==12){UGText.gotoAndStop(1)}else{UGText.gotoAndStop(UGText.currentFrame+1)}}
		function UGCleanUp(z:int){Back123.removeEventListener(MouseEvent.CLICK,Back321);TopLeft.removeEventListener(MouseEvent.CLICK,LeftTop);
			BottomLeft.removeEventListener(MouseEvent.CLICK,LeftBottom);BottomRight.removeEventListener(MouseEvent.CLICK,RightBottom);
			TopRight.removeEventListener(MouseEvent.CLICK,RightTop);}
		//Structure Guide
		function StrucMenu(l:int){gotoAndStop(8);UGText.gotoAndStop(13);TopText.gotoAndStop(2);Back123.addEventListener(MouseEvent.CLICK,Back322);
			TopLeft.addEventListener(MouseEvent.CLICK,LeftTop2);BottomLeft.addEventListener(MouseEvent.CLICK,LeftBottom2);
			BottomRight.addEventListener(MouseEvent.CLICK,RightBottom2);TopRight.addEventListener(MouseEvent.CLICK,RightTop2);}
		function Back322(l:int){SMCleanUp(0);MainMenu(7)};function LeftTop2(z:int){UGCleanUp(0);UnitGuide(6)}function RightTop2(z:int){UGCleanUp(0);IsMoving=true;ProfileMenu(6)}
		function LeftBottom2(pr:int){if(UGText.currentFrame==13){UGText.gotoAndStop(20)}else{UGText.gotoAndStop(UGText.currentFrame-1)}}
		function RightBottom2(pr:int){if(UGText.currentFrame==20){UGText.gotoAndStop(13)}else{UGText.gotoAndStop(UGText.currentFrame+1)}}
		function SMCleanUp(z:int){Back123.removeEventListener(MouseEvent.CLICK,Back322);TopLeft.removeEventListener(MouseEvent.CLICK,LeftTop2);
			BottomLeft.removeEventListener(MouseEvent.CLICK,LeftBottom2);BottomRight.removeEventListener(MouseEvent.CLICK,RightBottom2);
			TopRight.removeEventListener(MouseEvent.CLICK,RightTop2);}
		//Campaign Main
		function CampaignMenu(m:int){
			if(IsMoving==true){IsMoving=false;SavedData.flush();}else{MainMenuCleanup(0);};gotoAndStop(5);Back4.addEventListener(MouseEvent.CLICK, Bak4);
			IconArray = [Level1,Level1,Level2,Level3,Level4,Level5,Level6,Level7,Level8,Level9,Level10];T1.addEventListener(MouseEvent.CLICK,T1Go);
			T2.addEventListener(MouseEvent.CLICK,T2Go);
			Level1.addEventListener(MouseEvent.CLICK,L1Go);Level2.addEventListener(MouseEvent.CLICK,L2Go);Level3.addEventListener(MouseEvent.CLICK,L3Go);
			Level4.addEventListener(MouseEvent.CLICK,L4Go);Level5.addEventListener(MouseEvent.CLICK,L5Go);Level6.addEventListener(MouseEvent.CLICK,L6Go);
			Level7.addEventListener(MouseEvent.CLICK,L7Go);Level8.addEventListener(MouseEvent.CLICK,L8Go);Level9.addEventListener(MouseEvent.CLICK,L9Go);
			Level10.addEventListener(MouseEvent.CLICK,L10Go);if(SavedData.data.TutProgress>0){Level1.gotoAndStop(1);T1.gotoAndStop(2);}else{T1.gotoAndStop(1);Level1.gotoAndStop(2)};
			for(i=1;i<IconArray.length;i++){if(i>1){if(!SavedData.data.LevelProgress[i-1]){IconArray[i].gotoAndStop(2);}else{if(SavedData.data.LevelProgress[i-1]!=0){
				IconArray[i].gotoAndStop(1);}else{IconArray[i].gotoAndStop(2);}}}if(IconArray[i].currentFrame==1){
				IconArray[i].Text.Num.gotoAndStop(i);if(SavedData.data.LevelProgress[i]==0){IconArray[i].Core.gotoAndStop(5);IconArray[i].Text.gotoAndStop(5);}
				if(SavedData.data.LevelAchies[i]==0){IconArray[i].Ring.gotoAndStop(4)};for(j=1;j<5;j++){if(SavedData.data.LevelProgress[i]==j){
					IconArray[i].Core.gotoAndStop(j);IconArray[i].Text.gotoAndStop(j)};if(SavedData.data.LevelAchies[i]==j){IconArray[i].Ring.gotoAndStop(j)}}}}
			if(IconArray[3].currentFrame==1&&IconArray[4].currentFrame==2&&SavedData.data.TutProgress<2){T2.gotoAndStop(1);IconArray[3].gotoAndStop(2)}else{T2.gotoAndStop(2)}}
		function Bak4(Phone:Number){CampaignCleanup(0);MainMenu(0)};
		function CampaignCleanup(st:int){
			Back4.removeEventListener(MouseEvent.CLICK, Bak4);Level1.removeEventListener(MouseEvent.CLICK,L1Go);Level2.removeEventListener(MouseEvent.CLICK,L2Go);
			Level3.removeEventListener(MouseEvent.CLICK,L3Go);Level4.removeEventListener(MouseEvent.CLICK,L4Go);Level5.removeEventListener(MouseEvent.CLICK,L5Go);
			Level7.removeEventListener(MouseEvent.CLICK,L7Go);Level8.removeEventListener(MouseEvent.CLICK,L8Go);Level9.removeEventListener(MouseEvent.CLICK,L9Go);
			Level10.removeEventListener(MouseEvent.CLICK,L10Go)}
		function L1Go(whatever:int){LevelPreamble(1)};function L2Go(whatever:int){LevelPreamble(2)};function L3Go(whatever:int){LevelPreamble(3)};
		function L4Go(whatever:int){LevelPreamble(4)};function L5Go(whatever:int){LevelPreamble(5)};function L6Go(whatever:int){LevelPreamble(6)};
		function L7Go(whatever:int){LevelPreamble(7)};function L8Go(whatever:int){LevelPreamble(8)};function L9Go(whatever:int){LevelPreamble(9)};
		function L10Go(whatever:int){LevelPreamble(10)};function L11Go(whatever:int){LevelPreamble(11)};function L12Go(whatever:int){LevelPreamble(12)};
		function T1Go(whatever:MouseEvent){LetsGetGoing(54);}function T2Go(whatever:MouseEvent){LetsGetGoing(55)};
		//Preamble
		function LevelPreamble(LevelS:Number){CampaignCleanup(0);gotoAndStop(6);Header.gotoAndStop(LevelS);BlockText.gotoAndStop(((LevelS-1)*4)+1);
		Easy1.gotoAndStop(2);Medium1.gotoAndStop(1);Hard1.gotoAndStop(1);if(SavedData.data.LevelProgress[10]<3){Brutal1.gotoAndStop(3)}else{Brutal1.gotoAndStop(1)};
		if(LevelS==10){var TempNumx:Number=0;for(o=1;o<10;o++){TempNumx+=SavedData.data.LevelProgress[o]};
		if(TempNumx<35){Brutal1.gotoAndStop(3)};if(TempNumx<25){Hard1.gotoAndStop(3)};if(TempNumx<13){Medium1.gotoAndStop(3)}}
			Level=LevelS;Toggle1.gotoAndStop(1);AchieBox.gotoAndStop(41);if(SavedData.data.LevelProgress[Level]>0){
				AchieBox.gotoAndStop(AchieBox.currentFrame+1)};Difficulty=1;Back5.addEventListener(MouseEvent.CLICK, Bak5);Toggle1.addEventListener(MouseEvent.CLICK, Toggle);
			Easy1.addEventListener(MouseEvent.CLICK, Dc1);Medium1.addEventListener(MouseEvent.CLICK, Dc2);Hard1.addEventListener(MouseEvent.CLICK, Dc3);
			Brutal1.addEventListener(MouseEvent.CLICK, Dc4);PlayButton.addEventListener(MouseEvent.CLICK, LetsGetGoing);}
		function Dc1(l:int){Difficultyx(0)};function Dc2(l:int){Difficultyx(1)};function Dc3(l:int){Difficultyx(2)};function Dc4(l:int){Difficultyx(3)};
		function Bak5(l:int){PreambleCleanup(0);IsMoving=true;CampaignMenu(0)};
		function Toggle(a:Number){if(Toggle1.currentFrame<4){
				Toggle1.gotoAndStop(Toggle1.currentFrame+1);}else{Toggle1.gotoAndStop(1);}BlockText.gotoAndStop(((Level-1)*4) + Toggle1.currentFrame)}
		function Difficultyx(setting:int){var DcButtons:Array = new Array();DcButtons=[Easy1,Medium1,Hard1,Brutal1];
		if(setting!=Difficulty-1&&DcButtons[setting].currentFrame!=3){DcButtons[Difficulty-1].gotoAndStop(1);DcButtons[setting].gotoAndStop(2);if(setting==0){AchieBox.gotoAndStop(41);
		if(SavedData.data.LevelProgress[Level]>0){AchieBox.gotoAndStop(AchieBox.currentFrame+1)}};if(setting==3){AchieBox.gotoAndStop(43);if(SavedData.data.LevelProgress[Level]>3){
			AchieBox.gotoAndStop(AchieBox.currentFrame+1)}};if(setting==1||setting==2){AchieBox.gotoAndStop((4*(Level-1))+(setting*2)-1);
			if(SavedData.data.LevelAchies[Level]>=setting&&(SavedData.data.LevelAchies[Level]!=2||setting==2)){AchieBox.gotoAndStop(AchieBox.currentFrame+1)}};Difficulty=setting+1;}}
		function PreambleCleanup(l:int){
			Back5.removeEventListener(MouseEvent.CLICK, Bak5);Toggle1.removeEventListener(MouseEvent.CLICK, Toggle);Easy1.removeEventListener(MouseEvent.CLICK, Dc1);
			Medium1.removeEventListener(MouseEvent.CLICK, Dc2);Hard1.removeEventListener(MouseEvent.CLICK, Dc3);Brutal1.removeEventListener(MouseEvent.CLICK, Dc4);
			PlayButton.removeEventListener(MouseEvent.CLICK, LetsGetGoing);}
		function LetsGetGoing(k:int){
			if(k!=54&&k!=55){PreambleCleanup(0)};gotoAndStop(10);GameType=2;Pussy=false;
			//Levels
			if(k==54){Iron=100;IronIncome=0;Minerals=0;MineralsIncome=0;AIBuild=20;TutProgress=0;BuildingsA=[1,0,0,0,0,0,0,0,0,0];UnitsA=[0,0,0,0,0,0,0,0,0,0,0,0];
			Level=0;Difficulty=4;Skirmish(0);return;}
			if(k==55){AIBuild=30;TutProgress=20;Minerals=0;BuildingsA=[1,1,0,0,0,0,0,0,0,0];UnitsA=[1,1,1,0,1,0,0,0,0,0,0,0];Level=11;Difficulty=4;Skirmish(0);return}
			if(Level==1){eMinerals=0;eMineralsIncome=0;eIron=0;eIronIncome=0;BuildingsA=[1,1,0,0,0,0,0,0,0,0,0];UnitsA=[1,1,0,0,0,0,0,0,0,0,0,0];
			eUnitType=[-1,2,2,2,-1,-1,2,2,-1,-1];AIBuild=0;AchieTimer2.delay=120000;AchieTimer2.start();Minerals+=500;IronIncome=50};
			if(Level==2){eMinerals=0;if(Difficulty<3){IronIncome=50};if(Difficulty==3){eMineralsIncome=-5}else{if(Difficulty==4){eMineralsIncome=0}else{
			eMineralsIncome=-10}};eIron=50;eIronIncome=100;BuildingsA=[1,1,1,1,0,0,0,0,0,0,0];UnitsA=[1,1,1,0,0,0,0,0,0,0,0,0];AIBuild=2;if(Difficulty==1){AIBuildOrder=[2,2,2]
			}else{if(Difficulty==4){AIBuildOrder=[2,2,2,2,2,2,2,2,2,2,2,2]}else{AIBuildOrder=[2,2,2,2,2,2,2,2,2,2]}};eUnitType=[-1,-1,-1,-1,-1,-1,1,1,-1,-1];}
			if(Level==3){BuildingsA=[1,1,1,1,0,0,1,0,0,0,0];UnitsA=[1,1,1,0,1,0,0,0,0,0,0,0];eUnitType=[-1,-1,1,-1,-1,-1,1,1,-1,-1];IronIncome=40;MineralsIncome=40;AIBuild=3;
			if(Difficulty==1){eIronIncome=50;eMineralsIncome=-10;AIBuildOrder=[2,2,2,2,2,2];MineralsIncome=80;IronIncome=80;}
			if(Difficulty==2){eIronIncome=50;eMineralsIncome=0;AIBuildOrder=[2,2,2,2,2,2];}if(Difficulty==3){eIronIncome=70;eMineralsIncome=10;AIBuildOrder=[2,1,2,1,2,1,1,1,7];}
			if(Difficulty==4){eMineralsIncome=10;AIBuildOrder=[2,1,2,1,2,1,2,1,2,7,2,2];}};
			if(Level==4){BuildingsA=[1,1,1,1,0,0,1,0,0,0,0];UnitsA=[1,1,1,0,1,1,0,0,0,0,0,0];IronIncome=30;MineralsIncome=20;Iron=1500;Minerals=500;AIBuild=4;
			if(Difficulty==1){eIronIncome=50;eMineralsIncome=10;AIBuildOrder=[2,2,2,2,2,2];MineralsIncome=40;IronIncome=60;}
			if(Difficulty==2){eIronIncome=100;eIron=1800;eMineralsIncome=5;AIBuildOrder=[2,2,2,2,2,7,2,2,2,2];};
			if(Difficulty==3){eIronIncome=70;eIron=1800;eMinerals=1200;eMineralsIncome=10;AIBuildOrder=[2,1,2,7,2,2,2,2];}
			if(Difficulty==4){eIronIncome=70;eIron=1800;eMinerals=1500;eMineralsIncome=30;AIBuildOrder=[2,2,2,2,2,2,2,2,2,2,2,2];eTier=2;UnitType=[-1,-1,1,1,-1,-1,-1,-1,-1,-1]}}
			if(Level==5){BuildingsA=[1,1,1,1,0,0,1,0,0,0,0];UnitsA=[1,1,1,1,1,1,0,0,0,0,0,0];IronIncome=0;MineralsIncome=0;Iron=0;Minerals=5000;AIBuild=5;eMinerals=500000;
			eUnitType=[-1,-1,12,-1,-1,-1,-1,-1,-1,-1];Tier=2;UnitType=[-1,3,4,5,-1,-1,1,1,-1,-1];if(Difficulty==1){Minerals=50000};if(Difficulty==2){Minerals=6000};
			if(Difficulty==3){Minerals=3000;BossSpecial=6;};if(Difficulty==4){Minerals=0;BossSpecial=6;UnitHP[12]=5000}}
			if(Level==6){BuildingsA=[1,1,1,1,1,0,1,1,0,0,0];UnitsA=[1,1,1,1,1,1,0,0,1,0,0,0];IronIncome=100;MineralsIncome=40;Iron=4000;
			eUnitType=[1,-1,-1,-1,-1,-1,-1,1,1,-1];Tier=2;eTier=2;eMineralsIncome=00;AIBuild=6;eIron=99999;eIronIncome=5000;AIBuildOrder=[2,2,2,2,2,2,2];Minerals=2000;
			if(Difficulty==4){eTier=3;AIBuildOrder=[2,2,2,2,2,2,2,2,2,2];eMineralsIncome=30;}if(Difficulty==1){eMineralsIncome=-10}AchieTimer2.delay=120000;AchieTimer2.start();
			if(Difficulty==3){AIBuildOrder=[2,2,2,2,2,7,2,2,2,2,2,2,2,2];eMineralsIncome=10}}
			if(Level==7){BuildingsA=[1,1,1,1,1,1,1,1,0,0,0];UnitsA=[1,1,1,1,1,1,1,0,1,0,0,0];eTactics=5;eUnitType=[8,-1,-1,-1,-1,-1,1,1,1,1];UnitType=[-1,-1,-1,-1,-1,-1,1,1,-1,-1];
			Tier=2;eTier=2;eMineralsIncome=00;AIBuild=7;eIron=99999;eIronIncome=5000;AIBuildOrder=[2,2,2,2,2,2,2];Minerals=2000;Iron=4800;IronIncome=80;Tactics=1
			if(Difficulty==1){eMineralsIncome=-10;AIBuildOrder=[2,2,2,2,2,2,2];Iron+=5000;Minerals+=10000};if(Difficulty==2){eMineralsIncome=0;AIBuildOrder=[2,2,2,2,2,2]};
			if(Difficulty==3){AIBuildOrder=[2,2,2,2,2,7,2,2,2,2];eMineralsIncome=20}if(Difficulty==4){eTier=3;AIBuildOrder=[2,2,1,1,2,1,1,2,2,2,2,2];eMineralsIncome=0;}}
			if(Level==8){BossSpecial=1;Tier=3;MineralsIncome=0;Iron=0;IronIncome=0;AIBuild=8;eIron=0;eMinerals=0; BuildingsA=[0,0,0,0,0,0,0,0,0,0];
			if(Difficulty==1){eUnitType=[-1,-1,1,1,1,-1,-1,-1,-1,-1];Minerals=10000};if(Difficulty==2){eUnitType=[1,-1,1,0,1,-1,-1,-1,-1,-1];Minerals=4500};
			if(Difficulty==3){eUnitType=[-1,-1,3,4,5,-1,-1,-1,-1,-1];Minerals=2500};if(Difficulty==4){eUnitType=[-1,-1,6,6,6,-1,-1,-1,-1,-1];Minerals=4000};}
			if(Level==9){eTier=1;AIBuild=9;eIron=99999;BuildingsA=[1,1,1,1,1,1,1,1,0,0,0];eUnitType=[-1,-1,-1,-1,-1,-1,11,-1,-1,-1];IronIncome=150;
			MineralsIncome=70;Minerals=1800;Iron=1800;
			if(Difficulty>1){AIBuildOrder=[6,6,6,6,7,6,4,4,4,7];}else{AIBuildOrder=[1,1,1,1,1,1,1,1,1,1,7]};eReaper=true;eMineralsIncome=0
			if(Difficulty==1){UnitType=[-1,-1,-1,-1,-1,-1,9,-1,-1,-1];UnitsA=[1,1,1,1,1,1,1,1,1,1,0,0];Archmage=true;eMinerals=5000};
			if(Difficulty==2){UnitType=[-1,-1,-1,-1,-1,-1,9,-1,-1,-1];UnitsA=[1,1,1,1,1,1,1,1,1,1,0,0];Archmage=true;eMinerals=28000};
			if(Difficulty==3){UnitType=[-1,-1,-1,-1,-1,-1,9,-1,-1,-1];UnitsA=[1,1,1,1,1,1,1,1,1,1,0,0];Archmage=true;eMinerals=50000;
			MineralsIncome=200;eMinerals=50000;eToolsLevel=1};if(Difficulty==4){UnitType=[-1,-1,-1,-1,-1,-1,11,-1,-1,-1];UnitsA=[1,1,1,1,1,1,1,1,1,0,0,1];
			Reaper=true;MineralsIncome=150;eMinerals=50000;eBarracksLevel=-2;eToolsLevel=2};}
			if(Level==10){
				UnitType=[1,7,4,10,4,6,8,1,1,6];eUnitType=[-1,-1,-1,13,-1,-1,-1,-1,-1,-1];IronIncome=0;MineralsIncome=0;Iron=0;Minerals=(4-Difficulty)*5000;Tactics=5;eTactics=5
				AIBuild=10;Dragon=true;Tier=3;}
			//To Here
			Achievement=1;AchieArray=[1,0,0,0,0,0];Skirmish(0);}
		//Skirmish Menu
		function SkirmishMenu(m:MouseEvent){MainMenuCleanup(0);gotoAndStop(2);Difficulty1.gotoAndStop(2);
		Difficulty2.gotoAndStop(1);Difficulty3.gotoAndStop(1);
		if(SavedData.data.LevelProgress[10]<3){Difficulty4.gotoAndStop(3)}else{Difficulty4.gotoAndStop(1)};Difficulty=1;Difficulty1.addEventListener(MouseEvent.CLICK,Df1);
		Difficulty2.addEventListener(MouseEvent.CLICK,Df2);PlaySkirmish.addEventListener(MouseEvent.CLICK,SS);Difficulty=1;
			Difficulty3.addEventListener(MouseEvent.CLICK,Df3);Difficulty4.addEventListener(MouseEvent.CLICK,Df4);Back2.addEventListener(MouseEvent.CLICK,BackS)}
		function Df1(t:int){SDx(0)};function Df2(t:int){SDx(1)};function Df3(t:int){SDx(2)};function Df4(t:int){SDx(3)};
		function BackS(l:int){SkirmishCleanup(0);gotoAndStop(1);MainMenu(0);};
		function SkirmishCleanup(p:int){Difficulty1.removeEventListener(MouseEvent.CLICK, Df1);
		Difficulty2.removeEventListener(MouseEvent.CLICK, Df2);Difficulty3.removeEventListener(MouseEvent.CLICK, Df3);Difficulty4.removeEventListener(MouseEvent.CLICK, Df4);}
		function SDx(DC:int){var DcButtons:Array = new Array();DcButtons=[Difficulty1,Difficulty2,Difficulty3,Difficulty4];
			if(DC!=Difficulty-1&&(DC!=3||SavedData.data.LevelProgress[10]>2)){DcButtons[Difficulty-1].gotoAndStop(1);DcButtons[DC].gotoAndStop(2);Difficulty=DC+1;};}
		function SS(d:int){SkirmishCleanup(0);gotoAndStop(10);GameType=1;Level=999;Skirmish(0)}
		
		//Main Loop
		//Opening
		function Skirmish(word:int){
			//AI Tactics
			if(AIBuild==-1){
			AIBuild = (Math.floor(Math.random()*3));
			if(AIBuild==0){AIBuildOrder = [1,1,1,1,1,1,3,1,1,1,2,2,2,7,1,1,3,1,1,3,1,1,3,1,3,1,1,1,1,1,1,1,2,6,1,1,1,2,1,1,1,5,1,1,1,2,4,1,1,1,2,6,2,7,1,1,1,2,5,4,6,5,4,6,5,4,6,5,4,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,8,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2];};
			if(AIBuild==1){AIBuildOrder = [1,1,1,1,1,1,1,1,1,7,3,1,3,2,2,1,1,1,1,1,1,1,1,1,2,2,2,2,7,3,1,3,1,3,1,1,1,6,6,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,9,6,4,2,2,2,6,4,2,2,2,2,6,4,2,2,2,4,2,2,2,5,2,2,2,4,2,2,2,5,2,2,2,5,2,2,2,5,2,2,2,5,2,2,2,2,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2];};
			if(AIBuild==2){AIBuildOrder = [2,2,1,1,1,1,1,1,1,1,1,2,2,2,2,7,1,1,6,1,1,4,1,1,6,1,1,5,1,1,6,1,1,4,1,6,6,1,2,2,2,2,2,2,7,4,4,4,5,5,5,5,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2];};}
			//Timers
			for(i = 0 ; i < 10 ; i++){AttackTimer = new Timer(100);eAttackTimer = new Timer(100);AutoAttacks.push(AttackTimer);eAutoAttacks.push(eAttackTimer);
			eSpecialTimer = new Timer(100,1);SpecialTimer = new Timer(100,1);SpecialAttacks.push(SpecialTimer);eSpecialAttacks.push(eSpecialTimer);}
			//Fixing Arrays
			UnitArray = [UnitF0,UnitF1,UnitF2,UnitF3,UnitF4,UnitF5,UnitF6,UnitF7,UnitF8,UnitF9];
			eUnitArray = [UnitE0,UnitE1,UnitE2,UnitE3,UnitE4,UnitE5,UnitE6,UnitE7,UnitE8,UnitE9];
			HPBar = [HPBar0,HPBar1,HPBar2,HPBar3,HPBar4,HPBar5,HPBar6,HPBar7,HPBar8,HPBar9];
			AABar = [AutoBar0,AutoBar1,AutoBar2,AutoBar3,AutoBar4,AutoBar5,AutoBar6,AutoBar7,AutoBar8,AutoBar9];
			SpecBar = [SpecialPower0,SpecialPower1,SpecialPower2,SpecialPower3,SpecialPower4,SpecialPower5,SpecialPower6,SpecialPower7,SpecialPower8,SpecialPower9];
			eHPBar = [eHPBar0,eHPBar1,eHPBar2,eHPBar3,eHPBar4,eHPBar5,eHPBar6,eHPBar7,eHPBar8,eHPBar9];
			eAABar = [eAutoBar0,eAutoBar1,eAutoBar2,eAutoBar3,eAutoBar4,eAutoBar5,eAutoBar6,eAutoBar7,eAutoBar8,eAutoBar9];
			eSpecBar = [eSpecialPower0,eSpecialPower1,eSpecialPower2,eSpecialPower3,eSpecialPower4,eSpecialPower5,eSpecialPower6,eSpecialPower7,eSpecialPower8,eSpecialPower9];
        	ResourceTimer.start();for (i = 0; i < 10 ; i++){UnitArray[i].gotoAndStop(1);eUnitArray[i].gotoAndStop(1);}MenuButton.gotoAndStop(1)
			for(i=0;i<10;i++){if(eUnitType[i]!=-1){eHP[i]=UnitHP[eUnitType[i]]*(1+(0.1*eShieldLevel));eUnitArray[i].gotoAndStop((eUnitType[i]+1)*10);
			if(eUnitType[i]==2&&(Level!=1||Difficulty!=1)){eAutoAttacks[i].delay=2000;eAutoAttackMax[i]=eAutoAttacks[i].delay;eAutoAttackCurrent[i]=0;eAutoAttacks[i].start();}}}
			for(i=0;i<10;i++){if(UnitType[i]!=-1){HP[i]=UnitHP[UnitType[i]]*(1+(0.1*ShieldLevel));UnitArray[i].gotoAndStop((UnitType[i]+1)*10);
			if(UnitType[i]==2){AutoAttacks[i].delay=2000;AutoAttackMax[i]=AutoAttacks[i].delay;AutoAttackCurrent[i]=0;AutoAttacks[i].start();}}}
			//Texts
			Formatz.size = 14;Formaty.size = 8;Formatz.font = myFont.fontName;Formaty.font = myFont.fontName;IronBox.width = 250;MineralsBox.width = 320;Timed.width = 400
			IronBox.defaultTextFormat = Formatz;MineralsBox.defaultTextFormat = Formatz;Timed.defaultTextFormat = Formatz;
			IronBox.embedFonts = true;Timed.embedFonts = true;MineralsBox.embedFonts = true;
			MineralsBox.antiAliasType = AntiAliasType.ADVANCED;IronBox.antiAliasType = AntiAliasType.ADVANCED;Timed.antiAliasType = AntiAliasType.ADVANCED;
       		IronBox.text = "Iron: " + Iron + " (" + IronIncome + ")";MineralsBox.text = "Gold: " + Minerals + " (" + MineralsIncome + ")";addChild(IronBox);addChild(Timed);
			IronBox.textColor = 0xFFFFFF;IronBox.x = 40;IronBox.y = 30;Timed.textColor = 0xFFFFFF;Timed.x = 220;Timed.y = 560;addChild(MineralsBox);
			MineralsBox.textColor = 0xFFFFFF;MineralsBox.x = 520;MineralsBox.y = 30;
			IronBox.visible = true;MineralsBox.visible = true;Timed.visible = true;
			//Cells
			CellArray = [F0,F1,F2,F3,F4,F5,F6,F7,F8,F9];eCellArray = [E0,E1,E2,E3,E4,E5,E6,E7,E8,E9];
			if(Tactics<2){F4.gotoAndStop(2)};if(Tactics<4){F5.gotoAndStop(2);};if(Tactics<1){F8.gotoAndStop(2)};if(Tactics<3){F9.gotoAndStop(2);}if(Tactics<5){F0.gotoAndStop(2)};
			if(eTactics<2){E4.gotoAndStop(2);}if(eTactics<4){E5.gotoAndStop(2)};if(eTactics<1){E8.gotoAndStop(2);};if(eTactics<3){E9.gotoAndStop(2)};if(eTactics<5){E0.gotoAndStop(2);}
			if(Level==4){F4.gotoAndStop(1);F5.gotoAndStop(1);E5.gotoAndStop(1);E4.gotoAndStop(1);F6.gotoAndStop(2);F7.gotoAndStop(2);E6.gotoAndStop(2);E7.gotoAndStop(2)};
			if(Level==5&&BossSpecial!=-1&&Difficulty>2){CellArray[BossSpecial].gotoAndStop(3)};if(Level==6){E0.gotoAndStop(1);E8.gotoAndStop(1);E9.gotoAndStop(1);
			E1.gotoAndStop(2);E2.gotoAndStop(2);E3.gotoAndStop(2);F1.gotoAndStop(2);F6.gotoAndStop(2);F8.gotoAndStop(1);F4.gotoAndStop(1);}
			if(Level==8){E0.gotoAndStop(1);E4.gotoAndStop(1);E5.gotoAndStop(1);E6.gotoAndStop(2);E7.gotoAndStop(2);
			F0.gotoAndStop(1);F4.gotoAndStop(1);F5.gotoAndStop(1);F6.gotoAndStop(2);F7.gotoAndStop(2);}	
			if(Level==0&&TutProgress<4){MenuButton.Train.gotoAndStop(2)}else{MenuButton.Train.gotoAndStop(1)};ToolTip.gotoAndStop(24);
			//Listeners
			if(SavedData.data.Sounds==1){MusicChannel.removeEventListener(Event.SOUND_COMPLETE,NextSong);MusicChannel.stop();
			PickSong2(0);MusicChannel.addEventListener(Event.SOUND_COMPLETE,BattleSong);}
			stage.addEventListener(KeyboardEvent.KEY_DOWN, ForeheadMeetsKeyboard);stage.addEventListener(Event.ENTER_FRAME, ExplosionOfAwesome);
			ResourceTimer.addEventListener(TimerEvent.TIMER, ResourceCheck);
			BuildTimer.addEventListener(TimerEvent.TIMER, BuildFinished);eBuildTimer.addEventListener(TimerEvent.TIMER, eBuildFinished);
			TrainTimer.addEventListener(TimerEvent.TIMER, TrainFinished);eTrainTimer.addEventListener(TimerEvent.TIMER, eTrainFinished);
			eAutoAttacks[0].addEventListener(TimerEvent.TIMER,eAttackReady0);eAutoAttacks[1].addEventListener(TimerEvent.TIMER,eAttackReady1);
	    	eAutoAttacks[2].addEventListener(TimerEvent.TIMER,eAttackReady2);eAutoAttacks[3].addEventListener(TimerEvent.TIMER,eAttackReady3);
			eAutoAttacks[4].addEventListener(TimerEvent.TIMER,eAttackReady4);eAutoAttacks[5].addEventListener(TimerEvent.TIMER,eAttackReady5);
			eAutoAttacks[6].addEventListener(TimerEvent.TIMER,eAttackReady6);eAutoAttacks[7].addEventListener(TimerEvent.TIMER,eAttackReady7);
			eAutoAttacks[8].addEventListener(TimerEvent.TIMER,eAttackReady8);eAutoAttacks[9].addEventListener(TimerEvent.TIMER,eAttackReady9);
			AutoAttacks[0].addEventListener(TimerEvent.TIMER,AttackReady0);AutoAttacks[1].addEventListener(TimerEvent.TIMER,AttackReady1);
	    	AutoAttacks[2].addEventListener(TimerEvent.TIMER,AttackReady2);AutoAttacks[3].addEventListener(TimerEvent.TIMER,AttackReady3);
			AutoAttacks[4].addEventListener(TimerEvent.TIMER,AttackReady4);AutoAttacks[5].addEventListener(TimerEvent.TIMER,AttackReady5);
			AutoAttacks[6].addEventListener(TimerEvent.TIMER,AttackReady6);AutoAttacks[7].addEventListener(TimerEvent.TIMER,AttackReady7);
			AutoAttacks[8].addEventListener(TimerEvent.TIMER,AttackReady8);AutoAttacks[9].addEventListener(TimerEvent.TIMER,AttackReady9);
			UnitArray[0].addEventListener(MouseEvent.CLICK,ClickF0);UnitArray[1].addEventListener(MouseEvent.CLICK,ClickF1);
			UnitArray[2].addEventListener(MouseEvent.CLICK,ClickF2);UnitArray[3].addEventListener(MouseEvent.CLICK,ClickF3);
			UnitArray[4].addEventListener(MouseEvent.CLICK,ClickF4);UnitArray[5].addEventListener(MouseEvent.CLICK,ClickF5);
			UnitArray[6].addEventListener(MouseEvent.CLICK,ClickF6);UnitArray[7].addEventListener(MouseEvent.CLICK,ClickF7);
			UnitArray[8].addEventListener(MouseEvent.CLICK,ClickF8);UnitArray[9].addEventListener(MouseEvent.CLICK,ClickF9);
			BrokenCircle.addEventListener(MouseEvent.CLICK,Disselect);
			eUnitArray[0].addEventListener(MouseEvent.CLICK,ClickE0);eUnitArray[1].addEventListener(MouseEvent.CLICK,ClickE1);
			eUnitArray[2].addEventListener(MouseEvent.CLICK,ClickE2);eUnitArray[3].addEventListener(MouseEvent.CLICK,ClickE3);
			eUnitArray[4].addEventListener(MouseEvent.CLICK,ClickE4);eUnitArray[5].addEventListener(MouseEvent.CLICK,ClickE5);
			eUnitArray[6].addEventListener(MouseEvent.CLICK,ClickE6);eUnitArray[7].addEventListener(MouseEvent.CLICK,ClickE7);
			eUnitArray[8].addEventListener(MouseEvent.CLICK,ClickE8);eUnitArray[9].addEventListener(MouseEvent.CLICK,ClickE9);
			eCellArray[0].addEventListener(MouseEvent.CLICK,ClickE0);eCellArray[1].addEventListener(MouseEvent.CLICK,ClickE1);
			eCellArray[2].addEventListener(MouseEvent.CLICK,ClickE2);eCellArray[3].addEventListener(MouseEvent.CLICK,ClickE3);
			eCellArray[4].addEventListener(MouseEvent.CLICK,ClickE4);eCellArray[5].addEventListener(MouseEvent.CLICK,ClickE5);
			eCellArray[6].addEventListener(MouseEvent.CLICK,ClickE6);eCellArray[7].addEventListener(MouseEvent.CLICK,ClickE7);
			eCellArray[8].addEventListener(MouseEvent.CLICK,ClickE8);eCellArray[9].addEventListener(MouseEvent.CLICK,ClickE9);
			CellArray[0].addEventListener(MouseEvent.CLICK,ClickC0);CellArray[1].addEventListener(MouseEvent.CLICK,ClickC1);
			CellArray[2].addEventListener(MouseEvent.CLICK,ClickC2);CellArray[3].addEventListener(MouseEvent.CLICK,ClickC3);
			CellArray[4].addEventListener(MouseEvent.CLICK,ClickC4);CellArray[5].addEventListener(MouseEvent.CLICK,ClickC5);
			CellArray[6].addEventListener(MouseEvent.CLICK,ClickC6);CellArray[7].addEventListener(MouseEvent.CLICK,ClickC7);
			CellArray[8].addEventListener(MouseEvent.CLICK,ClickC8);CellArray[9].addEventListener(MouseEvent.CLICK,ClickC9);
			MenuButton.Build.addEventListener(MouseEvent.CLICK,BuildClick);MenuButton.Train.addEventListener(MouseEvent.CLICK,TrainClick)
			MenuButton.BG.addEventListener(MouseEvent.MOUSE_OVER,TTReset);BrokenCircle.addEventListener(MouseEvent.MOUSE_OVER,TTReset);
			//AutoBuild
			if(SavedData.data.Auto==1){
				if(IronIncome<=MineralsIncome+5&&Iron>100){BuildOrder=1;Iron-=100}else{if(Iron>50&&BuildingsA[2]==1){BuildOrder=2;Iron-=50}}
			BuildTimer.delay=5000*(1-(0.1*ToolsLevel));SpecialProgress[10]=0;BuildTimer.start();}}
		//AttackReady Functions
			function AttackReady0(event:TimerEvent):void{ Attack(0) }
			function AttackReady1(event:TimerEvent):void{ Attack(1)	}
			function AttackReady2(event:TimerEvent):void{ Attack(2) }
			function AttackReady3(event:TimerEvent):void{ Attack(3)	}
			function AttackReady4(event:TimerEvent):void{ Attack(4)	}
			function AttackReady5(event:TimerEvent):void{ Attack(5)	}
			function AttackReady6(event:TimerEvent):void{ Attack(6) }
			function AttackReady7(event:TimerEvent):void{ Attack(7)	}
			function AttackReady8(event:TimerEvent):void{ Attack(8)	}
			function AttackReady9(event:TimerEvent):void{ Attack(9)	}
			function eAttackReady0(event:TimerEvent):void{ eAttack(0) }
			function eAttackReady1(event:TimerEvent):void{ eAttack(1) }
			function eAttackReady2(event:TimerEvent):void{ eAttack(2) }
			function eAttackReady3(event:TimerEvent):void{ eAttack(3) }
			function eAttackReady4(event:TimerEvent):void{ eAttack(4) }
			function eAttackReady5(event:TimerEvent):void{ eAttack(5) }
			function eAttackReady6(event:TimerEvent):void{ eAttack(6) }
			function eAttackReady7(event:TimerEvent):void{ eAttack(7) }
			function eAttackReady8(event:TimerEvent):void{ eAttack(8) }
			function eAttackReady9(event:TimerEvent):void{ eAttack(9) }
		//Music
		function BattleSong(m:int){MusicChannel.removeEventListener(Event.SOUND_COMPLETE,BattleSong);PickSong2(0);MusicChannel.addEventListener(Event.SOUND_COMPLETE,BattleSong)}
		function PickSong2(z:int){
			//var SongArray = new Array(BattleTrack1,BattleTrack2,BattleTrack3);MusicChannel = SongArray[int(Math.random()*3)].play();
			MusicChannel = MenuTrack1.play()}
		//Attack+Special
		function Attack(AttackingUnit:int){
			AutoAttackCurrent[AttackingUnit] = 0
		if(UnitTarget[AttackingUnit] == 10){
		//Decommission
			if(UnitType[AttackingUnit] == -3){Minerals += 450;};
				HP[AttackingUnit] = -1;
				UnitTarget[AttackingUnit] = -1;
			} else {
			if(UnitTarget[AttackingUnit] == -1 || (eUnitType[UnitTarget[AttackingUnit]] == -1 && UnitType[AttackingUnit] != 1) || (UnitType[UnitTarget[AttackingUnit]] == -1 && UnitType[AttackingUnit] == 1)){
				//CancelAttack
				if(UnitType[AttackingUnit] == 2){
					Minerals+=10; Iron+=10;
					if (HP[AttackingUnit] < (UnitHP[UnitType[AttackingUnit]] * (1 + (0.1 * ShieldLevel)))){ HP[AttackingUnit] += 10; };
					if (HP[AttackingUnit] > (UnitHP[UnitType[AttackingUnit]] * (1 + (0.1 * ShieldLevel)))){HP[AttackingUnit] = UnitHP[UnitType[AttackingUnit]]};
				} else{
				   AutoAttacks[AttackingUnit].stop();
				   if(UnitType[AttackingUnit] == 3 && AutoAttacks[AttackingUnit].delay < 2000){
					   AutoAttacks[AttackingUnit].delay = 3000;
					   AutoAttackMax[AttackingUnit] = 3000
					   AutoAttackCurrent[AttackingUnit] = 0
					   AutoAttacks[AttackingUnit].start()}}
			} else {
			//Main attack script
			var DamageCalc:Number = 0;
				//Marine
				if(UnitType[AttackingUnit] == 0){
					DamageCalc = 4
					if(AttackingUnit < 6 && AttackingUnit > 0){
						for(i = 1 ; i < 6 ; i++){
						if(UnitType[i] == 0){DamageCalc++};
						}}
					if(AttackingUnit > 5){
						for(i = 5 ; i < 10 ; i++){
						if(UnitType[i] == 0){DamageCalc++};
						}}
					if(AttackingUnit == 0){DamageCalc++}
					if(eUnitDebuff[UnitTarget[AttackingUnit]]==2||eUnitDebuff[UnitTarget[AttackingUnit]]==3){DamageCalc*=2};
					if(eUnitType[UnitTarget[AttackingUnit]]==8&&UnitTarget[AttackingUnit]>5){DamageCalc/=2};
					eHP[UnitTarget[AttackingUnit]] -= DamageCalc;
					if(AttackingUnit==Reaped){HP[AttackingUnit]+=DamageCalc}}
				//Shaman
				if(UnitType[AttackingUnit] == 1){
					if(AutoAttacks[AttackingUnit].delay == 1800){
						DamageCalc = 65;
						if(UnitType[UnitTarget[AttackingUnit]] == 1){DamageCalc *=2}
						if(UnitDebuff[UnitTarget[AttackingUnit]] / 2 != int(UnitDebuff[UnitTarget[AttackingUnit]] / 2)){DamageCalc/=2}
						if(UnitType[UnitTarget[AttackingUnit]] == 7){DamageCalc = 0}
						AutoAttacks[AttackingUnit].delay = 4200;
						if(UnitTarget[AttackingUnit] == eDarkFlamed){DamageCalc=0}
						if(UnitTarget[AttackingUnit] == eDarkFlamed && eDarkFlameTimer==0){DamageCalc=-40;eDarkFlameTimer=1000;}
						HP[UnitTarget[AttackingUnit]] += DamageCalc;
						if (HP[UnitTarget[AttackingUnit]] > (UnitHP[UnitType[UnitTarget[AttackingUnit]]] * (1 + (0.1 * ShieldLevel)))){
							   HP[UnitTarget[AttackingUnit]] = (UnitHP[UnitType[UnitTarget[AttackingUnit]]] * (1 + (0.1 * ShieldLevel))); }
					    AutoAttackMax[AttackingUnit] = 4200;
						if(HP[AttackingUnit]>UnitHP[UnitType[AttackingUnit]] * (1 + (0.1 * ShieldLevel))){HP[AttackingUnit] = UnitHP[UnitType[AttackingUnit]] * (1 + (0.1 * ShieldLevel))}
						return;}
					if(AutoAttacks[AttackingUnit].delay == 4200){
						AutoAttacks[AttackingUnit].delay = 1800;
						AutoAttackMax[AttackingUnit] = -1800;}};
				//Machinegunner
				if(UnitType[AttackingUnit] == 3){
					if(AutoAttacks[AttackingUnit].delay < 3000){
					DamageCalc = 8;
					if(eUnitDebuff[UnitTarget[AttackingUnit]]==2 || eUnitDebuff[UnitTarget[AttackingUnit]]==3){DamageCalc*=2};
					if(AttackingUnit > 0 && AttackingUnit < 6){DamageCalc *= 1.5};
					if(SpecialEffect[AttackingUnit] == 1){DamageCalc *= 1.5};
					if(eUnitType[UnitTarget[AttackingUnit]]==8&&UnitTarget[AttackingUnit]>5){DamageCalc/=2};
					eHP[UnitTarget[AttackingUnit]] -= DamageCalc;
					if(AttackingUnit==Reaped){HP[AttackingUnit]+=DamageCalc}
					if(AutoAttacks[AttackingUnit].delay == 503){AutoAttacks[AttackingUnit].delay = 3000; AutoAttackMax[AttackingUnit] = AutoAttacks[AttackingUnit].delay;} else { 
					AutoAttacks[AttackingUnit].delay += 1; AutoAttackMax[AttackingUnit] = -AutoAttacks[AttackingUnit].delay; };
					AutoAttacks[AttackingUnit].start()
					} else {AutoAttacks[AttackingUnit].delay = 500; AutoAttackMax[AttackingUnit] = -500; return;}}
				//Ogre
				if(UnitType[AttackingUnit] == 4){
					DamageCalc = 50;
					if(eUnitType[UnitTarget[AttackingUnit]]==8&&UnitTarget[AttackingUnit]>5){DamageCalc/=2};
					if(eUnitDebuff[UnitTarget[AttackingUnit]]==2 || eUnitDebuff[UnitTarget[AttackingUnit]]==3){DamageCalc*=2};
					if(eUnitType[UnitTarget[AttackingUnit]]==5){eHP[UnitTarget[AttackingUnit]] -= 20; if(AttackingUnit==Reaped){HP[AttackingUnit]+=20}} else {
					eHP[UnitTarget[AttackingUnit]] -= DamageCalc; if(AttackingUnit==Reaped){HP[AttackingUnit]+=DamageCalc}}}
				//Hunter
				if(UnitType[AttackingUnit] == 5){
					DamageCalc = (UnitHP[eUnitType[UnitTarget[AttackingUnit]]] / 4)
					if(eUnitType[UnitTarget[AttackingUnit]]>=12){DamageCalc=50};
					eHP[UnitTarget[AttackingUnit]] -= DamageCalc;
					if(AttackingUnit==Reaped){HP[AttackingUnit]+=DamageCalc}
					if(HP[AttackingUnit]>UnitHP[UnitType[AttackingUnit]]*(1+(0.1*ShieldLevel))){HP[AttackingUnit]=UnitHP[UnitType[AttackingUnit]]*(1+(0.1*ShieldLevel))}}
				//BattleMage
				if(UnitType[AttackingUnit] == 6){
					if(AutoAttacks[AttackingUnit].delay == 1001){
						DamageCalc = 20;
						if(eUnitType[UnitTarget[AttackingUnit]]==8&&UnitTarget[AttackingUnit]>5){DamageCalc/=2};
						if((eUnitDebuff[UnitTarget[AttackingUnit]]==2 || eUnitDebuff[UnitTarget[AttackingUnit]]==3)){DamageCalc*=2};
						AutoAttacks[AttackingUnit].delay = 1000;
						if(eUnitType[UnitTarget[AttackingUnit]]==5){eHP[UnitTarget[AttackingUnit]] -= 20;if(AttackingUnit==Reaped){HP[AttackingUnit]+=20}}else{
						eHP[UnitTarget[AttackingUnit]] -= DamageCalc;if(AttackingUnit==Reaped){HP[AttackingUnit]+=DamageCalc}}
					    AutoAttackMax[AttackingUnit] = 1000;
						if(HP[AttackingUnit]>UnitHP[UnitType[AttackingUnit]] * (1 + (0.1 * ShieldLevel))){HP[AttackingUnit] = UnitHP[UnitType[AttackingUnit]] * (1 + (0.1 * ShieldLevel))};
						return;}
					if(AutoAttacks[AttackingUnit].delay == 1000){
						AutoAttacks[AttackingUnit].delay = 1001;
						AutoAttackMax[AttackingUnit] = -1001;}};
				//Giant
				if(UnitType[AttackingUnit] == 7){
					DamageCalc = 75;
					if(eUnitType[UnitTarget[AttackingUnit]]==8&&UnitTarget[AttackingUnit]>5){DamageCalc/=2};
					if(eUnitDebuff[UnitTarget[AttackingUnit]]==2 || eUnitDebuff[UnitTarget[AttackingUnit]]==3){DamageCalc*=2};
					if(eUnitType[UnitTarget[AttackingUnit]]==5){eHP[UnitTarget[AttackingUnit]] -= 20;if(AttackingUnit==Reaped){HP[AttackingUnit]+=20}} else {
						eHP[UnitTarget[AttackingUnit]] -= DamageCalc;if(AttackingUnit==Reaped){HP[AttackingUnit]+=DamageCalc}}
					if(eAutoAttackMax[UnitTarget[AttackingUnit]]<0){
						if(eUnitType[UnitTarget[AttackingUnit]]==1){eAutoAttacks[UnitTarget[AttackingUnit]].delay=4200}
						if(eUnitType[UnitTarget[AttackingUnit]]==3){eAutoAttacks[UnitTarget[AttackingUnit]].delay=3000}
						if(eUnitType[UnitTarget[AttackingUnit]]==6){eAutoAttacks[UnitTarget[AttackingUnit]].delay=1000}
						if(eUnitType[UnitTarget[AttackingUnit]]==10){eAutoAttacks[UnitTarget[AttackingUnit]].delay=1001}
						if(eUnitType[UnitTarget[AttackingUnit]]==11 && eAutoAttacks[UnitTarget[AttackingUnit]].delay < 1006){eAutoAttacks[UnitTarget[AttackingUnit]].delay = 5000}
						if(eUnitType[UnitTarget[AttackingUnit]]==13){eAutoAttacks[UnitTarget[AttackingUnit]].delay=1015;eUnitTarget[UnitTarget[AttackingUnit]]=-1}
						eAutoAttackMax[UnitTarget[AttackingUnit]]=eAutoAttacks[UnitTarget[AttackingUnit]].delay
						eAutoAttackCurrent[UnitTarget[AttackingUnit]]=0
						eAutoAttacks[UnitTarget[AttackingUnit]].start()}}
				//Sniper
				if(UnitType[AttackingUnit] == 8){
					DamageCalc = 60;
					if(eUnitType[UnitTarget[AttackingUnit]]==8&&UnitTarget[AttackingUnit]>5){DamageCalc/=2};
					if(eUnitDebuff[UnitTarget[AttackingUnit]]==2 || eUnitDebuff[UnitTarget[AttackingUnit]]==3){DamageCalc*=2;};
					if(eUnitType[UnitTarget[AttackingUnit]]==5){eHP[UnitTarget[AttackingUnit]] -= 20;if(AttackingUnit==Reaped){HP[AttackingUnit]+=20}} else {
					eHP[UnitTarget[AttackingUnit]] -= DamageCalc;if(AttackingUnit==Reaped){HP[AttackingUnit]+=DamageCalc}}
					SpecialAttacks[AttackingUnit].delay = 3000;AutoAttacks[AttackingUnit].delay = 6000;
					SpecialProgress[AttackingUnit] = 0;AutoAttackMax[AttackingUnit]=6000;
					SpecialAttacks[AttackingUnit].start();}
				//Archmage
				if(UnitType[AttackingUnit] == 9){
					DamageCalc = 50;
					if(eUnitType[UnitTarget[AttackingUnit]]==8&&UnitTarget[AttackingUnit]>5){DamageCalc/=2};
					if(eUnitDebuff[UnitTarget[AttackingUnit]]==2 || eUnitDebuff[UnitTarget[AttackingUnit]]==3){DamageCalc*=2};
					if(eUnitType[UnitTarget[AttackingUnit]]==5){eHP[UnitTarget[AttackingUnit]] -= 20;if(AttackingUnit==Reaped){HP[AttackingUnit]+=20}} else {
						eHP[UnitTarget[AttackingUnit]] -= DamageCalc;if(AttackingUnit==Reaped){HP[AttackingUnit]+=DamageCalc}}
					if(eAutoAttackMax[UnitTarget[AttackingUnit]]<0){
						if(eUnitType[UnitTarget[AttackingUnit]]==1){eAutoAttacks[UnitTarget[AttackingUnit]].delay=4200}
						if(eUnitType[UnitTarget[AttackingUnit]]==3){eAutoAttacks[UnitTarget[AttackingUnit]].delay=3000}
						if(eUnitType[UnitTarget[AttackingUnit]]==6){eAutoAttacks[UnitTarget[AttackingUnit]].delay=1000}
						if(eUnitType[UnitTarget[AttackingUnit]]==10){eAutoAttacks[UnitTarget[AttackingUnit]].delay=1001}
						if(eUnitType[UnitTarget[AttackingUnit]]==11 && eAutoAttacks[UnitTarget[AttackingUnit]].delay < 1006){eAutoAttacks[UnitTarget[AttackingUnit]].delay = (eAutoAttacks[UnitTarget[AttackingUnit]].delay-1000) * 1000}
						eAutoAttackMax[UnitTarget[AttackingUnit]]=eAutoAttacks[UnitTarget[AttackingUnit]].delay
						eAutoAttackCurrent[UnitTarget[AttackingUnit]]=0
						eAutoAttacks[UnitTarget[AttackingUnit]].start()}}
				//Dragon
				if(UnitType[AttackingUnit] == 10){
					if(AutoAttacks[AttackingUnit].delay == 999 || AutoAttacks[AttackingUnit].delay == 1000){
						DamageCalc = 30;
						if(eUnitType[UnitTarget[AttackingUnit]]==8&&UnitTarget[AttackingUnit]>5){DamageCalc/=2};
						if(eUnitDebuff[UnitTarget[AttackingUnit]]==2 || eUnitDebuff[UnitTarget[AttackingUnit]]==3){DamageCalc*=2};
						AutoAttacks[AttackingUnit].delay += 1;
					if(eUnitType[UnitTarget[AttackingUnit]]==5){eHP[UnitTarget[AttackingUnit]] -= 20;if(AttackingUnit==Reaped){HP[AttackingUnit]+=20}} else {
						eHP[UnitTarget[AttackingUnit]] -= DamageCalc;if(AttackingUnit==Reaped){HP[AttackingUnit]+=DamageCalc}};
					for(i=0;i<10;i++){if(eUnitType[i] != -1){eHP[i] -= 1.5}};
					if(AutoAttacks[AttackingUnit].delay == 1000){AutoAttackMax[AttackingUnit] = -AutoAttacks[AttackingUnit].delay;} else {AutoAttackMax[AttackingUnit] = AutoAttacks[AttackingUnit].delay;}
					if(HP[AttackingUnit]>UnitHP[UnitType[AttackingUnit]] * (1 + (0.1 * ShieldLevel))){HP[AttackingUnit] = UnitHP[UnitType[AttackingUnit]] * (1 + (0.1 * ShieldLevel))};
					return;}
					if(AutoAttacks[AttackingUnit].delay == 1001){
						AutoAttacks[AttackingUnit].delay = 999;
						AutoAttackMax[AttackingUnit] = -999;}};
				//REAPER
				if(UnitType[AttackingUnit] == 11){
					AutoAttacks[AttackingUnit].delay -=1;
					if(AutoAttacks[AttackingUnit].delay == 1000){AutoAttacks[AttackingUnit].delay = 1005};
					AutoAttackMax[AttackingUnit] = -AutoAttacks[AttackingUnit].delay
					DamageCalc = (UnitHP[eUnitType[UnitTarget[AttackingUnit]]] *0.15);
					if(AutoAttacks[AttackingUnit].delay > 1005){AutoAttacks[AttackingUnit].delay = 1005}else{
						eHP[UnitTarget[AttackingUnit]] -= DamageCalc;if(AttackingUnit==Reaped){HP[AttackingUnit]+=DamageCalc}}}
				//HP Check and Closing Brackets
				if(HP[AttackingUnit]>UnitHP[UnitType[AttackingUnit]] * (1 + (0.1 * ShieldLevel))){HP[AttackingUnit] = UnitHP[UnitType[AttackingUnit]] * (1 + (0.1 * ShieldLevel))};
			}}}
		function SpecialAttack(TargetUnit:int){
			SpecialActive = false;Remove1(MenuButton.currentFrame);
			SpecialAttacks[UnitSelected].delay = UnitSpec[UnitType[UnitSelected]];SpecialProgress[UnitSelected] = 0;SpecialAttacks[UnitSelected].start();
			//Marine/Shaman/Drone
		    if(UnitType[UnitSelected] == 0){
				var TargetsHit:Array = new Array();
				if(TargetUnit == 1){TargetsHit = [1,2,6,-1,-1,-1];}
				if(TargetUnit == 2){TargetsHit = [2,1,3,6,7,-1];}
				if(TargetUnit == 3){TargetsHit = [3,2,4,7,8,-1];}
				if(TargetUnit == 4){TargetsHit = [4,3,5,8,9,-1];}
				if(TargetUnit == 5){TargetsHit = [5,4,9,-1,-1,-1];}
				if(TargetUnit == 6){TargetsHit = [6,1,2,7,-1,-1];}
				if(TargetUnit == 7){TargetsHit = [7,2,3,6,8,0];}
				if(TargetUnit == 8){TargetsHit = [8,3,4,7,9,0];}
				if(TargetUnit == 9){TargetsHit = [9,4,5,8,-1,-1];}
				if(TargetUnit == 0){TargetsHit = [0,7,8,-1,-1,-1];}
				for(i = 0; i < 7; i++){if(TargetsHit[i] > -1){if(eUnitType[TargetsHit[i]] > -1 && eUnitType[TargetsHit[i]] < 11){
					if(eUnitDebuff[TargetsHit[i]]==2 || eUnitDebuff[TargetsHit[i]]==3){eHP[TargetsHit[i]]-= 15;}else{ eHP[TargetsHit[i]]-=10;};};};};};
			if(UnitType[UnitSelected] == 1){ for(i = 0 ; i < 10 ; i++){ if(UnitType[i] != -1&& UnitType[i]!=7){
				var DamageCalc:Number=12;if(UnitType[i] == 1){DamageCalc*=1.5};if(UnitDebuff[i]/2!= int(UnitDebuff[i]/2)){DamageCalc/=2};
				if(i == eDarkFlamed){DamageCalc=0};if(i == eDarkFlamed && eDarkFlameTimer==0){DamageCalc=-40;eDarkFlameTimer=1000;}; HP[i]+=DamageCalc;
				if (HP[i] > (UnitHP[UnitType[i]] * (1 + (0.1 * ShieldLevel)))){HP[i] = (UnitHP[UnitType[i]] * (1 + (0.1 * ShieldLevel))); } } } }
			if(UnitType[UnitSelected] == 2){ HP[UnitSelected] = UnitHP[UnitType[UnitSelected]] * (1 + (0.1 * ShieldLevel)); }
			//MGer/Ogre/Hunter
			if(UnitType[UnitSelected] ==3 && eUnitType[TargetUnit] != 11){if(eUnitDebuff[TargetUnit]==2 || eUnitDebuff[TargetUnit]==3){
			eHP[TargetUnit]-=24;}else{eHP[TargetUnit]-=16;};if(eHP[TargetUnit] < 1){SpecialEffect[UnitSelected] = 1;}}
			if(UnitType[UnitSelected] ==4){
			for(i=0;i<10;i++){
				if(eUnitType[i]!=11){
				if(eUnitDebuff[i]==2 || eUnitDebuff[i]==3){eHP[i] -= 15}else{eHP[i] -= 10}
					if(eAutoAttackMax[i]<0){
						if(eUnitType[i]==1){eAutoAttacks[i].delay=4200}
						if(eUnitType[i]==3){eAutoAttacks[i].delay=3000}
						if(eUnitType[i]==6){eAutoAttacks[i].delay=1000}
						if(eUnitType[i]==10){eAutoAttacks[i].delay=1001}
						if(eUnitType[i]==11 && eAutoAttacks[i].delay < 1006){eAutoAttacks[i].delay = 5000}
						if(eUnitType[i]==12){eAutoAttacks[i].delay=2501;eUnitTarget[i]=-1};if(eUnitType[i]==13){eAutoAttacks[i].delay=1015;eUnitTarget[i]=-1}
						eAutoAttackMax[i]=eAutoAttacks[i].delay;
						eAutoAttackCurrent[i]=0;
						eAutoAttacks[i].start()}}}}
			if(UnitType[UnitSelected]==5 && eUnitType[TargetUnit] != 11){
			if(eUnitDebuff[TargetUnit]/2== int(eUnitDebuff[TargetUnit]/2)){eUnitDebuff[TargetUnit]+=1;SpecialEffect[UnitSelected]=TargetUnit;};}
			//BattleMage/Giant/Sniper
			if(UnitType[UnitSelected] == 6){
				var totalhealing:Number = 75;
				while(totalhealing != 0){
					var damagecalcx:Number = 0;
					var changevalue:Number = 500;
					var unittarget:Number = -1
					for(i=0;i<10;i++){
						damagecalcx = ((UnitHP[UnitType[i]] * (1 + (ShieldLevel * 0.1))) - HP[i]);
						if(UnitDebuff[i]/2!= int(UnitDebuff[i]/2)){damagecalcx*=2;;};
						if(UnitType[i]==7 || i==eDarkFlamed){damagecalcx=0}
						if(damagecalcx > 0 && damagecalcx < changevalue){changevalue = damagecalcx;unittarget = i}}
					if(unittarget>-1){
						if(changevalue >= totalhealing){
							if(UnitDebuff[unittarget]/2!= int(UnitDebuff[unittarget]/2)){HP[unittarget]+=totalhealing/2;}else{HP[unittarget]+=totalhealing};totalhealing=0;
						}else{if(UnitDebuff[unittarget]/2!= int(UnitDebuff[unittarget]/2)){HP[unittarget]+=changevalue/4;}else{HP[unittarget]+=changevalue;} totalhealing-=changevalue;}
					}else{totalhealing = 0;};};};
			if(UnitType[UnitSelected]==7){
				var hammertime:Boolean = false;
				for(i=0;i<10;i++){if(eUnitTarget[i]==UnitSelected){hammertime=true;}}
				if(hammertime==false){SpecialEffect[UnitSelected]=1};}
			if(UnitType[UnitSelected]==8 && eUnitType[TargetUnit] != 11){
					if(eHP[TargetUnit]!=(UnitHP[eUnitType[TargetUnit]] * (1 + (0.1 * eShieldLevel))) && eUnitDebuff[TargetUnit] != 2 && eUnitDebuff[TargetUnit] != 3){eUnitDebuff[TargetUnit] += 2}
					AutoAttacks[UnitSelected].delay = 3000;
					AutoAttackMax[UnitSelected] = AutoAttacks[UnitSelected].delay;AutoAttackCurrent[UnitSelected] = 0;AutoAttacks[UnitSelected].start();}
			//Archmage/Dragon/Reaper
			if(UnitType[UnitSelected]==9 && UnitTarget[TargetUnit]!=10){LifeWard = TargetUnit;}
			if(UnitType[UnitSelected]==10 && eUnitType[TargetUnit] != 11){SpecialEffect[UnitSelected]=7000;DarkFlamed=TargetUnit;}
			if(UnitType[UnitSelected]==11){Reaped = TargetUnit;}
			//End of Attacks
			if(eHP[UnitSelected]>UnitHP[eUnitType[UnitSelected]]*(1+(0.1*eShieldLevel))){eHP[UnitSelected]=UnitHP[eUnitType[UnitSelected]]*(1+(0.1*eShieldLevel))};
			if(SavedData.data.Sticky==0){Remove1(MenuButton.currentFrame);UnitSelected=-1;}else{Remove5(MenuButton.currentFrame)}}
		function eAttack(AttackingUnit:int){
			//Decommission etc
			if(eUnitTarget[AttackingUnit] == 10){
				if(eUnitType[AttackingUnit] == -3){eMinerals += 450;};
				eHP[AttackingUnit] = -1;
				eUnitTarget[AttackingUnit] = -1;
			} else {
			//Drone & Cancel
			if(eUnitTarget[AttackingUnit] == -1 || (UnitType[eUnitTarget[AttackingUnit]] == -1 && eUnitType[AttackingUnit] != 1) ||
			   (eUnitType[eUnitTarget[AttackingUnit]] == -1 && eUnitType[AttackingUnit] == 1 && eUnitType[AttackingUnit]!=12)){
				if(eUnitType[AttackingUnit] == 2){
					if(Level!=1){eIron+=10;}if(Level!=1||Difficulty==4){eMinerals+=10;}
					if (eHP[AttackingUnit] < (UnitHP[eUnitType[AttackingUnit]] * (1 + (0.1 * eShieldLevel)))){
						if(eUnitDebuff[AttackingUnit]/2!= int(eUnitDebuff[AttackingUnit]/2)){eHP[AttackingUnit]+=5;;}else{eHP[AttackingUnit]+=10;}};
					if (eHP[AttackingUnit] > (UnitHP[eUnitType[AttackingUnit]] * (1 + (0.1 * eShieldLevel)))){eHP[AttackingUnit] = UnitHP[eUnitType[AttackingUnit]]};
					eAutoAttackMax[AttackingUnit]=eAutoAttacks[AttackingUnit].delay;
				} else{
					if(eUnitType[AttackingUnit]==1 && eAutoAttacks[AttackingUnit].delay == 4200){
						eAutoAttacks[AttackingUnit].stop();} else {eAutoAttacks[AttackingUnit].stop();if(eUnitType[AttackingUnit] == 1){eAutoAttacks[AttackingUnit].delay = 4200;
					eAutoAttacks[AttackingUnit].start();eAutoAttackMax[AttackingUnit] = 4200;eAutoAttackCurrent[AttackingUnit] = 0;}}
				   if(eUnitType[AttackingUnit] == 3 && eAutoAttacks[AttackingUnit].delay < 2000){
					   eAutoAttacks[AttackingUnit].delay = 3000;
					   eAutoAttackMax[AttackingUnit] = 3000;
					   eAutoAttackCurrent[AttackingUnit] = 0;
					   eAutoAttacks[AttackingUnit].start();}}
			} else {
				//Main attack script
				var DamageCalc:Number = 0;eAutoAttackCurrent[AttackingUnit]=0;
				//Marine Shaman
				if(eUnitType[AttackingUnit] == 0){DamageCalc = 4;if(AttackingUnit < 6 && AttackingUnit > 0){for(i = 1 ; i < 6 ; i++){if(eUnitType[i] == 0){DamageCalc++};}}
					if(AttackingUnit > 5){for(i = 5 ; i < 10 ; i++){if(eUnitType[i] == 0){DamageCalc++};}};if(AttackingUnit == 0){DamageCalc++};
					if(UnitType[eUnitTarget[AttackingUnit]]==8&&eUnitTarget[AttackingUnit]>5){DamageCalc/=2};if(Difficulty<3){DamageCalc*=0.7};if(Difficulty<2){DamageCalc*=0.7;};
					if(UnitDebuff[eUnitTarget[AttackingUnit]]==2||UnitDebuff[eUnitTarget[AttackingUnit]]==3){DamageCalc*=2};HP[eUnitTarget[AttackingUnit]] -= DamageCalc;
					if(AttackingUnit==eReaped){eHP[AttackingUnit]+=DamageCalc}}
				if(eUnitType[AttackingUnit] == 1){if(eAutoAttacks[AttackingUnit].delay < 1850){eAutoAttackMax[AttackingUnit] = 4200;DamageCalc = 65;
				if(eUnitType[eUnitTarget[AttackingUnit]] == 1){DamageCalc *=2;};if(eUnitType[eUnitTarget[AttackingUnit]] == 7){DamageCalc = 0;}
				if(eUnitTarget[AttackingUnit] == DarkFlamed){DamageCalc=0;};if(eUnitTarget[AttackingUnit] == DarkFlamed && DarkFlameTimer==0){DamageCalc=-40;DarkFlameTimer=1000;}
				if(eUnitDebuff[eUnitTarget[AttackingUnit]] / 2 != int(eUnitDebuff[eUnitTarget[AttackingUnit]] / 2)){DamageCalc/=2};eAutoAttacks[AttackingUnit].delay = 4200;
				if(Difficulty<3){DamageCalc*=0.7};if(Difficulty<2){DamageCalc*=0.7};eHP[eUnitTarget[AttackingUnit]]+=DamageCalc;if((Level==7||Level==3)&&Difficulty==2){Achievement=0}
				if (eHP[eUnitTarget[AttackingUnit]] > (UnitHP[eUnitType[eUnitTarget[AttackingUnit]]] * (1 + (0.1 * eShieldLevel)))){
				eHP[eUnitTarget[AttackingUnit]] = (UnitHP[eUnitType[eUnitTarget[AttackingUnit]]] * (1 + (0.1 * eShieldLevel))); };return;}
					if(eAutoAttacks[AttackingUnit].delay == 4200){eAutoAttacks[AttackingUnit].delay = 1800;eAutoAttackMax[AttackingUnit] = -1800;}};
				//Machinegunner Ogre Hunter
				if(eUnitType[AttackingUnit] == 3){if(eAutoAttacks[AttackingUnit].delay < 3000){DamageCalc = 8;
				if(UnitDebuff[eUnitTarget[AttackingUnit]]==2 || UnitDebuff[eUnitTarget[AttackingUnit]]==3){DamageCalc*=2};if(Difficulty<3){DamageCalc*=0.7};if(Difficulty<2){
					DamageCalc*=0.7};if(AttackingUnit > 0 && AttackingUnit < 6){DamageCalc *= 1.5};if(eSpecialEffect[AttackingUnit] == 1){DamageCalc *= 1.5};
					if(UnitType[eUnitTarget[AttackingUnit]]==8&&eUnitTarget[AttackingUnit]>5){DamageCalc/=2};HP[eUnitTarget[AttackingUnit]] -= DamageCalc;
					if(AttackingUnit==eReaped){eHP[AttackingUnit]+=DamageCalc}
					if(eAutoAttacks[AttackingUnit].delay == 503){eAutoAttacks[AttackingUnit].delay = 3006; eAutoAttackMax[AttackingUnit] = eAutoAttacks[AttackingUnit].delay;} else { 
					eAutoAttacks[AttackingUnit].delay += 1; eAutoAttackMax[AttackingUnit] = -eAutoAttacks[AttackingUnit].delay; };eAutoAttacks[AttackingUnit].start()
						} else {eAutoAttacks[AttackingUnit].delay = 500; eAutoAttackMax[AttackingUnit] = -500; return;}}
				if(eUnitType[AttackingUnit] == 4){DamageCalc = 50;if(UnitType[eUnitTarget[AttackingUnit]]==8&&eUnitTarget[AttackingUnit]>5){DamageCalc/=2};
					if(UnitDebuff[eUnitTarget[AttackingUnit]]==2 || UnitDebuff[eUnitTarget[AttackingUnit]]==3){DamageCalc*=2};if(Difficulty<3){DamageCalc*=0.7};if(Difficulty<2){
					DamageCalc*=0.7};if(UnitType[eUnitTarget[AttackingUnit]]==5){HP[eUnitTarget[AttackingUnit]] -= 20;if(AttackingUnit==eReaped){eHP[AttackingUnit]+=20}} else {
					HP[eUnitTarget[AttackingUnit]] -= DamageCalc;if(AttackingUnit==eReaped){eHP[AttackingUnit]+=DamageCalc}}}
				if(eUnitType[AttackingUnit] == 5){
					DamageCalc = (UnitHP[UnitType[eUnitTarget[AttackingUnit]]] / 4);if(Difficulty<3){DamageCalc*=0.7};if(Difficulty<2){DamageCalc*=0.7};
					HP[eUnitTarget[AttackingUnit]] -= DamageCalc;if(AttackingUnit==eReaped){eHP[AttackingUnit]+=DamageCalc}}
				//BattleMage Giant Sniper
				if(eUnitType[AttackingUnit] == 6){if(eAutoAttacks[AttackingUnit].delay == 1001){DamageCalc = 20;
					if(UnitType[eUnitTarget[AttackingUnit]]==8&&eUnitTarget[AttackingUnit]>5){DamageCalc/=2};if(Difficulty<3){DamageCalc*=0.7};if(Difficulty<2){DamageCalc*=0.7};
						if((UnitDebuff[eUnitTarget[AttackingUnit]]==2 || UnitDebuff[eUnitTarget[AttackingUnit]]==3)){DamageCalc*=2};eAutoAttacks[AttackingUnit].delay = 1000;
						if(UnitType[eUnitTarget[AttackingUnit]]==5){HP[eUnitTarget[AttackingUnit]] -= 20;if(AttackingUnit==eReaped){eHP[AttackingUnit]+=20}}else{
						HP[eUnitTarget[AttackingUnit]] -= DamageCalc;if(AttackingUnit==eReaped){eHP[AttackingUnit]+=DamageCalc}};eAutoAttackMax[AttackingUnit] = 1000;
						if(eHP[AttackingUnit]>UnitHP[eUnitType[AttackingUnit]] * (1 + (0.1 * eShieldLevel))){
							eHP[AttackingUnit] = UnitHP[eUnitType[AttackingUnit]] * (1 + (0.1 * eShieldLevel))};return;}
					if(eAutoAttacks[AttackingUnit].delay == 1000){eAutoAttacks[AttackingUnit].delay = 1001;eAutoAttackMax[AttackingUnit] = -1001;}};
				if(eUnitType[AttackingUnit] == 7){DamageCalc = 75;if(UnitType[eUnitTarget[AttackingUnit]]==8&&eUnitTarget[AttackingUnit]>5){DamageCalc/=2};
					if(UnitDebuff[eUnitTarget[AttackingUnit]]==2 || UnitDebuff[eUnitTarget[AttackingUnit]]==3){DamageCalc*=2};if(Difficulty<3){DamageCalc*=0.7};
					if(Difficulty<2){DamageCalc*=0.7};if(UnitType[eUnitTarget[AttackingUnit]]==5){HP[eUnitTarget[AttackingUnit]] -= 20;if(AttackingUnit==eReaped){
						eHP[AttackingUnit]+=20}}else{HP[eUnitTarget[AttackingUnit]] -= DamageCalc;if(AttackingUnit==eReaped){eHP[AttackingUnit]+=DamageCalc}}
					if(AutoAttackMax[eUnitTarget[AttackingUnit]]<0){if(UnitType[eUnitTarget[AttackingUnit]]==1){AutoAttacks[eUnitTarget[AttackingUnit]].delay=4200};
						if(UnitType[eUnitTarget[AttackingUnit]]==3){AutoAttacks[eUnitTarget[AttackingUnit]].delay=3000};
						if(UnitType[eUnitTarget[AttackingUnit]]==6){AutoAttacks[eUnitTarget[AttackingUnit]].delay=1000};
						if(UnitType[eUnitTarget[AttackingUnit]]==10){AutoAttacks[eUnitTarget[AttackingUnit]].delay=1001};
						if(UnitType[eUnitTarget[AttackingUnit]]==11 && AutoAttacks[eUnitTarget[AttackingUnit]].delay < 1006){
						AutoAttacks[eUnitTarget[AttackingUnit]].delay = (AutoAttacks[eUnitTarget[AttackingUnit]].delay-1000) * 1000}
						AutoAttackMax[eUnitTarget[AttackingUnit]]=AutoAttacks[eUnitTarget[AttackingUnit]].delay;AutoAttackCurrent[eUnitTarget[AttackingUnit]]=0;
						AutoAttacks[eUnitTarget[AttackingUnit]].start();}}
				if(eUnitType[AttackingUnit] == 8){
					DamageCalc = 60;if(UnitType[eUnitTarget[AttackingUnit]]==8&&eUnitTarget[AttackingUnit]>5){DamageCalc/=2};if(Difficulty<3){DamageCalc*=0.7};
					if(UnitDebuff[eUnitTarget[AttackingUnit]]==2 || UnitDebuff[eUnitTarget[AttackingUnit]]==3){DamageCalc*=2};if(Difficulty<2){DamageCalc*=0.7};
					if(UnitType[eUnitTarget[AttackingUnit]]==5){HP[eUnitTarget[AttackingUnit]] -= 20;if(AttackingUnit==eReaped){eHP[AttackingUnit]+=20}} else {
					HP[eUnitTarget[AttackingUnit]] -= DamageCalc;if(AttackingUnit==eReaped){eHP[AttackingUnit]+=DamageCalc}}eSpecialAttacks[AttackingUnit].delay = 3000;
					eAutoAttacks[AttackingUnit].delay = 7500;eAutoAttackMax[AttackingUnit]=7500;eSpecialProgress[AttackingUnit] = 0;eAutoAttackCurrent[AttackingUnit] = 0;
					eSpecialAttacks[AttackingUnit].start();eAutoAttacks[AttackingUnit].start();}
				//Archmage Dragon Reaper
				if(eUnitType[AttackingUnit] == 9){DamageCalc = 50;if(UnitDebuff[eUnitTarget[AttackingUnit]]==2 || UnitDebuff[eUnitTarget[AttackingUnit]]==3){DamageCalc*=2};
					if(UnitType[eUnitTarget[AttackingUnit]]==8&&eUnitTarget[AttackingUnit]>5){DamageCalc/=2};if(Difficulty<3){DamageCalc*=0.7};if(Difficulty<2){DamageCalc*=0.7};
					if(UnitType[eUnitTarget[AttackingUnit]]==5){HP[eUnitTarget[AttackingUnit]] -= 20;if(AttackingUnit==eReaped){eHP[AttackingUnit]+=20}} else {
						HP[eUnitTarget[AttackingUnit]] -= DamageCalc;if(AttackingUnit==eReaped){eHP[AttackingUnit]+=DamageCalc}}
					if(AutoAttackMax[eUnitTarget[AttackingUnit]]<0){if(UnitType[eUnitTarget[AttackingUnit]]==1){AutoAttacks[eUnitTarget[AttackingUnit]].delay=4200}
						if(UnitType[eUnitTarget[AttackingUnit]]==3){AutoAttacks[eUnitTarget[AttackingUnit]].delay=3000}
						if(UnitType[eUnitTarget[AttackingUnit]]==6){AutoAttacks[eUnitTarget[AttackingUnit]].delay=1000}
						if(UnitType[eUnitTarget[AttackingUnit]]==10){AutoAttacks[eUnitTarget[AttackingUnit]].delay=1001}
						if(UnitType[eUnitTarget[AttackingUnit]]==11 && AutoAttacks[eUnitTarget[AttackingUnit]].delay < 1006){
						AutoAttacks[eUnitTarget[AttackingUnit]].delay = (AutoAttacks[eUnitTarget[AttackingUnit]].delay-1000) * 1000}
						AutoAttackMax[eUnitTarget[AttackingUnit]]=AutoAttacks[eUnitTarget[AttackingUnit]].delay;AutoAttackCurrent[eUnitTarget[AttackingUnit]]=0;
						AutoAttacks[eUnitTarget[AttackingUnit]].start();}}
				if(eUnitType[AttackingUnit] == 10){if(eAutoAttacks[AttackingUnit].delay == 999 || eAutoAttacks[AttackingUnit].delay == 1000){DamageCalc = 30;
					if(UnitType[eUnitTarget[AttackingUnit]]==8&&eUnitTarget[AttackingUnit]>5){DamageCalc/=2};if(Difficulty<3){DamageCalc*=0.7};if(Difficulty<2){DamageCalc*=0.7};
					if(UnitDebuff[eUnitTarget[AttackingUnit]]==2 || UnitDebuff[eUnitTarget[AttackingUnit]]==3){DamageCalc*=2};eAutoAttacks[AttackingUnit].delay += 1;
					if(UnitType[eUnitTarget[AttackingUnit]]==5){HP[eUnitTarget[AttackingUnit]] -= 20;if(AttackingUnit==eReaped){eHP[AttackingUnit]+=20}} else {
					HP[eUnitTarget[AttackingUnit]]-= DamageCalc;if(AttackingUnit==eReaped){eHP[AttackingUnit]+=DamageCalc}};for(i=0;i<10;i++){if(UnitType[i]!= -1){HP[i]-= 1.5}};
					if(eAutoAttacks[AttackingUnit].delay == 1000){eAutoAttackMax[AttackingUnit] = -eAutoAttacks[AttackingUnit].delay;} else {
					eAutoAttackMax[AttackingUnit] = eAutoAttacks[AttackingUnit].delay;}if(eHP[AttackingUnit]>UnitHP[eUnitType[AttackingUnit]] * (1 + (0.1 * eShieldLevel))){
					eHP[AttackingUnit] = UnitHP[eUnitType[AttackingUnit]] * (1 + (0.1 * eShieldLevel))};return;}
					if(eAutoAttacks[AttackingUnit].delay == 1001){eAutoAttacks[AttackingUnit].delay = 999;eAutoAttackMax[AttackingUnit] = -999;}};
				if(eUnitType[AttackingUnit]== 11){eAutoAttacks[AttackingUnit].delay -=1;if(eAutoAttacks[AttackingUnit].delay == 1000){eAutoAttacks[AttackingUnit].delay = 1005};
					DamageCalc = (UnitHP[UnitType[eUnitTarget[AttackingUnit]]] *0.15);if(Difficulty<3){DamageCalc*=0.7};if(Difficulty<2){DamageCalc*=0.7};if(eAutoAttacks[AttackingUnit].delay > 1005){
					eAutoAttacks[AttackingUnit].delay = 1005}else{HP[eUnitTarget[AttackingUnit]] -= DamageCalc;};eAutoAttackMax[AttackingUnit] = -eAutoAttacks[AttackingUnit].delay}
				//Devourer Destroyer
				if(eUnitType[AttackingUnit]==12){if(eAutoAttacks[AttackingUnit].delay>3000){for(i=0;i<10;i++){if(UnitType[i]!=-1){if(Difficulty==1){
				HP[i]-=UnitHP[UnitType[i]]*0.24}else{HP[i]-=UnitHP[UnitType[i]]*0.48}}}}else{if(Difficulty>2){
				BossSpecial=Math.floor(Math.random()*3)+1;if(Math.random()<0.24){BossSpecial=6};
				if(Math.random()<0.2){BossSpecial=7}}};eAutoAttacks[AttackingUnit].delay=5000;eAutoAttackMax[AttackingUnit]=-5000}
				if(eUnitType[AttackingUnit]==13){if(eAutoAttackMax[AttackingUnit]<0){
					DamageCalc=60;if(Difficulty!=2){DamageCalc/=2};if(UnitType[eUnitTarget[AttackingUnit]]==8&&eUnitTarget[AttackingUnit]>5){
					DamageCalc/=2};HP[eUnitTarget[AttackingUnit]]-=DamageCalc;};eAutoAttacks[AttackingUnit].delay=1000;eAutoAttackMax[AttackingUnit]=-1000}
				//Closing brackets
				if(eHP[AttackingUnit]>UnitHP[eUnitType[AttackingUnit]] * (1 + (0.1 * eShieldLevel))){eHP[AttackingUnit] = UnitHP[eUnitType[AttackingUnit]] * (1 + (0.1 * eShieldLevel))};
				}}}
  		function eSpecialAttack(TargetUnit:int){
			eSpecialAttacks[k].delay = UnitSpec[eUnitType[k]];
			eSpecialAttacks[k].start();
			eSpecialProgress[k] = 0;
			//Marine/Shaman/Drone
		    if(eUnitType[k] == 0){
				var TargetsHit:Array = new Array();
				if(TargetUnit == 1){TargetsHit = [1,2,6,-1,-1,-1];};if(TargetUnit == 2){TargetsHit = [2,1,3,6,7,-1];};if(TargetUnit == 3){TargetsHit = [3,2,4,7,8,-1];}
				if(TargetUnit == 4){TargetsHit = [4,3,5,8,9,-1];};if(TargetUnit == 5){TargetsHit = [5,4,9,-1,-1,-1];};if(TargetUnit == 6){TargetsHit = [6,1,2,7,-1,-1];}
				if(TargetUnit == 7){TargetsHit = [7,2,3,6,8,0];};if(TargetUnit == 8){TargetsHit = [8,3,4,7,9,0];}
				if(TargetUnit == 9){TargetsHit = [9,4,5,8,-1,-1];};if(TargetUnit == 0){TargetsHit = [0,7,8,-1,-1,-1];}
				for(i = 0; i < 7; i++){if(TargetsHit[i] > -1){if(UnitType[TargetsHit[i]] > -1 && UnitType[TargetsHit[i]] != 11){ 
				if(UnitDebuff[TargetsHit[i]]==2 ||UnitDebuff[TargetsHit[i]]==3){
				HP[TargetsHit[i]]-= 15;}else{ HP[TargetsHit[i]]-=10;};};};};};
			if(eUnitType[k] == 1){ for(i = 0 ; i < 10 ; i++){ if(eUnitType[i] != -1&& eUnitType[i]!=7){
				var DamageCalc:Number=12;if(eUnitType[i] == 1){DamageCalc*=1.5};if(eUnitDebuff[i]/2!= int(eUnitDebuff[i]/2)){DamageCalc/=2};
				if(i == DarkFlamed){DamageCalc=0};if(i == DarkFlamed && DarkFlameTimer==0){DamageCalc=-40;DarkFlameTimer=1000;}; eHP[i]+=DamageCalc;
				if (eHP[i] > (UnitHP[eUnitType[i]] * (1 + (0.1 * eShieldLevel)))){eHP[i] = (UnitHP[eUnitType[i]] * (1 + (0.1 * eShieldLevel))); } } } }
			if(eUnitType[k] == 2){ eHP[k] = UnitHP[eUnitType[k]] * (1 + (0.1 * eShieldLevel)); }
			//MGer/Ogre/Hunter
			if(eUnitType[k] ==3 && UnitType[TargetUnit] != 11){
			if(UnitDebuff[TargetUnit]==2||UnitDebuff[TargetUnit]==3){HP[TargetUnit]-=24;}else{HP[TargetUnit]-=16;};if(HP[TargetUnit] < 1){eSpecialEffect[k] = 1;}}
			if(eUnitType[k] ==4){for(i=0;i<10;i++){
				if(UnitType[i]!=11){if(UnitDebuff[i]==2 || UnitDebuff[i]==3){HP[i] -= 15}else{HP[i] -= 10}
					if(AutoAttackMax[i]<0){if(UnitType[i]==1){AutoAttacks[i].delay=4200};if(UnitType[i]==3){AutoAttacks[i].delay=3000}
						if(UnitType[i]==6){AutoAttacks[i].delay=1000};if(UnitType[i]==10){AutoAttacks[i].delay=1001}
						if(UnitType[i]==11 && AutoAttacks[i].delay < 1006){AutoAttacks[i].delay = (AutoAttacks[i].delay-1000) * 1000}
						AutoAttackMax[i]=AutoAttacks[i].delay;AutoAttackCurrent[i]=0;AutoAttacks[i].start();}}}}
			if(eUnitType[k]==5 && UnitType[TargetUnit] != 11){
			if(UnitDebuff[TargetUnit]/2 == int(UnitDebuff[TargetUnit]/2)){UnitDebuff[TargetUnit]+=1;eSpecialEffect[k]=TargetUnit;};}
			//BattleMage/Giant/Sniper
			if(eUnitType[k] == 6){var totalhealing:Number = 75;while(totalhealing != 0){var damagecalcx:Number = 0;var changevalue:Number = 500;var unittarget:Number = -1;
					for(i=0;i<10;i++){damagecalcx = ((UnitHP[eUnitType[i]] * (1 + (eShieldLevel * 0.1))) - eHP[i]);
						if(eUnitDebuff[i]/2!= int(eUnitDebuff[i]/2)){damagecalcx*=2;;};if(eUnitType[i]==7 || i==DarkFlamed){damagecalcx=0};
						if(damagecalcx > 0 && damagecalcx < changevalue){changevalue = damagecalcx;unittarget = i}};
					if(unittarget>-1){if(changevalue >= totalhealing){
							if(eUnitDebuff[unittarget]/2!= int(eUnitDebuff[unittarget]/2)){eHP[unittarget]+=totalhealing/2;}else{eHP[unittarget]+=totalhealing};totalhealing=0;
						}else{if(eUnitDebuff[unittarget]/2!= int(eUnitDebuff[unittarget]/2)){eHP[unittarget]+=changevalue/4;}else{eHP[unittarget]+=changevalue;} totalhealing-=changevalue;}
					}else{totalhealing = 0;};};};
			if(eUnitType[k]==7){var hammertime:Boolean = false;for(i=0;i<10;i++){if(UnitTarget[i]==k){hammertime=true;}};if(hammertime==false){eSpecialEffect[k]=1}}
			if(eUnitType[k]==8&&UnitType[TargetUnit]!=11){
					if(HP[TargetUnit]!=(UnitHP[UnitType[TargetUnit]]*(1+(0.1*ShieldLevel)))&&UnitDebuff[TargetUnit]!=2&&UnitDebuff[TargetUnit]!=3){UnitDebuff[TargetUnit]+=2}
					eAutoAttacks[k].delay = 3000;eAutoAttackMax[k] = eAutoAttacks[k].delay;eAutoAttackCurrent[k] = 0;eAutoAttacks[k].start();}
			//Archmage/Dragon/Reaper/Devourer
			if(eUnitType[k]==9 && eUnitTarget[TargetUnit]!=10){eLifeWard = TargetUnit;}
			if(eUnitType[k]==10 && UnitType[TargetUnit] != 11){eSpecialEffect[k]=7000;eDarkFlamed=TargetUnit;}
			if(eUnitType[k]==11){eReaped = TargetUnit;}
			if(eUnitType[k]==12){for(i=0;i<10;i++){if(eUnitType[i]!=-1){if(eUnitDebuff[k]==1||eUnitDebuff[k]==3){eHP[k]+=75}else{eHP[k]+=150}}}}
			if(eUnitType[k]==13){if(Difficulty==3){BossArray[0]=int(Math.random()*10);BossArray[1]=int(Math.random()*10);}
				if(Difficulty==4){for(o=0;o<10;o++){if(BossArray[o]==-1){for(l=0;l<99999;l++){Calculator[3]=int(Math.random()*10);if(BossArray.indexOf(Calculator[3])==-1){
						BossArray[o]=Calculator[3];l=99999;o=10}}}}}}
			//End of Attacks
			if(eHP[k]>UnitHP[eUnitType[k]] * (1 + (0.1 * eShieldLevel))){eHP[k] = UnitHP[eUnitType[k]] * (1 + (0.1 * eShieldLevel))};}
		//Calculations
		function Calculate(KeyCode:int):Number{
			if(UnitSelected < 6 && UnitSelected > 0){Calculator[1] = 0};
				if(UnitSelected > 5){Calculator[1] = 1};
				if(UnitSelected == 0){Calculator[1] = 2};
				if((KeyCode) < 6 && (KeyCode) > 0){Calculator[2] = 0};
				if((KeyCode) > 5){Calculator[2] = 1};
				if((KeyCode) == 0){Calculator[2] = 2};
				Calculator[1] += Calculator[2];
				return Calculator[1];}
		function AutoAttack(KeyCode:int):void {
			UnitTarget[UnitSelected] = KeyCode;
			if(AutoAttacks[UnitSelected].running == false){ 
			AutoAttacks[UnitSelected].delay = UnitAuto[UnitType[UnitSelected]];
			if(UnitType[UnitSelected] == 1 || UnitType[UnitSelected] == 3 || UnitType[UnitSelected] == 6 || UnitType[UnitSelected] > 9){
			AutoAttackMax[UnitSelected] = -AutoAttacks[UnitSelected].delay} else {Attack(UnitSelected);; AutoAttackMax[UnitSelected] = AutoAttacks[UnitSelected].delay;}
			AutoAttackCurrent[UnitSelected] = 0;
			AutoAttacks[UnitSelected].start(); };Remove1(MenuButton.currentFrame);
			if(UnitType[UnitSelected]==-1){UnitSelected=-1}else{if(SavedData.data.Sticky==0){Remove1(MenuButton.currentFrame);UnitSelected=-1;}else{Remove5(MenuButton.currentFrame)}}}
		function SelectUnit(KeyCode:int):void {
			Remove1(MenuButton.currentFrame);TrainSlot = KeyCode;
			TrainTimer.delay = UnitTimer[TrainOrder] * (1 - (0.1 * BarracksLevel));SpecialProgress[11] = 0;TrainTimer.start();Minerals -= UnitMinerals[TrainOrder];}
		function Move(TargetSpot:int):void {
			IsMoving = true;Calculator[3] = HP[UnitSelected];HP[UnitSelected] = HP[TargetSpot];HP[TargetSpot] = Calculator[3];UnitTarget[TargetSpot] = -1;
			UnitTarget[UnitSelected] = -1;Calculator[3] = UnitType[UnitSelected];UnitType[UnitSelected] = UnitType[TargetSpot];UnitType[TargetSpot] = Calculator[3];
			UnitArray[UnitSelected].gotoAndStop(((UnitType[UnitSelected] + 1) * 10)+1);UnitArray[TargetSpot].gotoAndStop(((UnitType[TargetSpot] + 1) * 10)+1);
			Moving = false;AutoAttacks[TargetSpot].delay = UnitAuto[UnitType[TargetSpot]];AutoAttackMax[TargetSpot] = AutoAttacks[TargetSpot].delay;
			AutoAttackCurrent[TargetSpot] = 0;UnitTarget[TargetSpot] = -1;SpecialAttacks[TargetSpot].delay = UnitSpec[UnitType[TargetSpot]];
			AutoAttacks[TargetSpot].start();SpecialAttacks[TargetSpot].start();SpecialProgress[TargetSpot] = 0;
			if(UnitType[UnitSelected] != -1){
			     AutoAttacks[UnitSelected].delay = UnitAuto[UnitType[UnitSelected]];AutoAttackMax[UnitSelected] = AutoAttacks[UnitSelected].delay;
			     AutoAttackCurrent[UnitSelected] = 0;UnitTarget[UnitSelected] = -1;SpecialAttacks[UnitSelected].delay = UnitSpec[UnitType[UnitSelected]];
			     SpecialProgress[UnitSelected] = 0;AutoAttacks[UnitSelected].start();SpecialAttacks[UnitSelected].start();}
			Calculator[3] = SpecialEffect[UnitSelected];
			SpecialEffect[UnitSelected] = SpecialEffect[TargetSpot];SpecialEffect[TargetSpot] = Calculator[3];Calculator[3]=UnitDebuff[UnitSelected];
			UnitDebuff[UnitSelected]=UnitDebuff[TargetSpot];UnitDebuff[TargetSpot]=Calculator[3];if(eReaped==UnitSelected){eReaped=TargetSpot};
			if(eLifeWard==UnitSelected){eLifeWard=TargetSpot};if(eDarkFlamed==UnitSelected){eDarkFlamed=TargetSpot};
				if(SavedData.data.Sticky==0){UnitSelected=-1;Remove1(MenuButton.currentFrame)}else{UnitSelected=TargetSpot;Remove5(MenuButton.currentFrame)};IsMoving=false;}
		//Controls
		function ForeheadMeetsKeyboard(WASD:KeyboardEvent):void {
			if(WASD.keyCode==35){Pussy=true;return;}
			//TargetSelection
			if (Moving == true){
					if  (WASD.keyCode == 88){Remove5(MenuButton.currentFrame);Moving = false;return;}
					if  (WASD.keyCode > 47 && WASD.keyCode < 58 && AutoAttacks[WASD.keyCode - 48].running == false && CellArray[WASD.keyCode - 48].currentFrame == 1){
					Move(WASD.keyCode - 48);return;}
					if  (WASD.keyCode == 81 && AutoAttacks[6].running == false && CellArray[6].currentFrame == 1){ Move(6); return; };
					if  (WASD.keyCode == 87 && AutoAttacks[7].running == false && CellArray[7].currentFrame == 1){ Move(7); return; };
					if  (WASD.keyCode == 69 && AutoAttacks[8].running == false && CellArray[8].currentFrame == 1){ Move(8); return; };
					if  (WASD.keyCode == 82 && AutoAttacks[9].running == false && CellArray[9].currentFrame == 1){ Move(9); return; };
					if  (WASD.keyCode == 83 && AutoAttacks[0].running == false && CellArray[0].currentFrame == 1){ Move(0); return; };
					if  (WASD.keyCode == 68 && AutoAttacks[0].running == false && CellArray[0].currentFrame == 1){ Move(0); return; };}
			if (SpecialActive == true){
					if (WASD.keyCode == 88){Remove5(MenuButton.currentFrame);SpecialActive = false;return;}
					//(eUnitType[6] > -1 || (UnitType[6] > -1 && (UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)))
					if (WASD.keyCode>47&&WASD.keyCode<58&&(eUnitType[WASD.keyCode-48]>-1||(UnitType[WASD.keyCode-48]>-1&&(UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)))){
					SpecialAttack(WASD.keyCode - 48);return;}
					if (WASD.keyCode == 81 && (eUnitType[6] > -1 || (UnitType[6] > -1 && (UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)))){ SpecialAttack(6); return;};
					if (WASD.keyCode == 87 && (eUnitType[7] > -1 || (UnitType[7] > -1 && (UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)))){ SpecialAttack(7); return;};
					if (WASD.keyCode == 69 && (eUnitType[8] > -1 || (UnitType[8] > -1 && (UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)))){ SpecialAttack(8); return;};
					if (WASD.keyCode == 82 && (eUnitType[9] > -1 || (UnitType[9] > -1 && (UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)))){ SpecialAttack(9); return;};
					if (WASD.keyCode == 83 && (eUnitType[0] > -1 || (UnitType[0] > -1 && (UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)))){ SpecialAttack(0); return;};
					if (WASD.keyCode == 68 && (eUnitType[0] > -1 || (UnitType[0] > -1 && (UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)))){ SpecialAttack(0); return;};}
			if (MenuButton.currentFrame == 4 && UnitSelected > -1 &&UnitSelected < 10 && SpecialActive == false && Moving == false){
					if  (WASD.keyCode == 88){
					  Remove5(MenuButton.currentFrame);}
					if  (WASD.keyCode > 47 && WASD.keyCode < 58 && eUnitType[WASD.keyCode - 48] > -1 && UnitType[UnitSelected] != 1){
					  Calculator[1] = Calculate(WASD.keyCode - 48);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){ AutoAttack(WASD.keyCode - 48); return; }};
					if  (WASD.keyCode == 81 && eUnitType[6] > -1 && UnitType[UnitSelected] != 1){Calculator[1] = Calculate(6);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){ AutoAttack(6); return;}};
					if  (WASD.keyCode == 87 && eUnitType[7] > -1 && UnitType[UnitSelected] != 1){ Calculator[1] = Calculate(7);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){ AutoAttack(7); return;}};
					if  (WASD.keyCode == 69 && eUnitType[8] > -1 && UnitType[UnitSelected] != 1){Calculator[1] = Calculate(8);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){ AutoAttack(8); return;}};
					if  (WASD.keyCode == 82 && eUnitType[9] > -1 && UnitType[UnitSelected] != 1){Calculator[1] = Calculate(9);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){ AutoAttack(9); return;}};
					if  (WASD.keyCode == 83 && eUnitType[0] > -1 && UnitType[UnitSelected] != 1){Calculator[1] = Calculate(0);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){ AutoAttack(0); return;}};
					if  (WASD.keyCode == 68 && eUnitType[0] > -1 && UnitType[UnitSelected] != 1){Calculator[1] = Calculate(0);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){ AutoAttack(0); return;}};
					if  (WASD.keyCode > 47 && WASD.keyCode < 58 && UnitType[WASD.keyCode - 48] > -1 && UnitType[UnitSelected] == 1 && WASD.keyCode - 48 != UnitSelected){AutoAttack(WASD.keyCode - 48); return;};
					if  (WASD.keyCode ==81 && UnitType[6] > -1 && UnitType[UnitSelected] == 1 && 6 != UnitSelected){AutoAttack(6); return;};
					if  (WASD.keyCode ==87 && UnitType[7] > -1 && UnitType[UnitSelected] == 1 && 7 != UnitSelected){AutoAttack(7); return;};
					if  (WASD.keyCode ==69 && UnitType[8] > -1 && UnitType[UnitSelected] == 1 && 8 != UnitSelected){AutoAttack(8); return;};
					if  (WASD.keyCode ==82 && UnitType[9] > -1 && UnitType[UnitSelected] == 1 && 9 != UnitSelected){AutoAttack(9); return;};
					if  (WASD.keyCode ==83 && UnitType[0] > -1 && UnitType[UnitSelected] == 1 && 0 != UnitSelected){AutoAttack(0); return;};
					if  (WASD.keyCode ==68 && UnitType[0] > -1 && UnitType[UnitSelected] == 1 && 0 != UnitSelected){AutoAttack(0); return;};
			} else {
			//UnitControl
			if (SpecialActive == false && Moving == false && UnitSelected == 10){
				if(WASD.keyCode == 88){UnitSelected=-1;Remove1(MenuButton.currentFrame);return;}
					var Targetx=-1;if(WASD.keyCode>47&&WASD.keyCode<58&&eUnitType[WASD.keyCode - 48]>-1){Targetx=WASD.keyCode-48}
					if(WASD.keyCode==81&&eUnitType[6]>-1){Targetx=6};if(WASD.keyCode==87&&eUnitType[7]>-1){Targetx=7};if(WASD.keyCode==69&&eUnitType[8]>-1){Targetx=8};
					if(WASD.keyCode==82&&eUnitType[9]>-1){Targetx=9};if(WASD.keyCode==83&&eUnitType[0]>-1){Targetx=0};if(WASD.keyCode==68&&eUnitType[0]>-1){Targetx=0};
					if(Targetx>-1){for(o=1;o<10;o++){UnitSelected=o;
					if(UnitType[o]!=-1&&UnitType[o]!=1){Calculator[1]=Calculate(Targetx);if(Calculator[1]<UnitRange[UnitType[UnitSelected]]){
					AutoAttack(Targetx);}}}}UnitSelected=-1;return}
			if (UnitSelected > -1 && SpecialActive == false && Moving == false && UnitSelected < 10){
					if (WASD.keyCode == 88) { UnitSelected=-1; Remove1(MenuButton.currentFrame)};
					//Decommission
					if (WASD.keyCode == 222 && AutoAttacks[UnitSelected].running == false) {
						 UnitTarget[UnitSelected] = 10;AutoAttacks[UnitSelected].delay = 5000;AutoAttackMax[UnitSelected] = 5000;AutoAttacks[UnitSelected].start();
						 if(UnitType[UnitSelected] == 2){UnitType[UnitSelected] = -3} else { UnitType[UnitSelected] = -2; }
						 UnitSelected = -1; Remove1(MenuButton.currentFrame)}
					//Attack
					if (WASD.keyCode == 65) { if(UnitType[UnitSelected] == 2){AutoAttack(-1); } else { Remove4(MenuButton.currentFrame); }} 
					//Stop
					if (WASD.keyCode == 83) {Remove1(MenuButton.currentFrame);
						if(UnitType[UnitSelected] == 6 || UnitType[UnitSelected] == 2 ||(UnitType[UnitSelected] == 1 && AutoAttacks[UnitSelected].delay == 1800)){AutoAttacks[UnitSelected].stop()}
						if(UnitType[UnitSelected] == 3 && AutoAttacks[UnitSelected].delay < 510){
						AutoAttacks[UnitSelected].stop(); AutoAttacks[UnitSelected].delay = 3000;
						AutoAttackMax[UnitSelected] = 3000; AutoAttackCurrent[UnitSelected] = 0; AutoAttacks[UnitSelected].start();}
						if(UnitType[UnitSelected] == 11 && AutoAttacks[UnitSelected].delay < 1006){
							Calculator[6] = 1000000*((AutoAttacks[UnitSelected].delay/1000)-int(AutoAttacks[UnitSelected].delay/1000))
							AutoAttacks[UnitSelected].delay = Calculator[6]; AutoAttackMax[UnitSelected] = Calculator[6]; AutoAttackCurrent[UnitSelected] = 0; AutoAttacks[UnitSelected].start();}
						UnitTarget[UnitSelected] = -1;
						if(SavedData.data.Sticky==0){Remove1(MenuButton.currentFrame);UnitSelected=-1;}else{Remove5(MenuButton.currentFrame)}}
					//Special!
					if (WASD.keyCode == 70 && SpecialAttacks[UnitSelected].running == false) {
						 if(UnitType[UnitSelected] != 0 && UnitType[UnitSelected] != 3 && UnitType[UnitSelected] != 5 && UnitType[UnitSelected] < 8){
							 Calculator[8]=UnitSelected;SpecialAttack(0);UnitSelected=Calculator[8];
							 if(SavedData.data.Sticky==0){Remove1(MenuButton.currentFrame);UnitSelected=Calculator[8];
							 UnitSelected=-1;} else {Remove4(MenuButton.currentFrame);}}else{SpecialActive=true;Remove4(MenuButton.currentFrame)}}
					 //Move
					if(WASD.keyCode == 69 && AutoAttacks[UnitSelected].running == false){Moving = true;Remove4(MenuButton.currentFrame);}}}
			//Main Menu
			if (MenuButton.currentFrame == 1 && UnitSelected == -1){
					if  (WASD.keyCode == 66){Remove2(1);};if(WASD.keyCode == 65){ UnitSelected=10;Remove4(MenuButton.currentFrame);}
					if  (WASD.keyCode == 84&&(Level!=0||TutProgress>3)){Remove3(0);}
				    if (WASD.keyCode > 47 && WASD.keyCode < 58 && UnitType[WASD.keyCode - 48] > -1){ UnitSelected = WASD.keyCode - 48;Remove5(MenuButton.currentFrame); }
					if (WASD.keyCode == 81 && UnitType[6] > -1){ UnitSelected = 6; Remove5(MenuButton.currentFrame);}
					if (WASD.keyCode == 87 && UnitType[7] > -1){ UnitSelected = 7; Remove5(MenuButton.currentFrame);}
					if (WASD.keyCode == 69 && UnitType[8] > -1){ UnitSelected = 8; Remove5(MenuButton.currentFrame);}
					if (WASD.keyCode == 82 && UnitType[9] > -1){ UnitSelected = 9; Remove5(MenuButton.currentFrame);}
					if (WASD.keyCode == 63 && UnitType[0] > -1){ UnitSelected = 0; Remove5(MenuButton.currentFrame);}
					if (WASD.keyCode == 68 && UnitType[0] > -1){ UnitSelected = 0; Remove5(MenuButton.currentFrame);}}
			//Economy Menu
			if (MenuButton.currentFrame == 2 && UnitSelected == -1){
			if (WASD.keyCode==83&&Queue==-1&&BuildOrder>-1){BuildOrder==-1;BuildTimer.stop()};if (WASD.keyCode==83&&Queue>-1){Queue=-1};
			if  (WASD.keyCode == 88){Remove1(MenuButton.currentFrame)}
			if(WASD.keyCode>48&&WASD.keyCode<55&&BuildTimer.running==true&&Queue==-1&&BuildingsA[WASD.keyCode-49]==1){Queue=WASD.keyCode-48;Remove1(MenuButton.currentFrame)};
			if(WASD.keyCode==69&&BuildTimer.running==true&&Queue==-1&&Tier==1&&BuildingsA[6]==1){Queue=7;Remove1(MenuButton.currentFrame);};
			if(WASD.keyCode==69&&BuildTimer.running==true&&Queue==-1&&Tier==2&&BuildingsA[7]==1){Queue=7;Remove1(MenuButton.currentFrame);};
			if(WASD.keyCode==87&&BuildTimer.running==true&&Queue==-1&&Tier<3&&BuildingsA[8]==1){Queue=8;Remove1(MenuButton.currentFrame);};
			if(WASD.keyCode==69&&BuildTimer.running==true&&Queue==-1&&Tier==3&&BuildingsA[9]==1){Queue=9;Remove1(MenuButton.currentFrame)};
			if(WASD.keyCode==82&&BuildTimer.running==true&&Queue==-1&&Tier==3&&BuildingsA[10]==1){Queue=0;Remove1(MenuButton.currentFrame)};
			if (WASD.keyCode == 49 && BuildTimer.running == false && Iron >= 100 && BuildingsA[0]==1){
			  BuildOrder = 1;BuildTimer.delay = 5000 * (1 - (0.1 * ToolsLevel));SpecialProgress[10] = 0;BuildTimer.start();Iron-=100;Remove1(MenuButton.currentFrame);}
			if (WASD.keyCode == 50 && BuildTimer.running == false && Iron >= 50 && IronIncome > 10 && BuildingsA[1]==1){
			  BuildOrder = 2;BuildTimer.delay = 5000 * (1 - (0.1 * ToolsLevel));SpecialProgress[10] = 0;BuildTimer.start();Iron-=50;Remove1(MenuButton.currentFrame)}
			if (WASD.keyCode == 51 && BuildTimer.running == false && Iron >= 800 && ToolsLevel < 5 && BuildingsA[2]==1){BuildOrder = 3;
			  BuildTimer.delay = 5000 * (1 - (0.1 * ToolsLevel));SpecialProgress[10] = 0;BuildTimer.start();Iron-= 800;Remove1(MenuButton.currentFrame);}
			if (WASD.keyCode == 52 && BuildTimer.running == false && Iron >= 800 && BarracksLevel < 5 && BuildingsA[3]==1){BuildOrder = 4;
			  BuildTimer.delay = 5000 * (1 - (0.1 * ToolsLevel));SpecialProgress[10] = 0;BuildTimer.start();Iron-= 800;Remove1(MenuButton.currentFrame)}
			if (WASD.keyCode == 53 && BuildTimer.running == false && Iron >= 500 && ShieldLevel < 5 && BuildingsA[4]==1){BuildOrder = 5;
			  BuildTimer.delay = 5000 * (1 - (0.1 * ToolsLevel));SpecialProgress[10] = 0;BuildTimer.start();Iron-= 500;Remove1(MenuButton.currentFrame)}
			if (WASD.keyCode == 54 && BuildTimer.running == false && Iron >= 1000 && Tactics < 5 && BuildingsA[5]==1){BuildOrder = 6;
			  BuildTimer.delay = 7500 * (1 - (0.1 * ToolsLevel));SpecialProgress[10] = 0;BuildTimer.start();Iron-=1000;Remove1(MenuButton.currentFrame)}
			if (WASD.keyCode == 69 && BuildTimer.running == false && Iron >= 2000 && Tier == 1 && BuildingsA[6]==1){BuildOrder = 7;BuildTimer.delay = 15000 * (1 - (0.1 * ToolsLevel));
			  SpecialProgress[10] = 0;BuildTimer.start();Iron-= 2000;Remove1(MenuButton.currentFrame);}
			if (WASD.keyCode == 69 && BuildTimer.running == false && Iron >= 5000 && Tier == 2&&BuildingsA[7]==1){BuildOrder=7;BuildTimer.delay=20000*(1-(0.1*ToolsLevel));
			  SpecialProgress[10] = 0;BuildTimer.start();Iron-= 5000;Remove1(MenuButton.currentFrame);}
			if (WASD.keyCode == 87 && BuildTimer.running == false && Iron >= 10000 && Tier == 3 && Archmage == false&&BuildingsA[8]==1){BuildOrder = 8;
			  BuildTimer.delay = 20000 * (1 - (0.1 * ToolsLevel));SpecialProgress[10] = 0;BuildTimer.start();Iron-= 10000;Remove1(MenuButton.currentFrame);}
			if (WASD.keyCode == 69 && BuildTimer.running == false && Iron >= 10000 && Tier == 3 && Dragon == false&&BuildingsA[9]==1){BuildOrder = 9;
			  BuildTimer.delay = 20000 * (1 - (0.1 * ToolsLevel));SpecialProgress[10] = 0;BuildTimer.start();Iron-= 10000;Remove1(MenuButton.currentFrame);}
			if (WASD.keyCode == 82 && BuildTimer.running == false && Iron >= 10000 && Tier == 3 && Reaper == false&&BuildingsA[10]==1){BuildOrder = 0;
			  BuildTimer.delay = 20000 * (1 - (0.1 * ToolsLevel));SpecialProgress[10] = 0;BuildTimer.start();Iron-= 10000;Remove1(MenuButton.currentFrame);}}
			//Select-A-Slot
			if (MenuButton.currentFrame == 4 && UnitSelected == -1){
					//Cancel
					if  (WASD.keyCode == 88){Remove3(666);TrainOrder = 0}
					//Slot Selection itself
					if  (WASD.keyCode > 47 && WASD.keyCode < 58 && UnitType[WASD.keyCode - 48] == -1&&CellArray[WASD.keyCode - 48].currentFrame == 1){ SelectUnit(WASD.keyCode - 48); }
					if  (WASD.keyCode == 81 && UnitType[6] == -1 && CellArray[6].currentFrame == 1){ SelectUnit(6); }
					if  (WASD.keyCode == 87 && UnitType[7] == -1 && CellArray[7].currentFrame == 1){ SelectUnit(7); }
					if  (WASD.keyCode == 69 && UnitType[8] == -1 && CellArray[8].currentFrame == 1){ SelectUnit(8); }
					if  (WASD.keyCode == 82 && UnitType[9] == -1 && CellArray[9].currentFrame == 1){ SelectUnit(9); }
					if  (WASD.keyCode == 83 && UnitType[0] == -1 && CellArray[0].currentFrame == 1){ SelectUnit(0); }
					if  (WASD.keyCode == 68 && UnitType[0] == -1 && CellArray[0].currentFrame == 1){ SelectUnit(0); }}
			//Train Menu
			if (MenuButton.currentFrame == 3 && UnitSelected == -1){if (WASD.keyCode == 88){Remove1(MenuButton.currentFrame);};for (i = 0; i < 9 ; i++){
					if  (WASD.keyCode == UnitHotkeys[i]&&Minerals>=UnitMinerals[i]&&TrainTimer.running == false&&Tier>UnitTier[i]&&UnitsA[i]==1){
					  Calculator[4] = 0;
					  if(i < 3){for (j = 0; j < 9; j++){ if(UnitType[j] == i){ Calculator[4]++ } } }
					  if(i > 2 && i < 6){for(j = 0;j < 9; j++){ if( UnitType[j] > 2 && UnitType[j] < 6){Calculator[4]++} } }
					  if(i > 5 && i < 9){for(j = 0;j < 9; j++){ if( UnitType[j] > 5 && UnitType[j] < 9){Calculator[4]++} } }
					  if(i > 8){for(j = 0;j < 9; j++){ if( UnitType[j] > 8){Calculator[4]++} } }
					  if(i==0){if(Calculator[4]<5){Calculator[4]=-1}else{Calculator[4]=-2}};if(i==1){if(Calculator[4]<3){Calculator[4]=-1}else{Calculator[4]=-2}}
					  if(i==2){if(Calculator[4]<5){Calculator[4]=-1}else{Calculator[4]=-2}};if(i>2&&i<6){if(Calculator[4]<4){Calculator[4]=-1}else{Calculator[4]=-2}}
					  if(Calculator[4]>-2){Remove4(MenuButton.currentFrame); TrainOrder = i;}}}
						  if(i>5&&i<9){if(Calculator[4]<2){Calculator[4]=-1}else{Calculator[4]=-2}};
				if  (WASD.keyCode == 65 && Minerals > 4000 && TrainTimer.running == false && Archmage == true){
					  Calculator[4] = 0; for(i=0;i<9;i++){if(UnitType[i]>8){Calculator[4]=1}};
					  if(Calculator[4]==0){Remove4(MenuButton.currentFrame);TrainOrder = 9;}}
					if  (WASD.keyCode == 68 && Minerals > 4000 && TrainTimer.running == false && Dragon == true){
					  Calculator[4] = 0;for(i=0;i<9;i++){if(UnitType[i]>8){Calculator[4]=1}};
					  if(Calculator[4]==0){Remove4(MenuButton.currentFrame);TrainOrder = 10;}}
					if  (WASD.keyCode == 82 && Minerals > 4000 && TrainTimer.running == false && Reaper == true){
					  Calculator[4] = 0;for(i=0;i<9;i++){if(UnitType[i]>8){Calculator[4]=1}};if(Calculator[4]==0){Remove4(MenuButton.currentFrame);
					  TrainOrder = 11;}}
			}}
		//Mouse Controls
		//Friendly Units
		function ClickF0(wut:MouseEvent){var ClickNum:int=0
			if(UnitType[UnitSelected]==1&&UnitSelected!=ClickNum){AutoAttack(ClickNum);if(SavedData.data.Sticky==0){
				UnitSelected=-1;Remove1(MenuButton.currentFrame);}};
			if(UnitSelected==ClickNum&&SpecialActive==false&&SpecialAttacks[ClickNum].running==false){
				if(UnitType[UnitSelected]==1||UnitType[UnitSelected]==2||UnitType[UnitSelected]==4||UnitType[UnitSelected]==7||UnitType[UnitSelected]==6){
					SpecialAttack(0);return;}else{SpecialActive=true;Remove4(MenuButton.currentFrame);return;}}
				if(SpecialActive==true&&(UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)){SpecialAttack(ClickNum)}
				if(UnitSelected!=ClickNum&&UnitType[UnitSelected]!=1&&SpecialActive==false){UnitSelected=ClickNum;Remove5(MenuButton.currentFrame);return;}}
		function ClickF1(wut:MouseEvent){var ClickNum:int=1
			if(UnitType[UnitSelected]==1&&UnitSelected!=ClickNum){AutoAttack(ClickNum);if(SavedData.data.Sticky==0){
				UnitSelected=-1;Remove1(MenuButton.currentFrame);return;}};
			if(UnitSelected==ClickNum&&SpecialActive==false&&SpecialAttacks[ClickNum].running==false){
				if(UnitType[UnitSelected]==1||UnitType[UnitSelected]==2||UnitType[UnitSelected]==4||UnitType[UnitSelected]==7||UnitType[UnitSelected]==6){
					SpecialAttack(0);return;}else{SpecialActive=true;Remove4(MenuButton.currentFrame);return;}}
				if(SpecialActive==true&&(UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)){SpecialAttack(ClickNum)}
				if(UnitSelected!=ClickNum&&UnitType[UnitSelected]!=1&&SpecialActive==false){UnitSelected=ClickNum;Remove5(MenuButton.currentFrame);return;}}
		function ClickF2(wut:MouseEvent){var ClickNum:int=2
			if(UnitType[UnitSelected]==1&&UnitSelected!=ClickNum){AutoAttack(ClickNum);if(SavedData.data.Sticky==0){
				UnitSelected=-1;Remove1(MenuButton.currentFrame);return;}};
			if(UnitSelected==ClickNum&&SpecialActive==false&&SpecialAttacks[ClickNum].running==false){
				if(UnitType[UnitSelected]==1||UnitType[UnitSelected]==2||UnitType[UnitSelected]==4||UnitType[UnitSelected]==7||UnitType[UnitSelected]==6){
					SpecialAttack(0);return;}else{SpecialActive=true;Remove4(MenuButton.currentFrame);return;}}
				if(SpecialActive==true&&(UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)){SpecialAttack(ClickNum)}
				if(UnitSelected!=ClickNum&&UnitType[UnitSelected]!=1&&SpecialActive==false){UnitSelected=ClickNum;Remove5(MenuButton.currentFrame);return;}}
		function ClickF3(wut:MouseEvent){var ClickNum:int=3
			if(UnitType[UnitSelected]==1&&UnitSelected!=ClickNum){AutoAttack(ClickNum);if(SavedData.data.Sticky==0){
				UnitSelected=-1;Remove1(MenuButton.currentFrame);return;}};
			if(UnitSelected==ClickNum&&SpecialActive==false&&SpecialAttacks[ClickNum].running==false){
				if(UnitType[UnitSelected]==1||UnitType[UnitSelected]==2||UnitType[UnitSelected]==4||UnitType[UnitSelected]==7||UnitType[UnitSelected]==6){
					SpecialAttack(0);return;}else{SpecialActive=true;Remove4(MenuButton.currentFrame);return;}}
				if(SpecialActive==true&&(UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)){SpecialAttack(ClickNum)}
				if(UnitSelected!=ClickNum&&UnitType[UnitSelected]!=1&&SpecialActive==false){UnitSelected=ClickNum;Remove5(MenuButton.currentFrame);return;}}
		function ClickF4(wut:MouseEvent){var ClickNum:int=4
			if(UnitType[UnitSelected]==1&&UnitSelected!=ClickNum){AutoAttack(ClickNum);if(SavedData.data.Sticky==0){
				UnitSelected=-1;Remove1(MenuButton.currentFrame);return;}};
			if(UnitSelected==ClickNum&&SpecialActive==false&&SpecialAttacks[ClickNum].running==false){
				if(UnitType[UnitSelected]==1||UnitType[UnitSelected]==2||UnitType[UnitSelected]==4||UnitType[UnitSelected]==7||UnitType[UnitSelected]==6){
					SpecialAttack(0);return;}else{SpecialActive=true;Remove4(MenuButton.currentFrame);return;}}
				if(SpecialActive==true&&(UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)){SpecialAttack(ClickNum)}
				if(UnitSelected!=ClickNum&&UnitType[UnitSelected]!=1&&SpecialActive==false){UnitSelected=ClickNum;Remove5(MenuButton.currentFrame);return;}}
		function ClickF5(wut:MouseEvent){var ClickNum:int=5
			if(UnitType[UnitSelected]==1&&UnitSelected!=ClickNum){AutoAttack(ClickNum);if(SavedData.data.Sticky==0){
				UnitSelected=-1;Remove1(MenuButton.currentFrame);return;}};
			if(UnitSelected==ClickNum&&SpecialActive==false&&SpecialAttacks[ClickNum].running==false){
				if(UnitType[UnitSelected]==1||UnitType[UnitSelected]==2||UnitType[UnitSelected]==4||UnitType[UnitSelected]==7||UnitType[UnitSelected]==6){
					SpecialAttack(0);return;}else{SpecialActive=true;Remove4(MenuButton.currentFrame);return;}}
				if(SpecialActive==true&&(UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)){SpecialAttack(ClickNum)}
				if(UnitSelected!=ClickNum&&UnitType[UnitSelected]!=1&&SpecialActive==false){UnitSelected=ClickNum;Remove5(MenuButton.currentFrame);return;}}
		function ClickF6(wut:MouseEvent){var ClickNum:int=6
			if(UnitType[UnitSelected]==1&&UnitSelected!=ClickNum){AutoAttack(ClickNum);if(SavedData.data.Sticky==0){
				UnitSelected=-1;Remove1(MenuButton.currentFrame);return;}};
			if(UnitSelected==ClickNum&&SpecialActive==false&&SpecialAttacks[ClickNum].running==false){
				if(UnitType[UnitSelected]==1||UnitType[UnitSelected]==2||UnitType[UnitSelected]==4||UnitType[UnitSelected]==7||UnitType[UnitSelected]==6){
					SpecialAttack(0);return;}else{SpecialActive=true;Remove4(MenuButton.currentFrame);return;}}
				if(SpecialActive==true&&(UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)){SpecialAttack(ClickNum)}
				if(UnitSelected!=ClickNum&&UnitType[UnitSelected]!=1&&SpecialActive==false){UnitSelected=ClickNum;Remove5(MenuButton.currentFrame);return;}}
		function ClickF7(wut:MouseEvent){var ClickNum:int=7
			if(UnitType[UnitSelected]==1&&UnitSelected!=ClickNum){AutoAttack(ClickNum);if(SavedData.data.Sticky==0){
				UnitSelected=-1;Remove1(MenuButton.currentFrame);return;}};
			if(UnitSelected==ClickNum&&SpecialActive==false&&SpecialAttacks[ClickNum].running==false){
				if(UnitType[UnitSelected]==1||UnitType[UnitSelected]==2||UnitType[UnitSelected]==4||UnitType[UnitSelected]==7||UnitType[UnitSelected]==6){
					SpecialAttack(0);return;}else{SpecialActive=true;Remove4(MenuButton.currentFrame);return;}}
				if(SpecialActive==true&&(UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)){SpecialAttack(ClickNum)}
				if(UnitSelected!=ClickNum&&UnitType[UnitSelected]!=1&&SpecialActive==false){UnitSelected=ClickNum;Remove5(MenuButton.currentFrame);return;}}
		function ClickF8(wut:MouseEvent){var ClickNum:int=8
			if(UnitType[UnitSelected]==1&&UnitSelected!=ClickNum){AutoAttack(ClickNum);if(SavedData.data.Sticky==0){
				UnitSelected=-1;Remove1(MenuButton.currentFrame);return;}};
			if(UnitSelected==ClickNum&&SpecialActive==false&&SpecialAttacks[ClickNum].running==false){
				if(UnitType[UnitSelected]==1||UnitType[UnitSelected]==2||UnitType[UnitSelected]==4||UnitType[UnitSelected]==7||UnitType[UnitSelected]==6){
					SpecialAttack(0);return;}else{SpecialActive=true;Remove4(MenuButton.currentFrame);return;}}
				if(SpecialActive==true&&(UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)){SpecialAttack(ClickNum)}
				if(UnitSelected!=ClickNum&&UnitType[UnitSelected]!=1&&SpecialActive==false){UnitSelected=ClickNum;Remove5(MenuButton.currentFrame);return;}}
		function ClickF9(wut:MouseEvent){var ClickNum:int=9
			if(UnitType[UnitSelected]==1&&UnitSelected!=ClickNum){AutoAttack(ClickNum);if(SavedData.data.Sticky==0){
				UnitSelected=-1;Remove1(MenuButton.currentFrame);return;}};
			if(UnitSelected==ClickNum&&SpecialActive==false&&SpecialAttacks[ClickNum].running==false){
				if(UnitType[UnitSelected]==1||UnitType[UnitSelected]==2||UnitType[UnitSelected]==4||UnitType[UnitSelected]==7||UnitType[UnitSelected]==6){
					SpecialAttack(0);return;}else{SpecialActive=true;Remove4(MenuButton.currentFrame);return;}}
				if(SpecialActive==true&&(UnitType[UnitSelected]==9||UnitType[UnitSelected]==11)){SpecialAttack(ClickNum)}
				if(UnitSelected!=ClickNum&&UnitType[UnitSelected]!=1&&SpecialActive==false){UnitSelected=ClickNum;Remove5(MenuButton.currentFrame);return;}}
		//Disselect
		function Disselect(l:MouseEvent){if(MenuButton.currentFrame!=1){UnitSelected=-1;Remove1(MenuButton.currentFrame)}Moving=false;SpecialActive=false};
		//Enemy Units
		function ClickE0(wassa:MouseEvent){var ClickNum = 0;
			if(UnitSelected==-1){for(o=0;o<10;o++){UnitSelected=o;if(UnitType[o]!=1&&UnitType[o]!=-1){Calculator[1]=Calculate(ClickNum);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum);}}};UnitSelected=-1;return;}
			if(UnitType[UnitSelected]>-1&&SpecialActive==false){Calculator[1]=Calculate(ClickNum);
			if(Calculator[1]<=UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum)}}
			if(UnitType[UnitSelected]>-1&&SpecialActive==true&&UnitType[UnitSelected]!=9&&UnitType[UnitSelected]!=11){
				if(UnitType[UnitSelected]==-1){UnitSelected=-1}else{SpecialAttack(ClickNum)}}}
		function ClickE1(wassa:MouseEvent){var ClickNum = 1;
			if(UnitSelected==-1){for(o=0;o<10;o++){UnitSelected=o;if(UnitType[o]!=1&&UnitType[o]!=-1){Calculator[1]=Calculate(ClickNum);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum);}}};UnitSelected=-1;return;}
			if(UnitType[UnitSelected]>-1&&SpecialActive==false){Calculator[1]=Calculate(ClickNum);
			if(Calculator[1]<=UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum)}}
			if(UnitType[UnitSelected]>-1&&SpecialActive==true&&UnitType[UnitSelected]!=9&&UnitType[UnitSelected]!=11){
				if(UnitType[UnitSelected]==-1){UnitSelected=-1}else{SpecialAttack(ClickNum)}}}
		function ClickE2(wassa:MouseEvent){var ClickNum = 2;
			if(UnitSelected==-1){for(o=0;o<10;o++){UnitSelected=o;if(UnitType[o]!=1&&UnitType[o]!=-1){Calculator[1]=Calculate(ClickNum);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum);}}};UnitSelected=-1;return;}
			if(UnitType[UnitSelected]>-1&&SpecialActive==false){Calculator[1]=Calculate(ClickNum);
			if(Calculator[1]<=UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum)}}
			if(UnitType[UnitSelected]>-1&&SpecialActive==true&&UnitType[UnitSelected]!=9&&UnitType[UnitSelected]!=11){
				if(UnitType[UnitSelected]==-1){UnitSelected=-1}else{SpecialAttack(ClickNum)}}}
		function ClickE3(wassa:MouseEvent){var ClickNum = 3;
			if(UnitSelected==-1){for(o=0;o<10;o++){UnitSelected=o;if(UnitType[o]!=1&&UnitType[o]!=-1){Calculator[1]=Calculate(ClickNum);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum);}}};UnitSelected=-1;return;}
			if(UnitType[UnitSelected]>-1&&SpecialActive==false){Calculator[1]=Calculate(ClickNum);
			if(Calculator[1]<=UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum)}}
			if(UnitType[UnitSelected]>-1&&SpecialActive==true&&UnitType[UnitSelected]!=9&&UnitType[UnitSelected]!=11){
				if(UnitType[UnitSelected]==-1){UnitSelected=-1}else{SpecialAttack(ClickNum)}}}
		function ClickE4(wassa:MouseEvent){var ClickNum = 4;
			if(UnitSelected==-1){for(o=0;o<10;o++){UnitSelected=o;if(UnitType[o]!=1&&UnitType[o]!=-1){Calculator[1]=Calculate(ClickNum);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum);}}};UnitSelected=-1;return;}
			if(UnitType[UnitSelected]>-1&&SpecialActive==false){Calculator[1]=Calculate(ClickNum);
			if(Calculator[1]<=UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum)}}
			if(UnitType[UnitSelected]>-1&&SpecialActive==true&&UnitType[UnitSelected]!=9&&UnitType[UnitSelected]!=11){
				if(UnitType[UnitSelected]==-1){UnitSelected=-1}else{SpecialAttack(ClickNum)}}}
		function ClickE5(wassa:MouseEvent){var ClickNum = 5;
			if(UnitSelected==-1){for(o=0;o<10;o++){UnitSelected=o;if(UnitType[o]!=1&&UnitType[o]!=-1){Calculator[1]=Calculate(ClickNum);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum);}}};UnitSelected=-1;return;}
			if(UnitType[UnitSelected]>-1&&SpecialActive==false){Calculator[1]=Calculate(ClickNum);
			if(Calculator[1]<=UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum)}}
			if(UnitType[UnitSelected]>-1&&SpecialActive==true&&UnitType[UnitSelected]!=9&&UnitType[UnitSelected]!=11){
				if(UnitType[UnitSelected]==-1){UnitSelected=-1}else{SpecialAttack(ClickNum)}}}
		function ClickE6(wassa:MouseEvent){var ClickNum = 6;
			if(UnitSelected==-1){for(o=0;o<10;o++){UnitSelected=o;if(UnitType[o]!=1&&UnitType[o]!=-1){Calculator[1]=Calculate(ClickNum);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum);}}};UnitSelected=-1;return;}
			if(UnitType[UnitSelected]>-1&&SpecialActive==false){Calculator[1]=Calculate(ClickNum);
			if(Calculator[1]<=UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum)}}
			if(UnitType[UnitSelected]>-1&&SpecialActive==true&&UnitType[UnitSelected]!=9&&UnitType[UnitSelected]!=11){
				if(UnitType[UnitSelected]==-1){UnitSelected=-1}else{SpecialAttack(ClickNum)}}}
		function ClickE7(wassa:MouseEvent){var ClickNum = 7;
			if(UnitSelected==-1){for(o=0;o<10;o++){UnitSelected=o;if(UnitType[o]!=1&&UnitType[o]!=-1){Calculator[1]=Calculate(ClickNum);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum);}}};UnitSelected=-1;return;}
			if(UnitType[UnitSelected]>-1&&SpecialActive==false){Calculator[1]=Calculate(ClickNum);
			if(Calculator[1]<=UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum)}}
			if(UnitType[UnitSelected]>-1&&SpecialActive==true&&UnitType[UnitSelected]!=9&&UnitType[UnitSelected]!=11){
				if(UnitType[UnitSelected]==-1){UnitSelected=-1}else{SpecialAttack(ClickNum)}}}
		function ClickE8(wassa:MouseEvent){var ClickNum = 8;
			if(UnitSelected==-1){for(o=0;o<10;o++){UnitSelected=o;if(UnitType[o]!=1&&UnitType[o]!=-1){Calculator[1]=Calculate(ClickNum);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum);}}};UnitSelected=-1;return;}
			if(UnitType[UnitSelected]>-1&&SpecialActive==false){Calculator[1]=Calculate(ClickNum);
			if(Calculator[1]<=UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum)}}
			if(UnitType[UnitSelected]>-1&&SpecialActive==true&&UnitType[UnitSelected]!=9&&UnitType[UnitSelected]!=11){
				if(UnitType[UnitSelected]==-1){UnitSelected=-1}else{SpecialAttack(ClickNum)}}}
		function ClickE9(wassa:MouseEvent){var ClickNum = 9;
			if(UnitSelected==-1){for(o=0;o<10;o++){UnitSelected=o;if(UnitType[o]!=1&&UnitType[o]!=-1){Calculator[1]=Calculate(ClickNum);
					  if(Calculator[1] < UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum);}}};UnitSelected=-1;return;}
			if(UnitType[UnitSelected]>-1&&SpecialActive==false){Calculator[1]=Calculate(ClickNum);if(Calculator[1]<=UnitRange[UnitType[UnitSelected]]){AutoAttack(ClickNum)}}
			if(UnitType[UnitSelected]>-1&&SpecialActive==true&&UnitType[UnitSelected]!=9&&UnitType[UnitSelected]!=11){
				if(UnitType[UnitSelected]==-1){UnitSelected=-1}else{SpecialAttack(ClickNum)}}}
		//Cells
		function ClickC0(a:MouseEvent){var ClickNum = 0;
			if(MenuButton.currentFrame==4&&UnitSelected==-1&&UnitType[ClickNum]==-1&&CellArray[ClickNum].currentFrame==1){SelectUnit(ClickNum);}
			if(UnitSelected>-1&&UnitSelected!=ClickNum&&AutoAttacks[UnitSelected].running==false&&CellArray[ClickNum].currentFrame==1){Move(ClickNum);return}}
		function ClickC1(a:MouseEvent){var ClickNum = 1;
		if(MenuButton.currentFrame==4&&UnitSelected==-1&&UnitType[ClickNum]==-1&&CellArray[ClickNum].currentFrame==1){SelectUnit(ClickNum);}
			if(UnitSelected>-1&&UnitSelected!=ClickNum&&AutoAttacks[UnitSelected].running==false&&CellArray[ClickNum].currentFrame==1){Move(ClickNum);return}}
		function ClickC2(a:MouseEvent){var ClickNum = 2;
		if(MenuButton.currentFrame==4&&UnitSelected==-1&&UnitType[ClickNum]==-1&&CellArray[ClickNum].currentFrame==1){SelectUnit(ClickNum);}
			if(UnitSelected>-1&&UnitSelected!=ClickNum&&AutoAttacks[UnitSelected].running==false&&CellArray[ClickNum].currentFrame==1){Move(ClickNum);return}}
		function ClickC3(a:MouseEvent){var ClickNum = 3;
		if(MenuButton.currentFrame==4&&UnitSelected==-1&&UnitType[ClickNum]==-1&&CellArray[ClickNum].currentFrame==1){SelectUnit(ClickNum);}
			if(UnitSelected>-1&&UnitSelected!=ClickNum&&AutoAttacks[UnitSelected].running==false&&CellArray[ClickNum].currentFrame==1){Move(ClickNum);return}}
		function ClickC4(a:MouseEvent){var ClickNum = 4;
		if(MenuButton.currentFrame==4&&UnitSelected==-1&&UnitType[ClickNum]==-1&&CellArray[ClickNum].currentFrame==1){SelectUnit(ClickNum);}
			if(UnitSelected>-1&&UnitSelected!=ClickNum&&AutoAttacks[UnitSelected].running==false&&CellArray[ClickNum].currentFrame==1){Move(ClickNum);return}}
		function ClickC5(a:MouseEvent){var ClickNum = 5;
		if(MenuButton.currentFrame==4&&UnitSelected==-1&&UnitType[ClickNum]==-1&&CellArray[ClickNum].currentFrame==1){SelectUnit(ClickNum);}
			if(UnitSelected>-1&&UnitSelected!=ClickNum&&AutoAttacks[UnitSelected].running==false&&CellArray[ClickNum].currentFrame==1){Move(ClickNum);return}}
		function ClickC6(a:MouseEvent){var ClickNum = 6;
		if(MenuButton.currentFrame==4&&UnitSelected==-1&&UnitType[ClickNum]==-1&&CellArray[ClickNum].currentFrame==1){SelectUnit(ClickNum);}
			if(UnitSelected>-1&&UnitSelected!=ClickNum&&AutoAttacks[UnitSelected].running==false&&CellArray[ClickNum].currentFrame==1){Move(ClickNum);return}}
		function ClickC7(a:MouseEvent){var ClickNum = 7;
		if(MenuButton.currentFrame==4&&UnitSelected==-1&&UnitType[ClickNum]==-1&&CellArray[ClickNum].currentFrame==1){SelectUnit(ClickNum);}
			if(UnitSelected>-1&&UnitSelected!=ClickNum&&AutoAttacks[UnitSelected].running==false&&CellArray[ClickNum].currentFrame==1){Move(ClickNum);return}}
		function ClickC8(a:MouseEvent){var ClickNum = 8;
		if(MenuButton.currentFrame==4&&UnitSelected==-1&&UnitType[ClickNum]==-1&&CellArray[ClickNum].currentFrame==1){SelectUnit(ClickNum);}
			if(UnitSelected>-1&&UnitSelected!=ClickNum&&AutoAttacks[UnitSelected].running==false&&CellArray[ClickNum].currentFrame==1){Move(ClickNum);return}}
		function ClickC9(a:MouseEvent){var ClickNum = 9;
		if(MenuButton.currentFrame==4&&UnitSelected==-1&&UnitType[ClickNum]==-1&&CellArray[ClickNum].currentFrame==1){SelectUnit(ClickNum);}
			if(UnitSelected>-1&&UnitSelected!=ClickNum&&AutoAttacks[UnitSelected].running==false&&CellArray[ClickNum].currentFrame==1){Move(ClickNum);return}}
		//Main Menu
		function BuildClick (squeaky:MouseEvent){if(MenuButton.currentFrame==1){Remove2(1)}}
		function TrainClick (squeaky:MouseEvent){if(MenuButton.currentFrame==1){Remove3(0);}}
		//Build Menu
		function BMiners(w:int){var ClickNum:int = 0
			if(BuildTimer.running==true&&Queue==-1&&BuildingsA[ClickNum]==1){Queue=ClickNum+1;Remove1(MenuButton.currentFrame);}if(BuildTimer.running==false&&BuildingsA[ClickNum]==1&&Iron>=100){
				BuildOrder=ClickNum+1;BuildTimer.delay=BuildingTimer[ClickNum+1]*(1-(0.1*ToolsLevel));SpecialProgress[10]=0;BuildTimer.start();Iron-=100;Remove1(MenuButton.currentFrame);}}
		function BFactory(w:int){var ClickNum:int = 1
			if(BuildTimer.running==true&&Queue==-1&&BuildingsA[ClickNum]==1){Queue=ClickNum+1;Remove1(MenuButton.currentFrame);}
			if(BuildTimer.running==false&&BuildingsA[ClickNum]==1&&Iron >= 50 && IronIncome > 10){
				BuildOrder=ClickNum+1;BuildTimer.delay=BuildingTimer[ClickNum+1]*(1-(0.1*ToolsLevel));SpecialProgress[10]=0;BuildTimer.start();Iron-=50;Remove1(MenuButton.currentFrame);}}
		function BTools(w:int){var ClickNum:int = 2
			if(BuildTimer.running==true&&Queue==-1&&BuildingsA[ClickNum]==1){Queue=ClickNum+1;Remove1(MenuButton.currentFrame);}
			if(BuildTimer.running==false&&BuildingsA[ClickNum]==1&& Iron >= 800 && ToolsLevel < 5){
				BuildOrder=ClickNum+1;BuildTimer.delay=BuildingTimer[ClickNum+1]*(1-(0.1*ToolsLevel));SpecialProgress[10]=0;BuildTimer.start();Iron-=800;Remove1(MenuButton.currentFrame);}}
		function BRax(w:int){var ClickNum:int = 3
			if(BuildTimer.running==true&&Queue==-1&&BuildingsA[ClickNum]==1){Queue=ClickNum+1;Remove1(MenuButton.currentFrame);}
			if(BuildTimer.running==false&&BuildingsA[ClickNum]==1&& Iron >= 800 && BarracksLevel < 5){
				BuildOrder=ClickNum+1;BuildTimer.delay=BuildingTimer[ClickNum+1]*(1-(0.1*ToolsLevel));SpecialProgress[10]=0;BuildTimer.start();Iron-=800;Remove1(MenuButton.currentFrame);}}
		function BShields(w:int){var ClickNum:int = 4
			if(BuildTimer.running==true&&Queue==-1&&BuildingsA[ClickNum]==1){Queue=ClickNum+1;Remove1(MenuButton.currentFrame);}
			if(BuildTimer.running==false&&BuildingsA[ClickNum]==1&& Iron >= 500 && ShieldLevel < 5){
				BuildOrder=ClickNum+1;BuildTimer.delay=BuildingTimer[ClickNum+1]*(1-(0.1*ToolsLevel));SpecialProgress[10]=0;BuildTimer.start();Iron-=500;Remove1(MenuButton.currentFrame);}}
		function BTactics(w:int){var ClickNum:int = 5
			if(BuildTimer.running==true&&Queue==-1&&BuildingsA[ClickNum]==1){Queue=ClickNum+1;Remove1(MenuButton.currentFrame);}
			if(BuildTimer.running==false&&BuildingsA[ClickNum]==1&& Iron >= 1000 && Tactics < 5){
				BuildOrder=ClickNum+1;BuildTimer.delay=BuildingTimer[ClickNum+1]*(1-(0.1*ToolsLevel));SpecialProgress[10]=0;BuildTimer.start();Iron-=1000;Remove1(MenuButton.currentFrame);}}
		function BTier(k:int){var ClickNum:int = 6
		if(BuildTimer.running==true&&Queue==-1&&BuildingsA[ClickNum]==1&&Tier==1){Queue=ClickNum+1;Remove1(MenuButton.currentFrame);}
		if(BuildTimer.running==true&&Queue==-1&&BuildingsA[ClickNum+1]==1&&Tier==2){Queue=ClickNum+1;Remove1(MenuButton.currentFrame)}
			if(BuildTimer.running==false&&BuildingsA[ClickNum]==1&& Iron >= 2000 && Tier==1){
				BuildOrder=ClickNum+1;BuildTimer.delay=BuildingTimer[ClickNum+1]*(1-(0.1*ToolsLevel));SpecialProgress[10]=0;BuildTimer.start();Iron-=2000;Remove1(MenuButton.currentFrame);}
			if(BuildTimer.running==false&&BuildingsA[ClickNum+1]==1&& Iron >= 5000 && Tier==2){
				BuildOrder=ClickNum+1;BuildTimer.delay=BuildingTimer[ClickNum+1]*(1-(0.1*ToolsLevel));SpecialProgress[10]=0;BuildTimer.start();Iron-=5000;Remove1(MenuButton.currentFrame);}}
		function BLibrary(w:int){var ClickNum:int = 7
			if(BuildTimer.running==true&&Queue==-1&&BuildingsA[ClickNum]==1){Queue=ClickNum+1;Remove1(MenuButton.currentFrame);}
			if(BuildTimer.running==false&&BuildingsA[ClickNum]==1&& Iron >= 10000 && Tier==3&&Archmage==false){
				BuildOrder=ClickNum+1;BuildTimer.delay=BuildingTimer[ClickNum+1]*(1-(0.1*ToolsLevel));SpecialProgress[10]=0;BuildTimer.start();Iron-=10000;Remove1(MenuButton.currentFrame);}}
		function BDraco(w:int){var ClickNum:int = 8
			if(BuildTimer.running==true&&Queue==-1&&BuildingsA[ClickNum]==1){Queue=ClickNum+1;Remove1(MenuButton.currentFrame);}
			if(BuildTimer.running==false&&BuildingsA[ClickNum]==1&& Iron >= 10000 && Tier==3&&Dragon==false){
				BuildOrder=ClickNum+1;BuildTimer.delay=BuildingTimer[ClickNum+1]*(1-(0.1*ToolsLevel));SpecialProgress[10]=0;BuildTimer.start();Iron-=10000;Remove1(MenuButton.currentFrame);}}
		function BRitual(w:int){var ClickNum:int = 9
			if(BuildTimer.running==true&&Queue==-1&&BuildingsA[ClickNum]==1){Queue=ClickNum+1;Remove1(MenuButton.currentFrame);}
			if(BuildTimer.running==false&&BuildingsA[ClickNum]==1&& Iron >= 10000 && Tier==3&&Reaper==false){
				BuildOrder=ClickNum+1;BuildTimer.delay=BuildingTimer[ClickNum+1]*(1-(0.1*ToolsLevel));SpecialProgress[10]=0;BuildTimer.start();Iron-=10000;Remove1(MenuButton.currentFrame);}}
		//Train Menu
		function Train0(E:MouseEvent){var ClickNum = 0
			if(Tier>UnitTier[ClickNum]&&Minerals>=UnitMinerals[ClickNum]&&TrainTimer.running==false){Calculator[4]=0;
			for(i=0;i<10;i++){if(UnitType[i]==ClickNum){Calculator[4]++}};if(Calculator[4]<5){Remove4(MenuButton.currentFrame);TrainOrder=ClickNum}}}
		function Train1(E:MouseEvent){var ClickNum = 1
			if(Tier>UnitTier[ClickNum]&&Minerals>=UnitMinerals[ClickNum]&&TrainTimer.running==false){Calculator[4]=0;
			for(i=0;i<10;i++){if(UnitType[i]==ClickNum){Calculator[4]++}};if(Calculator[4]<3){Remove4(MenuButton.currentFrame);TrainOrder=ClickNum}}}
		function Train2(E:MouseEvent){var ClickNum = 2
			if(Tier>UnitTier[ClickNum]&&Minerals>=UnitMinerals[ClickNum]&&TrainTimer.running==false){Calculator[4]=0;
			for(i=0;i<10;i++){if(UnitType[i]==ClickNum){Calculator[4]++}};if(Calculator[4]<5){Remove4(MenuButton.currentFrame);TrainOrder=ClickNum}}}
		function Train3(E:MouseEvent){var ClickNum = 3
			if(Tier>UnitTier[ClickNum]&&Minerals>=UnitMinerals[ClickNum]&&TrainTimer.running==false){Calculator[4]=0;
			for(i=0;i<10;i++){if(UnitType[i]==3||UnitType[i]==4||UnitType[i]==5){Calculator[4]++}};if(Calculator[4]<4){Remove4(MenuButton.currentFrame);TrainOrder=ClickNum}}}
		function Train4(E:MouseEvent){var ClickNum = 4
			if(Tier>UnitTier[ClickNum]&&Minerals>=UnitMinerals[ClickNum]&&TrainTimer.running==false){Calculator[4]=0;
			for(i=0;i<10;i++){if(UnitType[i]==3||UnitType[i]==4||UnitType[i]==5){Calculator[4]++}};if(Calculator[4]<4){Remove4(MenuButton.currentFrame);TrainOrder=ClickNum}}}
		function Train5(E:MouseEvent){var ClickNum = 5
			if(Tier>UnitTier[ClickNum]&&Minerals>=UnitMinerals[ClickNum]&&TrainTimer.running==false){Calculator[4]=0;
			for(i=0;i<10;i++){if(UnitType[i]==3||UnitType[i]==4||UnitType[i]==5){Calculator[4]++}};if(Calculator[4]<4){Remove4(MenuButton.currentFrame);TrainOrder=ClickNum}}}
		function Train6(E:MouseEvent){var ClickNum = 6
			if(Tier>UnitTier[ClickNum]&&Minerals>=UnitMinerals[ClickNum]&&TrainTimer.running==false){Calculator[4]=0;
			for(i=0;i<10;i++){if(UnitType[i]==6||UnitType[i]==7||UnitType[i]==8){Calculator[4]++}};if(Calculator[4]<2){Remove4(MenuButton.currentFrame);TrainOrder=ClickNum}}}
		function Train7(E:MouseEvent){var ClickNum = 7
			if(Tier>UnitTier[ClickNum]&&Minerals>=UnitMinerals[ClickNum]&&TrainTimer.running==false){Calculator[4]=0;
			for(i=0;i<10;i++){if(UnitType[i]==6||UnitType[i]==7||UnitType[i]==8){Calculator[4]++}};if(Calculator[4]<2){Remove4(MenuButton.currentFrame);TrainOrder=ClickNum}}}
		function Train8(E:MouseEvent){var ClickNum = 8
			if(Tier>UnitTier[ClickNum]&&Minerals>=UnitMinerals[ClickNum]&&TrainTimer.running==false){Calculator[4]=0;
			for(i=0;i<10;i++){if(UnitType[i]==6||UnitType[i]==7||UnitType[i]==8){Calculator[4]++}};if(Calculator[4]<2){Remove4(MenuButton.currentFrame);TrainOrder=ClickNum}}}
		function Train9(E:MouseEvent){var ClickNum = 9
			if(Tier>UnitTier[ClickNum]&&Minerals>=UnitMinerals[ClickNum]&&TrainTimer.running==false){Calculator[4]=0;for(i=0;i<10;i++){
				if(UnitType[i]==9||UnitType[i]==10||UnitType[i]==11){Calculator[4]++}};if(Calculator[4]<1&&Archmage==true){Remove4(MenuButton.currentFrame);TrainOrder=ClickNum}}}
		function Train10(E:MouseEvent){var ClickNum = 10
			if(Tier>UnitTier[ClickNum]&&Minerals>=UnitMinerals[ClickNum]&&TrainTimer.running==false){Calculator[4]=0;for(i=0;i<10;i++){
				if(UnitType[i]==9||UnitType[i]==10||UnitType[i]==11){Calculator[4]++}};if(Calculator[4]<1&&Dragon==true){Remove4(MenuButton.currentFrame);TrainOrder=ClickNum}}}
		function Train11(E:MouseEvent){var ClickNum = 11
			if(Tier>UnitTier[ClickNum]&&Minerals>=UnitMinerals[ClickNum]&&TrainTimer.running==false){Calculator[4]=0;for(i=0;i<10;i++){
				if(UnitType[i]==9||UnitType[i]==10||UnitType[i]==11){Calculator[4]++}};if(Calculator[4]<1&&Reaper==true){Remove4(MenuButton.currentFrame);TrainOrder=ClickNum}}}
		//Unit Control Menu
		function CDecom(E:MouseEvent){
			if (AutoAttacks[UnitSelected].running == false) {
			UnitTarget[UnitSelected] = 10;AutoAttacks[UnitSelected].delay = 5000;AutoAttackMax[UnitSelected] = 5000;AutoAttacks[UnitSelected].start();
			if(UnitType[UnitSelected] == 2){UnitType[UnitSelected] = -3} else { UnitType[UnitSelected] = -2; }
			UnitSelected = -1; Remove1(MenuButton.currentFrame)}}
		function CStop(E:MouseEvent){
			Remove1(MenuButton.currentFrame);if(UnitType[UnitSelected] == 6 || UnitType[UnitSelected] == 2 ||(UnitType[UnitSelected] == 1 && AutoAttacks[UnitSelected].delay == 1800)){
			AutoAttacks[UnitSelected].stop()}if(UnitType[UnitSelected] == 3 && AutoAttacks[UnitSelected].delay < 510){
			AutoAttacks[UnitSelected].stop(); AutoAttacks[UnitSelected].delay = 3000;
			AutoAttackMax[UnitSelected] = 3000; AutoAttackCurrent[UnitSelected] = 0; AutoAttacks[UnitSelected].start();}
			if(UnitType[UnitSelected] == 11 && AutoAttacks[UnitSelected].delay < 1006){
				Calculator[6] = 1000000*((AutoAttacks[UnitSelected].delay/1000)-int(AutoAttacks[UnitSelected].delay/1000))
				AutoAttacks[UnitSelected].delay=Calculator[6]; AutoAttackMax[UnitSelected]=Calculator[6];AutoAttackCurrent[UnitSelected]=0;AutoAttacks[UnitSelected].start();}
			UnitTarget[UnitSelected] = -1;
			if(SavedData.data.Sticky==0){Remove1(MenuButton.currentFrame);UnitSelected=-1;}else{Remove5(MenuButton.currentFrame)}}
		//Listeners etc.
		function Remove1(CameFrom:int){var temparray = new Array();
			if(CameFrom==2){MenuButton.Miners.removeEventListener(MouseEvent.CLICK,BMiners);MenuButton.Factory.removeEventListener(MouseEvent.CLICK,BFactory);
			MenuButton.Tools.removeEventListener(MouseEvent.CLICK,BTools);MenuButton.Barracks.removeEventListener(MouseEvent.CLICK,BRax);
			MenuButton.Tactics.removeEventListener(MouseEvent.CLICK,BTactics);MenuButton.Shields.removeEventListener(MouseEvent.CLICK,BShields);
			if(Tier<3){MenuButton.Tier.removeEventListener(MouseEvent.CLICK,BTier);MenuButton.Tier.removeEventListener(MouseEvent.MOUSE_OVER,TT2x7);}else{
			MenuButton.Tier.Library.removeEventListener(MouseEvent.CLICK,BLibrary);MenuButton.Tier.Library.removeEventListener(MouseEvent.MOUSE_OVER,TT2x8);
			MenuButton.Tier.Draco.removeEventListener(MouseEvent.CLICK,BDraco);MenuButton.Tier.Draco.removeEventListener(MouseEvent.MOUSE_OVER,TT2x9);
			MenuButton.Tier.Ritual.removeEventListener(MouseEvent.CLICK,BRitual);MenuButton.Tier.Ritual.removeEventListener(MouseEvent.MOUSE_OVER,TT2x0);}
			MenuButton.Miners.removeEventListener(MouseEvent.MOUSE_OVER,TT2x1);MenuButton.Factory.removeEventListener(MouseEvent.MOUSE_OVER,TT2x2);
			MenuButton.Tools.removeEventListener(MouseEvent.MOUSE_OVER,TT2x3);MenuButton.Barracks.removeEventListener(MouseEvent.MOUSE_OVER,TT2x4);
			MenuButton.Shields.removeEventListener(MouseEvent.MOUSE_OVER,TT2x5);MenuButton.Tactics.removeEventListener(MouseEvent.MOUSE_OVER,TT2x6);};if(CameFrom==3){			
			temparray=[MenuButton.Marine,MenuButton.Shaman,MenuButton.Drone,MenuButton.MGer,MenuButton.Ogre,MenuButton.Hunter,MenuButton.BMage,MenuButton.Giant,MenuButton.Sniper,MenuButton.AMage,MenuButton.Dragon,MenuButton.Reaper];
			temparray[0].removeEventListener(MouseEvent.CLICK,Train0);temparray[9].removeEventListener(MouseEvent.CLICK,Train3);
			temparray[1].removeEventListener(MouseEvent.CLICK,Train1);temparray[2].removeEventListener(MouseEvent.CLICK,Train2);
			temparray[3].removeEventListener(MouseEvent.CLICK,Train3);temparray[4].removeEventListener(MouseEvent.CLICK,Train1);
			temparray[5].removeEventListener(MouseEvent.CLICK,Train2);temparray[6].removeEventListener(MouseEvent.CLICK,Train3);
			temparray[7].removeEventListener(MouseEvent.CLICK,Train1);temparray[8].removeEventListener(MouseEvent.CLICK,Train2);
			temparray[10].removeEventListener(MouseEvent.CLICK,Train1);temparray[11].removeEventListener(MouseEvent.CLICK,Train2);
			temparray[0].removeEventListener(MouseEvent.MOUSE_OVER,TT3x0);temparray[1].removeEventListener(MouseEvent.MOUSE_OVER,TT3x1);
			temparray[2].removeEventListener(MouseEvent.MOUSE_OVER,TT3x2);temparray[3].removeEventListener(MouseEvent.MOUSE_OVER,TT3x3);
			temparray[4].removeEventListener(MouseEvent.MOUSE_OVER,TT3x4);temparray[5].removeEventListener(MouseEvent.MOUSE_OVER,TT3x5);
			temparray[6].removeEventListener(MouseEvent.MOUSE_OVER,TT3x6);temparray[7].removeEventListener(MouseEvent.MOUSE_OVER,TT3x7);
			temparray[8].removeEventListener(MouseEvent.MOUSE_OVER,TT3x8);temparray[9].removeEventListener(MouseEvent.MOUSE_OVER,TT3x9);
			temparray[10].removeEventListener(MouseEvent.MOUSE_OVER,TT3x10);temparray[11].removeEventListener(MouseEvent.MOUSE_OVER,TT3x11);}
			if(CameFrom==5){MenuButton.Decommissiond.removeEventListener(MouseEvent.CLICK,CDecom);MenuButton.Stopd.removeEventListener(MouseEvent.CLICK,CStop);}
			MenuButton.gotoAndStop(1);MenuButton.Build.addEventListener(MouseEvent.CLICK,BuildClick);MenuButton.Train.addEventListener(MouseEvent.CLICK,TrainClick);
			if(Level==0&&TutProgress<4){MenuButton.Train.gotoAndStop(2)}else{MenuButton.Train.gotoAndStop(1)}}
		function Remove2(one:int){
			MenuButton.Build.removeEventListener(MouseEvent.CLICK,BuildClick);MenuButton.Train.removeEventListener(MouseEvent.CLICK,TrainClick);MenuButton.gotoAndStop(2);
			var temparray = new Array();temparray=[MenuButton.Miners,MenuButton.Factory,MenuButton.Tools,MenuButton.Barracks,MenuButton.Shields,MenuButton.Tactics,MenuButton.Tier];
			for(i=0;i<temparray.length;i++){if(BuildingsA[i]==0){temparray[i].gotoAndStop(2)}else{temparray[i].gotoAndStop(1)}};
			if(Tier==3){MenuButton.Tier.gotoAndStop(3);temparray=[MenuButton.Tier.Library,MenuButton.Tier.Draco,MenuButton.Tier.Ritual];for(j=8;j<11;j++){
			if(BuildingsA[j]==1){temparray[j-8].gotoAndStop(1)}else{temparray[j-8].gotoAndStop(2)}}};if(Tier==2&&BuildingsA[7]==0){MenuButton.Tier.gotoAndStop(2)};
			if(Tactics==5){MenuButton.Tactics.gotoAndStop(2);}if(ToolsLevel==5){MenuButton.Tools.gotoAndStop(2);}if(BarracksLevel==5){MenuButton.Barracks.gotoAndStop(2);}
			if(ShieldLevel==5){MenuButton.Shields.gotoAndStop(2);}
			MenuButton.Miners.addEventListener(MouseEvent.CLICK,BMiners);MenuButton.Factory.addEventListener(MouseEvent.CLICK,BFactory);
			MenuButton.Tools.addEventListener(MouseEvent.CLICK,BTools);MenuButton.Barracks.addEventListener(MouseEvent.CLICK,BRax);
			MenuButton.Tactics.addEventListener(MouseEvent.CLICK,BTactics);MenuButton.Shields.addEventListener(MouseEvent.CLICK,BShields);
			if(Tier<3){MenuButton.Tier.addEventListener(MouseEvent.CLICK,BTier);MenuButton.Tier.addEventListener(MouseEvent.MOUSE_OVER,TT2x7);}else{
			MenuButton.Tier.Library.addEventListener(MouseEvent.CLICK,BLibrary);MenuButton.Tier.Library.addEventListener(MouseEvent.MOUSE_OVER,TT2x8);
			MenuButton.Tier.Draco.addEventListener(MouseEvent.CLICK,BDraco);MenuButton.Tier.Draco.addEventListener(MouseEvent.MOUSE_OVER,TT2x9);
			MenuButton.Tier.Ritual.addEventListener(MouseEvent.CLICK,BRitual);MenuButton.Tier.Ritual.addEventListener(MouseEvent.MOUSE_OVER,TT2x0);}
			MenuButton.Miners.addEventListener(MouseEvent.MOUSE_OVER,TT2x1);MenuButton.Factory.addEventListener(MouseEvent.MOUSE_OVER,TT2x2);
			MenuButton.Tools.addEventListener(MouseEvent.MOUSE_OVER,TT2x3);MenuButton.Barracks.addEventListener(MouseEvent.MOUSE_OVER,TT2x4);
			MenuButton.Shields.addEventListener(MouseEvent.MOUSE_OVER,TT2x5);MenuButton.Tactics.addEventListener(MouseEvent.MOUSE_OVER,TT2x6);}
		function Remove3(Another:int){var temparray = new Array();
			if(Another!=666){MenuButton.Build.removeEventListener(MouseEvent.CLICK,BuildClick);
			MenuButton.Train.removeEventListener(MouseEvent.CLICK,TrainClick)};MenuButton.gotoAndStop(3);
			temparray=[MenuButton.Marine,MenuButton.Shaman,MenuButton.Drone,MenuButton.MGer,MenuButton.Ogre,MenuButton.Hunter,MenuButton.BMage,MenuButton.Giant,MenuButton.Sniper,MenuButton.AMage,MenuButton.Dragon,MenuButton.Reaper];
			for(l=0;l<12;l++){if(UnitsA[l]==0||(Tier<2&&l>2)||(Tier<3&&l>5)||(Archmage==false&&l==9)||(Archmage==false&&l==10)||(Archmage==false&&l==11)){
				temparray[l].gotoAndStop(2)}else{temparray[l].gotoAndStop(1)}};temparray[0].addEventListener(MouseEvent.CLICK,Train0);
			temparray[1].addEventListener(MouseEvent.CLICK,Train1);temparray[2].addEventListener(MouseEvent.CLICK,Train2);temparray[3].addEventListener(MouseEvent.CLICK,Train3);
			temparray[4].addEventListener(MouseEvent.CLICK,Train4);temparray[5].addEventListener(MouseEvent.CLICK,Train5);temparray[6].addEventListener(MouseEvent.CLICK,Train6);
			temparray[7].addEventListener(MouseEvent.CLICK,Train7);temparray[8].addEventListener(MouseEvent.CLICK,Train8);temparray[9].addEventListener(MouseEvent.CLICK,Train6)
			temparray[10].addEventListener(MouseEvent.CLICK,Train10);temparray[11].addEventListener(MouseEvent.CLICK,Train11)
			temparray[0].addEventListener(MouseEvent.MOUSE_OVER,TT3x0);temparray[1].addEventListener(MouseEvent.MOUSE_OVER,TT3x1);
			temparray[2].addEventListener(MouseEvent.MOUSE_OVER,TT3x2);temparray[3].addEventListener(MouseEvent.MOUSE_OVER,TT3x3);
			temparray[4].addEventListener(MouseEvent.MOUSE_OVER,TT3x4);temparray[5].addEventListener(MouseEvent.MOUSE_OVER,TT3x5);
			temparray[6].addEventListener(MouseEvent.MOUSE_OVER,TT3x6);temparray[7].addEventListener(MouseEvent.MOUSE_OVER,TT3x7);
			temparray[8].addEventListener(MouseEvent.MOUSE_OVER,TT3x8);temparray[9].addEventListener(MouseEvent.MOUSE_OVER,TT3x9);
			temparray[10].addEventListener(MouseEvent.MOUSE_OVER,TT3x10);temparray[11].addEventListener(MouseEvent.MOUSE_OVER,TT3x11);}
		function Remove4(Shit:int){var temparray = new Array();
			if(Shit==1){MenuButton.Build.removeEventListener(MouseEvent.CLICK,BuildClick);MenuButton.Train.removeEventListener(MouseEvent.CLICK,TrainClick);}
			if(Shit==2){MenuButton.Miners.removeEventListener(MouseEvent.CLICK,BMiners);MenuButton.Factory.removeEventListener(MouseEvent.CLICK,BFactory);
			MenuButton.Tools.removeEventListener(MouseEvent.CLICK,BTools);MenuButton.Barracks.removeEventListener(MouseEvent.CLICK,BRax);
			MenuButton.Tactics.removeEventListener(MouseEvent.CLICK,BTactics);MenuButton.Shields.removeEventListener(MouseEvent.CLICK,BShields);
			if(Tier<3){MenuButton.Tier.removeEventListener(MouseEvent.CLICK,BTier);MenuButton.Tier.removeEventListener(MouseEvent.MOUSE_OVER,TT2x7);}else{
			MenuButton.Tier.Library.removeEventListener(MouseEvent.CLICK,BLibrary);MenuButton.Tier.Library.removeEventListener(MouseEvent.MOUSE_OVER,TT2x8);
			MenuButton.Tier.Draco.removeEventListener(MouseEvent.CLICK,BDraco);MenuButton.Tier.Draco.removeEventListener(MouseEvent.MOUSE_OVER,TT2x9);
			MenuButton.Tier.Ritual.removeEventListener(MouseEvent.CLICK,BRitual);MenuButton.Tier.Ritual.removeEventListener(MouseEvent.MOUSE_OVER,TT2x0);}
			MenuButton.Miners.removeEventListener(MouseEvent.MOUSE_OVER,TT2x1);MenuButton.Factory.removeEventListener(MouseEvent.MOUSE_OVER,TT2x2);
			MenuButton.Tools.removeEventListener(MouseEvent.MOUSE_OVER,TT2x3);MenuButton.Barracks.removeEventListener(MouseEvent.MOUSE_OVER,TT2x4);
			MenuButton.Shields.removeEventListener(MouseEvent.MOUSE_OVER,TT2x5);MenuButton.Tactics.removeEventListener(MouseEvent.MOUSE_OVER,TT2x6);}
			if(Shit==3){
			temparray=[MenuButton.Marine,MenuButton.Shaman,MenuButton.Drone,MenuButton.MGer,MenuButton.Ogre,MenuButton.Hunter,MenuButton.BMage,MenuButton.Giant,MenuButton.Sniper,MenuButton.AMage,MenuButton.Dragon,MenuButton.Reaper];
			temparray[0].removeEventListener(MouseEvent.CLICK,Train0);temparray[1].removeEventListener(MouseEvent.CLICK,Train1);
			temparray[2].removeEventListener(MouseEvent.CLICK,Train2);temparray[3].removeEventListener(MouseEvent.CLICK,Train3);
			temparray[4].removeEventListener(MouseEvent.CLICK,Train1);temparray[5].removeEventListener(MouseEvent.CLICK,Train2);
			temparray[6].removeEventListener(MouseEvent.CLICK,Train3);temparray[7].removeEventListener(MouseEvent.CLICK,Train1);
			temparray[8].removeEventListener(MouseEvent.CLICK,Train2);temparray[9].removeEventListener(MouseEvent.CLICK,Train3);
			temparray[10].removeEventListener(MouseEvent.CLICK,Train1);temparray[11].removeEventListener(MouseEvent.CLICK,Train2);
			temparray[0].removeEventListener(MouseEvent.MOUSE_OVER,TT3x0);temparray[1].removeEventListener(MouseEvent.MOUSE_OVER,TT3x1);
			temparray[2].removeEventListener(MouseEvent.MOUSE_OVER,TT3x2);temparray[3].removeEventListener(MouseEvent.MOUSE_OVER,TT3x3);
			temparray[4].removeEventListener(MouseEvent.MOUSE_OVER,TT3x4);temparray[5].removeEventListener(MouseEvent.MOUSE_OVER,TT3x5);
			temparray[6].removeEventListener(MouseEvent.MOUSE_OVER,TT3x6);temparray[7].removeEventListener(MouseEvent.MOUSE_OVER,TT3x7);
			temparray[8].removeEventListener(MouseEvent.MOUSE_OVER,TT3x8);temparray[9].removeEventListener(MouseEvent.MOUSE_OVER,TT3x9);
			temparray[10].removeEventListener(MouseEvent.MOUSE_OVER,TT3x10);temparray[11].removeEventListener(MouseEvent.MOUSE_OVER,TT3x11);}if(Shit==5){
				MenuButton.Decommissiond.removeEventListener(MouseEvent.CLICK,CDecom);MenuButton.Stopd.removeEventListener(MouseEvent.CLICK,CStop);};MenuButton.gotoAndStop(4);}
		function Remove5(Final:int){var temparray = new Array();
			if(Final==1){MenuButton.Build.removeEventListener(MouseEvent.CLICK,BuildClick);MenuButton.Train.removeEventListener(MouseEvent.CLICK,TrainClick);}
			if(Final==2){MenuButton.Miners.removeEventListener(MouseEvent.CLICK,BMiners);MenuButton.Factory.removeEventListener(MouseEvent.CLICK,BFactory);
			MenuButton.Tools.removeEventListener(MouseEvent.CLICK,BTools);MenuButton.Barracks.removeEventListener(MouseEvent.CLICK,BRax);
			MenuButton.Tactics.removeEventListener(MouseEvent.CLICK,BTactics);MenuButton.Shields.removeEventListener(MouseEvent.CLICK,BShields);
			if(Tier<3){MenuButton.Tier.removeEventListener(MouseEvent.CLICK,BTier);MenuButton.Tier.removeEventListener(MouseEvent.MOUSE_OVER,TT2x7);}else{
			MenuButton.Tier.Library.removeEventListener(MouseEvent.CLICK,BLibrary);MenuButton.Tier.Library.removeEventListener(MouseEvent.MOUSE_OVER,TT2x8);
			MenuButton.Tier.Draco.removeEventListener(MouseEvent.CLICK,BDraco);MenuButton.Tier.Draco.removeEventListener(MouseEvent.MOUSE_OVER,TT2x9);
			MenuButton.Tier.Ritual.removeEventListener(MouseEvent.CLICK,BRitual);MenuButton.Tier.Ritual.removeEventListener(MouseEvent.MOUSE_OVER,TT2x0);}
			MenuButton.Miners.removeEventListener(MouseEvent.MOUSE_OVER,TT2x1);MenuButton.Factory.removeEventListener(MouseEvent.MOUSE_OVER,TT2x2);
			MenuButton.Tools.removeEventListener(MouseEvent.MOUSE_OVER,TT2x3);MenuButton.Barracks.removeEventListener(MouseEvent.MOUSE_OVER,TT2x4);
			MenuButton.Shields.removeEventListener(MouseEvent.MOUSE_OVER,TT2x5);MenuButton.Tactics.removeEventListener(MouseEvent.MOUSE_OVER,TT2x6);};if(Final==3){
			temparray=[MenuButton.Marine,MenuButton.Shaman,MenuButton.Drone,MenuButton.MGer,MenuButton.Ogre,MenuButton.Hunter,MenuButton.BMage,MenuButton.Giant,MenuButton.Sniper,MenuButton.AMage,MenuButton.Dragon,MenuButton.Reaper];
			temparray[0].removeEventListener(MouseEvent.CLICK,Train0);temparray[1].removeEventListener(MouseEvent.CLICK,Train1);
			temparray[2].removeEventListener(MouseEvent.CLICK,Train2);temparray[3].removeEventListener(MouseEvent.CLICK,Train3);
			temparray[4].removeEventListener(MouseEvent.CLICK,Train1);temparray[5].removeEventListener(MouseEvent.CLICK,Train2);
			temparray[6].removeEventListener(MouseEvent.CLICK,Train3);temparray[7].removeEventListener(MouseEvent.CLICK,Train1);
			temparray[8].removeEventListener(MouseEvent.CLICK,Train2);temparray[9].removeEventListener(MouseEvent.CLICK,Train3);
			temparray[10].removeEventListener(MouseEvent.CLICK,Train1);temparray[11].removeEventListener(MouseEvent.CLICK,Train2);
			temparray[0].removeEventListener(MouseEvent.MOUSE_OVER,TT3x0);temparray[1].removeEventListener(MouseEvent.MOUSE_OVER,TT3x1);
			temparray[2].removeEventListener(MouseEvent.MOUSE_OVER,TT3x2);temparray[3].removeEventListener(MouseEvent.MOUSE_OVER,TT3x3);
			temparray[4].removeEventListener(MouseEvent.MOUSE_OVER,TT3x4);temparray[5].removeEventListener(MouseEvent.MOUSE_OVER,TT3x5);
			temparray[6].removeEventListener(MouseEvent.MOUSE_OVER,TT3x6);temparray[7].removeEventListener(MouseEvent.MOUSE_OVER,TT3x7);
			temparray[8].removeEventListener(MouseEvent.MOUSE_OVER,TT3x8);temparray[9].removeEventListener(MouseEvent.MOUSE_OVER,TT3x9);
			temparray[10].removeEventListener(MouseEvent.MOUSE_OVER,TT3x10);temparray[11].removeEventListener(MouseEvent.MOUSE_OVER,TT3x11);}
			MenuButton.gotoAndStop(5);MenuButton.Decommissiond.addEventListener(MouseEvent.CLICK,CDecom);MenuButton.Stopd.addEventListener(MouseEvent.CLICK,CStop);}
		//ToolTips
		function TT2x1(xyz:MouseEvent){ToolTip.gotoAndStop(1);};function TT2x2(xyz:MouseEvent){ToolTip.gotoAndStop(2);};function TT2x3(xyz:MouseEvent){ToolTip.gotoAndStop(3);};
		function TT2x4(xyz:MouseEvent){ToolTip.gotoAndStop(4);};function TT2x5(xyz:MouseEvent){ToolTip.gotoAndStop(5);};function TT2x6(xyz:MouseEvent){ToolTip.gotoAndStop(6);};
		function TT2x7(xyz:MouseEvent){if(Tier==1){ToolTip.gotoAndStop(7);}else{ToolTip.gotoAndStop(8);}};
		function TT2x8(xyz:MouseEvent){ToolTip.gotoAndStop(9);};function TT2x9(xyz:MouseEvent){ToolTip.gotoAndStop(10);};function TT2x0(xyz:MouseEvent){ToolTip.gotoAndStop(11);}
		function TT3x0(xyz:MouseEvent){ToolTip.gotoAndStop(12);};function TT3x1(xyz:MouseEvent){ToolTip.gotoAndStop(13);};function TT3x2(xyz:MouseEvent){ToolTip.gotoAndStop(14)}
		function TT3x3(xyz:MouseEvent){ToolTip.gotoAndStop(15);};function TT3x4(xyz:MouseEvent){ToolTip.gotoAndStop(16);};function TT3x5(xyz:MouseEvent){ToolTip.gotoAndStop(17)}
		function TT3x6(xyz:MouseEvent){ToolTip.gotoAndStop(18);};function TT3x7(xyz:MouseEvent){ToolTip.gotoAndStop(19);};function TT3x8(xyz:MouseEvent){ToolTip.gotoAndStop(20)}
		function TT3x9(xyz:MouseEvent){ToolTip.gotoAndStop(21)};function TT3x10(xyz:MouseEvent){ToolTip.gotoAndStop(22)};function TT3x11(xyz:MouseEvent){ToolTip.gotoAndStop(23)}
		function TTReset(heh:MouseEvent){ToolTip.gotoAndStop(24);}
		//BuildTrain
		function BuildFinished(event:TimerEvent):void{
			//Build
			if(BuildOrder>-1){if(BuildOrder==1){IronIncome+=5;};if(BuildOrder==2){IronIncome-=5;MineralsIncome+=5};if(BuildOrder==3){ToolsLevel+=1;};
			if(BuildOrder==4){BarracksLevel+=1;};if(BuildOrder==5){ShieldLevel+=1;};if(BuildOrder==6){Tactics+=1;if(Tactics==1){F8.gotoAndStop(1)};
			if(Tactics==2){F4.gotoAndStop(1)};if(Tactics==3){F9.gotoAndStop(1)};if(Tactics==4){F5.gotoAndStop(1)};if(Tactics==5){F0.gotoAndStop(1)};};
			if(BuildOrder==7){Tier+=1;};if(BuildOrder==8){Archmage=true;};if(BuildOrder==9){Dragon=true;};if(BuildOrder==0){Reaper=true;};BuildOrder=-1;BuildTimer.stop();}
			if(Tier==3&&MenuButton.currentFrame==2&&MenuButton.Tier.currentFrame==1){MenuButton.Tier.gotoAndStop(3);
			var temparray:Array = new Array();temparray=[MenuButton.Tier.Library,MenuButton.Tier.Draco,MenuButton.Tier.Ritual];for(j=8;j<11;j++){
			if(BuildingsA[j]==1){temparray[j-8].gotoAndStop(1)}else{temparray[j-8].gotoAndStop(2)}}
			MenuButton.Tier.removeEventListener(MouseEvent.CLICK,BTier);MenuButton.Tier.removeEventListener(MouseEvent.MOUSE_OVER,TT2x7)
			MenuButton.Tier.Library.addEventListener(MouseEvent.CLICK,BLibrary);MenuButton.Tier.Library.addEventListener(MouseEvent.MOUSE_OVER,TT2x8);
			MenuButton.Tier.Draco.addEventListener(MouseEvent.CLICK,BDraco);MenuButton.Tier.Draco.addEventListener(MouseEvent.MOUSE_OVER,TT2x9);
			MenuButton.Tier.Ritual.addEventListener(MouseEvent.CLICK,BRitual);MenuButton.Tier.Ritual.addEventListener(MouseEvent.MOUSE_OVER,TT2x0);};
			//AutoBuild
			if(Queue==-1&&SavedData.data.Auto==1){Queue=1;if(IronIncome>MineralsIncome+5&&BuildingsA[1]==1&&Iron>=50){Queue=2};
				if(Tier==3&&IronIncome>30&&BuildingsA[1]==1){Queue=2};if(ToolsLevel<5&&Iron>=800&&IronIncome>(55+(10*ToolsLevel))&&BuildingsA[2]==1){Queue=3}; 
				if(BarracksLevel<5&&Iron>=800&&MineralsIncome>(60+(10*BarracksLevel))&&BuildingsA[3]==1&&Tier>1){Queue=4};
				if(ShieldLevel<5&&Iron>=500&&IronIncome>(60+(20*ShieldLevel))&&Tier>1&&BuildingsA[4]==1){Queue=5};
				if(Tactics<5&&BuildingsA[5]==1&&Iron>=1000&&IronIncome>(80+(10*Tactics))&&Tier>1){Queue=6};if(Tier==3&&Iron>=10000&&Archmage==false&&BuildingsA[8]==1){Queue=8};
				if(Tier==1&&Iron>=2000&&BuildingsA[6]==1){Queue=7};if(Tier==2&&Iron>=5000&&BuildingsA[7]==1){Queue=7};};
			//Queues
			if (Queue==1){if(Iron>=100){BuildOrder=1;BuildTimer.delay=5000*(1-(0.1*ToolsLevel));SpecialProgress[10]=0;BuildTimer.start();Iron-=100;Queue=-1;}else{Queue=-1;}}
			if (Queue==2){if(Iron>=50&&IronIncome>10){BuildOrder=2;BuildTimer.delay=5000*(1-(0.1*ToolsLevel));
				SpecialProgress[10]=0;BuildTimer.start();Iron-=50;Queue=-1;}else{Queue=-1;}}
			if (Queue==2){if(Iron>=50&&IronIncome>10){BuildOrder=2;BuildTimer.delay=5000*(1-(0.1*ToolsLevel));
				SpecialProgress[10]=0;BuildTimer.start();Iron-=50;Queue=-1;}else{Queue=-1;}}
			if (Queue==3){if(Iron>=800&&ToolsLevel<5){BuildOrder=3;BuildTimer.delay=5000*(1-(0.1*ToolsLevel));
				SpecialProgress[10]=0;BuildTimer.start();Iron-=800;Queue=-1;}else{Queue=-1;}}
			if (Queue==4){if(Iron>=800&&BarracksLevel<5){BuildOrder=4;BuildTimer.delay=5000*(1-(0.1*ToolsLevel));
				SpecialProgress[10]=0;BuildTimer.start();Iron-=800;Queue=-1;}else{Queue=-1;}}
			if (Queue==5){if(Iron>=500&&ShieldLevel<5){BuildOrder=5;BuildTimer.delay=5000*(1-(0.1*ToolsLevel));
				SpecialProgress[10]=0;BuildTimer.start();Iron-=500;Queue=-1;}else{Queue=-1;}}
			if (Queue==6){if(Iron>=1000&&Tactics<5){BuildOrder=6;BuildTimer.delay=7500*(1-(0.1*ToolsLevel));
				SpecialProgress[10]=0;BuildTimer.start();Iron-=1000;Queue=-1;}else{Queue=-1;}}
			if (Queue==7&&Tier==1){if(Iron>=2000){BuildOrder=7;BuildTimer.delay=15000*(1-(0.1*ToolsLevel));
				SpecialProgress[10]=0;BuildTimer.start();Iron-=2000;Queue=-1;}else{Queue=-1;}}
			if (Queue==7&&Tier==2){if(Iron>=5000){BuildOrder=7;BuildTimer.delay=20000*(1-(0.1*ToolsLevel));
				SpecialProgress[10]=0;BuildTimer.start();Iron-=5000;Queue=-1;}else{Queue=-1;}}
			if (Queue==8){if(Iron>=10000&&Tier==3){BuildOrder=8;BuildTimer.delay=20000*(1-(0.1*ToolsLevel));
				SpecialProgress[10]=0;BuildTimer.start();Iron-=10000;Queue=-1;}else{Queue=-1;}}
			if (Queue==9){if(Iron>=10000&&Tier==3){BuildOrder=8;BuildTimer.delay=20000*(1-(0.1*ToolsLevel));
				SpecialProgress[10]=0;BuildTimer.start();Iron-=10000;Queue=-1;}else{Queue=-1;}}
			if (Queue==0){if(Iron>=10000&&Tier==3){BuildOrder=8;BuildTimer.delay=20000*(1-(0.1*ToolsLevel));
				SpecialProgress[10]=0;BuildTimer.start();Iron-=10000;Queue=-1;}else{Queue=-1;}}}
		function TrainFinished(event:TimerEvent):void {
			UnitType[TrainSlot] = TrainOrder;HP[TrainSlot] = UnitHP[TrainOrder]*(1+(0.1*ShieldLevel));TrainTimer.stop();UnitArray[TrainSlot].gotoAndStop((TrainOrder + 1)*10)
			HP[TrainSlot] = (UnitHP[TrainOrder] * (1 + (0.1 * ShieldLevel)));UnitTarget[TrainSlot]=-1;if(TrainOrder==1){AutoAttacks[TrainSlot].delay=4200}else{
				if(TrainOrder==3){AutoAttacks[TrainSlot].delay=3000}else{AutoAttacks[TrainSlot].delay=UnitAuto[TrainOrder];}};if(Level==2&&Difficulty==2){Achievement++};
				AutoAttackMax[TrainSlot] = AutoAttacks[TrainSlot].delay;AutoAttackCurrent[TrainSlot] = 0;AutoAttacks[TrainSlot].start();TrainOrder = -1;
				if(Level==5&&Difficulty==3){Achievement=0}}
		function eBuildFinished(event:TimerEvent):void{
			if(eBuildOrder!=-1){if(eBuildOrder==1){eIronIncome+=5;};if(eBuildOrder==2){eIronIncome-=5;eMineralsIncome+=5;};if(eBuildOrder==3){eToolsLevel+=1;}
			if(eBuildOrder==4){eBarracksLevel+=1;};if(eBuildOrder==5){eShieldLevel+=1;};if(eBuildOrder==6){eTactics+=1;if(eTactics==1){E8.gotoAndStop(1)};if(eTactics==2){
			E4.gotoAndStop(1)};if(eTactics==3){E9.gotoAndStop(1)};if(eTactics==4){E5.gotoAndStop(1)};if(eTactics==5){E0.gotoAndStop(1)};}
			if(eBuildOrder==7){eTier+=1;};if(eBuildOrder==8){eArchmage=true;};if(eBuildOrder==9){eDragon=true;};if(eBuildOrder==0){eReaper=true;}
			eBuildOrder = -1;eBuildTimer.stop();}}
		function eTrainFinished(event:TimerEvent):void {
			if(eUnitType[eTrainSlot]==-1){eUnitType[eTrainSlot] = eTrainOrder;eHP[eTrainSlot] = UnitHP[eTrainOrder] * (1 + (0.1 * eShieldLevel));eTrainTimer.stop();
			eUnitArray[eTrainSlot].gotoAndStop((eTrainOrder + 1) * 10);eHP[eTrainSlot] = (UnitHP[eTrainOrder] * (1 + (0.1 * eShieldLevel)));
			if(eTrainOrder==1){eAutoAttacks[eTrainSlot].delay=4200}else{
			if(eTrainOrder==3){eAutoAttacks[eTrainSlot].delay=3000}else{eAutoAttacks[eTrainSlot].delay=UnitAuto[eTrainOrder];}};
			eAutoAttackMax[eTrainSlot] = eAutoAttacks[eTrainSlot].delay;eAutoAttackCurrent[eTrainSlot] = 0;eAutoAttacks[eTrainSlot].start();eTrainOrder = -1;eTrainSlot=-1}}
		//Periodics
		function ResourceCheck(event:TimerEvent):void {
			var dcredux:Number=1;if(Difficulty==1){dcredux=0.75};if(Difficulty==2){dcredux=0.9};if(Difficulty==3){dcredux=0.95};
		 	Iron += IronIncome;Minerals += MineralsIncome; eIron += (eIronIncome*dcredux); eMinerals += eMineralsIncome;}
		function ExplosionOfAwesome(WordUp:Event):void {
			//UI, Death and Unit Passives/Specials
		  	for(i = 0; i < 10; i++){
			//Unit is Dead
		  	if(HP[i] < 1 && IsMoving == false){
				if(UnitType[i]!=-1&&Level==1&&Difficulty==3){Achievement=0;};if(UnitType[i]!=-1&&Level==8&&Difficulty==3){Achievement=0;};
				if(UnitType[i]==9&&Level==9&&Difficulty==3){Achievement=0};if(UnitType[i]!=-1&&Level==10&&Difficulty==3){Achievement=0;};
				if(LifeWard==i){HP[i]=UnitHP[UnitType[i]] * (1 + (0.1 * ShieldLevel)) * 0.4;LifeWard=-1;}else{
				HP[i] = -1;UnitType[i] = -1;UnitArray[i].gotoAndStop(1);AutoAttacks[i].stop();SpecialAttacks[i].stop();SpecialEffect[i]=0;UnitDebuff[i]=0;
				if(i==eReaped||UnitType[i]==11){eReaped = -1};if(i==LifeWard||eUnitType[i]==9){LifeWard=-1};if(i==eDarkFlamed||eUnitType[i]==10){eDarkFlamed=-1;eDarkFlameTimer=0}
				if(UnitSelected == i){ UnitSelected = -1;Remove1(MenuButton.currentFrame);
				SpecialActive = false; Moving = false}}};
			if(eHP[i] < 1 && eIsMoving == false){
				if(Level==1&&Difficulty==2&&eUnitType[i]==2&&AchieTimer.running==false){AchieTimer.delay=10000;AchieTimer.start();}
				if(Level==9&&eUnitType[i]==11&&Difficulty==2&&Tier==1){Achievement=0};if(Level==10&&eUnitType[i]==1&&Difficulty==2){Achievement=0}
				if(Level==4&&Difficulty==2&&eUnitType[i]!=-1&&eTier==2){AchieArray[AchieArray[0]]=timenumber;AchieArray[0]+=1;if(AchieArray[0]==5){AchieArray[0]=1};
				if(AchieArray[0]==1){if(AchieArray[4]-AchieArray[1]<=20){Achievement=0;}}else{
				if(AchieArray[AchieArray[0]-1]-AchieArray[AchieArray[0]]<=20&&AchieArray[AchieArray[0]]!=0){Achievement=0;}}
				AchieTimer.addEventListener(TimerEvent.TIMER, AchieTimed);};if(eLifeWard==i &&eUnitType[i]>-1){eHP[i]=UnitHP[eUnitType[i]]*(1+(0.1*eShieldLevel))*0.4;
				eLifeWard=-1;}else{eHP[i]=-1;eUnitType[i] = -1;eUnitArray[i].gotoAndStop(1);eAutoAttacks[i].stop();eSpecialAttacks[i].stop();eSpecialEffect[i]=0;eUnitDebuff[i]=0;
				eAutoAttackMax[i]=0;eAutoAttackCurrent[i]=0;eAutoAttacks[i].delay=0;eSpecialAttacks[i].delay=0
				if(i==Reaped||eUnitType[i]==11){Reaped=-1};if(i==eLifeWard||eUnitType[i]==9){eLifeWard=-1};if(i==DarkFlamed||eUnitType[i]==10){DarkFlamed=-1;DarkFlameTimer=0;}}}
			//Unit UI Elements
			IronBox.text = "Iron: " + Iron + " (" + IronIncome + ")";MineralsBox.text = "Gold: " + Minerals + " (" + MineralsIncome + ")";
			if((Level==5&&Difficulty>2&&BossSpecial==i)||BossArray.indexOf(i)>-1){CellArray[i].gotoAndStop(3)}else{
				if(CellArray[i].currentFrame!=2&&UnitSelected==i){CellArray[i].gotoAndStop(4)}else{if(CellArray[i].currentFrame!=2){CellArray[i].gotoAndStop(1)}}}
			if(UnitType[i] == -1){
			HPBar[i].gotoAndStop(101);} else {Calculator[5] = int((HP[i] / (UnitHP[UnitType[i]] * (1 + (ShieldLevel * 0.1)))) * 100);HPBar[i].gotoAndStop(Calculator[5]);}
			if(eUnitType[i] == -1){
			eHPBar[i].gotoAndStop(101);} else {Calculator[5] = int((eHP[i] / (UnitHP[eUnitType[i]] * (1 + (eShieldLevel * 0.1)))) * 100);eHPBar[i].gotoAndStop(Calculator[5]);}
			if(AutoAttacks[i].running == false){if(UnitType[i]==-1){AABar[i].gotoAndStop(201)} else {AABar[i].gotoAndStop(100)}} else {
				if(AutoAttackMax[i]>0){AutoAttackCurrent[i] += 40;Calculator[5] = int((AutoAttackCurrent[i]/AutoAttackMax[i])*100);AABar[i].gotoAndStop(Calculator[5]);} else { 
				AutoAttackCurrent[i] -= 40;Calculator[5] = int((AutoAttackCurrent[i]/AutoAttackMax[i])*100);AABar[i].gotoAndStop(100 + Calculator[5]);}}
			if(eAutoAttacks[i].running == false){if(eUnitType[i]==-1){eAABar[i].gotoAndStop(201)} else {eAABar[i].gotoAndStop(100)}} else {if(eAutoAttackMax[i]>0){
				eAutoAttackCurrent[i] += 40;Calculator[5] = int((eAutoAttackCurrent[i]/eAutoAttackMax[i])*100);eAABar[i].gotoAndStop(Calculator[5]);} else { 
				eAutoAttackCurrent[i] -= 40;Calculator[5] = int((eAutoAttackCurrent[i]/eAutoAttackMax[i])*100);eAABar[i].gotoAndStop(100 + Calculator[5]);}}
			if(SpecialAttacks[i].running == false && UnitType[i] == 3 && SpecialEffect[i] ==1){SpecialEffect[i] = 0;}
			if(UnitType[i]==-1){SpecBar[i].gotoAndStop(101)} else{if(SpecialAttacks[i].running == false){ SpecBar[i].gotoAndStop(100); } else {SpecialProgress[i] += 40;
				Calculator[5] = int((SpecialProgress[i]/SpecialAttacks[i].delay)*100);SpecBar[i].gotoAndStop(Calculator[5]);}}
			if(eSpecialAttacks[i].running == false && eUnitType[i] == 3 && eSpecialEffect[i] ==1){eSpecialEffect[i] = 0;}
			if(eUnitType[i]==-1){eSpecBar[i].gotoAndStop(101)} else{if(eSpecialAttacks[i].running == false){ eSpecBar[i].gotoAndStop(100); } else {eSpecialProgress[i] += 40;
				Calculator[5] = int((eSpecialProgress[i]/eSpecialAttacks[i].delay)*100);eSpecBar[i].gotoAndStop(Calculator[5]);}}
			//Health, Specials and Passives
			if(Level==5&&i==BossSpecial&&UnitType[i]!=-1){if(Difficulty==3){HP[i]-=(UnitHP[UnitType[i]]/320)}else{if(Difficulty==4){HP[i]-=(UnitHP[UnitType[i]]/160)}}};
			for(o=0;o<10;o++){if(BossArray[o]==i){if(UnitType[i]==10){HP[i]-=UnitHP[UnitType[i]]/2000}else{HP[i]-=UnitHP[UnitType[i]]/400}}}
			if(Level==1&&Difficulty==3&&HP[i]>0){HP[i]-=0.35};if(Level==1&&Difficulty==4&&HP[i]>0){HP[i]-=0.48}
			eHP[DarkFlamed]-=0.0001;HP[eDarkFlamed]-=0.0001;var DarkHP = eHP[DarkFlamed]; var eDarkHP = HP[eDarkFlamed];
			if(eUnitDebuff[i]==2||eUnitDebuff[i]==3){if(eHP[i]==UnitHP[eUnitType[i]] * (1 + (0.1 * eShieldLevel))){eUnitDebuff[i]-=2}}
			if(UnitDebuff[i]==2||UnitDebuff[i]==3){if(HP[i]==UnitHP[UnitType[i]] * (1 + (0.1 * ShieldLevel))){UnitDebuff[i]-=2}}
			if(UnitType[i]==4){Calculator[5] = 0; for(j = 0; j < 10 ; j++){if(eUnitTarget[j]==i){Calculator[5]=1}}if(Calculator[5]==0){if(UnitDebuff[i]/2!= int(UnitDebuff[i]/2)){HP[i]+=0.2}else{HP[i]+=0.4;}}}
			if(eUnitType[i]==4){Calculator[5] = 0; for(j = 0; j < 10 ; j++){if(UnitTarget[j]==i){Calculator[5]=1}}if(Calculator[5]==0){if(eUnitDebuff[i]/2!= int(eUnitDebuff[i]/2)){eHP[i]+=0.2}else{eHP[i]+=0.4;}}}
			if(UnitType[i]==5 && SpecialAttacks[i].running==false && SpecialEffect[i]>0){eUnitDebuff[SpecialEffect[i]]-=1;SpecialEffect[i]=0};
			if(eUnitType[i]==5 && eSpecialAttacks[i].running==false && eSpecialEffect[i]>0){UnitDebuff[eSpecialEffect[i]]-=1;eSpecialEffect[i]=0};
			if(UnitType[i]==6&&i>0&&i<6&&UnitDebuff[i]/2==int(UnitDebuff[i]/2)){HP[i]+=0.06};if(eUnitType[i]==6&&i>0&&i<6&&eUnitDebuff[i]/2==int(eUnitDebuff[i]/2)){eHP[i]+=0.12}
			if(UnitType[i]==7){if(eUnitDebuff[i]/2!= int(UnitDebuff[i]/2)){HP[i]+=0.15}else{HP[i]+=0.3;};for(j=0;j<10;j++){
				if(eUnitTarget[j]==i){SpecialEffect[i]=0}}if(SpecialEffect[i]==1){if(UnitDebuff[i]/2!= int(UnitDebuff[i]/2)){HP[i]+=0.5}else{HP[i]+=1;};};};
			if(eUnitType[i]==7){if(eUnitDebuff[i]/2!= int(eUnitDebuff[i]/2)){eHP[i]+=0.05}else{eHP[i]+=0.1;};for(j=0;j<10;j++){
				if(UnitTarget[j]==i){eSpecialEffect[i]=0}};if(eSpecialEffect[i]==1){if(eUnitDebuff[i]/2!= int(eUnitDebuff[i]/2)){eHP[i]+=0.2}else{eHP[i]+=0.4;}};	};
			if(UnitType[i]==9){for(j=0;j<9;j++){if(UnitType[j]!=7){if(UnitDebuff[j]/2!= int(UnitDebuff[j]/2)){HP[j]+=0.04}else{HP[j]+=0.08;}}}}; 
			if(eUnitType[i]==9){for(j=0;j<9;j++){if(eUnitType[j]!=7){if(eUnitDebuff[j]/2!= int(eUnitDebuff[j]/2)){eHP[j]+=0.04}else{eHP[j]+=0.08;}}}}
			if(UnitType[i]==9 && SpecialAttacks[i].running==false && LifeWard != -1){LifeWard=-1};
			if(eUnitType[i]==9 && eSpecialAttacks[i].running==false && eLifeWard != -1){eLifeWard=-1};
			if(UnitType[i]==10){if(SpecialEffect[i]>0){SpecialEffect[i] -=40;}else{DarkFlamed=-1;DarkFlameTimer=0;}};
			if(eUnitType[i]==10){if(eSpecialEffect[i]>0){eSpecialEffect[i] -=40;}else{eDarkFlamed=-1;eDarkFlameTimer=0;}};			
			if(UnitType[i]==11 && SpecialAttacks[i].running==false && Reaped != -1){Reaped=-1};
			if(eUnitType[i]==11 && eSpecialAttacks[i].running==false && eReaped != -1){eReaped=-1};
			if(HP[i]>UnitHP[UnitType[i]] * (1 + (0.1 * ShieldLevel))){HP[i] = UnitHP[UnitType[i]] * (1 + (0.1 * ShieldLevel))};
			if(eHP[i]>UnitHP[eUnitType[i]] * (1 + (0.1 * eShieldLevel))){eHP[i] = UnitHP[eUnitType[i]] * (1 + (0.1 * eShieldLevel))};
			if(eHP[DarkFlamed] > DarkHP){if(DarkFlameTimer==0){eHP[DarkFlamed] = DarkHP - 40;DarkFlameTimer=1000;}else{eHP[DarkFlamed] = DarkHP}};
			if(HP[eDarkFlamed] > eDarkHP){if(eDarkFlameTimer==0){HP[eDarkFlamed] = eDarkHP - 40;eDarkFlameTimer=1000;}else{HP[eDarkFlamed] = eDarkHP}};
			if(DarkFlameTimer>0){DarkFlameTimer-=4}; if(eDarkFlameTimer>0){eDarkFlameTimer-=4};}
			//None-Specific UI Elements
			if(UnitSelected==-1&&MenuButton.currentFrame==5){Remove1(5)};
			if(BuildTimer.running == false){ IronCast.gotoAndStop(101) } else {
				SpecialProgress[10] += 40;Calculator[5] = int((SpecialProgress[10]/BuildTimer.delay)*100);IronCast.gotoAndStop(Calculator[5]);}
			if(TrainTimer.running == false){ MineralCast.gotoAndStop(101); } else {
				SpecialProgress[11] += 40;Calculator[5] = int((SpecialProgress[11]/TrainTimer.delay)*100);MineralCast.gotoAndStop(Calculator[5]);}
			//Remove this lot too
			timenumber += 0.04;
			Calculator[5] = int(timenumber);
			Timed.text = "Time passed: " + Calculator[5];
			//AI
			//Build
			if(eBuildTimer.running == false){
				if(AIBuildOrder[AIBuildProgress]==1 && eIron >= 100){eBuildOrder=1;eIron-=100;};
				if(AIBuildOrder[AIBuildProgress]==2 && eIron >= 50 && eIronIncome > 10){eBuildOrder=2;eIron-=50;}
				if(AIBuildOrder[AIBuildProgress]==2 && eIronIncome <= 10){AIBuildProgress+=1}
				if(AIBuildOrder[AIBuildProgress]==3 && eIron >= 800 && eToolsLevel < 5){eBuildOrder=3;eIron-=800;}
				if(AIBuildOrder[AIBuildProgress]==3 && eToolsLevel > 4){AIBuildProgress+=1}
				if(AIBuildOrder[AIBuildProgress]==4 && eIron >= 800 && eBarracksLevel < 5){eBuildOrder=4;eIron-=800;}
				if(AIBuildOrder[AIBuildProgress]==4 && eBarracksLevel > 4){AIBuildProgress+=1}
				if(AIBuildOrder[AIBuildProgress]==5 && eIron >= 500 && eShieldLevel < 5){eBuildOrder=5;eIron-=500;}
				if(AIBuildOrder[AIBuildProgress]==5 && eShieldLevel > 4){AIBuildProgress+=1}
				if(AIBuildOrder[AIBuildProgress]==6 && eIron >= 1000 && eTactics < 5){eBuildOrder=6;eIron-=1000;}
				if(AIBuildOrder[AIBuildProgress]==6 && eTactics > 4){AIBuildProgress+=1}
				if(AIBuildOrder[AIBuildProgress]==7 && eTier == 1 && eIron >= 2000){eBuildOrder=7;eIron-=2000;}
				if(AIBuildOrder[AIBuildProgress]==7 && eTier == 2 && eIron >= 5000){eBuildOrder=7;eIron-=5000;}
				if(AIBuildOrder[AIBuildProgress]==7 && eTier > 2){AIBuildProgress+=1}
				if(AIBuildOrder[AIBuildProgress]==8 && eTier == 3 && eIron >= 10000){eBuildOrder=8;eIron-=10000;}
				if(AIBuildOrder[AIBuildProgress]==9 && eTier == 3 && eIron >= 10000){eBuildOrder=9;eIron-=10000;}
				if(AIBuildOrder[AIBuildProgress]==0 && eTier == 3 && eIron >= 10000){eBuildOrder=0;eIron-=10000;}
				if(eBuildOrder!=-1){eBuildTimer.delay = BuildingTimer[eBuildOrder] * (1 - (0.1 * eToolsLevel));eBuildTimer.start();AIBuildProgress+=1;}}
			//Train Loop
			var rngmax:Number=1;if(Difficulty==1){rngmax=174};if(Difficulty==2){rngmax=44};if(Difficulty==3||Level==8){rngmax=11};
			if(eTrainTimer.running==false){if(eTrainOrder==-1&&Math.floor(Math.random()*rngmax)==0){AIChooseUnit(0)}if(eTrainOrder !=-1&&eMinerals>UnitMinerals[eTrainOrder]){
			eTrainTimer.delay = UnitTimer[eTrainOrder] * (1 - (0.1 * eBarracksLevel));eTrainTimer.start();eMinerals-=UnitMinerals[eTrainOrder];}}	
			//Movement Loop
			Calculator[5]=0;for(j=1;j<6;j++){if(UnitType[j]==7){Calculator[5]++}};
			//Moving Away
			if(Difficulty>2&&Level!=8){for(k=1;k<6;k++){if(eUnitType[k]==6&&Calculator[5]>0&&eAutoAttackMax[k]-eAutoAttackCurrent[k]<45){Calculator[6]=0;
				for(j=6;j<10;j++){if(eUnitType[j]==-1&&TrainOrder!=j&&Calculator[6]==0&&eIsMoving==false&&(j!=8||Tactics>0)&&(j!=9||Tactics>2)){eMo(j);Calculator[6]=1}};
				for(j=6;j<10;j++){if(eUnitType[j]==0&&Calculator[6]==0&&eIsMoving==false&&eAutoAttackMax[j]-eAutoAttackCurrent[j]<85){eMo(j);Calculator[6]=1}};
				for(j=6;j<10;j++){if(eUnitType[j]==1&&Calculator[6]==0&&eIsMoving==false&&eAutoAttackMax[j]-eAutoAttackCurrent[j]<85){eMo(j);Calculator[6]=1}};
				for(j=6;j<10;j++){if(eUnitType[j]==3&&Calculator[6]==0&&eIsMoving==false&&eAutoAttackMax[j]-eAutoAttackCurrent[j]<85){eMo(j);Calculator[6]=1}};}
				if(eUnitType[k]==6&&DarkFlamed==k&&eAutoAttackMax[k]-eAutoAttackCurrent[k]<45){Calculator[6]=0;
				for(j=6;j<10;j++){if(eUnitType[j]==-1&&TrainOrder!=j&&Calculator[6]==0&&eIsMoving==false&&(j!=8||Tactics>0)&&(j!=9||Tactics>2)){eMo(j);Calculator[6]=1}};
				for(j=6;j<10;j++){if(eUnitType[j]==0&&Calculator[6]==0&&eIsMoving==false&&eAutoAttackMax[j]-eAutoAttackCurrent[j]<85){eMo(j);Calculator[6]=1}};
				for(j=6;j<10;j++){if(eUnitType[j]==1&&Calculator[6]==0&&eIsMoving==false&&eAutoAttackMax[j]-eAutoAttackCurrent[j]<85){eMo(j);Calculator[6]=1}};
				for(j=6;j<10;j++){if(eUnitType[j]==3&&Calculator[6]==0&&eIsMoving==false&&eAutoAttackMax[j]-eAutoAttackCurrent[j]<85){eMo(j);Calculator[6]=1}};}
				if(eUnitType[k]==7&&(eHP[k]/(UnitHP[eUnitType[k]]*(1+(0.1*eShieldLevel))))<0.3&&eAutoAttackMax[k]-eAutoAttackCurrent[k]<45){Calculator[6]=0;
				for(j=6;j<10;j++){if(eUnitType[j]==-1&&TrainOrder!=j&&Calculator[6]==0&&eIsMoving==false&&(j!=8||Tactics>0)&&(j!=9||Tactics>2)){eMo(j);Calculator[6]=1}};
				for(j=6;j<10;j++){if(eUnitType[j]==0&&Calculator[6]==0&&eIsMoving==false&&eAutoAttackMax[j]-eAutoAttackCurrent[j]<85){eMo(j);Calculator[6]=1}};
				for(j=6;j<10;j++){if(eUnitType[j]==1&&Calculator[6]==0&&eIsMoving==false&&eAutoAttackMax[j]-eAutoAttackCurrent[j]<85){eMo(j);Calculator[6]=1}};
				for(j=6;j<10;j++){if(eUnitType[j]==2&&Calculator[6]==0&&eIsMoving==false&&eAutoAttackMax[j]-eAutoAttackCurrent[j]<85){eMo(j);Calculator[6]=1}};
				for(j=6;j<10;j++){if(eUnitType[j]==3&&Calculator[6]==0&&eIsMoving==false&&eAutoAttackMax[j]-eAutoAttackCurrent[j]<85){eMo(j);Calculator[6]=1}}}}}
			//Moving Back
			if(Difficulty>2){for(k=6;k<10;k++){var HPCheck:Number = (eHP[k]/UnitHP[eUnitType[k]]*(1+(0.1*eShieldLevel)))
				if(eUnitType[k]==7&&eAutoAttackMax[k]-eAutoAttackCurrent[k]<45 && HPCheck > 0.8){
				Calculator[6]=0;for(j=1;j<6;j++){if(eUnitType[j]==-1&&TrainOrder!=j&&Calculator[6]==0&&eIsMoving==false&&(j!=4||Tactics>1)&&(j!=5||Tactics>3)){eMo(j);Calculator[6]=1}}
				for(j=1;j<6;j++){if(eUnitType[j]==-1&&TrainOrder!=j&&Calculator[6]==0&&eIsMoving==false&&(j!=8||Tactics>0)&&(j!=9||Tactics>2)){eMo(j);Calculator[6]=1}}
				for(j=1;j<6;j++){if(eUnitType[j]==0&&Calculator[6]==0&&eIsMoving==false&&eAutoAttackMax[j]-eAutoAttackCurrent[j]<85){eMo(j);Calculator[6]=1}}
				for(j=1;j<6;j++){if(eUnitType[j]==1&&Calculator[6]==0&&eIsMoving==false&&eAutoAttackMax[j]-eAutoAttackCurrent[j]<85){eMo(j);Calculator[6]=1}}
				for(j=1;j<6;j++){if(eUnitType[j]==3&&Calculator[6]==0&&eIsMoving==false&&eAutoAttackMax[j]-eAutoAttackCurrent[j]<85){eMo(j);Calculator[6]=1}}}
				if(eUnitType[k]==6&&DarkFlamed!=k&&Calculator[5]==0&&eAutoAttackMax[k]-eAutoAttackCurrent[k]<45){
				Calculator[6]=0;for(j=1;j<6;j++){if(eUnitType[j]==-1&&TrainOrder!=j&&Calculator[6]==0&&eIsMoving==false&&(j!=4||Tactics>1)&&(j!=5||Tactics>3)){eMo(j);Calculator[6]=1}}
				for(j=1;j<6;j++){if(eUnitType[j]==-1&&TrainOrder!=j&&Calculator[6]==0&&eIsMoving==false&&(j!=8||Tactics>0)&&(j!=9||Tactics>2)){eMo(j);Calculator[6]=1}}
				for(j=1;j<6;j++){if(eUnitType[j]==0&&Calculator[6]==0&&eIsMoving==false&&eAutoAttackMax[j]-eAutoAttackCurrent[j]<85){eMo(j);Calculator[6]=1}}
				for(j=1;j<6;j++){if(eUnitType[j]==1&&Calculator[6]==0&&eIsMoving==false&&eAutoAttackMax[j]-eAutoAttackCurrent[j]<85){eMo(j);Calculator[6]=1}}
				for(j=1;j<6;j++){if(eUnitType[j]==3&&Calculator[6]==0&&eIsMoving==false&&eAutoAttackMax[j]-eAutoAttackCurrent[j]<85){eMo(j);Calculator[6]=1}}}}}		
			//AutoAttack Loop
			//Front Line
			for(k=1;k<6;k++){
				//Decommission & Target Check
				if(eTier==2&&eUnitType[k]==2){eUnitTarget[k] = 10;eAutoAttacks[k].delay = 5000;eAutoAttackMax[k] = 5000;eAutoAttacks[k].start();eAutoAttackCurrent[k]=0;eUnitType[k]=-3}
				if(eUnitType[k]!=1&&eUnitType[k]>-1){eUnitTarget[k]=-1;}
				//Marine Medic Drone
				if(eUnitType[k]==0){
					UnitPriority=[6,5,12,7,2,9,3,1,8,10,4,11];for(j=1;j<10;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
					if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}};for(j=9;j>0;j--){if(HP[j]<16 && HP[j]>0){eUnitTarget[k]=j;}}}
				if(eUnitType[k]==1){
					Calculator[5] = 0;if(eUnitType[eUnitTarget[k]]==-1){eUnitTarget[k]=-1};
					for(j=0;j<10;j++){if(eUnitType[j]==1 && eAutoAttackMax[j] < 0 && eAutoAttacks[j].running == true && j!=k){Calculator[5]++;};};
					if(Calculator[5] < 1 && eAutoAttacks[k].delay != 1800){Calculator[5] = 0;for(j=0;j<10;j++){
						if(UnitHP[eUnitType[j]] * (1 + (0.1 * eShieldLevel)) - eHP[j] - 35 > Calculator[5] && eUnitType[j] != 7&& j != DarkFlamed && k != j){
						Calculator[5] = UnitHP[eUnitType[j]] * (1 + (0.1 * eShieldLevel)) - eHP[j]; eUnitTarget[k] = j;}}}}
				if(eUnitType[k]==2 && eAutoAttacks[k].delay - eAutoAttackCurrent[k] < 0.01&&Level!=0){
					  eAutoAttackCurrent[k] = 0;eAutoAttacks[k].delay = UnitAuto[eUnitType[k]];eAttack(k);eAutoAttackMax[k] = eAutoAttacks[k].delay;eAutoAttacks[k].start();}
				//MG-er Ogre(+Giant) Hunter
				if(eUnitType[k]==3){UnitPriority=[10,5,12,6,2,11,4,1,7,8,3,9];
					for(j=1;j<10;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
						if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}}
					for(j=9;j>0;j--){if(HP[j]<16 && HP[j]>0){eUnitTarget[k]=j;}}Calculator[5] = 0;
					for(j=0;j<10;j++){if(eUnitType[j]==3 && eAutoAttackMax[j] < 0 && eAutoAttacks[j].delay < 1000 && eAutoAttacks[k].running == false){Calculator[5]++;};};
					if(Calculator[5]>1){eUnitTarget[k]=-1}}
				if(eUnitType[k]==4 || eUnitType[k]==7){
				UnitPriority=[6,7,12,11,3,1,5,2,10,8,4,9];for(j=1;j<6;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
						if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}};for(j=5;j>0;j--){if(HP[j]<46 && HP[j]>0){eUnitTarget[k]=j;}}}
				if(eUnitType[k]==5){UnitPriority=[3,6,1,5,10,2,7,11,4,9,12,8];for(j=1;j<6;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
				if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}};for(j=5;j>0;j--){if(HP[j]<51 && HP[j]>0){eUnitTarget[k]=j;}}}
				//BMage Sniper
				if(eUnitType[k]==6){UnitPriority=[10,5,12,6,2,11,4,1,7,8,3,9];for(j=0;j<10;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
				if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}};for(j=9;j>-1;j--){if(HP[j]<51 && HP[j]>0){eUnitTarget[k]=j;}}}
				if(eUnitType[k]==8){UnitPriority=[10,4,12,6,4,1,3,12,2,8,7,9];for(j=0;j<10;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
					if(UnitType[j]==8 && j>0 && j<6){UnitPriority=[10,4,13,6,4,1,3,12,11,8,7,9];}else{UnitPriority=[10,4,13,6,4,1,3,12,2,8,7,9]};
					if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}};for(j=9;j>-1;j--){if(HP[j]<51 && HP[j]>0){eUnitTarget[k]=j;}}}
				//Ultimates
				if(eUnitType[k]==9){
					UnitPriority=[10,5,12,6,2,11,4,1,7,8,3,9];for(j=0;j<10;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
					if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}};for(j=9;j>-1;j--){if(HP[j]<51 && HP[j]>0){eUnitTarget[k]=j;}
					if(AutoAttacks[j].running==true && AutoAttackMax[j]<-1){eUnitTarget[k]=j}}}
				if(eUnitType[k]==10){
				UnitPriority=[6,7,12,11,3,1,5,2,10,8,4,9];for(j=1;j<6;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
					if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}};for(j=5;j>0;j--){if(HP[j]<60 && HP[j]>0){eUnitTarget[k]=j;}}}
				if(eUnitType[k]==11){UnitPriority=[3,6,1,5,10,2,7,11,4,9,8,12];for(j=0;j<10;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
						if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}}}
				//Bosses
				if(eUnitType[k]==12&&UnitType[1]!=-1){eUnitTarget[k]=1};if(eUnitType[k]==12&&UnitType[3]!=-1){eUnitTarget[k]=3};if(eUnitType[k]==12&&UnitType[2]!=-1){
				eUnitTarget[k]=2};if(eUnitType[k]==12&&UnitType[6]!=-1){eUnitTarget[k]=6};if(eUnitType[k]==12&&UnitType[7]!=-1){eUnitTarget[k]=7}
				if(eUnitType[k]==13){UnitPriority=[3,6,1,5,10,2,7,11,4,9,12,8];for(j=0;j<10;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
					if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}};for(j=9;j>0;j--){if(HP[j]<16 && HP[j]>0){eUnitTarget[k]=j;}}
					if(Difficulty>2){eUnitTarget[k]=int(Math.random()*10)};if(Difficulty>2&&UnitType[eUnitType[k]]==-1){eUnitTarget[k]=int(Math.random()*10)}
					if(Difficulty>2&&UnitType[eUnitType[k]]==-1){eUnitTarget[k]=int(Math.random()*10)};if(Difficulty>2&&UnitType[eUnitType[k]]==-1){eUnitTarget[k]=int(Math.random()*10)}}
				//Run the attack
				if(eUnitTarget[k]>-1 && eAutoAttacks[k].running == false && eUnitType[k]>-1){eAutoAttackCurrent[k] = 0;eAutoAttacks[k].delay = UnitAuto[eUnitType[k]];
					if(eUnitType[k] == 1 || eUnitType[k] == 3 || eUnitType[k] == 6 || eUnitType[k] > 9){
					eAutoAttackMax[k] = -eAutoAttacks[k].delay} else {eAttack(k); eAutoAttackMax[k] = eAutoAttacks[k].delay;};eAutoAttacks[k].start();}}
			//Middle Line
			for(k=6;k<10;k++){
				//Decommission & Target Check
				if(eTier==2 && eUnitType[k]==2){ eUnitTarget[k] = 10; eAutoAttacks[k].delay = 5000; eAutoAttackMax[k] = 5000; eAutoAttacks[k].start();
				if(eUnitType[k] == 2){eUnitType[k] = -3} else {eUnitType[k] = -2;}}
				if(eUnitType[k]!=1){eUnitTarget[k]=-1}
				//Marine Medic Drone
				if(eUnitType[k]==0){
					UnitPriority=[6,5,12,7,2,9,3,1,8,10,4,11];for(j=1;j<6;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
					if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}};for(j=5;j>0;j--){if(HP[j]<16 && HP[j]>0){eUnitTarget[k]=j;}}}
				if(eUnitType[k]==1){
					Calculator[5] = 0;if(eUnitType[eUnitTarget[k]]==-1){eUnitTarget[k]=-1};
					for(j=0;j<10;j++){if(eUnitType[j]==1 && eAutoAttackMax[j] < 0 && eAutoAttacks[j].running == true && j!=k){Calculator[5]++;};};
					if(Calculator[5] < 1 && eAutoAttacks[k].delay != 1800){Calculator[5] = 0;for(j=0;j<10;j++){
						if(UnitHP[eUnitType[j]] * (1 + (0.1 * eShieldLevel)) - eHP[j] - 35 > Calculator[5] && eUnitType[j] != 7&& j != DarkFlamed && k != j){
						Calculator[5] = UnitHP[eUnitType[j]] * (1 + (0.1 * eShieldLevel)) - eHP[j]; eUnitTarget[k] = j;}}}}
				if(eUnitType[k]==2 && eAutoAttacks[k].delay - eAutoAttackCurrent[k] < 0.01&&(Level!=0||TutProgress>16)){
					  eAutoAttackCurrent[k] = 0;eAutoAttacks[k].delay = UnitAuto[eUnitType[k]];eAttack(k);eAutoAttackMax[k] = eAutoAttacks[k].delay;eAutoAttacks[k].start();}
				//MG-er BMage Sniper
				if(eUnitType[k]==3){UnitPriority=[10,5,12,6,2,11,4,1,7,8,3,9];
					for(j=1;j<6;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
						if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}}
					for(j=6;j>0;j--){if(HP[j]<16 && HP[j]>0){eUnitTarget[k]=j;}}Calculator[5] = 0;
					for(j=0;j<10;j++){if(eUnitType[j]==3 && eAutoAttackMax[j] < 0 && eAutoAttacks[j].delay < 1000 && eAutoAttacks[k].running == false){Calculator[5]++;};};
					if(Calculator[5]>1){eUnitTarget[k]=-1}}
				if(eUnitType[k]==6){UnitPriority=[10,5,12,6,2,11,4,1,7,8,3,9];for(j=0;j<10;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
				if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}};for(j=9;j>-1;j--){if(HP[j]<51 && HP[j]>0){eUnitTarget[k]=j;}}}
				if(eUnitType[k]==8){UnitPriority=[10,4,12,6,4,1,3,12,2,8,7,9];for(j=0;j<10;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
					if(UnitType[j]==8 && j>0 && j<6){UnitPriority=[10,4,13,6,4,1,3,12,11,8,7,9];}else{UnitPriority=[10,4,13,6,4,1,3,12,2,8,7,9]};
					if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}};for(j=9;j>-1;j--){if(HP[j]<51 && HP[j]>0){eUnitTarget[k]=j;}}}
				//AMage Reaper
				if(eUnitType[k]==9){
					UnitPriority=[10,5,12,6,2,11,4,1,7,8,3,9];for(j=0;j<10;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
					if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}};for(j=9;j>-1;j--){if(HP[j]<51 && HP[j]>0){eUnitTarget[k]=j;}
					if(AutoAttacks[j].running==true && AutoAttackMax[j]<-1){eUnitTarget[k]=j}}}
				if(eUnitType[k]==11){UnitPriority=[3,6,1,5,10,2,7,11,4,9,8,12];for(j=0;j<10;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
						if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}}}
				//Run the attack
				if(eUnitTarget[k]>-1 && eAutoAttacks[k].running == false){eAutoAttackCurrent[k] = 0;eAutoAttacks[k].delay = UnitAuto[eUnitType[k]];
					if(eUnitType[k] == 1 || eUnitType[k] == 3 || eUnitType[k] == 6 || eUnitType[k] > 9){
					eAutoAttackMax[k] = -eAutoAttacks[k].delay} else {eAttack(k); eAutoAttackMax[k] = eAutoAttacks[k].delay;};eAutoAttacks[k].start();}}
			//Back Line
			k=0;
			//Decommission & Target Check
			if(eTier==2 && eUnitType[k]==2){ eUnitTarget[k] = 10; eAutoAttacks[k].delay = 5000; eAutoAttackMax[k] = 5000; eAutoAttacks[k].start();
				if(eUnitType[k] == 2){eUnitType[k] = -3} else {eUnitType[k] = -2;}}
				if(eUnitType[k]!=1){eUnitTarget[k]=-1}
			//Medic Drone BMage Sniper AMage Reaper
			if(eUnitType[k]==1){
					Calculator[5] = 0;if(eUnitType[eUnitTarget[k]]==-1){eUnitTarget[k]=-1};
					for(j=0;j<10;j++){if(eUnitType[j]==1 && eAutoAttackMax[j] < 0 && eAutoAttacks[j].running == true && j!=k){Calculator[5]++;};};
					if(Calculator[5] < 1 && eAutoAttacks[k].delay != 1800){Calculator[5] = 0;for(j=0;j<10;j++){
						if(UnitHP[eUnitType[j]] * (1 + (0.1 * eShieldLevel)) - eHP[j] - 35 > Calculator[5] && eUnitType[j] != 7&& j != DarkFlamed && k != j){
						Calculator[5] = UnitHP[eUnitType[j]] * (1 + (0.1 * eShieldLevel)) - eHP[j]; eUnitTarget[k] = j;}}}}
			if(eUnitType[k]==2 && eAutoAttacks[k].delay - eAutoAttackCurrent[k] < 0.01){
					  eAutoAttackCurrent[k] = 0;eAutoAttacks[k].delay = UnitAuto[eUnitType[k]];eAttack(k);eAutoAttackMax[k] = eAutoAttacks[k].delay;eAutoAttacks[k].start();}
			if(eUnitType[k]==6){UnitPriority=[10,5,12,6,2,11,4,1,7,8,3,9];for(j=0;j<10;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
				if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}};for(j=9;j>-1;j--){if(HP[j]<51 && HP[j]>0){eUnitTarget[k]=j;}}}
			if(eUnitType[k]==8){UnitPriority=[10,4,12,6,4,1,3,12,2,8,7,9];for(j=0;j<10;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
					if(UnitType[j]==8 && j>0 && j<6){UnitPriority=[10,4,13,6,4,1,3,12,11,8,7,9];}else{UnitPriority=[10,4,13,6,4,1,3,12,2,8,7,9]};
					if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}};for(j=9;j>-1;j--){if(HP[j]<51 && HP[j]>0){eUnitTarget[k]=j;}}}
			if(eUnitType[k]==9){
					UnitPriority=[10,5,12,6,2,11,4,1,7,8,3,9];for(j=0;j<10;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
					if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}};for(j=9;j>-1;j--){if(HP[j]<51 && HP[j]>0){eUnitTarget[k]=j;}
					if(AutoAttacks[j].running==true && AutoAttackMax[j]<-1){eUnitTarget[k]=j}}}
			if(eUnitType[k]==11){UnitPriority=[3,6,1,5,10,2,7,11,4,9,8,12];for(j=0;j<10;j++){if(UnitType[j]>-1){if(eUnitTarget[k]==-1){eUnitTarget[k]=j}else{
						if(UnitPriority[UnitType[j]]>UnitPriority[UnitType[eUnitTarget[k]]]){eUnitTarget[k]=j}}}}}
			//Run the attack
			if(eUnitTarget[k]>-1 && eAutoAttacks[k].running == false){eAutoAttackCurrent[k] = 0;eAutoAttacks[k].delay = UnitAuto[eUnitType[k]];
					if(eUnitType[k] == 1 || eUnitType[k] == 3 || eUnitType[k] == 6 || eUnitType[k] > 9){
					eAutoAttackMax[k] = -eAutoAttacks[k].delay} else {eAttack(k); eAutoAttackMax[k] = eAutoAttacks[k].delay;};eAutoAttacks[k].start();}
			//Specials Loop
			rngmax=1;if(Difficulty==1){rngmax=100};if(Difficulty==2){rngmax=30};if(Difficulty==3){rngmax=8};
			for(k=0;k<10;k++){if(eSpecialAttacks[k].running==false&&Math.floor(Math.random()*rngmax)==0){
				//Specials: Marine, Medic, Drone
				if(eUnitType[k]==0){Calculator[5]=500;Calculator[7]=-1;
					for(j=0;j<10;j++){if(HP[j]<Calculator[5] && HP[j]>0 && UnitType[j]!=11){Calculator[7]=j;Calculator[5]=HP[j]}}
					if(Calculator[7]!= -1){eSpecialAttack(Calculator[7]);}}
				if(eUnitType[k]==1){
					var QuickTest:Boolean = false;for(j=0;j<10;j++){if(eUnitType[j] != 7 && eHP[j] + 20 < UnitHP[eUnitType[j]] * (1 + (0.1 * eShieldLevel))){QuickTest=true}}
					if(QuickTest==true){ eSpecialAttack(0)}}
				if(eUnitType[k]==2){if(eHP[k]<15&&Level!=0){eSpecialAttack(0);}}
				//MGer, Ogre, Hunter
				if(eUnitType[k]==3){Calculator[5]=0;for(j=0;j<10;j++){if(HP[j]<17 && HP[j]>0 && Calculator[5]==0 && UnitType[j]!=11){Calculator[5]=1;eSpecialAttack(j);}}}
				if(eUnitType[k]==4){Calculator[5]=0;for(j=0;j<10;j++){if(AutoAttackMax[j]<0 && UnitType[j]!=11){Calculator[5]=1}};
					if(Calculator[5]==1 && Math.floor( Math.random() * 1000 ) > 960){eSpecialAttack(0);};}
				if(eUnitType[k]==5){Calculator[5]=-1;
				   for(j=0;j<10;j++){if(HP[j]/UnitHP[UnitType[j]]*(1+(0.1*ShieldLevel)) < 0.5 && UnitDebuff[j]/2==int(UnitDebuff[j]/2 && UnitType[j]!=11)){Calculator[5]=j}}
				   		if(Calculator[5]!=-1){eSpecialAttack(Calculator[5]);}}
				//BMage, Giant, Sniper
				if(eUnitType[k]==6){Calculator[5]=0;for(j=0;j<10;j++){if(eUnitType[j]!=-1&&eUnitType[j]!=7){
					Calculator[5] += UnitHP[eUnitType[j]] * (1 + (0.1 * eShieldLevel)) - eHP[j]}};if(Calculator[5]>65){eSpecialAttack(0);}}
				if(eUnitType[k]==7){Calculator[5]=1;for(j=0;j<10;j++){if(UnitTarget[j]==k){Calculator[5]=0}};if(Calculator[5]==1){eSpecialAttack(0);}}
				if(eUnitType[k]==8){
					Calculator[5]=-1;for(j=0;j<10;j++){if(UnitType[j]>-1){if(Calculator[5]==-1){Calculator[5]=j}else{
						if(UnitType[j]==8 && j>0 && j<6){UnitPriority=[10,4,13,6,4,1,3,12,11,8,7,9];}else{UnitPriority=[10,4,13,6,4,1,3,12,2,8,7,9]};
						if( UnitPriority[UnitType[j]] > UnitPriority[UnitType[Calculator[5]]] && UnitType[j]!=11){Calculator[5]=j}}}};
						   if(HP[Calculator[5]]<UnitHP[UnitType[Calculator[5]]]* (1 + (0.1 * ShieldLevel))){eSpecialAttack(Calculator[5]);}}
				//Ultimates
				if(eUnitType[k]==9){Calculator[5]=120;Calculator[6]=-1;for(j=0;j<10;j++){if(eHP[j]<Calculator[5] && eHP[j]>0 && eUnitTarget[j]!=10){
					Calculator[5]=eHP[j];Calculator[6]=j}};if(Calculator[6]!=-1){eSpecialAttack(Calculator[6]);};}
				if(eUnitType[k]==10){Calculator[5]=0;
					for(j=0;j<10;j++){if(Calculator[5]==0 && UnitType[j]==9){Calculator[5]=1;eSpecialAttack(j);}}
					for(j=0;j<10;j++){if(Calculator[5]==0 && UnitType[j]==7){Calculator[5]=1;eSpecialAttack(j);}}
					for(j=1;j<6;j++){if(Calculator[5]==0 && UnitType[j]==6){Calculator[5]=1;eSpecialAttack(j);}}
					for(j=0;j<10;j++){if(Calculator[5]==0 && UnitType[j]==2){Calculator[5]=1;eSpecialAttack(j);}}
					for(j=0;j<10;j++){if(Calculator[5]==0 && UnitType[j]==4){Calculator[5]=1;eSpecialAttack(j);}}
					for(j=0;j<10;j++){if(Calculator[5]==0 && HP[j]/UnitHP[UnitType[j]]*(1+(0.1*ShieldLevel)) < 0.3){Calculator[5]=1;eSpecialAttack(j);}}}
				if(eUnitType[k]==11){Calculator[5]=0;Calculator[6]=-1;UnitPriority=[1,0,0,5,2,4,3,0,6,0,0,0];
					for(j=0;j<10;j++){if(eUnitType[j]>-1){if(UnitPriority[eUnitType[j]]>Calculator[5] && eHP[j] != UnitHP[UnitType[j]]* (1 + (0.1 * ShieldLevel))){
					Calculator[5]=UnitPriority[eUnitType[j]];Calculator[6]=j}}}if(Calculator[6]!=-1){eSpecialAttack(Calculator[6])}else{eSpecialAttack(k)}}
				//Bosses
				if(eUnitType[k]==12&&Difficulty!=1){eSpecialAttack(0)}
				if(eUnitType[k]==13&&Difficulty>2){eSpecialAttack(0)}}}
			//Game-End
			Calculator[8]=0;Calculator[9]=0;for(k=0;k<10;k++){if(HP[k]>0){Calculator[8]++;};if(eHP[k]>0){Calculator[9]++;};};
			if(Pussy==true){if((Level==0&&TutProgress==18)||(Level==11&&TutProgress==28)){GameEnd(true)}else{GameEnd(false)}}
			if(Calculator[8]>Calculator[9]+4&&(GameType==1||Level==4)){GameEnd(true);return};if(Calculator[9]>Calculator[8]+8&&(Level==7)){GameEnd(false);return};
			if(Calculator[9]>Calculator[8]+4&&(GameType==1||Level==2||Level==3||Level==4||Level==6||Level==9)&&Calculator[8]==0){GameEnd(false);return};
			if((Level==1||Level==2||Level==3||Level==6||Level==7)&&Calculator[9]==0){GameEnd(true);return};if(Level==10&&eHP[3]==-1){GameEnd(true);return};
			if((Level==5||Level==10)&&Calculator[8]==0){GameEnd(false);return};if(Level==5&&eHP[2]<0){GameEnd(true);return};
			if(Level==8&&BossSpecial==2&&Calculator[9]==0&&Difficulty==1){GameEnd(true)};if(Level==8&&BossSpecial==3&&Calculator[9]==0&&Difficulty==2){
			if(Minerals>5000){Achievement=0};GameEnd(true)};if(Level==8&&BossSpecial==4&&Calculator[9]==0&&Difficulty>2){GameEnd(true)};
			if(Level==8&&Calculator[8]==0&&Minerals<800&&TrainTimer.running==false){GameEnd(false)};
			if(Level==9&&eMinerals<UnitMinerals[eTrainOrder]&&Calculator[9]==0){GameEnd(true)}};
		//Endgame Stuff
		function GameEnd(Won:Boolean){
			//CleanUp
			//Listeners
			if(MenuButton.currentFrame==1){MenuButton.Build.removeEventListener(MouseEvent.CLICK,BuildClick);MenuButton.Train.removeEventListener(MouseEvent.CLICK,TrainClick);}
			if(MenuButton.currentFrame==2){MenuButton.Miners.removeEventListener(MouseEvent.CLICK,BMiners);MenuButton.Factory.removeEventListener(MouseEvent.CLICK,BFactory);
			MenuButton.Tools.removeEventListener(MouseEvent.CLICK,BTools);MenuButton.Barracks.removeEventListener(MouseEvent.CLICK,BRax);
			MenuButton.Tactics.removeEventListener(MouseEvent.CLICK,BTactics);MenuButton.Shields.removeEventListener(MouseEvent.CLICK,BShields);
			if(Tier<3){MenuButton.Tier.removeEventListener(MouseEvent.CLICK,BTier);MenuButton.Tier.removeEventListener(MouseEvent.MOUSE_OVER,TT2x7);}else{
			MenuButton.Tier.Library.removeEventListener(MouseEvent.CLICK,BLibrary);MenuButton.Tier.Library.removeEventListener(MouseEvent.MOUSE_OVER,TT2x8);
			MenuButton.Tier.Draco.removeEventListener(MouseEvent.CLICK,BDraco);MenuButton.Tier.Draco.removeEventListener(MouseEvent.MOUSE_OVER,TT2x9);
			MenuButton.Tier.Ritual.removeEventListener(MouseEvent.CLICK,BRitual);MenuButton.Tier.Ritual.removeEventListener(MouseEvent.MOUSE_OVER,TT2x0);}
			MenuButton.Miners.removeEventListener(MouseEvent.MOUSE_OVER,TT2x1);MenuButton.Factory.removeEventListener(MouseEvent.MOUSE_OVER,TT2x2);
			MenuButton.Tools.removeEventListener(MouseEvent.MOUSE_OVER,TT2x3);MenuButton.Barracks.removeEventListener(MouseEvent.MOUSE_OVER,TT2x4);
			MenuButton.Shields.removeEventListener(MouseEvent.MOUSE_OVER,TT2x5);MenuButton.Tactics.removeEventListener(MouseEvent.MOUSE_OVER,TT2x6);}
			if(MenuButton.currentFrame==3){var temparray:Array = new Array();
			temparray=[MenuButton.Marine,MenuButton.Shaman,MenuButton.Drone,MenuButton.MGer,MenuButton.Ogre,MenuButton.Hunter,MenuButton.BMage,MenuButton.Giant,MenuButton.Sniper,MenuButton.AMage,MenuButton.Dragon,MenuButton.Reaper];
			temparray[0].removeEventListener(MouseEvent.CLICK,Train0);temparray[9].removeEventListener(MouseEvent.CLICK,Train3);
			temparray[1].removeEventListener(MouseEvent.CLICK,Train1);temparray[2].removeEventListener(MouseEvent.CLICK,Train2);
			temparray[3].removeEventListener(MouseEvent.CLICK,Train3);temparray[4].removeEventListener(MouseEvent.CLICK,Train1);
			temparray[5].removeEventListener(MouseEvent.CLICK,Train2);temparray[6].removeEventListener(MouseEvent.CLICK,Train3);
			temparray[7].removeEventListener(MouseEvent.CLICK,Train1);temparray[8].removeEventListener(MouseEvent.CLICK,Train2);
			temparray[10].removeEventListener(MouseEvent.CLICK,Train1);temparray[11].removeEventListener(MouseEvent.CLICK,Train2);
			temparray[0].removeEventListener(MouseEvent.MOUSE_OVER,TT3x0);temparray[1].removeEventListener(MouseEvent.MOUSE_OVER,TT3x1);
			temparray[2].removeEventListener(MouseEvent.MOUSE_OVER,TT3x2);temparray[3].removeEventListener(MouseEvent.MOUSE_OVER,TT3x3);
			temparray[4].removeEventListener(MouseEvent.MOUSE_OVER,TT3x4);temparray[5].removeEventListener(MouseEvent.MOUSE_OVER,TT3x5);
			temparray[6].removeEventListener(MouseEvent.MOUSE_OVER,TT3x6);temparray[7].removeEventListener(MouseEvent.MOUSE_OVER,TT3x7);
			temparray[8].removeEventListener(MouseEvent.MOUSE_OVER,TT3x8);temparray[9].removeEventListener(MouseEvent.MOUSE_OVER,TT3x9);
			temparray[10].removeEventListener(MouseEvent.MOUSE_OVER,TT3x10);temparray[11].removeEventListener(MouseEvent.MOUSE_OVER,TT3x11);}
			if(MenuButton.currentFrame==5){MenuButton.Decommissiond.removeEventListener(MouseEvent.CLICK,CDecom);MenuButton.Stopd.removeEventListener(MouseEvent.CLICK,CStop);}
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, ForeheadMeetsKeyboard);stage.removeEventListener(Event.ENTER_FRAME, ExplosionOfAwesome);
			ResourceTimer.removeEventListener(TimerEvent.TIMER, ResourceCheck);
			BuildTimer.removeEventListener(TimerEvent.TIMER, BuildFinished);TrainTimer.removeEventListener(TimerEvent.TIMER, TrainFinished);
			eAutoAttacks[0].removeEventListener(TimerEvent.TIMER,eAttackReady0);eAutoAttacks[1].removeEventListener(TimerEvent.TIMER,eAttackReady1);
	    	eAutoAttacks[2].removeEventListener(TimerEvent.TIMER,eAttackReady2);eAutoAttacks[3].removeEventListener(TimerEvent.TIMER,eAttackReady3);
			eAutoAttacks[4].removeEventListener(TimerEvent.TIMER,eAttackReady4);eAutoAttacks[5].removeEventListener(TimerEvent.TIMER,eAttackReady5);
			eAutoAttacks[6].removeEventListener(TimerEvent.TIMER,eAttackReady6);eAutoAttacks[7].removeEventListener(TimerEvent.TIMER,eAttackReady7);
			eAutoAttacks[8].removeEventListener(TimerEvent.TIMER,eAttackReady8);eAutoAttacks[9].removeEventListener(TimerEvent.TIMER,eAttackReady9);
			AutoAttacks[0].removeEventListener(TimerEvent.TIMER,AttackReady0);AutoAttacks[1].removeEventListener(TimerEvent.TIMER,AttackReady1);
	    	AutoAttacks[2].removeEventListener(TimerEvent.TIMER,AttackReady2);AutoAttacks[3].removeEventListener(TimerEvent.TIMER,AttackReady3);
			AutoAttacks[4].removeEventListener(TimerEvent.TIMER,AttackReady4);AutoAttacks[5].removeEventListener(TimerEvent.TIMER,AttackReady5);
			AutoAttacks[6].removeEventListener(TimerEvent.TIMER,AttackReady6);AutoAttacks[7].removeEventListener(TimerEvent.TIMER,AttackReady7);
			AutoAttacks[8].removeEventListener(TimerEvent.TIMER,AttackReady8);AutoAttacks[9].removeEventListener(TimerEvent.TIMER,AttackReady9);
			UnitArray[0].removeEventListener(MouseEvent.CLICK,ClickF0);UnitArray[1].removeEventListener(MouseEvent.CLICK,ClickF1);
			UnitArray[2].removeEventListener(MouseEvent.CLICK,ClickF2);UnitArray[3].removeEventListener(MouseEvent.CLICK,ClickF3);
			UnitArray[4].removeEventListener(MouseEvent.CLICK,ClickF4);UnitArray[5].removeEventListener(MouseEvent.CLICK,ClickF5);
			UnitArray[6].removeEventListener(MouseEvent.CLICK,ClickF6);UnitArray[7].removeEventListener(MouseEvent.CLICK,ClickF7);
			UnitArray[8].removeEventListener(MouseEvent.CLICK,ClickF8);UnitArray[9].removeEventListener(MouseEvent.CLICK,ClickF9);
			BrokenCircle.removeEventListener(MouseEvent.CLICK,Disselect);
			eUnitArray[0].removeEventListener(MouseEvent.CLICK,ClickE0);eUnitArray[1].removeEventListener(MouseEvent.CLICK,ClickE1);
			eUnitArray[2].removeEventListener(MouseEvent.CLICK,ClickE2);eUnitArray[3].removeEventListener(MouseEvent.CLICK,ClickE3);
			eUnitArray[4].removeEventListener(MouseEvent.CLICK,ClickE4);eUnitArray[5].removeEventListener(MouseEvent.CLICK,ClickE5);
			eUnitArray[6].removeEventListener(MouseEvent.CLICK,ClickE6);eUnitArray[7].removeEventListener(MouseEvent.CLICK,ClickE7);
			eUnitArray[8].removeEventListener(MouseEvent.CLICK,ClickE8);eUnitArray[9].removeEventListener(MouseEvent.CLICK,ClickE9);
			eCellArray[0].removeEventListener(MouseEvent.CLICK,ClickE0);eCellArray[1].removeEventListener(MouseEvent.CLICK,ClickE1);
			eCellArray[2].removeEventListener(MouseEvent.CLICK,ClickE2);eCellArray[3].removeEventListener(MouseEvent.CLICK,ClickE3);
			eCellArray[4].removeEventListener(MouseEvent.CLICK,ClickE4);eCellArray[5].removeEventListener(MouseEvent.CLICK,ClickE5);
			eCellArray[6].removeEventListener(MouseEvent.CLICK,ClickE6);eCellArray[7].removeEventListener(MouseEvent.CLICK,ClickE7);
			eCellArray[8].removeEventListener(MouseEvent.CLICK,ClickE8);eCellArray[9].removeEventListener(MouseEvent.CLICK,ClickE9);
			CellArray[0].removeEventListener(MouseEvent.CLICK,ClickC0);CellArray[1].removeEventListener(MouseEvent.CLICK,ClickC1);
			CellArray[2].removeEventListener(MouseEvent.CLICK,ClickC2);CellArray[3].removeEventListener(MouseEvent.CLICK,ClickC3);
			CellArray[4].removeEventListener(MouseEvent.CLICK,ClickC4);CellArray[5].removeEventListener(MouseEvent.CLICK,ClickC5);
			CellArray[6].removeEventListener(MouseEvent.CLICK,ClickC6);CellArray[7].removeEventListener(MouseEvent.CLICK,ClickC7);
			CellArray[8].removeEventListener(MouseEvent.CLICK,ClickC8);CellArray[9].removeEventListener(MouseEvent.CLICK,ClickC9);
			if(SavedData.data.Sounds==1){MusicChannel.removeEventListener(Event.SOUND_COMPLETE,BattleSong);MusicChannel.stop();
			PickSong(0);MusicChannel.addEventListener(Event.SOUND_COMPLETE,NextSong);
			MenuButton.BG.removeEventListener(MouseEvent.MOUSE_OVER,TTReset);BrokenCircle.removeEventListener(MouseEvent.MOUSE_OVER,TTReset);}
			//Variables.
			Iron= 70;Minerals=500;IronIncome=30;MineralsIncome=20; BossArray=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
			BuildOrder=-1;TrainOrder=-1;TrainSlot=-1;ToolsLevel=0;BarracksLevel=0;ShieldLevel=0;Tactics=0;Tier= 1;Archmage=false;Reaper=false;Dragon=false;
			UnitType=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];HP=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];Pussy==false;TutProgress=0
			SpecialEffect=[0,0,0,0,0,0,0,0,0,0];Debuff=[0,0,0,0,0,0,0,0,0,0];	UnitTarget=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];CellArray=[F0,F1,F2,F3,F4,F5,F6,F7,F8,F9];
			SpecialProgress=[0,0,0,0,0,0,0,0,0,0,0,0];AutoAttackCurrent=[0,0,0,0,0,0,0,0,0,0];AutoAttackMax=[0,0,0,0,0,0,0,0,0,0];UnitDebuff=[0,0,0,0,0,0,0,0,0,0];
			SpecialActive=false;Moving=false;IsMoving=false;Reaped=-1;LifeWard=-1;DarkFlamed=-1;DarkFlameTimer=0;AIBuild=-1;AIBuildProgress=0;eIron= 70;eMinerals=500;
			eIronIncome=30;eMineralsIncome=20;eBuildOrder=-1;eTrainOrder=-1;eTrainSlot=-1;eToolsLevel=0;BarracksLevel=0;eShieldLevel=0;eTactics=0;eTier= 1;eArchmage=false;
			eReaper=false;eDragon=false;eUnitType=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];eHP=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];BuildingsA=[1,1,1,1,1,1,1,1,1,1,1];
			eSpecialEffect=[0,0,0,0,0,0,0,0,0,0];eDebuff=[0,0,0,0,0,0,0,0,0,0];eUnitTarget=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];eCellArray=[F0,F1,F2,F3,F4,F5,F6,F7,F8,F9];
			eSpecialProgress=[0,0,0,0,0,0,0,0,0,0,0,0];eAutoAttackCurrent=[0,0,0,0,0,0,0,0,0,0];eAutoAttackMax=[0,0,0,0,0,0,0,0,0,0];eUnitDebuff=[0,0,0,0,0,0,0,0,0,0];
			eSpecialActive=false;eIsMoving=false;eReaped=-1;eLifeWard=-1;eDarkFlamed=-1;eDarkFlameTimer=0;AIBuild=-1;UnitsA=[1,1,1,1,1,1,1,1,1,1,1,1];timenumber=0;
			//Texts & Timers
			IronBox.text="";IronBox.visible=false;MineralsBox.text="";MineralsBox.visible=false;Timed.text="";Timed..visible=false;ResourceTimer.stop();BuildTimer.stop();
			TrainTimer.stop();eBuildTimer.stop();eTrainTimer.stop();for(i=0;i<10;i++){
			AutoAttacks[i].stop();SpecialAttacks[i].stop();AttackTimer.stop();eAutoAttacks[i].stop();eSpecialAttacks[i].stop();eAttackTimer.stop();};
			//Exit
			//Generic
			if(GameType==1){gotoAndStop(4);FakeBoxy.addEventListener(MouseEvent.CLICK,BackToMenu);if(Won==true){YouWinYouLose.gotoAndStop(1);}else{YouWinYouLose.gotoAndStop(2)}}
			if(Won==false){IsMoving=true;CampaignMenu(0);}
			//Levels 0-5
			if(Won==true){
			if(Level==0&&Won==true){SavedData.data.TutProgress=1;IsMoving=true;CampaignMenu(0);}
			if(Level==1){if(Difficulty==2&&AchieTimer.running==true){AchieTimer.removeEventListener(TimerEvent.TIMER, AchieTimed);
			if(Achievement==1&&SavedData.data.LevelAchies[Level]!=1&&SavedData.data.LevelAchies[Level]!=3){SavedData.data.LevelAchies[Level]+=1}}
			if(Difficulty==3&&Achievement==1&&SavedData.data.LevelAchies[Level]<2&&AchieTimer2.running==true){SavedData.data.LevelAchies[Level]+=2;AchieTimer2.stop();};
			if(SavedData.data.LevelProgress[Level]<Difficulty){SavedData.data.LevelProgress[Level]=Difficulty};IsMoving=true;CampaignMenu(0);}
			if(Level==2&&Won==true){if(Difficulty==2&&Achievement<6&&SavedData.data.LevelAchies[Level]!=1&&SavedData.data.LevelAchies[Level]!=3){
			SavedData.data.LevelAchies[Level]+=1};if(Difficulty==3&&Achievement==1&&SavedData.data.LevelAchies[Level]<2){SavedData.data.LevelAchies[Level]+=2;};
			if(SavedData.data.LevelProgress[Level]<Difficulty){SavedData.data.LevelProgress[Level]=Difficulty};IsMoving=true;CampaignMenu(0);}
			if(Level==3&&Won==true){if(Difficulty==2&&Achievement==1&&SavedData.data.LevelAchies[Level]!=1&&SavedData.data.LevelAchies[Level]!=3){
			SavedData.data.LevelAchies[Level]+=1};if(Difficulty==3&&Achievement==1&&SavedData.data.LevelAchies[Level]<2){SavedData.data.LevelAchies[Level]+=2;};
			if(SavedData.data.LevelProgress[Level]<Difficulty){SavedData.data.LevelProgress[Level]=Difficulty};IsMoving=true;CampaignMenu(0);}
			if(Level==4&&Won==true){if(Difficulty==2&&Achievement==0&&SavedData.data.LevelAchies[Level]!=1&&SavedData.data.LevelAchies[Level]!=3){
			SavedData.data.LevelAchies[Level]+=1};if(Difficulty==3&&Achievement==1&&SavedData.data.LevelAchies[Level]<2){SavedData.data.LevelAchies[Level]+=2;};
			if(SavedData.data.LevelProgress[Level]<Difficulty){SavedData.data.LevelProgress[Level]=Difficulty};IsMoving=true;CampaignMenu(0);}
			if(Level==5&&Won==true){if(Difficulty==2&&Achievement==1&&SavedData.data.LevelAchies[Level]!=1&&SavedData.data.LevelAchies[Level]!=3){
			SavedData.data.LevelAchies[Level]+=1};if(Difficulty==3&&Achievement==1&&SavedData.data.LevelAchies[Level]<2){SavedData.data.LevelAchies[Level]+=2;};
			if(SavedData.data.LevelProgress[Level]<Difficulty){SavedData.data.LevelProgress[Level]=Difficulty};IsMoving=true;CampaignMenu(0);}
			//Levels 6-11
			if(Level==6&&Won==true){if(Difficulty==2&&AchieTimer2.running==true&&SavedData.data.LevelAchies[Level]!=1&&SavedData.data.LevelAchies[Level]!=3){
			SavedData.data.LevelAchies[Level]+=1};if(Difficulty==3&&Achievement==1&&SavedData.data.LevelAchies[Level]<2){SavedData.data.LevelAchies[Level]+=2;};
			if(SavedData.data.LevelProgress[Level]<Difficulty){SavedData.data.LevelProgress[Level]=Difficulty};IsMoving=true;CampaignMenu(0);}
			if(Level==7&&Won==true){if(Difficulty==2&&Achievement==1&&SavedData.data.LevelAchies[Level]!=1&&SavedData.data.LevelAchies[Level]!=3){
			SavedData.data.LevelAchies[Level]+=1};if(Difficulty==3&&Achievement==0&&SavedData.data.LevelAchies[Level]<2){SavedData.data.LevelAchies[Level]+=2;};
			if(SavedData.data.LevelProgress[Level]<Difficulty){SavedData.data.LevelProgress[Level]=Difficulty};IsMoving=true;CampaignMenu(0);}
			if(Level==8&&Won==true){if(Difficulty==2&&Achievement==0&&SavedData.data.LevelAchies[Level]!=1&&SavedData.data.LevelAchies[Level]!=3){
			SavedData.data.LevelAchies[Level]+=1};if(Difficulty==3&&Achievement==1&&SavedData.data.LevelAchies[Level]<2){SavedData.data.LevelAchies[Level]+=2;};
			if(SavedData.data.LevelProgress[Level]<Difficulty){SavedData.data.LevelProgress[Level]=Difficulty};IsMoving=true;CampaignMenu(0);}
			if(Level==9&&Won==true){if(Difficulty==2&&Achievement==1&&SavedData.data.LevelAchies[Level]!=1&&SavedData.data.LevelAchies[Level]!=3){
			SavedData.data.LevelAchies[Level]+=1};if(Difficulty==3&&Achievement==1&&SavedData.data.LevelAchies[Level]<2){SavedData.data.LevelAchies[Level]+=2;};
			if(SavedData.data.LevelProgress[Level]<Difficulty){SavedData.data.LevelProgress[Level]=Difficulty};IsMoving=true;CampaignMenu(0);}
			if(Level==10&&Won==true){if(Difficulty==2&&Achievement==1&&SavedData.data.LevelAchies[Level]!=1&&SavedData.data.LevelAchies[Level]!=3){
			SavedData.data.LevelAchies[Level]+=1};if(Difficulty==3&&Achievement==1&&SavedData.data.LevelAchies[Level]<2){SavedData.data.LevelAchies[Level]+=2;};
			if(SavedData.data.LevelProgress[Level]<Difficulty){SavedData.data.LevelProgress[Level]=Difficulty};
			gotoAndStop(4);FakeBoxy.addEventListener(MouseEvent.CLICK,BackToMenu);YouWinYouLose.gotoAndStop(Difficulty+2)}
			if(Won==false){IsMoving=true;CampaignMenu(0);}
			if(Level==11&&Won==true){SavedData.data.TutProgress=2;IsMoving=true;CampaignMenu(0);}}}
		function BackToMenu(wasted:int){FakeBoxy.removeEventListener(MouseEvent.CLICK,BackToMenu);gotoAndStop(1);IsMoving=true;CampaignMenu(0);}
		function AchieTimed(event:TimerEvent):void{if(Level==1&&Difficulty==2){Achievement=0};}
		//AI Routines
		function AIChooseUnit(UnimportantValue:int):void{
			//UnitCounts
				var UnitCounts:Array = new Array(0,0,0,0,0,0,0,0,0,0,0,0);var eUnitCounts:Array = new Array(0,0,0,0,0,0,0,0,0,0,0,0);
					for(l=0;l<11;l++){if(eUnitType[l]!=-1){eUnitCounts[eUnitType[l]]++};if(UnitType[l]!=-1){UnitCounts[UnitType[l]]++};};var RandomNumber:int;
					var unittotals:Array = new Array(0,0,0,0,0);for(m=0;m<12;m++){unittotals[0]+=UnitCounts[m];unittotals[1]+=eUnitCounts[m];
					unittotals[2]+=(UnitHP[m]*UnitCounts[m]);unittotals[3]+=UnitHP[m]*eUnitCounts[m];unittotals[3]-=eHP[m]*eUnitCounts[m];};unittotals[2]/=unittotals[0];
					if(Level==2&&Difficulty==3&&eUnitCounts[0]>1){Achievement=0;};if(Level==3&&Difficulty==3&&UnitCounts[4]>1){Achievement=0;};
					if(Level==4&&Difficulty==3&&UnitCounts[4]>0){Achievement=0;};if(Level==5&&Difficulty==2&&eUnitCounts[0]>1){Achievement=0;};
					if(Level==6&&(UnitCounts[1]>0||UnitCounts[4]>0)&&Difficulty==3){Achievement=0}if(Level==7&&unittotals[1]>7){Achievement=0};
					if(Level==0&&TutProgress==17&&UnitCounts[0]>1){for(i=0;i<10;i++){UnitType[i]=-1;HP[i]=-1;UnitArray[i].gotoAndStop(1);};eUnitType[6]=2;eHP[6]=50;
					eUnitArray[6].gotoAndStop(30);MineralsIncome=0;Minerals=795;IronIncome=150;}
				if(eTier==1||GameType==2){
					//Builds 0-2
					if(AIBuild==0){
					    if(eMinerals>=500&&UnitCounts[0]==0){if(eUnitType[1]==-1){eTrainSlot=1;}else{if(eUnitType[2]==-1){eTrainSlot=2;}else{if(eUnitType[3]==-1){eTrainSlot=3;}else{eTrainSlot=-1}}};
					    if(eTrainSlot!=-1){eTrainOrder=2;};if(eBuildOrder==7){eTrainOrder=-1;eTrainSlot=-1};};
						if(eMinerals>=800&&UnitCounts[0]!=0){if(eUnitType[6]==-1){eTrainSlot=6};if(eUnitType[7]==-1){eTrainSlot=7};if(eTrainSlot!=-1){eTrainOrder=2;};};};
					if(AIBuild==1){
						if(eMinerals>=800){if(eUnitType[6]==-1){eTrainSlot=6;}else{if(eUnitType[7]==-1){eTrainSlot=7;}else{eTrainSlot=-1}};
						if(eUnitType[1]==-1&&eUnitType[6]!=-1&&eUnitType[7]!=-1){eTrainSlot=1;};
						if(eUnitType[2]==-1&&eUnitType[6]!=-1&&eUnitType[7]!=-1&&eUnitType[1]!=-1){eTrainSlot=2;};
						if(eUnitType[3]==-1&&eUnitType[6]!=-1&&eUnitType[7]!=-1&&eUnitType[1]!=-1&&eUnitType[2]!=-1){eTrainSlot=3;};if(eTrainSlot!=-1){eTrainOrder=1;};};};
					if(AIBuild==2){
						if(eMinerals>=800&&Level==2&&Difficulty==4){if(eUnitType[6]==-1){eTrainSlot=6;}else{if(eUnitType[7]==-1){eTrainSlot=7;}else{eTrainSlot=-1}}};
						if(eMinerals>=800){if(eUnitType[3]==-1){eTrainSlot=3};if(eUnitType[7]==-1){eTrainSlot=7};if(eUnitType[6]==-1){eTrainSlot=6};
					if(eUnitType[2]==-1){eTrainSlot=2};if(eUnitType[1]==-1){eTrainSlot=1};if(eTrainSlot!=-1){eTrainOrder=0};if(eBuildOrder==7){eTrainOrder=-1;eTrainSlot=-1}}}
					//Builds 3-6
					if(AIBuild==3){
						if(eUnitType[6]!=1&&Difficulty>1){eTrainOrder=1;eTrainSlot=6;return};if(eUnitType[7]!=1&&Difficulty>1){eTrainOrder=1;eTrainSlot=7};
						if(eUnitType[2]!=1&&Difficulty>1){eTrainOrder=1;eTrainSlot=2;return};
						if(Tier==2&&Difficulty==4&&UnitCounts[4]>0&&eUnitCounts[5]<1&&eUnitCounts[5]<1&&eUnitType[1]==-1){eTrainOrder=5;eTrainSlot=1;return};
						if(Tier==2&&Difficulty==4&&UnitCounts[4]>0&&eUnitCounts[5]<1&&eUnitCounts[5]<1&&eUnitType[3]==-1){eTrainOrder=5;eTrainSlot=3;return};
						if(Tier==2&&Difficulty>2&&eUnitType[1]==-1){eTrainOrder=4;eTrainSlot=1;return};if(Tier==2&&Difficulty>2&&eUnitType[3]==-1){eTrainOrder=4;eTrainSlot=3;return};
						if(eUnitType[1]==-1){eTrainOrder=0;eTrainSlot=1;return};if(eUnitType[3]==-1){eTrainOrder=0;eTrainSlot=3;return};}
					if(AIBuild==4){
						if(eTier==1){if(eUnitType[3]==-1){if(Difficulty>2){eTrainOrder=1;eTrainSlot=3;return}else{eTrainOrder=0;eTrainSlot=3;return}};
						if(eUnitType[2]==-1){if(Difficulty>2){eTrainOrder=1;eTrainSlot=2;return}else{eTrainOrder=0;eTrainSlot=2;return}};
						if(eUnitType[4]==-1){eTrainOrder=0;eTrainSlot=4;return};if(eUnitType[1]==-1){eTrainOrder=0;eTrainSlot=1;return};
						if(eUnitType[5]==-1){eTrainOrder=0;eTrainSlot=5;return};}
					if(eTier==2){
						if(Difficulty==2){for(i=1;i<6;i++){if(eUnitType[i]==-1&&Math.floor(Math.random()*2)==0){eTrainOrder=4;eTrainSlot=i;return;};
							if(eUnitType[i]==-1&&Math.floor(Math.random()*2)==0){eTrainOrder=5;eTrainSlot=i;return;}}}
						if(Difficulty>2){TidierNumber=eUnitCounts[3]+eUnitCounts[4]+eUnitCounts[5];if(TidierNumber<4){
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(UnitCounts[5]>0&&eUnitCounts[3]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}}}}
					if(RandomNumber==2){if(UnitCounts[3]>0&&eUnitCounts[4]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}}}};
					if(RandomNumber==0){if(UnitCounts[4]>0&&eUnitCounts[5]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}}}}};
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(UnitCounts[5]>2&&eUnitCounts[3]<2){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}}}};
					if(RandomNumber==2){if(UnitCounts[3]>2&&eUnitCounts[4]<2){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}}}};
					if(RandomNumber==0){if(UnitCounts[4]>2&&eUnitCounts[5]<2){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}}}}};
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(unittotals[2]<140&&eUnitCounts[3]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}}}};
					if(RandomNumber==2){if(UnitCounts[1]>0&&eUnitCounts[4]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}}}};
					if(RandomNumber==0){if(unittotals[2]>150&&eUnitCounts[5]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}}}}};
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(unittotals[2]<125&&eUnitCounts[3]<2){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}}}};
					if(RandomNumber==2){if(UnitCounts[1]>1&&eUnitCounts[4]<2){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}}}};
					if(RandomNumber==0){if(unittotals[2]>180&&eUnitCounts[5]<2){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}}}}};
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(eUnitCounts[3]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}}}};
					if(RandomNumber==2){if(eUnitCounts[4]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}}}};
					if(RandomNumber==0){if(eUnitCounts[5]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}}}}};
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(eUnitCounts[3]==1&&eUnitCounts[4]==1&&eUnitCounts[5]==1){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}}}};
					if(RandomNumber==2){if(eUnitCounts[3]==1&&eUnitCounts[4]==1&&eUnitCounts[5]==1){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}}}};
					if(RandomNumber==0){if(eUnitCounts[3]==1&&eUnitCounts[4]==1&&eUnitCounts[5]==1){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}}}}}
					}else{for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=1;return;}}}}}}
					if(AIBuild==5){
						if(Difficulty>1&&Difficulty!=4&&int(int(timenumber)/10)==(int(timenumber)/10)){if(eUnitType[1]==-1){eTrainOrder=0;eTrainSlot=1;return};if(eUnitType[3]==-1){
						eTrainOrder=0;eTrainSlot=3;return};if(eUnitType[6]==-1){eTrainOrder=0;eTrainSlot=6;return};if(eUnitType[7]==-1){eTrainOrder=0;eTrainSlot=7;return}}}
					if(AIBuild==6){
						if(Difficulty==1){if(eUnitType[6]==-1){eTrainOrder=0;eTrainSlot=6};if(eUnitType[9]==-1){eTrainOrder=0;eTrainSlot=9}}else{if(Difficulty>2){
						if(eUnitType[7]==-1){eTrainOrder=1;eTrainSlot=7};if(eUnitType[8]==-1){eTrainOrder=1;eTrainSlot=8};if(eUnitType[0]==-1){eTrainOrder=1;eTrainSlot=0};}
						if(eTier==2){if(eUnitType[6]==-1){eTrainOrder=3;eTrainSlot=6};if(eUnitType[9]==-1){eTrainOrder=3;eTrainSlot=9};}
						if(eTier==3){if(eUnitType[6]==-1){eTrainOrder=8;eTrainSlot=6};if(eUnitType[9]==-1){eTrainOrder=8;eTrainSlot=9};}}}
					//Builds 7+
					if(AIBuild==7){
						if(Difficulty>2){for(n=6;n<10;n++){if(eUnitType[n]==-1){eTrainSlot=n;eTrainOrder=1}};if(eUnitType[0]==-1){eTrainSlot=0;eTrainOrder=8}};
						if(Difficulty<4){for(n=0;n<6;n++){if(eUnitType[n]==-1){eTrainSlot=n;if(Difficulty<3){eTrainOrder=0}else{eTrainOrder=3}}}};
						if(Difficulty==4){if(Difficulty==2){for(i=1;i<6;i++){if(eUnitType[i]==-1&&Math.floor(Math.random()*2)==0){eTrainOrder=4;eTrainSlot=i;return;};
							if(eUnitType[i]==-1&&Math.floor(Math.random()*2)==0){eTrainOrder=5;eTrainSlot=i;return;}}}
						if(Difficulty>2){TidierNumber=eUnitCounts[3]+eUnitCounts[4]+eUnitCounts[5];if(TidierNumber<4){
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(UnitCounts[5]>0&&eUnitCounts[3]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}}}}
					if(RandomNumber==2){if(UnitCounts[3]>0&&eUnitCounts[4]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}}}};
					if(RandomNumber==0){if(UnitCounts[4]>0&&eUnitCounts[5]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}}}}};
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(UnitCounts[5]>2&&eUnitCounts[3]<2){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}}}};
					if(RandomNumber==2){if(UnitCounts[3]>2&&eUnitCounts[4]<2){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}}}};
					if(RandomNumber==0){if(UnitCounts[4]>2&&eUnitCounts[5]<2){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}}}}};
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(unittotals[2]<140&&eUnitCounts[3]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}}}};
					if(RandomNumber==2){if(UnitCounts[1]>0&&eUnitCounts[4]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}}}};
					if(RandomNumber==0){if(unittotals[2]>150&&eUnitCounts[5]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}}}}};
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(unittotals[2]<125&&eUnitCounts[3]<2){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}}}};
					if(RandomNumber==2){if(UnitCounts[1]>1&&eUnitCounts[4]<2){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}}}};
					if(RandomNumber==0){if(unittotals[2]>180&&eUnitCounts[5]<2){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}}}}};
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(eUnitCounts[3]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}}}};
					if(RandomNumber==2){if(eUnitCounts[4]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}}}};
					if(RandomNumber==0){if(eUnitCounts[5]==0){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}}}}};
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(eUnitCounts[3]==1&&eUnitCounts[4]==1&&eUnitCounts[5]==1){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}}}};
					if(RandomNumber==2){if(eUnitCounts[3]==1&&eUnitCounts[4]==1&&eUnitCounts[5]==1){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}}}};
					if(RandomNumber==0){if(eUnitCounts[3]==1&&eUnitCounts[4]==1&&eUnitCounts[5]==1){for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}}}}}
					}else{for(m=1;m<6;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=0;return;}}}}}}
					if(AIBuild==8&&unittotals[1]==0){
					if(BossSpecial==3){
						if(Difficulty==3){UnitType=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];eUnitType=[1,-1,7,-1,7,-1,-1,-1,-1,-1];Minerals+=2000;FixTroops(0);BossSpecial++}
						if(Difficulty==4){UnitType=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];eUnitType=[1,-1,7,-1,7,-1,-1,-1,-1,-1];FixTroops(0);BossSpecial++}}
					if(BossSpecial==2){
						if(Difficulty==2){UnitType=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];eUnitType=[-1,-1,6,-1,6,-1,-1,-1,-1,-1];Minerals+=4500;FixTroops(0);BossSpecial++}
						if(Difficulty==3){UnitType=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];eUnitType=[1,1,1,1,1,1,-1,-1,-1,-1];Minerals+=2000;FixTroops(0);BossSpecial++}
						if(Difficulty==4){UnitType=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];eUnitType=[8,-1,8,-1,8,-1,-1,-1,-1,-1];Minerals+=4000;FixTroops(0);BossSpecial++}}
					if(BossSpecial==1){
						if(Difficulty==1){UnitType=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];eUnitType=[1,0,-1,-1,-1,0,-1,-1,-1,-1];Minerals+=10000;FixTroops(0);BossSpecial++}
						if(Difficulty==2){UnitType=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];eUnitType=[-1,0,1,0,1,0,-1,-1,-1,-1];Minerals+=4500;FixTroops(0);BossSpecial++}
						if(Difficulty==3){UnitType=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];eUnitType=[8,-1,-1,6,-1,-1,-1,-1,-1,-1];Minerals+=4200;FixTroops(0);BossSpecial++}
						if(Difficulty==4){UnitType=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];eUnitType=[-1,0,0,-1,0,0,-1,-1,-1,-1];Minerals+=2400;FixTroops(0);BossSpecial++}}}
					if(AIBuild==9&&Math.random()<0.6){
						if(unittotals[1]>unittotals[0]&&eUnitCounts[11]==0){if(eUnitType[0]==-1&&eTactics==5){eTrainOrder=11;eTrainSlot=0;return};
						for(n=6;n<8;n++){if(eUnitType[n]==-1){eTrainOrder=11;eTrainSlot=n;return}}}
						if(eTier==1){for(n=1;n<4;n++){if(eUnitType[n]==-1){eTrainOrder=0;eTrainSlot=n;return}}}
						if(eTier==1&&eUnitType[4]==-1&&eTactics>1){eTrainOrder=0;eTrainSlot=4;return};if(eTier==1&&eUnitType[4]==-1&&eTactics>1){eTrainOrder=0;eTrainSlot=5;return}
						if(eTier==2){if(Difficulty>2){if(eUnitCounts[1]<2){for(n=6;n<10;n++){if(eUnitType[n]==-1){eTrainOrder=1;eTrainSlot=n;return}}}}
							for(n=1;n<10;n++){if(eUnitType[n]==-1){eTrainOrder=Math.floor(Math.random()*3)+3;eTrainSlot=n;return}}}
					TidierNumber=eUnitCounts[6]+eUnitCounts[7]+eUnitCounts[8];if(eTier==3&&TidierNumber<2){
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(UnitCounts[8]>0&&eUnitCounts[6]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=6;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=6;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=6;return}};
					}else{if(RandomNumber==2){if(UnitCounts[6]>0&&eUnitCounts[7]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=7;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=7;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=7;return}};
					}else{if(UnitCounts[7]>0&&eUnitCounts[8]==0){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=8;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=8;eTrainOrder=8;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=8;return}}}}}
					if(UnitCounts[8]>0&&eUnitCounts[6]==0){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=8;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=6;eTrainOrder=8;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=8;return}}					
					if(eUnitCounts[10]==1&&eUnitType[0]==-1&&eTactics==5){if(eUnitCounts[8]==0){eTrainSlot=0;eTrainOrder=8;return;}else{eTrainSlot=0;eTrainOrder=6;return;}};
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*4);
					if(RandomNumber==1){if(UnitCounts[1]>2&&eUnitCounts[8]==0){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=8;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=8;eTrainOrder=8;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=8;return}};
					}else{if(RandomNumber==2){if(UnitCounts[2]>0&&eUnitCounts[8]==0){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=8;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=8;eTrainOrder=8;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=8;return}};
					}else{if(RandomNumber==3){if(eUnitCounts[7]==0&&unittotals[0]>unittotals[1]+2){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=7;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=7;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=7;return}};
					}else{if(eUnitCounts[6]==0&&unittotals[3]>149){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=6;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=6;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=6;return}}}}}}
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*9);
					if(RandomNumber<3){if(eUnitCounts[8]==0){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=8;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=8;eTrainOrder=8;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=8;return}};
					}else{if(RandomNumber>2&&RandomNumber<6){if(UnitCounts[6]>0&&eUnitCounts[7]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=7;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=7;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=7;return}};
					}else{if(RandomNumber>5&&RandomNumber<8){if(eUnitCounts[6]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=6;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=6;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=6;return}};
					}else{if(eUnitCounts[6]==0){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=6;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=8;eTrainOrder=6;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=6;return}}}}}}}
					if(eUnitCounts[1]<2){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=1;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=8;eTrainOrder=1;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=1;return}}}
					if(AIBuild==10){
						if(Math.random()<(0.2/(Math.pow(Difficulty,2)))&&eUnitType[6]==-1){eUnitType[6]=1;eUnitArray[6].gotoAndStop(20);eHP[6]=150}
						if(Math.random()<(0.2/(Math.pow(Difficulty,2)))&&eUnitType[7]==-1){eUnitType[7]=1;eUnitArray[7].gotoAndStop(20);eHP[7]=150}
						if(Math.random()<(0.2/(Math.pow(Difficulty,2)))&&eUnitType[8]==-1){eUnitType[8]=1;eUnitArray[8].gotoAndStop(20);eHP[8]=150}
						if(Math.random()<(0.2/(Math.pow(Difficulty,2)))&&eUnitType[9]==-1){eUnitType[9]=1;eUnitArray[9].gotoAndStop(20);eHP[9]=150}
						if(Difficulty>1&&Math.random()<(0.1/Difficulty)&&eUnitType[1]==-1){
							eUnitType[1]=int((Math.random()*3)+6);eUnitArray[1].gotoAndStop((eUnitType[1]+1)*10);eHP[1]=UnitHP[eUnitType[1]]}
						if(Difficulty>1&&Math.random()<(0.07/Difficulty)&&eUnitType[5]==-1){
							eUnitType[5]=int((Math.random()*9));eUnitArray[5].gotoAndStop((eUnitType[5]+1)*10);eHP[5]=UnitHP[eUnitType[5]]}}
					//Tutorial Builds
					if(AIBuild==20){
						if(TutProgress==0){
							if(MenuButton.currentFrame!=2){MenuButton.Train.gotoAndStop(2);TutorialOverlay.gotoAndStop(2);
							}else{TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1)};}
						if(TutProgress==1){
							if(BuildOrder==1){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);BuildingsA=[1,1,0,0,0,0,0,0,0,0];IronIncome=150};}
						if(TutProgress==2){
							if(BuildOrder==2){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1)};}
						if(TutProgress==3){
							if(BuildOrder==2&&Queue==2){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);MenuButton.Train.gotoAndStop(1);
							UnitsA=[1,0,0,0,0,0,0,0,0,0,0,0];MineralsIncome=150;Minerals=1000;};}
						if(TutProgress==4){
							if(MenuButton.currentFrame==3){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1)};}
						if(TutProgress==5){
							if(TrainOrder==0){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1)};}
						if(TutProgress==6){
							if(TrainOrder==0&&TrainTimer.running==true){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1)};}
						if(TutProgress==7){
							if(UnitSelected>-1){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);eMineralsIncome=UnitSelected};}
						if(TutProgress==8){
							if(eMineralsIncome!=UnitSelected){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);
							eUnitType[2]=2;eHP[2]=50;eUnitArray[2].gotoAndStop(30);};}
						if(TutProgress==9){
							for(i=0;i<10;i++){if(UnitType[i]==0&&UnitTarget[i]>-1){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);}}}
						if(TutProgress==10){
							if(eHP[2]==-1){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);
							eUnitType[6]=2;eHP[6]=50;eUnitArray[6].gotoAndStop(30);}}
						if(TutProgress==11){for(i=0;i<10;i++){if(UnitType[i]==0&&UnitTarget[i]>-1){Calculator[4]=1}}
							if(Calculator[4]==1){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1)}else{
								if(eUnitType[6]!=2){eUnitType[6]=2;eHP[6]=50;eUnitArray[6].gotoAndStop(30);}}}
						if(TutProgress==12){Calculator[4]=0;if(eUnitType[6]!=2){eUnitType[6]=2;eHP[6]=50;eUnitArray[6].gotoAndStop(30);};if(SpecialActive==true){
								TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);}}
						if(TutProgress==13){Calculator[4]=0;if(eUnitType[6]!=2){eUnitType[6]=2;eHP[6]=50;eUnitArray[6].gotoAndStop(30);}
							for(i=0;i<10;i++){if(SpecialAttacks[i].running==true){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);
							for(j=1;j<4;j++){eUnitType[j]=2;eHP[j]=10;eUnitArray[j].gotoAndStop(30)};for(j=6;j<8;j++){eUnitType[j]=2;eHP[j]=10;eUnitArray[j].gotoAndStop(30)}}}}
						if(TutProgress==14){if(eUnitType[1]==-1&&eUnitType[2]==-1&&eUnitType[3]==-1&&eUnitType[6]==-1&&eUnitType[7]==-1){
							TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);}}
						if(TutProgress==15){Calculator[4]=0;for(i=0;i<10;i++){if(UnitType[i]==-2){Calculator[4]=1;eMineralsIncome=i}}
							if(Calculator[4]==1){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);}}
						if(TutProgress==16){if(UnitType[eMineralsIncome]==-1){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);
						for(i=0;i<10;i++){UnitType[i]=-1;HP[i]=-1;UnitArray[i].gotoAndStop(1);};eUnitType[6]=2;eHP[6]=50;eUnitArray[6].gotoAndStop(30);
						MineralsIncome=0;Minerals=795;IronIncome=150;}}
						if(TutProgress==17){Calculator[4]=0;for(i=1;i<10;i++){if(UnitType[i]>-1||eUnitType[i]>-1){Calculator[4]=1}}
						if(Calculator[4]==0){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);}}}
					if(AIBuild==30){
						if(TutProgress==20){
							if(Minerals>=500){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);BuildingsA=[1,1,1,1,0,0,0,0,0,0]}else{
								TutorialOverlay.gotoAndStop(21)}}
						if(TutProgress==21){
							if(ToolsLevel>0&&BarracksLevel>0){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);BuildingsA=[1,1,1,1,0,0,1,0,0,0];}}
						if(TutProgress==22){
							if(BuildOrder==7){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);}}
						if(TutProgress==23){
							if(Tier==2){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);}}
						if(TutProgress==24){Calculator[4]=0;for(i=0;i<10;i++){if(UnitType[i]==4){Calculator[4]=1}};
							if(Calculator[4]==1){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);BuildingsA=[1,1,1,1,1,0,1,0,0,0];}}
						if(TutProgress==25){Calculator[4]=0;for(i=0;i<10;i++){if(UnitType[i]==4){Calculator[4]=1}};
							if(ShieldLevel>0){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);BuildingsA=[1,1,1,1,1,1,1,0,0,0];}}
						if(TutProgress==26){Calculator[4]=0;for(i=0;i<10;i++){if(UnitType[i]==4){Calculator[4]=1}};
							if(Tactics>0){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);}}
						if(TutProgress==27){
							if(UnitType[8]>-1){TutProgress++;TutorialOverlay.gotoAndStop(TutorialOverlay.currentFrame+1);
							Tactics=5;for(i=0;i<10;i++){CellArray[i].gotoAndStop(1);}}}}
				} else {
					//Ultimates
					var TidierNumber:Number=eUnitCounts[9]+eUnitCounts[10]+eUnitCounts[11];
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(eArchmage==true&&TidierNumber==0&&eTactics==5&&eUnitType[0]==-1&&UnitCounts[11]>0){
					eTrainSlot=0;eTrainOrder=9;return;}}else{if(RandomNumber==2){if(eDragon==true&&TidierNumber==0&&UnitCounts[9]>0){
					for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=10;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=10;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=10;return}};
					}else{if(eReaper==true && TidierNumber==0 && eTactics==5 && eUnitType[0]==-1&&UnitCounts[10]){eTrainSlot=0;eTrainOrder=11;return;}}}}
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);if(RandomNumber==1){if(eArchmage==true && TidierNumber==0 && eTactics==5 && eUnitType[0]==-1){
					eTrainSlot=0;eTrainOrder=9;return;}}else{if(RandomNumber==2){
					if(eDragon==true && TidierNumber==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=10;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=10;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=10;return}};
					}else{if(eReaper==true && TidierNumber==0 && eTactics==5 && eUnitType[0]==-1){eTrainSlot=0;eTrainOrder=11;return;}}}}
					//Tier 3
					TidierNumber=eUnitCounts[6]+eUnitCounts[7]+eUnitCounts[8];
					if(eTier==3&&TidierNumber<2){
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(UnitCounts[8]>0&&eUnitCounts[6]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=6;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=6;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=6;return}};
					}else{if(RandomNumber==2){if(UnitCounts[6]>0&&eUnitCounts[7]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=7;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=7;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=7;return}};
					}else{if(UnitCounts[7]>0&&eUnitCounts[8]==0){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=8;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=8;eTrainOrder=8;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=8;return}}}}}
					if(UnitCounts[8]>0&&eUnitCounts[6]==0){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=8;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=6;eTrainOrder=8;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=8;return}}					
					if(eUnitCounts[10]==1&&eUnitType[0]==-1&&eTactics==5){if(eUnitCounts[8]==0){eTrainSlot=0;eTrainOrder=8;return;}else{eTrainSlot=0;eTrainOrder=6;return;}};
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*4);
					if(RandomNumber==1){if(UnitCounts[1]>2&&eUnitCounts[8]==0){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=8;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=8;eTrainOrder=8;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=8;return}};
					}else{if(RandomNumber==2){if(UnitCounts[2]>0&&eUnitCounts[8]==0){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=8;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=8;eTrainOrder=8;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=8;return}};
					}else{if(RandomNumber==3){if(eUnitCounts[7]==0&&unittotals[0]>unittotals[1]+2){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=7;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=7;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=7;return}};
					}else{if(eUnitCounts[6]==0&&unittotals[3]>149){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=6;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=6;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=6;return}}}}}}
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*9);
					if(RandomNumber<3){if(eUnitCounts[8]==0){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=8;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=8;eTrainOrder=8;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=8;return}};
					}else{if(RandomNumber>2&&RandomNumber<6){if(UnitCounts[6]>0&&eUnitCounts[7]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=7;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=7;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=7;return}};
					}else{if(RandomNumber>5&&RandomNumber<8){if(eUnitCounts[6]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=6;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=6;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=6;return}};
					}else{if(eUnitCounts[6]==0){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=6;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=8;eTrainOrder=6;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=6;return}}}}}}}
					if(eUnitCounts[1]<2){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=1;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=8;eTrainOrder=1;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=1;return}}
					//Tier 2
					TidierNumber=eUnitCounts[3]+eUnitCounts[4]+eUnitCounts[5];
					if(eTier>1&&TidierNumber<4){
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(UnitCounts[5]>0&&eUnitCounts[3]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=3;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=3;return}};
					}else{if(RandomNumber==2){if(UnitCounts[3]>0&&eUnitCounts[4]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=4;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=4;return}};
					}else{if(UnitCounts[4]>0&&eUnitCounts[5]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=5;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=5;return}}}}}
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(UnitCounts[5]>2&&eUnitCounts[3]<2){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=3;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=3;return}};
					}else{if(RandomNumber==2){if(UnitCounts[3]>2&&eUnitCounts[4]<2){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=4;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=4;return}};
					}else{if(UnitCounts[4]>2&&eUnitCounts[5]<2){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=5;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=5;return}}}}}
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(unittotals[2]<140&&eUnitCounts[3]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=3;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=3;return}};
					}else{if(RandomNumber==2){if(UnitCounts[1]>0&&eUnitCounts[4]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=4;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=4;return}};
					}else{if(unittotals[2]>150&&eUnitCounts[5]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=5;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=5;return}}}}}
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(unittotals[2]<125&&eUnitCounts[3]<2){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=3;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=3;return}};
					}else{if(RandomNumber==2){if(UnitCounts[1]>1&&eUnitCounts[4]<2){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=4;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=4;return}};
					}else{if(unittotals[2]>180&&eUnitCounts[5]<2){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=5;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=5;return}}}}}
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(eUnitCounts[3]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=3;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=3;return}};
					}else{if(RandomNumber==2){if(eUnitCounts[4]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=4;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=4;return}};
					}else{if(eUnitCounts[5]==0){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=5;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=5;return}}}}}
					for(n=1;n<Math.pow(Difficulty,2);n++){RandomNumber=Math.floor(Math.random()*3);
					if(RandomNumber==1){if(eUnitCounts[3]==1&&eUnitCounts[4]==1&&eUnitCounts[5]==1){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=3;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=3;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=3;return}};
					}else{if(RandomNumber==2){if(eUnitCounts[3]==1&&eUnitCounts[4]==1&&eUnitCounts[5]==1){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=4;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=4;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=4;return}};
					}else{if(eUnitCounts[3]==1&&eUnitCounts[4]==1&&eUnitCounts[5]==1){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=5;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=5;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=5;return}}}}}}
					//Tier 1
					if(eUnitCounts[1]<2){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=1;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=8;eTrainOrder=1;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=1;return}}
					if(unittotals[3]>80&&eUnitCounts[1]<3){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=1;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=8;eTrainOrder=1;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=1;return}}
					if((eUnitCounts[0]+eUnitCounts[1])<4){for(m=6;m<8;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=0;return;}};
					if(eUnitType[8]==-1&&eTactics>0){eTrainSlot=8;eTrainOrder=0;return};if(eUnitType[9]==-1&&eTactics>2){eTrainSlot=9;eTrainOrder=0;return}}
					if((eUnitCounts[0]+eUnitCounts[1])<4){for(m=1;m<4;m++){if(eUnitType[m]==-1){eTrainSlot=m;eTrainOrder=0;return;}};
					if(eUnitType[4]==-1&&eTactics>1){eTrainSlot=4;eTrainOrder=0;return};if(eUnitType[5]==-1&&eTactics>3){eTrainSlot=5;eTrainOrder=0;return}}
					if(eUnitCounts[10]==1&&eTactics==5&&eUnitType[0]==-1){eTrainSlot=0;eTrainOrder=1;return};
				}}
		function FixTroops(pointless:int):void{
			for(n=0;n<10;n++){if(eUnitType[n]!=-1){eHP[n]=UnitHP[eUnitType[n]]*(1+(0.1*eShieldLevel));eUnitArray[n].gotoAndStop((eUnitType[n]+1)*10);}}
			for(n=0;n<10;n++){if(UnitType[n]!=-1){HP[n]=UnitHP[UnitType[n]]*(1+(0.1*eShieldLevel));UnitArray[n].gotoAndStop((UnitType[n]+1)*10);}}
			for(n=0;n<10;n++){if(eUnitType[n]==-1){eHP[n]=-1;eUnitArray[n].gotoAndStop(1);eSpecialAttacks[n].stop();eAutoAttacks[n].stop();
			};if(UnitType[n]==-1){HP[n]=-1;UnitArray[n].gotoAndStop(1);SpecialAttacks[n].stop();AutoAttacks[n].stop();}}}
		function eMo(TargetSpot:int):void {
			eIsMoving = true;Calculator[3] = eHP[k];eHP[k] = eHP[TargetSpot];eHP[TargetSpot] = Calculator[3];eUnitTarget[TargetSpot] = -1;eUnitTarget[k] = -1;
			Calculator[3] = eUnitType[k];eUnitType[k] = eUnitType[TargetSpot];eUnitType[TargetSpot] = Calculator[3];
			eUnitArray[k].gotoAndStop(((eUnitType[k] + 1) * 10)+1);eUnitArray[TargetSpot].gotoAndStop(((eUnitType[TargetSpot] + 1) * 10)+1);
			eAutoAttacks[TargetSpot].delay = UnitAuto[eUnitType[TargetSpot]];eAutoAttackMax[TargetSpot] = eAutoAttacks[TargetSpot].delay;
			eAutoAttackCurrent[TargetSpot] = 0;eUnitTarget[TargetSpot] = -1;eSpecialAttacks[TargetSpot].delay = UnitSpec[eUnitType[TargetSpot]];
			eAutoAttacks[TargetSpot].start();eSpecialAttacks[TargetSpot].start();eSpecialProgress[TargetSpot] = 0;
			if(eUnitType[k] != -1){eAutoAttacks[k].delay = UnitAuto[eUnitType[k]];eAutoAttackMax[k] = eAutoAttacks[k].delay;eAutoAttackCurrent[k] = 0; eUnitTarget[k] = -1;
			    eSpecialAttacks[k].delay = UnitSpec[eUnitType[k]];eSpecialProgress[k] = 0;eAutoAttacks[k].start();eSpecialAttacks[k].start();}
			Calculator[3] = eSpecialEffect[k];eSpecialEffect[k] = eSpecialEffect[TargetSpot];
			eSpecialEffect[TargetSpot]=Calculator[3];Calculator[3]=eUnitDebuff[k];eUnitDebuff[k] = eUnitDebuff[TargetSpot]; eUnitDebuff[TargetSpot] = Calculator[3];
			if(Reaped==k){Reaped=TargetSpot};if(LifeWard==k){LifeWard=TargetSpot};if(DarkFlamed==k){DarkFlamed=TargetSpot};eIsMoving = false;}
			
}}