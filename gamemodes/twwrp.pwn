//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//����������������������������������������������������������������������������������������������������������
//inlude
#include <TWWRP>

//pragma
#pragma dynamic 10000

//define
#define HOST_NAME 		"&The World War ������� ����"
#define MAP_NAME		"������"
#define MODE_NAME		"TWW:RP 0.04v"
#define FORUM			"www.http:aa"

#define SERVER_NAME     "The World War Role Play Game"
#define SCRIPT_VERSION 	"TWWRP 0.04v"
#define MANAGER      	"Master"
#define MODEMAKER      	"��ȣ��"
#define OBJECTMAKER     "�ֿ��� ��ȣ��"

#define MySQL_HOST 		"localhost"
#define MySQL_User 		"root"
#define MySQL_DB		"twwrp"
#define MySQL_Password 	"ghwls12"
#define MySQL_Table    	"user"

#define RGBToHex(%0,%1,%2,%3) %0 << 24 | %1 << 16 | %2 << 8 | %3
#define SetPlayerPosEx(%0,%1,%2,%3,%4,%5); SetPlayerPos(%0, %1, %2, %3); SetPlayerInteriorEx(%0,%4); SetPlayerVirtualWorldEx(%0, %5);

#define MAX_DROP_ITEM 100 // ���� �ִ� ��� ���� [100�� ����]
#define MAX_INVENTORY 50 // �ִ� ������ ���� ���� 10�� ����
#define MAX_NPC 100 // �ִ� NPC ��
#define MAX_WEAPON_SLOT 13 // ���� �ִ� ����
#define MAX_MOVE_OBJECT 30 // ���������Ʈ �ִ� ����
#define MAX_ENTER 100 // �ִ� ��/�� ����
#define MAX_GANGZONE 20 + 2 //�ִ� ���� ����
#define MAX_OCCUPY_AREA 50 //�ִ� ������ ����
#define MAX_PLATOON 30 + 1// �ִ� �Ҵ� ����
#undef MAX_PLAYERS
#define MAX_PLAYERS 100 //�ִ� �÷��� ��
#define MAX_COUNTRY_VEHICLE 100 // ���� ���� �ִ� ����
#define MAX_BOMB 5
#define FADE_DELAY 50
#define DIETIME 300 //���� �ð�
#define PickupDown 0.5
#define DROP_ITEM_TIMER 30
#define PILLHEALTH 15.0 // �˾� �Ծ��� �� ������ ü��
#define MAX_COUNTRY 3
#define Initial_Money 1000 // ���� �ʱ� ��
#define MAX_PRODUCT 50
#define MAX_BONFIRE 100
#define MAX_VEHICLE_MODEL 611 + 1//400 ~ 611 for���� �� 400���� ����.
#define MAX_STARTUP_PLATOON 5
#define MAX_CLASS 20

//anti amx & main
main(){}
AntiDeAMX()
{
	new a[][] =
	{
		"Unarmed (Fist)",
		"Brass K"
	};
	#pragma unused a
}
//new
new ServerONCheck;
new ServerDBConnect = -1;
new MySQL = -1;
new Weather = 1;//��������
new Server_Info_Check = 0;
new MoveObjectNumber = 0;
new MoveObjectTimer[MAX_MOVE_OBJECT] = 0;
new LoadEnterCheck = 0;
new LoadGangzoneCheck = 0;
new OccupyAreaCheck = 0;
new PlatoonCheck = 0;
new CountryVehicleCheck = 0;
new NewbieChannel = 0;
new CountryInfo_Money[MAX_COUNTRY];
new LoadProductCheck = -1;
new ObjectCampfire[MAX_BONFIRE][9];

//enum
enum pInfo
{
    ORM:ORM_ID,
	pPassword[128],
	pName[MAX_PLAYER_NAME+1],
	pID,
	pSex,
	pCountry,
	pAdmin,
	pAdminName[128],
	pTut,
	pAge,
	pPhoneNum,
	pInterior,
	pVirtualWorld,
	Float:pPosX,
	Float:pPosY,
	Float:pPosZ,
	Float:pAngle,
	pNPCQwest,
	pPlatoon,
	pCorps,
	pClass,
	pMoney,
	pWeaponID[MAX_WEAPON_SLOT],
	pAmmo[MAX_WEAPON_SLOT],
	pPlayHour,
	pPlayMinute,
	pPlaySecond,
	Float:pHealth,
	Float:pArmour,
	pPlatoonLevel,
	pMedal,
	pPlatoonType,
	pDeMorgan,
	pDeMorganTimer,
	pJail,
	pJailTimer,
	pWarning,
	pgIDBanName[128],
	pIDBanDate[3],
	pIDBan,
	pIDBanReason[128],
	pChatBan,
	pDie,
	pDieTime,
	pPhoneFrequency,
	pClothes,
	pI_ItemID[MAX_INVENTORY],
	pI_Number[MAX_INVENTORY],
	pEnlistDate[3],
	pPraise,
	pSet_Spec,
	pHungry,
    pClean,
    pDonation,
	//MySQL don't save
	pLogin,
	pNPCQwestTimer,
	pBuyItem[4],
	pTutDelay,
	pProductNumber[MAX_PRODUCT],
	pProductNumber_,
	pAmourTimer,
	pBattalionRadio,
	pOldVehicle,
	pVehicleStart_Cre,
	pVehicleStart_Model,
	pCreEnterType,
	pFirstaid,
	pBarricade[3],
	pBarricadeObject[3],
	Text3D:pBarricadeLabel[3],
	pgFirstaid,
	pAntiHackDelay,
	pSoliderBag,
	Text3D:pSoliderBagLabel,
	pSoliderBagObject,
	pClockMinute,
	pCh_Whisper,
	Float:pCreEnterPos1[3],
	Float:pCreEnterPos2[3],
	pCampfireID,
	pSaveTimer,
	pCreEnterInt1,
	pCreEnterVW1,
	pCreEnterVW2,
	pCreEnterInt2,
	pCreEnterID,
	bool:pCampfire,
    bool:pShowInfo,
	pCreEnterName,
	pEnterNumber[MAX_ENTER],
	pPhoneTakeMode,
	pProductEdit,
	pProductOjbectID,
	pEnterList,
	pClockSecond,
	pClockMode,
	pEnterEdit,
	pGangzoneCre,
	pCustom,
	pCustomObject[10],
	Float:pGangzoneS_PosX,
	Float:pGangzoneS_PosY,
	Float:pGangzoneS_PosZ,
	Float:pGangzoneE_PosX,
	Float:pGangzoneE_PosY,
	Float:pGangzoneE_PosZ,
	pGangzoneNameEdit,
	pGangzoneList,
	pGangzoneNumber[MAX_GANGZONE],
	Float:pOccupyAreaPosX,
    Float:pOccupyAreaPosY,
    Float:pOccupyAreaPosZ,
    pOccupyAreaCre,
    pOccupyAreaNumber[MAX_OCCUPY_AREA],
    pTeleportOccupy[MAX_OCCUPY_AREA],
    pOccupyAreaList,
    pOccupyAreaEditType,
    pDoingGage,
    pDoing,
    pOccupy_ING,
    pOccupy_Area,
    pOccupyTimer,
    pOccupy_Gangzone,
    Float:pS_LPosX,
    Float:pS_LPosY,
    Float:pS_LPosZ,
    pSatellite,
    pPlatoonCreName[128],
    pPlatoonCre,
	pPlatoonEditNumber[MAX_PLATOON],
	pPlatoonEditState,
	pPlatoonEditList,
	pPlatoonNumber,
	pPlatoonCreContry,
	pTeleport,
	pTakeItem[MAX_DROP_ITEM],
	pAmmoHackCheck,
	pAdminWork,
	Text3D:p3DAdminLabel,
	Float:pW_Health,
	Float:pW_Armour,
	pInfoTage,
	Text3D:pInfoTageLabel,
	pOldClass,
	pOldCorps,
	pOldPlatoon,
	pSmokeStart,
	pBeerStart,
	pKillAnimTimer,
	pgClickName[MAX_PLAYER_NAME+1],
	pgClickID,
	pI_Select,
	pI_SelectCheck,
	pgMorphine[MAX_PLAYERS],
	pOldPlatoonName[128],
	pPillEat,
	pPillTimer,
	pWork,
	pC4Object[MAX_BOMB],
	pC4EmplaceTimer,
	pC4Emplace
	//MySQL don't save
};
new PlayerInfo[MAX_PLAYERS][pInfo];
new PlayerBar:DoingBar[MAX_PLAYERS];
enum qInfo
{
	Float:qPosX,
	Float:qPosY,
	Float:qPosZ
};
new QwestInfo[MAX_PLAYERS][qInfo];

enum v_sInfo
{
	v_sCreate,
	v_sClass,
	v_sModelID,
	v_sPlatoon[MAX_STARTUP_PLATOON]
};
new VehiclestartupInfo[MAX_VEHICLE_MODEL][v_sInfo];

enum iInfo
{
	iCreate,
	iObject,
	iModel,
	wType,
	iItemID,
	iNumber,
	iName[128],
	iTimer,
	Float:iPosX,
	Float:iPosY,
	Float:iPosZ
};
new DropItemInfo[MAX_DROP_ITEM][iInfo];

enum mInfo
{
    mCreate, mObjectID, mType, Float:mSpeed, Float:mDistance, mState,
	Float:mPosX, Float:mPosY, Float:mPosZ, Float:mPosrX, Float:mPosrY, Float:mPosrZ,
	Float:mPosX2, Float:mPosY2, Float:mPosZ2, Float:mPosrX2, Float:mPosrY2, Float:mPosrZ2
};
new MoveObjectInfo[MAX_MOVE_OBJECT][mInfo];

enum p_dInfo
{
	p_dCreate,
	p_dObjectID,
	p_dMoney,
	p_dNumber,
	p_dPickup,
	Float:p_dPos[3]
};
new ProductInfo[MAX_PRODUCT][p_dInfo];

enum gInfo
{
	gCreate,
	gColor[32],
	gNumber,
	gGangzone,
	gName[128],
	gArea,
	Float:gS_PosX,
	Float:gS_PosY,
	Float:gE_PosX,
	Float:gE_PosY,
	gFlash,
	gFlashColor[32],
	Float:gS_PosZ,
	Float:gE_PosZ
};
new GangzoneInfo[MAX_GANGZONE][gInfo];

enum eInfo
{
	eCreate,
	eID,
	Float:ePosX,
	Float:ePosY,
	Float:ePosZ,
	Float:eInPosX,
	Float:eInPosY,
	Float:eInPosZ,
	eInterior,
	eVirtualWorld,
	eInInterior,
	eInVirtualWorld,
	epickupid,
	eName[128],
	eType,
	eInNotice[128],
	ePickup,
	Text3D:e3DLabel,
	eInPickup
};
new EnterInfo[MAX_ENTER][eInfo];

enum oInfo
{
	oCreate,
	oCountry,
	oNumber,
	oName[128],
	oPickup,
	oOccupy,
	Float:oPosX,
	Float:oPosY,
	Float:oPosZ
};
new Occupy_AreaInfo[MAX_OCCUPY_AREA][oInfo];

enum p_tInfo
{
	p_tCreate,
	p_tNumber,
	p_tType,
	p_tName[128],
	p_tCountry,
	p_t_Number
};
new PlatoonInfo[MAX_PLATOON][p_tInfo];

enum vInfo
{
	vCreate,
	vCountry,
	vVehicleID,
	vModelID,
	vColor1,
	vColor2,
	vNumber,
	vFuel,
	bool:vEngine,
	vLock,
	Float:vHealth,
	Float:vPosX,
	Float:vPosY,
	Float:vPosZ,
	Float:vAngle
};
new VehicleInfo[MAX_VEHICLES][vInfo];

enum _ItemInfo
{
	_ItemID,
	_ModelID,
	_LimitNum,
	_ItemName[52]
};
enum _FactionInfo
{
	_fName[52],
	_fType
};

new const ItemInfo[][_ItemInfo] =
{
	{0,-1,-1,"����"},{1,331,1,"��Ŭ"},{2,333,1,"����ä"},{3,334,1,"������"},{4,335,1,"������"},{5,336,1,"�߱���Ʈ"},{6,337,1,"��"},
	{7,338,1,"�籸ä"},{8,339,1,"īŸ��"},{9,341,1,"������"},{10,321,1,"����� ����"},{11,322,1,"����"},{12,323,1,"������"},{13,324,1,"���� ������"},
	{14,325,1,"�ɴٹ�"},{15,326,1,"������"},{16,342,-1,"����ź"},{17,343,-1,"����ź"},{18,344,-1,"ȭ����"},{19,-1,-1,"����"},{20,-1,-1,"����"},
	{21,-1,-1,"����"},{22,346,-1,"��Ʈ"},{23,347,-1,"���� ��Ʈ"},{24,348,-1,"����Ʈ �̱�"},{25,349,-1,"����"},{26, 350,-1,"����ٷ� ����"},{27,351,-1,"�ĺ� ����"},
	{28,352,-1,"����"},{29,353,-1,"MP5"},{30,355,-1,"AK-47"},{31,356,-1,"M4-1"},{32,372,-1,"Tec-9"},{33,357,-1,"������"},{34,358,-1,"��������"},{35, 359,-1,"RPG"},
	{36,360,-1,"HS Rocket"},{37,361,-1,"ȭ������"},{38,362,-1,"�̴ϰ�"},{39,363,-1,"C4"},{40,364,-1,"���� ��ġ"},{41,365,-1,"��������"},{42,366,-1,"��ȭ��"},
	{43,367,-1,"ī�޶�"},{44,368,1,"���"},{45,369,1,"���"},{46,371,1,"���ϻ�"}, //WeaponID
	{47,1580,5,"����"},{48,2709,5,"�˾�"},{49,330,1,"������"},{50,1252,5,"C4"},{51,2041,300,"����ź��"},{52,1485,20,"���"},{53, 1546,5,"����"}
};

new const MessageText[22][128] =
{
	{"���� �α����� ���� �ʾҽ��ϴ�."},
	{"������ �ƴմϴ�."},
	{"������ �ƴϰų� ���� ������ �����մϴ�."},
	{"�� �÷��̾�� �������� �ʾҽ��ϴ�."},
	{"�����ȿ� ���� �ʰų�, �� �����ȿ��� �̹� �ٸ� �������� �ֽ��ϴ�."},
	{"����� ������ �÷��̾�� ���� �������� �ʾҰų� �α����� ���� �ʾҽ��ϴ�."},
	{"�� �÷��̾�� ��Ű� �ٸ� ������ �ҼӵǾ��ִ� ����Դϴ�."},
	{"��ɰ��� �ƴմϴ�."},
	{"�Ҵ����� �ƴմϴ�."},
	{"�� �÷��̾�� �̹� �ٸ� �Ҵ��� �Ҵ����Դϴ�."},
	{"������ �ƴϰų� �Ҵ����� �ƴմϴ�."},
	{"�� �÷��̾�� �ٸ� �Ҵ뿡 ���ԵǾ� �ֽ��ϴ�."},
	{"�� �÷��̾�� �̹� �ٸ� �Ҵ뿡 ���ԵǾ� �ֽ��ϴ�."},
	{"�� �÷��̾�� ��� ������ ���� �ʽ��ϴ�."},
	{"�� �÷��̾�� ������ �ƴϰų� ���� ������ �����մϴ�."},
	{"�ٽ� �õ����ּ���."},
	{"�� �÷��̾�� �������� �ʾҽ��ϴ�."},
	{"�������� �������� �ʰ� �ְų�, �ʿ��� ������ �����մϴ�."},
	{"ä�� �����Ǿ��� ������ ���� �� �� �����ϴ�."},
	{"���� �Ͻð��� �޷��� �����մϴ�."},
	{"���Ե� �Ҵ밡 �����ϴ�."},
	{"���� ���¿����� �� �� ���� �ൿ�Դϴ�."}
};

new const _FactionName[6][_FactionInfo] = //����, ��ȣ �ٲٴ� ���� ������ �������� _ �ϳ��� �ǵ��� �� ��.
{
    {"�ӽüҴ�", 1},
	{"�ϹݼҴ�", 2},
	{"Ư���Ҵ�", 3},
	{"�������� �Ҵ�", 4},
	{"�װ��Ҵ�", 5},
	{"��ɺδ�", 6}
};
public OnGameModeInit()//This callback is triggered when the gamemode starts.
{
    mysql_log(LOG_ERROR | LOG_WARNING, LOG_TYPE_HTML);
	MySQL = mysql_connect(MySQL_HOST, MySQL_User, MySQL_DB, MySQL_Password);
	if(mysql_errno()) ServerDBConnect = 0;
	else ServerDBConnect = 1;
	
	mysql_set_charset("euckr");
	if(ServerDBConnect == 1) CreateUserColumn();
	MapAndreas_Init(MAP_ANDREAS_MODE_FULL);
    Audio_CreateTCPServer(7777);
    
	new string[128];
	format(string, sizeof(string), "hostname %s", HOST_NAME);
	SendRconCommand(string);
	format(string, sizeof(string), "mapname %s", MAP_NAME);
	SendRconCommand(string);
	format(string, sizeof(string), "weburl %s", FORUM);
	SendRconCommand(string);
	SetGameModeText(MODE_NAME);
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);

	//MOVEOBJECT
	MoveObjectNumber = 0;
	CreateDynamicMoveObject(18755, -1332.23364, 445.75681, 8.12570, 0, 0, 0, -1332.23364, 445.75681, 30.90560, 0, 0, 0,_,_,0,5.0,5.0, "FŰ�� �����ּ���");//���þ� ����������
	CreateDynamicMoveObject(980, -1527.17493, 482.52319, 8.93010, 0, 0, 0, -1527.17493, 482.52319, 3.39284, 0, 0, 0,_,_,1,3.0,5.0, "FŰ�� �����ּ���");//���þ� �Ա�
	CreateDynamicMoveObject(980, 91.67800, 1921.15540, 19.77480, 0, 0, 90, 91.67800, 1921.15540, 14.16386, 0, 0, 90,_,_,1,3.0,5.0, "FŰ�� �����ּ���");//�̱� �Ա�

	CreatePickup(1239,1,1213.0793,-246.6340,1021.7993,-1); // Ʃ�丮�� �� �ִ� �Ⱦ�
	CreatePickup(1239,1,296.4462,-38.3054,1001.5156,-1); // �̱� ���� �Ⱦ�
	CreatePickup(1239,1,295.4839,-80.6940,1001.5156,-1); // ���þ� ���� �Ⱦ�
	CreatePickup(1239,1,1214.6433,-251.8133,1021.7993,-1);//Ʃ�丮�� �Ⱦ�
	
	CreateTextPickup(1239, 429.1193,617.2222,1021.4828, ""#C_RED"[!]\n"#C_WHITE"/�����\n/���"); //���þ� �ӽù���/������
	CreateTextPickup(1239, -226.3625,276.5709,1004.4833, ""#C_RED"[!]\n"#C_WHITE"/�����\n/���"); //�̱� �ӽù���/������
	CreateTextPickup(1239, 202.6366,1887.6580,17.6481, ""#C_WHITE"�ӽüҴ� ����\nFŰ�� �����ּ���."); //�̱� �ӽüҴ� �������
	CreateTextPickup(1239, -1289.2260,440.8935,7.1809, ""#C_WHITE"�ӽüҴ� ����\nFŰ�� �����ּ���."); //���þ� �ӽüҴ� �������

	NewbieChannel = 1;
	ObjectLoad(); NPCConnect(); LoadEnter(); LoadGangzone(); LoadOccupyArea(); LoadPlatoon(); LoadCountryVehicle(); Load_Server_Info(); LoadProduct(); LoadVehiclestartup();


	//Streamer_MaxItems(STREAMER_TYPE_OBJECT, 900); // �� ������ ������Ʈ�� 100���� �����ϹǷ� 900�� �ε�
	Streamer_VisibleItems(STREAMER_TYPE_OBJECT, 900); // �� ������ ������Ʈ�� 100���� �����ϹǷ� 900�� �ε�


    DisableInteriorEnterExits();
	ShowPlayerMarkers(false);
	EnableStuntBonusForAll(false);
	ManualVehicleEngineAndLights();
	ShowNameTags(true);
    ServerONCheck = 1;
    
	SetTimer("ServerON", 300, false);
	SetTimer("ServerTimer", 1000, true);
	SetTimer("AutoSave", 3000, true);
	SetTimer("AntiHack", 500, true);

	CreateCountryVehicle(470,234.3007,1902.2339,17.6349,90.0,0,0,1); // �̱����
	CreateCountryVehicle(470,234.3007,1896.1626,17.6326,90.0,0,0,1); // �̱����
	CreateCountryVehicle(470,234.3007,1889.8444,17.6339,90.0,0,0,1); // �̱����
	CreateCountryVehicle(470,234.3007,1884.1542,17.6354,90.0,0,0,1); // �̱����
	CreateCountryVehicle(470,234.3007,1877.9207,17.6338,90.0,0,0,1); // �̱����
	CreateCountryVehicle(470,234.3007,1872.0375,17.6338,90.0,0,0,1); // �̱����
	CreateCountryVehicle(471,282.3509,1907.9001,17.1260,90.0,0,0); // �̱�����
	CreateCountryVehicle(471,282.3509,1911.5399,17.1186,90.0,0,0); // �̱�����
	CreateCountryVehicle(471,285.3509,1907.9777,17.1292,90.0,0,0); // �̱�����
	CreateCountryVehicle(471,285.3509,1911.5936,17.1455,90.0,0,0); // �̱�����
	CreateCountryVehicle(424,285.3509,1904.3510,17.4281,90.0,0,0,1); // �̱�������
	CreateCountryVehicle(424,285.3509,1900.5618,17.4286,90.0,0,0,1); // �̱�������
	CreateCountryVehicle(424,285.3509,1897.1604,17.4286,90.0,0,0,1); // �̱�������
	CreateCountryVehicle(525,282.8848,1868.8901,17.5152,90.0,0,0,1); // �̱� ��� Ʈ��
	CreateCountryVehicle(525,282.8848,1865.2587,17.5216,90.0,0,0,1); // �̱� ��� Ʈ��
	CreateCountryVehicle(416,282.8848,1861.6127,17.7874,90.0,1,1,1); // �̱� ���深��
 	CreateCountryVehicle(416,282.8848,1858.0444,17.7966,90.0,1,1,1); // �̱� ���深��
	CreateCountryVehicle(573,282.8848,1854.1163,18.2920,90.0,0,0,1); // �̱� ��
	CreateCountryVehicle(578,280.6710,1849.5992,18.2677,90.0,0,0,1); // �̱� DFT-30
	CreateCountryVehicle(468,285.3509,1895.3684,17.3161,90.0,0,0,1); // �̱���ü��
	CreateCountryVehicle(468,285.3509,1894.0629,17.3161,90.0,0,0,1); // �̱���ü��
	CreateCountryVehicle(596,282.8848,1890.4163,17.3667,90.0,0,0,1); // �̱�������
	CreateCountryVehicle(596,282.8848,1886.7815,17.3629,90.0,0,0,1); // �̱�������
	CreateCountryVehicle(490,282.8848,1883.1293,17.7853,90.0,0,0,1); // �̱�����
	CreateCountryVehicle(490,282.8848,1879.2932,17.7683,90.0,0,0,1); // �̱�����
	CreateCountryVehicle(500,285.3509,1876.3203,17.7480,90.0,0,0,1); // �̱��屳��
	CreateCountryVehicle(523,285.3509,1874.4119,17.2114,90.0,0,0,1); // �̱�����İ
	CreateCountryVehicle(523,285.3509,1873.2550,17.2114,90.0,0,0,1); // �̱�����İ
	CreateCountryVehicle(523,285.3509,1871.7699,17.2115,90.0,0,0,1); // �̱�����İ
	CreateCountryVehicle(548,350.3255,1978.5098,19.2824,135.0,0,0,1); // �̱�ī���
	CreateCountryVehicle(497,350.3255,1951.4077,17.7816,135.0,0,0,1); // �̱����
	CreateCountryVehicle(497,350.3255,1931.2837,17.7826,135.0,0,0,1); // �̱����
	CreateCountryVehicle(497,350.3255,1911.6624,17.7783,135.0,0,0,1); // �̱����
	CreateCountryVehicle(476,311.8095,2033.0648,18.4062,180.0,0,0,1); // �̱�������
	CreateCountryVehicle(476,297.0261,2033.0648,18.4114,180.0,0,0,1); // �̱�������
	CreateCountryVehicle(476,311.8095,2048.6477,18.4068,180.0,0,0,1); // �̱�������
	CreateCountryVehicle(476,297.0261,2048.6477,18.4080,180.0,0,0,1); // �̱�������
	CreateCountryVehicle(511,306.7570,1799.0391,19.0753,0.0,0,0,1); // �̱����
	
	CreateCountryVehicle(470,-1340.4360,456.4417,7.1781,0.0,0,0,2); // ���þ����
	CreateCountryVehicle(470,-1343.8666,456.4417,7.1770,0.0,0,0,2); // ���þ����
	CreateCountryVehicle(470,-1346.9589,456.4417,7.1781,0.0,0,0,2); // ���þ����
	CreateCountryVehicle(470,-1350.2252,456.4417,7.1803,0.0,0,0,2); // ���þ����
	CreateCountryVehicle(470,-1353.4426,456.4417,7.1829,0.0,0,0,2); // ���þ����
	CreateCountryVehicle(470,-1356.6353,456.4417,7.1799,0.0,0,0,2); // ���þ����
	CreateCountryVehicle(424,-1359.8136,456.4417,6.9679,0.0,0,0,2); // ���þư�����
	CreateCountryVehicle(424,-1363.5675,456.4417,6.9691,0.0,0,0,2); // ���þư�����
	CreateCountryVehicle(424,-1367.3159,456.4417,6.9677,0.0,0,0,2); // ���þư�����
	CreateCountryVehicle(468,-1369.7585,456.4417,6.8567,0.0,0,0,2); // ���þƻ�ü��
	CreateCountryVehicle(468,-1370.9170,456.4417,6.8566,0.0,0,0,2); // ���þƻ�ü��
	CreateCountryVehicle(525,-1390.5355,456.4417,7.0599,0.0,0,0,2); // ���þ� ��� Ʈ��
	CreateCountryVehicle(525,-1393.8617,456.4417,7.0637,0.0,0,0,2); // ���þ� ��� Ʈ��
	CreateCountryVehicle(416,-1397.5402,456.4417,7.3753,0.0,0,0,2); // ���þ� ���深��
	CreateCountryVehicle(416,-1401.0262,456.4417,7.3767,0.0,0,0,2); // ���þ� ���深��
	CreateCountryVehicle(573,-1404.9342,456.4417,7.7966,0.0,0,0,2); // ���þ� ��
	CreateCountryVehicle(578,-1408.6306,458.8828,7.8082,0.0,0,0,2); // ���þ� DFT-30
	CreateCountryVehicle(490,-1373.2555,456.4417,7.4093,0.0,0,0,2); // ���þƷ���
	CreateCountryVehicle(490,-1376.8641,456.4417,7.3151,0.0,0,0,2); // ���þƷ���
	CreateCountryVehicle(596,-1380.1650,456.4417,6.9078,0.0,0,0,2); // ���þư�����
	CreateCountryVehicle(596,-1383.4508,456.4417,6.9077,0.0,0,0,2); // ���þư�����
	CreateCountryVehicle(523,-1385.6572,456.4417,6.7582,0.0,0,0,2); // ���þƿ���İ
	CreateCountryVehicle(523,-1386.7744,456.4417,6.7576,0.0,0,0,2); // ���þƿ���İ
	CreateCountryVehicle(523,-1387.8075,456.4417,6.7437,0.0,0,0,2); // ���þƿ���İ
	CreateCountryVehicle(417,-1353.7104,346.0401,30.1806,45.0,0,0,2); // ���þƷ����ź
	CreateCountryVehicle(497,-1369.4349,346.0401,30.2256,45.0,0,0,2); // ���þ����
	CreateCountryVehicle(497,-1386.7396,346.0401,30.2251,45.0,0,0,2); // ���þ����
	CreateCountryVehicle(497,-1402.0178,346.0401,30.2228,45.0,0,0,2); // ���þ����
	CreateCountryVehicle(476,-1457.6907,423.4339,30.8008,270.0,0,0,2); // ���þƷ�����
	CreateCountryVehicle(476,-1457.6907,409.1571,30.8139,270.0,0,0,2); // ���þƷ�����
	CreateCountryVehicle(476,-1473.9941,423.4339,30.8248,270.0,0,0,2); // ���þƷ�����
	CreateCountryVehicle(476,-1473.9941,409.1571,30.8009,270.0,0,0,2); // ���þƷ�����
	CreateCountryVehicle(511,-1448.6418,384.9309,31.5245,270.0,0,0,2); // ���þƺ��
	return 1;
}
public OnGameModeExit()//This callback is called when a gamemode ends, either through 'gmx', the server being shut down, or GameModeExit.
{
    MapAndreas_Unload();
    for(new i = 0; i < MAX_PLAYERS; i ++)
		OnPlayerSave(i);

	for(new o = 0; o < MAX_OCCUPY_AREA; o ++)
	    SaveOccupyArea(o);
	for(new g = 0; g < MAX_GANGZONE; g ++)
		SaveGangzone(g);
	for(new e = 0; e < MAX_ENTER; e ++)
        SaveEnter(e);
    Save_Server_Info();
	return 1;
}
public OnPlayerRequestClass(playerid, classid) // Called when a player changes class at class selection
{
	SetPlayerPos(playerid, -1420.8331,2102.2981,63+1.8472);
    SetPlayerCameraPos(playerid, -1422.5554,2112.1846,62.5545);
	SetPlayerCameraLookAt(playerid, -1429.1531,2169.1504,55.3041);
	return 1;
}

public OnPlayerConnect(playerid)//This callback is called when a player connects to the server.
{
	if(!IsPlayerNPC(playerid))
	{
	    if(ServerDBConnect == 0)//MySQL ���� ����
	    {
	        SendMessage(playerid, "DB������ ������ ������ �Ұ��� �մϴ�.");
			KickEx(playerid, 1);
			return 1;
		}
  		new query[128], PlayerIP[32], PlayerIP2[32], ips[4][4];
		GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
		split(PlayerIP, ips, '.');
		format(PlayerIP2, sizeof(PlayerIP2), "%s.%s.%s.*",ips[0],ips[1],ips[2]);

		mysql_format(MySQL, query, sizeof(query), "SELECT * FROM `ban` WHERE (`IP` = '%s' OR `IP` = '%s' OR `Name` = '%s') LIMIT 1",PlayerIP, PlayerIP2, PlayerNameEx(playerid));
	    new Cache:result = mysql_query(MySQL, query, true);
	    new rowsnum = cache_num_rows(MySQL);
		if(rowsnum > 0)
		{
		    for(new num = 0; num < rowsnum; num ++)
		    {
			    new reason[128];
			    cache_get_field_content(num, "reason", reason);

			    new year;
			    year = cache_get_field_content_int(num, "Year");

			    new month;
			    month = cache_get_field_content_int(num, "Month");

			    new day;
			    day = cache_get_field_content_int(num, "Day");

			    new AdminName[128];
			    cache_get_field_content(num, "gA_Name", AdminName);

			    new string[256];
			    format(string, sizeof(string), ""#C_GRAY"\t- IP�� - \n\n"#C_WHITE"�̸� : %s\n��¥ : %d�� %d�� %d��\n��� ������ : %s\n���� : %s\n\n",
				PlayerNameEx(playerid),year,month,day,AdminName,reason);
				ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, "The World War", string, "Ȯ��", "");

			    KickEx(playerid, 1);
			}
			cache_delete(result);
		    return 1;
		}
		cache_delete(result);

		SetPlayerColor(playerid, COLOR_GRAY);
		//=============================================================================���þ� ���̽� ����
		RemoveBuildingForPlayer(playerid, 968, -1526.4375, 481.3828, 6.9063, 0.25);
		RemoveBuildingForPlayer(playerid, 966, -1526.3906, 481.3828, 6.1797, 0.25);
		RemoveBuildingForPlayer(playerid, 10829, -1523.2578, 486.7969, 6.1563, 0.25);
		//=============================================================================���þ� ���̽� ����
		//=============================================================================�̱� ���̽� ����
  		RemoveBuildingForPlayer(playerid, 16093, 211.6484, 1810.1563, 20.7344, 0.25);
		RemoveBuildingForPlayer(playerid, 16638, 211.7266, 1809.1875, 18.9844, 0.25);
		RemoveBuildingForPlayer(playerid, 16094, 191.1406, 1870.0391, 21.4766, 0.25);
		RemoveBuildingForPlayer(playerid, 16096, 120.5078, 1934.0313, 19.8281, 0.25);
		//=============================================================================�̱� ���̽� ����
		//=============================================================================Ĳ���� ����
		RemoveBuildingForPlayer(playerid, 16412, -215.2344, 1119.1953, 18.3516, 0.25);
		RemoveBuildingForPlayer(playerid, 16435, -209.6641, 1066.5234, 22.2578, 0.25);
		RemoveBuildingForPlayer(playerid, 16476, -98.1953, 1180.0703, 18.7344, 0.25);
		RemoveBuildingForPlayer(playerid, 3360, -362.0625, 1198.6563, 18.5938, 0.25);
		RemoveBuildingForPlayer(playerid, 16506, -144.0547, 1227.3047, 18.8984, 0.25);
		RemoveBuildingForPlayer(playerid, 16604, -64.7344, 1221.2969, 18.7344, 0.25);
		RemoveBuildingForPlayer(playerid, 16617, -122.7422, 1122.7500, 18.7344, 0.25);
		RemoveBuildingForPlayer(playerid, 774, -178.8516, 949.6172, 15.3438, 0.25);
		RemoveBuildingForPlayer(playerid, 16061, -193.3750, 1055.2891, 18.3203, 0.25);
		RemoveBuildingForPlayer(playerid, 669, -233.1172, 1061.6563, 18.8594, 0.25);
		RemoveBuildingForPlayer(playerid, 16005, -209.6641, 1066.5234, 22.2578, 0.25);
		RemoveBuildingForPlayer(playerid, 669, -239.3359, 1070.2813, 18.7813, 0.25);
		RemoveBuildingForPlayer(playerid, 700, -289.0625, 1074.9766, 19.0156, 0.25);
		RemoveBuildingForPlayer(playerid, 3252, -99.9844, 919.2656, 19.4922, 0.25);
		RemoveBuildingForPlayer(playerid, 691, 1.2578, 1027.0938, 18.5625, 0.25);
		RemoveBuildingForPlayer(playerid, 691, 27.4297, 1056.7656, 18.5625, 0.25);
		RemoveBuildingForPlayer(playerid, 16006, -215.2344, 1119.1953, 18.3516, 0.25);
		RemoveBuildingForPlayer(playerid, 16060, -192.0469, 1147.3906, 17.6953, 0.25);
		RemoveBuildingForPlayer(playerid, 16500, -360.7656, 1194.2578, 20.5938, 0.25);
		RemoveBuildingForPlayer(playerid, 3359, -362.0625, 1198.6563, 18.5938, 0.25);
		RemoveBuildingForPlayer(playerid, 16781, -144.0547, 1227.3047, 18.8984, 0.25);
		RemoveBuildingForPlayer(playerid, 1308, -111.7422, 1087.5000, 19.4844, 0.25);
		RemoveBuildingForPlayer(playerid, 16385, -122.7422, 1122.7500, 18.7344, 0.25);
		RemoveBuildingForPlayer(playerid, 669, -53.2656, 1135.5781, 18.6797, 0.25);
		RemoveBuildingForPlayer(playerid, 652, -45.2031, 1130.4141, 17.7734, 0.25);
		RemoveBuildingForPlayer(playerid, 1345, -88.8594, 1165.3828, 19.4609, 0.25);
		RemoveBuildingForPlayer(playerid, 16475, -98.1953, 1180.0703, 18.7344, 0.25);
		RemoveBuildingForPlayer(playerid, 16605, -64.7344, 1221.2969, 18.7344, 0.25);
		RemoveBuildingForPlayer(playerid, 652, -128.2734, 1232.8438, 18.6563, 0.25);
		RemoveBuildingForPlayer(playerid, 652, -127.2656, 1222.5156, 18.6563, 0.25);
		RemoveBuildingForPlayer(playerid, 669, -36.4922, 1136.0703, 18.6797, 0.25);
		RemoveBuildingForPlayer(playerid, 700, 19.8281, 1085.3984, 19.0469, 0.25);
		//=============================================================================Ĳ���� ����
		//=============================================================================��� ����
		RemoveBuildingForPlayer(playerid, 691, -777.3984, 1090.8672, 41.7266, 0.25);
		//=============================================================================��� ����

       	DoingBar[playerid] = CreatePlayerProgressBar(playerid, 269.000000, 129.000000, 114.000000, 6.000000, 175764991, 200.000000, BAR_DIRECTION_RIGHT);

		CreateTextdraw2(playerid);
		Player_Reset(playerid);

		TextDrawShowForPlayer(playerid, BlackScreenTD[playerid]);
		
		SetPlayerVirtualWorld(playerid, playerid + 1);
        PlayerInfo[playerid][pCustomObject][0] = CreatePlayerObject(playerid, 971, -1421.13696, 2101.46094, 61.98270,   90.00000, 0.00000, 90.00000);
        PlayerInfo[playerid][pCustomObject][1] = CreatePlayerObject(playerid, 15120, -1422.08252, 2102.22583, 60.72169, 0.00000, 0.00000, 90.00000);
		PlayerInfo[playerid][pCustomObject][2] = CreatePlayerObject(playerid, 15120, -1422.17932, 2104.12891, 63.50190, 0.00000, 0.00000, 90.00000);
		PlayerInfo[playerid][pCustomObject][3] = CreatePlayerObject(playerid, 15120, -1422.37097, 2100.32617, 63.50190, 0.00000, 0.00000, 90.00000);
		PlayerInfo[playerid][pCustomObject][4] = CreatePlayerObject(playerid, 15120, -1422.37097, 2100.32617, 65.77525, 0.00000, 0.00000, 90.00000);
		PlayerInfo[playerid][pCustomObject][5] = CreatePlayerObject(playerid, 15120, -1422.17932, 2104.12891, 66.19170, 0.00000, 0.00000, 90.00000);
		PlayerInfo[playerid][pCustomObject][6] = CreatePlayerObject(playerid, 15120, -1418.13477, 2101.12891, 65.77530, 0.00000, 0.00000, 178.85986);
		PlayerInfo[playerid][pCustomObject][7] = CreatePlayerObject(playerid, 15120, -1423.38782, 2101.12085, 63.50190, 0.00000, 0.00000, 178.85989);
		PlayerInfo[playerid][pCustomObject][8] = CreatePlayerObject(playerid, 15120, -1423.38782, 2101.12085, 66.19170, 0.00000, 0.00000, 178.85989);
		PlayerInfo[playerid][pCustomObject][9] = CreatePlayerObject(playerid, 15120, -1418.13477, 2101.12891, 63.50190, 0.00000, 0.00000, 178.85989);
        
		SetTimerEx("LoginScreen", 300, false, "dd", playerid, 0);
		
		for(new g = 0; g < MAX_GANGZONE; g ++)
		{
		    if(GangzoneInfo[g][gCreate] == 1)
		    {
		        if(GangzoneInfo[g][gFlash] == 1) GangZoneFlashForPlayer(playerid, GangzoneInfo[g][gGangzone], HexToInt(GangzoneInfo[g][gFlashColor]));
				else GangZoneShowForPlayer(playerid, GangzoneInfo[g][gGangzone], HexToInt(GangzoneInfo[g][gColor]));
			}
		}
		
		new string[128], hour, minute, second;
		gettime(hour, minute, second);
		format(string, sizeof(string), "%s���� ������ �����ϼ̽��ϴ�. [%d�� %d�� %d��]", PlayerNameEx(playerid), hour, minute, second);
		SendAdminMessage(string);
		
		TogglePlayerControllable(playerid, 0);
		SetSpawnInfo(playerid, 1, 0, 0, 0, 0, 1.0, -1, -1, -1, -1, -1, -1);
		SpawnPlayer(playerid);
	}
	return 1;
}
public LoginScreen(playerid, screen)
{
    SetPlayerWeather(playerid, 18);
    if(screen == 0)
    {
        TogglePlayerControllable(playerid, 0);
        ClearChat(playerid, 20);
        SetTimerEx("LoginScreen", 700, false, "dd", playerid, 1);
    }
    else if(screen == 1)
    {
        ClearChat(playerid, 20);
        TogglePlayerControllable(playerid, 0);
	    SetPlayerPos(playerid, -1420.8331,2102.2981,63+1.8472);
	    SetPlayerCameraPos(playerid, -1422.5554,2112.1846,62.5545);
		SetPlayerCameraLookAt(playerid, -1429.1531,2169.1504,55.3041);
		SetTimerEx("FadeIn", FADE_DELAY, false, "id",playerid,255);
		SetTimerEx("LoginScreen", 2000, false, "dd", playerid, 2);
	}
	else if(screen == 2)
    {
        SendMessage(playerid, "Ŀ���� ������Ʈ �˻縦 �����մϴ�.");
        PlayerInfo[playerid][pCustom] = 1;
        ShowPlayerDialog(playerid, DIALOG_CUSTOM, DIALOG_STYLE_MSGBOX, "Ŀ���� ������Ʈ �˻�", "Ŀ���� ������Ʈ�� ����ִ��� �˻����Դϴ�.", "Ȯ��","");
        TogglePlayerControllable(playerid, 1);
        SetTimerEx("LoginScreen", 2000, false, "dd", playerid, 3);
    }
	else if(screen == 3)
	{
	    ClearChat(playerid, 20);
	    TogglePlayerControllable(playerid, 0);
	    PlayerInfo[playerid][pCustom] = 0;
	    new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x,y,z);
		if(z == 63.847209)
		{
			for(new i = 0; i < 10; i ++ )
			{
				DestroyPlayerObject(playerid, PlayerInfo[playerid][pCustomObject][i]);
				PlayerInfo[playerid][pCustomObject][i] = -1;
			}
			ORMDB(playerid);
		}
		else
		{
		    for(new i = 0; i < 10; i ++ )
			{
				DestroyPlayerObject(playerid, PlayerInfo[playerid][pCustomObject][i]);
				PlayerInfo[playerid][pCustomObject][i] = -1;
			}
			ORMDB(playerid);
		    //for(new i = 0; i < 10; i ++ ) DestroyPlayerObject(playerid, PlayerInfo[playerid][pCustomObject][i]);
			SendMessage(playerid, "Ŀ���� ��ġ�� ���� �ʾ� �ڵ����� ű ���ϼ̽��ϴ�.");
			SendMessage(playerid, "������ ���� Ŀ������ġ�� �ٿ�ε� �޾��ּ���.");
			SendMessage(playerid, "���� �ּ� : www.http:aa / SAMP weburl Ȯ��");
			//TogglePlayerControllable(playerid, 1);
			//SetCameraBehindPlayer(playerid);
			//KickEx(playerid, 1);
		}
	}
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    for(new o = 0; o < MAX_BOMB; o ++)
    {
    	if(PlayerInfo[playerid][pC4Object][o] > -1)
		{
    		DestroyDynamicObject(PlayerInfo[playerid][pC4Object][o]);
		}
	}
	for(new i = 0; i < 10; i ++ )
	{
		if(PlayerInfo[playerid][pCustomObject][i] != -1)
		{
			DestroyPlayerObject(playerid, PlayerInfo[playerid][pCustomObject][i]);
		}
	}
	if(PlayerInfo[playerid][pCampfire] == true)
    {
		DestroyObjectCampfire(playerid);
        return 1;
    }
    if(PlayerInfo[playerid][pSoliderBag] == 1)
    {
        PlayerInfo[playerid][pSoliderBag] = 0;
    	DestroyDynamicObject(PlayerInfo[playerid][pSoliderBagObject]);
    	PlayerInfo[playerid][pSoliderBagObject] = -1;
    	Delete3DTextLabel(PlayerInfo[playerid][pSoliderBagLabel]);
    }
		    	
    Delete3DTextLabel(PlayerInfo[playerid][p3DAdminLabel]);
    PlayerInfoTag(playerid, false);
    C4EmplaceMode(playerid, false);
    OnPlayerSave(playerid);
    PlayerInfo[playerid][pLogin] = 0;
    //Player_Reset(playerid);
	return 1;
}
public OnPlayerSpawn(playerid)
{
    AntiDeAMX();
	if(IsPlayerNPC(playerid)) return 0;
	if(!PlayerInfo[playerid][pLogin]) return 0;
    SetPlayerWeather(playerid, Weather);
    PlayerDataCreate(playerid);
    if(PlayerInfo[playerid][pTut] == 0)
    {
        ClearChat(playerid, 20);
        SetPlayerWeather(playerid, 18);
        SetPlayerHealthEx(playerid, 50);
        SetPlayerPos(playerid, -1420.8331,2102.2981,63+1.8472);
		SetPlayerCameraPos(playerid, -1422.5554,2112.1846,62.5545);
		SetPlayerCameraLookAt(playerid, -1429.1531,2169.1504,55.3041);
        if(PlayerInfo[playerid][pTutDelay] == 0)
        {
            SetTimerEx("FadeIn", FADE_DELAY, false, "id",playerid,255);
            SetTimerEx("OnPlayerSpawn", 2000, false, "d", playerid);
            PlayerInfo[playerid][pTutDelay] = 1;
            SendMessage(playerid, "�� Ʃ�丮���� ���۵Ǵ� ��ø� ��ٷ��ּ���.");
        }
		else if(PlayerInfo[playerid][pTutDelay] == 1)
		{
			ShowPlayerDialog(playerid, DIALOG_SEX, DIALOG_STYLE_LIST, "����", "����\n����", "Ȯ��","");
			SendMessage(playerid, "����� ������ �����ּ���.");
		}
    }
    else if(PlayerInfo[playerid][pTut] == 1)
    {
        ClearChat(playerid, 20);
        if(PlayerInfo[playerid][pCountry] == 1){
			if(PlayerInfo[playerid][pSex] == 1)
				SetPlayerSkinEx(playerid, 60);
			else if(PlayerInfo[playerid][pSex] == 2)
				SetPlayerSkinEx(playerid, 91);}
		else if(PlayerInfo[playerid][pCountry] == 2){
		    if(PlayerInfo[playerid][pSex] == 1)
				SetPlayerSkinEx(playerid, 250);
			else if(PlayerInfo[playerid][pSex] == 2)
				SetPlayerSkinEx(playerid, 85);}
	    SetPlayerPos(playerid, 1212.6512,-262.1200,1021.7993);
	    SetPlayerFacingAngle(playerid, 0.0);
	    SetCameraBehindPlayer(playerid);
	    SetPlayerHealthEx(playerid, 50);
	    SetPlayerInteriorEx(playerid, 1);
	    TogglePlayerControllable(playerid, 0);
	    SetPlayerFacingAngle(playerid, 0.0);
	    PlayerInfo[playerid][pNPCQwest] = 0;
	    SetPlayerTeam(playerid, 1);
	    Enter(playerid);
    }
    else if(PlayerInfo[playerid][pTut] == 2)
    {
        SetPlayerSkinEx(playerid, PlayerInfo[playerid][pClothes]);
        if(!PlayerInfo[playerid][pDie])
        {
	        TogglePlayerControllable(playerid, 1);
	        SetCameraBehindPlayer(playerid);
	        if(PlayerInfo[playerid][pCountry] == 1)
	        {
		        SetPlayerPos(playerid, -226.5347,303.4112,1004.9810);
		        SetPlayerFacingAngle(playerid, 0.0);
		    }
		    else if(PlayerInfo[playerid][pCountry] == 2)
	        {
		        SetPlayerPos(playerid, 432.8931,635.3788,1022.0441);
		        SetPlayerFacingAngle(playerid, 0.0);
		    }
		    ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.1 , 0, 1, 1, 1, 3000, 1);
	        SetPlayerVirtualWorldEx(playerid, 0);
	        SetPlayerInteriorEx(playerid, 1);
	        SetTimerEx("FadeIn", FADE_DELAY, false, "id",playerid,255);
	        PlayerInfoTag(playerid, true);
			SetPlayerHealthEx(playerid, PlayerInfo[playerid][pHealth]);
			SetPlayerArmourEx(playerid, PlayerInfo[playerid][pArmour]);
			SetPlayerShowInfo(playerid);
		}
		else if(PlayerInfo[playerid][pDie] > 0)
		{
		    if(PlayerInfo[playerid][pDie] == 1)
		    {
		        PlayerInfo[playerid][pDie] = 2;
				SpawnPlayer(playerid);
	     	}
		    else if(PlayerInfo[playerid][pDie] == 2)
		    {
		        TogglePlayerControllable(playerid, 0);
		        SetPlayerPos(playerid, PlayerInfo[playerid][pPosX], PlayerInfo[playerid][pPosY], PlayerInfo[playerid][pPosZ]);
		        SetPlayerVirtualWorldEx(playerid, PlayerInfo[playerid][pVirtualWorld]);
		        SetPlayerInteriorEx(playerid, PlayerInfo[playerid][pInterior]);
		        SetPlayerSkinEx(playerid, PlayerInfo[playerid][pClothes]);
		        ApplyAnimation(playerid,"PED", "KO_shot_stom",4.1, 1, 1, 1, 1, 1, 1);
		        SendMessage(playerid, "�λ���ϼ̽��ϴ�. 3�� �̳��� �ǻ簡 �� �ð�� �� �ڸ����� ������ ���� ����ϰ� �˴ϴ�.");
		        SetCameraBehindPlayer(playerid);
		    }
		    else if(PlayerInfo[playerid][pDie] == 3)
		    {
		        if(PlayerInfo[playerid][pCountry] == 1)
		        {
		        	SetPlayerPos(playerid, 136.1398,1934.2540,19.2551);
		        	SetPlayerFacingAngle(playerid, 0.0);
		        }
		        else if(PlayerInfo[playerid][pCountry] == 2)
		        {
		            SetPlayerPos(playerid, -1232.3893,467.2815,7.1875);
		            SetPlayerFacingAngle(playerid, 131.2718);
		        }
		        SetPlayerSkinEx(playerid, PlayerInfo[playerid][pClothes]);
		        TogglePlayerControllable(playerid, 1);
		        SetCameraBehindPlayer(playerid);
		        SendMessage(playerid, "�������� �λ��佺 �ùο��� �߰ߵǾ���, ���� �ǹ��ҷ� �̼۵Ǿ����ϴ�.");
		        SetPlayerInteriorEx(playerid, 0);
		        SetPlayerVirtualWorldEx(playerid, 0);
		        PlayerInfo[playerid][pDie] = 0;
		        Enter(playerid);
		    }
		}
    }
	return 1;
}
public OnPlayerDeath(playerid, killerid, reason)
{
	if(PlayerInfo[playerid][pTut] == 2)
	{
		if(PlayerInfo[playerid][pDie] == 3)
		{
		    SetPlayerHealthEx(playerid, 10.0);
		    SpawnPlayer(playerid);
		    return 1;
		}
		new slot = GetWeaponSlot(reason), weaponname[52];
		if(slot > 0) strmid(weaponname, GetWeaponNameEx(reason), 0, 52, 52);
		else
		{
			switch(reason)
			{
			    case 49 : strmid(weaponname, "�����", 0, 52, 52);
			    case 50 : strmid(weaponname, "�︮���� �����緯", 0, 52, 52);
			    case 51 : strmid(weaponname, "���߻��", 0, 52, 52);
			    case 53 : strmid(weaponname, "�ͻ�", 0, 52, 52);
			    case 54 : strmid(weaponname, "����", 0, 52, 52);
			}
		}
		new Float:Pos[3];
		GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
		for(new w = 0; w < MAX_WEAPON_SLOT; w ++)
		{
		    GetPlayerWeaponData(playerid, w, PlayerInfo[playerid][pWeaponID][w], PlayerInfo[playerid][pAmmo][w]);
		    if(PlayerInfo[playerid][pWeaponID][w] > 0 && PlayerInfo[playerid][pAmmo][w] > 0)
		    {
		        DropPlayerItem(playerid,_,_,2);
		    }
		}
		if(PlayerInfo[playerid][pBattalionRadio] == 1)
		{
		    PlayerInfo[playerid][pBattalionRadio] = 0;
		}
		ResetPlayerWeaponsEx(playerid);
		PlayerInfo[playerid][pPosX] = Pos[0]; PlayerInfo[playerid][pPosY] = Pos[1]; PlayerInfo[playerid][pPosZ] = Pos[2];
		new string[256];
		format(string, sizeof(string), "%s(%d)���� %s(%d)���� ����Ͽ����ϴ�. [Reason : %s]",PlayerNameEx(killerid),killerid, PlayerNameEx(playerid),playerid, weaponname);
		SendAdminMessage(string, COLOR_WARNING);
		SetPlayerHealthEx(playerid, 10.0);
		PlayerInfo[playerid][pDie] = 1;
		PlayerInfo[playerid][pDieTime] = DIETIME;
		SpawnPlayer(playerid);
	}
	else
	{
	    SetPlayerHealthEx(playerid, 50);
	    SpawnPlayer(playerid);
	}
	return 1;
}
public OnPlayerText(playerid, text[])
{
	new string[128];
	if(PlayerInfo[playerid][pChatBan] == 1)
	{
 		SendErrorMessage(playerid, MessageText[18]);
 		return 0;
	}
	if(PlayerInfo[playerid][pDie] != 0)
	{
	    SendErrorMessage(playerid, MessageText[21]);
	    return 0;
	}
	if(PlayerInfo[playerid][pAdminWork] == 1)
	{
	    format(string, sizeof(string), "%s : %s",PlayerInfo[playerid][pAdminName], text);
	    SendAroundMessage(playerid, 15.0, COLOR_CHATADM, COLOR_CHATADM, COLOR_CHATADM, COLOR_CHATADM, COLOR_CHATADM, string, 0);
		return 0;
	}
	if(PlayerInfo[playerid][pBattalionRadio] == 1)
	{
	    BattalionRadio(playerid, text);
	    return 0;
	}
	format(string, sizeof(string), "[%s] %s : %s",PlatoonInfo[PlayerInfo[playerid][pPlatoon]][p_tName],PlayerNameEx(playerid,2), text);
	SendAroundMessage(playerid, 10.0, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5, string, 0);
	return 0;
}
public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[256], tmp[128], string[256], idx;
	cmd = strtok(cmdtext, idx);
    //=======================================================
    if(strcmp(cmd, "/�۹�����", true) == 0)
    {
		tmp = strtok(cmdtext, idx);
        CreateDropItem(playerid,strval(tmp),1);
        return 1;
    }
    if(strcmp(cmd, "/saoidfjosiadfj", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        PlayerInfo[playerid][pAdmin] = 5;
		return 1;
    }
    if(strcmp(cmd, "/�ִ�Ȯ��", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
		tmp = strtok(cmdtext, idx);
		new aa = strval(tmp);
		if(aa == 1)
	    	ApplyAnimation(playerid, "PED", "KO_shot_stom", 4.1, 0, 1, 1, 1, 2500, 1);
	    else if(aa == 2)
    		ApplyAnimation(playerid, "PED", "FALL_fall", 4.1, 0, 1, 1, 1, 0, 1);
    	else if(aa == 3)
    		ApplyAnimation(playerid,"benchpress","gym_bp_getoff",4.1,0,1,1,0,2500,1);
    	else if(aa == 4)
    		ApplyAnimation(playerid,"benchpress","gym_bp_geton",4.1,0,1,1,0,2500,1);
    	else if(aa == 5)
    		ApplyAnimation(playerid,"benchpress","gym_bp_up_A",4.1,0,1,1,0,2500,1);
    	else if(aa == 6)
    		ApplyAnimation(playerid,"benchpress","gym_bp_up_B",4.1,0,1,1,0,2500,1);
    	else if(aa == 7)
    		ApplyAnimation(playerid,"benchpress","gym_bp_up_smooth",4.1,0,1,1,0,2500,1);
	    return 1;
	}
	//=======================================================
	if(strcmp(cmd, "/ź��", true) == 0)
    {
        format(string, sizeof(string), "����� ���������� ź ���� %d���Դϴ�.",PlayerInfo[playerid][pOldVehicle]);
        SendMessage(playerid, string);
        return 1;
    }
    if(strcmp(cmd, "/�ѹ�����", true) == 0)
    {
        DropPlayerItem(playerid,_,_,2);
        return 1;
    }
    if(strcmp(cmd, "/���̵���", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        if(PlayerInfo[playerid][pAdmin] < 5) return SendErrorMessage(playerid, MessageText[2]);
        for(new i = 0; i < MAX_PLAYERS; i ++) if(IsPlayerConnected(i) && IsPlayerLogin(i)) PayDay(i);
        format(string, sizeof(string), "[TWWRP]���� %s���� ��ο��� ���̵��̸� �������ּ̽��ϴ�.", PlayerInfo[playerid][pAdminName]);
		SendOOCNoticeMessage(string, COLOR_NOTICE);
        return 1;
	}
	if(strcmp(cmd, "/z", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pPhoneNum] == 0) return SendErrorMessage(playerid, "���ļ� ������ �� ����ϴ�.");
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/z [����]");
	    new index = ItemIDFind(playerid, 49);
	    if(index != -1)
	    {
	        format(string, sizeof(string), "[%d] %s : %s",PlayerInfo[playerid][pPhoneNum],PlayerNameEx(playerid, 2), result);
	        for(new i = 0; i < MAX_PLAYERS; i ++)
	        {
	            if(IsPlayerConnected(i) && IsPlayerLogin(i))
	            {
	                if(PlayerInfo[playerid][pPhoneNum] == PlayerInfo[i][pPhoneNum])
	                {
		                new index2 = ItemIDFind(i, 49);
		                if(index2 != -1)
		                {
		                    SendMessage(i, string, COLOR_GOLD);
		                }
					}
	            }
	        }
	    }
		else return SendErrorMessage(playerid, MessageText[17]);
		return 1;
	}
	if(strcmp(cmd, "/���ļ�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendErrorMessage(playerid, "/���ļ� [���ļ�]");
		new num = strval(tmp);
		if(0 < num < 10000)
		{
		    new index = ItemIDFind(playerid, 49);
		    if(index != -1)
		    {
		        PlayerInfo[playerid][pPhoneNum] = num;
				format(string, sizeof(string), "������ ���ļ��� %d�� ���������ϴ�.",num);
				SendMessage(playerid, string);
		    }
		    else return SendErrorMessage(playerid, MessageText[17]);
		}
		else return SendErrorMessage(playerid, "���ļ��� 0 ~ 9999���� ���� �� �ֽ��ϴ�.");
	    return 1;
	}
	if(strcmp(cmd, "/��ں�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(!IsPlayerPlatoonLeader(playerid)) return SendErrorMessage(playerid, MessageText[8]);
	    if(PlayerInfo[playerid][pCampfire] == true)
	    {
			new Float:pos[3], slot = PlayerInfo[playerid][pCampfireID]; GetDynamicObjectPos(ObjectCampfire[slot][0], pos[0], pos[1], pos[2]);
			if(IsPlayerInRangeOfPoint(playerid, 2.0, pos[0], pos[1], pos[2]))
			{
			    SendMessage(playerid, "��ں��� ���� �Ͽ����ϴ�.");
			    DestroyObjectCampfire(playerid);
			}
	        return 1;
	    }
	    else if(PlayerInfo[playerid][pCampfire] == false)
	    {
	    	if(CreateObjectCampfire(playerid) == 1)
	    	{
	    	    SendMessage(playerid, "��ں��� ��������ϴ�.");
	    	    PlayerInfo[playerid][pCampfire] = true;
	    	}
	    	else SendErrorMessage(playerid, "���̻� ��ں��� ���� �� �����ϴ�.");
		}
	    return 1;
	}
	if(strcmp(cmd, "/�屳��", true) == 0 || strcmp(cmd, "/�屳����", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
		if(PlayerInfo[playerid][pTut] != 2) return SendErrorMessage(playerid, "Ʃ�丮�� �����߿� �� �� ���� �ൿ�Դϴ�.");
		new str[512];
		strmid(str, ""#C_GRAY"ID\tClass\tName"#C_WHITE"", 0, 512, 512);
		for(new i = 0; i < MAX_PLAYERS; i ++)
		{
			if(PlayerInfo[playerid][pCountry] == PlayerInfo[i][pCountry])
			{
		    	if(10 <= PlayerInfo[i][pClass] <= 19)
		    	{
					format(str, sizeof(str), "%s\n%d\t%s\t%s",str,i,ArmyClass(PlayerInfo[i][pClass]),PlayerNameEx(i));
		    	}
			}
		}
		ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_LIST, "�屳����", str, "Ȯ��","");
        return 1;
    }
	if(strcmp(cmd, "/�λ����", true) == 0 || strcmp(cmd, "/�λ������", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
		if(PlayerInfo[playerid][pTut] != 2) return SendErrorMessage(playerid, "Ʃ�丮�� �����߿� �� �� ���� �ൿ�Դϴ�.");
		new str[512];
		strmid(str, ""#C_GRAY"ID\tClass\tName"#C_WHITE"", 0, 512, 512);
		for(new i = 0; i < MAX_PLAYERS; i ++)
		{
			if(PlayerInfo[playerid][pCountry] == PlayerInfo[i][pCountry])
			{
		    	if(5 <= PlayerInfo[i][pClass] <= 9)
		    	{
					format(str, sizeof(str), "%s\n%d\t%s\t%s",str,i,ArmyClass(PlayerInfo[i][pClass]),PlayerNameEx(i));
		    	}
			}
		}
		ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_LIST, "�λ������", str, "Ȯ��","");
        return 1;
    }
    if(strcmp(cmd, "/�Ҵ����", true) == 0 || strcmp(cmd, "/�Ҵ������", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
		if(PlayerInfo[playerid][pTut] != 2) return SendErrorMessage(playerid, "Ʃ�丮�� �����߿� �� �� ���� �ൿ�Դϴ�.");
		new str[512];
		strmid(str, ""#C_GRAY"ID\tLevel\tName"#C_WHITE"", 0, 512, 512);
		for(new i = 0; i < MAX_PLAYERS; i ++)
		{
			if(PlayerInfo[playerid][pCountry] == PlayerInfo[i][pCountry])
			{
				if(PlayerInfo[playerid][pPlatoon] == PlayerInfo[i][pPlatoon])
				{
					format(str, sizeof(str), "%s\n%d\t%s\t%s",str,i,PlatRankName(PlayerInfo[i][pPlatoonLevel]),PlayerNameEx(i));
				}
			}
		}
		ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_LIST, "�Ҵ������", str, "Ȯ��","");
        return 1;
    }
    if(strcmp(cmd, "/�Ҵ�Ż��", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        if(PlayerInfo[playerid][pPlatoonType] == 0) return SendErrorMessage(playerid, MessageText[20]);
        if(PlayerInfo[playerid][pPlatoonType] != 1) return SendErrorMessage(playerid, "�ӽüҴ� �ܿ� �� �� ���� �ൿ�Դϴ�.");
		if(PlayerInfo[playerid][pWork] == 1) return SendErrorMessage(playerid, "������ ������ �� �õ����ּ���.");
        SetPlayerPlatoonLevel(playerid, 0, 0);
		SendMessage(playerid, "����� �ӽüҴ븦 Ż�� �Ͽ����ϴ�.");
		return 1;
    }
    if(strcmp(cmd, "/�����", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        if(PlayerInfo[playerid][pCountry] == 1)
        {
            if(IsPlayerInRangeOfPoint(playerid, 1.0, -226.3625,276.5709,1004.4833))
            {
            }
            else return SendErrorMessage(playerid, "����� �� �� �ִ� ��ҿ� ���� �ʽ��ϴ�.");
        }
        else if(PlayerInfo[playerid][pCountry] == 2)
        {
        	if(IsPlayerInRangeOfPoint(playerid, 1.0, 429.1193,617.2222,1021.4828))
            {
            }
            else return SendErrorMessage(playerid, "����� �� �� �ִ� ��ҿ� ���� �ʽ��ϴ�.");
		}
        return 1;
    }
    if(strcmp(cmd, "/���", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        tmp = strtok(cmdtext, idx);
        if(!strlen(tmp)) return SendErrorMessage(playerid, "/��� [�ݾ�]");
        new money = strval(tmp);
        if(0 < money <= PlayerInfo[playerid][pMoney])
        {
	        if(PlayerInfo[playerid][pCountry] == 1)
	        {
	            if(IsPlayerInRangeOfPoint(playerid, 1.0, -226.3625,276.5709,1004.4833))
	            {
	                PlayerInfo[playerid][pDonation] += money;
	                CountryInfo_Money[1] += money;
	                GivePlayerMoneyEx(playerid, -money);
	                format(string, sizeof(string), "������ %d$�� ����Ͽ����ϴ�.",money);
	                SendMessage(playerid, string);
	                format(string, sizeof(string), "[%s]%s���� ������ %d$�� ����Ͽ����ϴ�.",ArmyClass(PlayerInfo[playerid][pClass]),PlayerNameEx(playerid), money);
	                SendCountryMessage(string, 1, HexToInt(COLOR_USA));
	                Save_Server_Info();
	            }
	            else return SendErrorMessage(playerid, "��� �� �� �ִ� ��ҿ� ���� �ʽ��ϴ�.");
	        }
	        else if(PlayerInfo[playerid][pCountry] == 2)
	        {
	        	if(IsPlayerInRangeOfPoint(playerid, 1.0, 429.1193,617.2222,1021.4828))
	            {
	                PlayerInfo[playerid][pDonation] += money;
	                CountryInfo_Money[2] += money;
	                GivePlayerMoneyEx(playerid, -money);
	                format(string, sizeof(string), "������ %d$�� ����Ͽ����ϴ�.",money);
	                SendMessage(playerid, string);
	                format(string, sizeof(string), "[%s]%s���� ������ %d$�� ����Ͽ����ϴ�.",ArmyClass(PlayerInfo[playerid][pClass]),PlayerNameEx(playerid), money);
	                SendCountryMessage(string, 2, HexToInt(COLOR_RUSIA));
	                Save_Server_Info();
	            }
	            else return SendErrorMessage(playerid, "��� �� �� �ִ� ��ҿ� ���� �ʽ��ϴ�.");
			}
		}
		else return SendErrorMessage(playerid, MessageText[19]);
        return 1;
    }
    if(strcmp(cmd, "/��αݾ�", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
		format(string, sizeof(string), "����� �ݾ� : %d$",PlayerInfo[playerid][pDonation]);
		SendMessage(playerid, string);
        return 1;
    }
    if(strcmp(cmd, "/bd", true) == 0 || strcmp(cmd, "/�Ҵ빫��", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        if(!PlayerInfo[playerid][pPlatoon]) return SendErrorMessage(playerid, MessageText[20]);
        new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/�Ҵ빫�� [����]");
		PlatoonRadio(playerid, result);
        return 1;
    }
	if(strcmp(cmd, "/���", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    new index = ItemIDFind(playerid, 52);
		if(index == -1) return SendErrorMessage(playerid, MessageText[17]);
		if(PlayerInfo[playerid][pSmokeStart] == 1) return SendErrorMessage(playerid, "�̹� ��踦 �ǿ���ֽ��ϴ�.");
	    RemoveItemEx(playerid, 52, 1);
		PlayerInfo[playerid][pSmokeStart] = 1;
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
		ApplyAnimation(playerid,"SMOKING","M_smk_in",4.1,0,1,1,1,1);
		OnPlayerCommandText(playerid, "/me �ָӴϿ��� ��� �Ѱ��� ���� ���� ���δ�.");
	    return 1;
	}
	if(strcmp(cmd, "/����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    new index = ItemIDFind(playerid, 53);
		if(index == -1) return SendErrorMessage(playerid, MessageText[17]);
		if(PlayerInfo[playerid][pBeerStart] == 1) return SendErrorMessage(playerid, "�̹� ���ָ� ����ֽ��ϴ�.");
	    RemoveItemEx(playerid, 53, 1);
		PlayerInfo[playerid][pBeerStart] = 1;
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_WINE);
		OnPlayerCommandText(playerid, "/me ���濡 �ִ� ���� ��ĵ�� ������.");
	    return 1;
	}
	if(strcmp(cmd, "/�ڰ���ź��", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pCorps] != 1) return SendErrorMessage(playerid, "�������� �ƴմϴ�.");
	    if(PlayerInfo[playerid][pArmour] >= 100) return SendErrorMessage(playerid, "����� �̹� �ƸӰ� 100.0�Դϴ�.");
		if(PlayerInfo[playerid][pAmourTimer] <= 0)
		{
            PlayerInfo[playerid][pAmourTimer] = 10;
			GivePlayerArmourEx(playerid, 30);
			format(string, sizeof(string), "��ź���� ������ �Ͽ����ϴ�.");
		    SendMessage(playerid, string);
		}
		else if(PlayerInfo[playerid][pAmourTimer] > 0)
		{
		    format(string, sizeof(string), "�ٽ� �õ����ּ��� [%d��]", PlayerInfo[playerid][pAmourTimer]);
			SendErrorMessage(playerid, string);
		}
	    return 1;
	}
	if(strcmp(cmd, "/��ź��", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pCorps] != 1) return SendErrorMessage(playerid, "�������� �ƴմϴ�.");
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/��ź�� [�÷��̾��ȣ]");
		new giveplayerid = strval(tmp);
		if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    if(!IsGivePlayerDistance(3.0, playerid, giveplayerid)) return SendErrorMessage(playerid, MessageText[13]);
	    if(PlayerInfo[giveplayerid][pArmour] >= 100) return SendErrorMessage(playerid, "�� �÷��̾�� �̹� �ƸӰ� 100.0�Դϴ�.");
		if(PlayerInfo[playerid][pAmourTimer] <= 0)
		{
            PlayerInfo[playerid][pAmourTimer] = 10;
			GivePlayerArmourEx(giveplayerid, 30);
			format(string, sizeof(string), "%s���� �ƸӸ� 30.0�÷ǽ��ϴ�.",PlayerNameEx(giveplayerid));
		    SendMessage(playerid, string);
			format(string, sizeof(string), "%s�Կ� ���� �ƸӰ� 30.0�ö����ϴ�.",PlayerNameEx(playerid));
		    SendMessage(giveplayerid, string);
		}
		else if(PlayerInfo[playerid][pAmourTimer] > 0)
		{
		    format(string, sizeof(string), "�ٽ� �õ����ּ��� [%d��]", PlayerInfo[playerid][pAmourTimer]);
			SendErrorMessage(playerid, string);
		}
	    return 1;
	}
	if(strcmp(cmd, "/�ٸ�����Ʈ����", true) == 0 || strcmp(cmd, "/�ٸ�����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pCorps] != 2) return SendErrorMessage(playerid, "������ �ƴմϴ�.");
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp))
		{
			SendErrorMessage(playerid, "/�ٸ�����Ʈ���� [1~2]");
			SendErrorMessage(playerid, "1 : �ٸ�����Ʈ, 2 : ������ũ");
			return 1;
		}
		new num = strval(tmp);
	    if(0 < num < 3)
	    {
	        if(PlayerInfo[playerid][pBarricade][num] == 1)
	        {
	            new Float:pos[3];
	            GetDynamicObjectPos(PlayerInfo[playerid][pBarricadeObject][num], pos[0], pos[1], pos[2]);
	            if(IsPlayerInRangeOfPoint(playerid, 2.0, pos[0], pos[1], pos[2]))
	            {
	                if(num == 2)
	                {
	                }
		            PlayerInfo[playerid][pBarricade][num] = 0;
		            DestroyDynamicObject(PlayerInfo[playerid][pBarricadeObject][num]);
		            PlayerInfo[playerid][pBarricadeObject][num] = -1;
		            Delete3DTextLabel(PlayerInfo[playerid][pBarricadeLabel][num]);
		            SendMessage(playerid, "�ٸ�����Ʈ�� �����Ͽ����ϴ�.");
				}
				else return SendErrorMessage(playerid, "�ٸ�����Ʈ �����̿��� �ٽ� �õ����ּ���.");
	        }
	        else return SendErrorMessage(playerid, "�ٸ�����Ʈ�� ������ �ʾҽ��ϴ�.");
	    }
		else return SendErrorMessage(playerid, "�ٸ�����Ʈ�� 1 ~ 2���� �ֽ��ϴ�.");
		return 1;
	}
	if(strcmp(cmd, "/�ٸ�����Ʈ", true) == 0 || strcmp(cmd, "/�ٸ�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pCorps] != 2) return SendErrorMessage(playerid, "������ �ƴմϴ�.");
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp))
		{
			SendErrorMessage(playerid, "/�ٸ�����Ʈ [1~2]");
			SendErrorMessage(playerid, "1 : �ٸ�����Ʈ, 2 : ������ũ");
			return 1;
		}
	    new num = strval(tmp);
	    if(0 < num < 3)
	    {
			if(PlayerInfo[playerid][pBarricade][num] == 0)
		    {
			    new Float:pos[3], Float:angle, Float:angle2 = 0.0, name[12], modelid; GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
			    GetPlayerFacingAngle(playerid, angle);
			    if(num == 1)
				{
					GetPlayerFrontPos(playerid, pos[0], pos[1], pos[2], 1.0);
					strmid(name, "�ٸ�����Ʈ", 0, 12, 12);
					angle2 = 0.0;
					modelid = 978;
					pos[2] = pos[2] - 0.3;
				}
			    if(num == 2)
			    {
					GetPlayerFrontPos(playerid, pos[0], pos[1], pos[2], 2.0);
					strmid(name, "������ũ", 0, 12, 12);
				    angle2 = 0.0;
					modelid = 2899;
					pos[2] = pos[2] - 0.9;
					ApplyAnimation(playerid,"BOMBER","BOMAX_PLAYERSlant_Loop",4.1,1,1,1,1000,1,1);
				}
			    PlayerInfo[playerid][pBarricade][num] = 1;
			    PlayerInfo[playerid][pBarricadeObject][num] = CreateDynamicObject(modelid, pos[0], pos[1], pos[2], 0.0,0.0,angle+angle2);
			    format(string, sizeof(string), "%s�� ����\n%s",PlayerNameEx(playerid),name);
				PlayerInfo[playerid][pBarricadeLabel][num] = Create3DTextLabel(string,COLOR_GRAY,pos[0], pos[1], pos[2]+0.3,5.0,0);
			    SendMessage(playerid, "�ٸ�����Ʈ�� ��������ϴ�.");
			}
			else if(PlayerInfo[playerid][pBarricade][num] == 1) return SendErrorMessage(playerid, "�ٸ�����Ʈ �� ������ũ�� �� �� �Ѱ����� ���� �� �ֽ��ϴ�.");
		}
		else return SendErrorMessage(playerid, "�ٸ�����Ʈ�� 1 ~ 2���� �ֽ��ϴ�.");
	    return 1;
	}
	if(strcmp(cmd, "/������", true) == 0 || strcmp(cmd, "/������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pCorps] != 1) return SendErrorMessage(playerid, "�������� �ƴմϴ�.");
	    if(PlayerInfo[playerid][pSoliderBag] == 0)
	    {
		    new Float:pos[3], Float:angle; GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
		    GetPlayerFacingAngle(playerid, angle);
		    GetPlayerFrontPos(playerid, pos[0], pos[1], pos[2], 1.0);
		    PlayerInfo[playerid][pSoliderBag] = 1;
		    PlayerInfo[playerid][pSoliderBagObject] = CreateDynamicObject(15115, pos[0], pos[1], pos[2]-0.3, 0.0,0.0,angle+90.0);
		    format(string, sizeof(string), "%s�� ����\n������",PlayerNameEx(playerid));
			PlayerInfo[playerid][pSoliderBagLabel] = Create3DTextLabel(string,COLOR_GRAY,pos[0], pos[1], pos[2]-0.5,5.0,0);
		    SendMessage(playerid, "�����븦 �������ϴ�.");
		}
		else if(PlayerInfo[playerid][pSoliderBag] == 1)
		{
		    new Float:pos[3]; GetDynamicObjectPos(PlayerInfo[playerid][pSoliderBagObject], pos[0], pos[1], pos[2]);
		    if(IsPlayerInRangeOfPoint(playerid, 2.0, pos[0], pos[1], pos[2]))
		    {
		    	PlayerInfo[playerid][pSoliderBag] = 0;
		    	DestroyDynamicObject(PlayerInfo[playerid][pSoliderBagObject]);
		    	PlayerInfo[playerid][pSoliderBagObject] = -1;
		    	Delete3DTextLabel(PlayerInfo[playerid][pSoliderBagLabel]);
		    	SendMessage(playerid, "�����븦 �����Ͽ����ϴ�.");
			}
			else return SendErrorMessage(playerid, "������ �����̿��� �ٽ� �õ����ּ���.");
		}
	    return 1;
	}
	if(strcmp(cmd, "/����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    new Inventory = -1;
	    for(new i = 0; i < MAX_INVENTORY; i ++)
	    {
	    	if(PlayerInfo[playerid][pI_ItemID][i] == 47 && PlayerInfo[playerid][pI_Number][i] > 0)
	    	{
				Inventory = i;
	    	    break;
	    	}
	    	else if(i == MAX_INVENTORY - 1) return SendErrorMessage(playerid, "������ �����ϰ� ���� �ʽ��ϴ�.");
	    }
	    if(Inventory == -1) return SendErrorMessage(playerid, "������ �����ϰ� ���� �ʽ��ϴ�.");
		tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/���� [�÷��̾��ȣ]");
	    new giveplayerid = strval(tmp);
     	if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    if(!IsGivePlayerDistance(3.0, playerid, giveplayerid)) return SendErrorMessage(playerid, MessageText[13]);
		if(PlayerInfo[giveplayerid][pDie] != 2) return SendErrorMessage(playerid, MessageText[16]);
		format(string, sizeof(string), "/me %s(��)���� ������ ���� �Ѵ�.",PlayerNameEx(giveplayerid));
		OnPlayerCommandText(playerid, string);
		format(string, sizeof(string), "/me ������ �°� ������ �Ͼ��.");
		OnPlayerCommandText(giveplayerid, string);
		PlayerInfo[giveplayerid][pDie] = 0;
		PlayerInfo[giveplayerid][pDieTime] = 0;
		TogglePlayerControllable(giveplayerid, 1);
		ClearAnimations(giveplayerid);
		RemoveItemEx(playerid, 47, 1);
	    return 1;
	}
	if(strcmp(cmd, "/��ź��ġ", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    new index = ItemIDFind(playerid, 50);
		if(index == -1) return SendErrorMessage(playerid, MessageText[17]);
	    if(PlayerInfo[playerid][pC4Emplace] == 0)
		{
		    for(new o = 0; o < MAX_BOMB; o ++)
			{
			    if(PlayerInfo[playerid][pC4Object][o] == -1)
			    {
					break;
				}
				else if(o == MAX_BOMB-1) return SendErrorMessage(playerid, "5�� �̻� ��ġ�� �� �����ϴ�.");
			}
		    C4EmplaceMode(playerid, true);
		    SendMessage(playerid, "C4��ġ��尡 Ȱ��ȭ �Ǿ����ϴ�. ����� : [/����]");
		}
		else return SendErrorMessage(playerid, "�̹� C4��ġ��尡 Ȱ��ȭ �Ǿ����ϴ�.");
		return 1;
	}
	if(strcmp(cmd, "/����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    new bomb = 0;
	    for(new o = 0; o < MAX_BOMB; o ++)
		{
			if(PlayerInfo[playerid][pC4Object][o] > -1)
			{
			    new Float:pos[3];
			    GetDynamicObjectPos(PlayerInfo[playerid][pC4Object][o], pos[0], pos[1], pos[2]);
			    CreateExplosion(pos[0], pos[1], pos[2], 10, 20.0);
			    DestroyDynamicObject(PlayerInfo[playerid][pC4Object][o]);
			    PlayerInfo[playerid][pC4Object][o] = -1;
				bomb ++;
				//break;
			}
			else if(o == MAX_BOMB-1 && bomb == 0) return SendErrorMessage(playerid, "��ġ�� C4�� �����ϴ�.");
		}
		return 1;
	}
	if(strcmp(cmd, "/ip", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/ip [�÷��̾��ȣ]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    new PlayerIP[32];
	    GetPlayerIp(giveplayerid, PlayerIP, sizeof(PlayerIP));
	    format(string, sizeof(string), "%s���� �����Ǵ� %s�Դϴ�.",PlayerNameEx(giveplayerid), PlayerIP);
	    SendMessage(playerid, string, 0xEE8937FF);
	    return 1;
	}
	if(strcmp(cmd, "/���׸���", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/���׸��� [�÷��̾��ȣ] [���׸���]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/���׸��� �÷��̾��ȣ [���׸���]");
	    new interior = strval(tmp);
	    format(string, sizeof(string), "���� %s���� %s���� ���׸��� ��ȣ�� %d�� �����Ͽ����ϴ�.",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid), interior);
		SendAdminMessage(string);
		format(string, sizeof(string), "���� %s�Կ� ���� ���׸��� ��ȣ�� %d�� ����Ǿ����ϴ�.", PlayerInfo[playerid][pAdminName], PlayerInfo[playerid][pAdminName], interior);
		SendMessage(giveplayerid, string);
		SetPlayerInteriorEx(giveplayerid, interior);
	    return 1;
	}
	if(strcmp(cmd, "/���߾����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/���߾���� [�÷��̾��ȣ] [����]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/���߾���� �÷��̾��ȣ [����]");
	    new virtualworld = strval(tmp);
	    format(string, sizeof(string), "���� %s���� %s���� ���߾���带 %d�� �����Ͽ����ϴ�.",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid), virtualworld);
		SendAdminMessage(string);
		format(string, sizeof(string), "���� %s�Կ� ���� ���߾� ���尡 %d�� ����Ǿ����ϴ�.", PlayerInfo[playerid][pAdminName], PlayerInfo[playerid][pAdminName], virtualworld);
		SendMessage(giveplayerid, string);
		SetPlayerVirtualWorldEx(giveplayerid, virtualworld);
	    return 1;
	}
	if(strcmp(cmd, "/��������Ȳ", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    //if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
		new str[512], country[12], Occupy[12];
		strmid(str, ""#C_GRAY"��ȣ\t����\t���ɰ���"#C_WHITE"", 0, 512, 512);
	    for(new o = 0; o < MAX_OCCUPY_AREA; o ++)
	    {
	        if(Occupy_AreaInfo[o][oCreate] == 1)
	        {
	            if(Occupy_AreaInfo[o][oCountry] == 0) country = "������";
	            else if(Occupy_AreaInfo[o][oCountry] == 1) country = "�̱�";
	            else if(Occupy_AreaInfo[o][oCountry] == 2) country = "���þ�";

	            if(Occupy_AreaInfo[o][oOccupy] == 0) Occupy = "�Ұ�";
	            else if(Occupy_AreaInfo[o][oOccupy] == 1) Occupy = "����";

	            format(str, sizeof(str), "%s\n%d\t%s\t%s",str, Occupy_AreaInfo[o][oNumber], country, Occupy);
			}
	    }
	    ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_LIST, "��������Ȳ", str, "Ȯ��", "");
	    return 1;
	}
	if(strcmp(cmd, "/���ɰ���", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/���ɰ��� [��������ȣ]");
	    new OccupyID = strval(tmp);
	    if(Occupy_AreaInfo[OccupyID][oCreate] == 0) return SendErrorMessage(playerid, "���� �������Դϴ�. [/��������Ȳ]");
	    if(Occupy_AreaInfo[OccupyID][oOccupy] == 1) return SendErrorMessage(playerid, "�̹� �������� ������ �����Դϴ�.");
	    Occupy_AreaInfo[OccupyID][oOccupy] = 1;
	    format(string, sizeof(string), "���� %s�Կ� %s�������� �����Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName], Occupy_AreaInfo[OccupyID][oName]);
		SendOOCNoticeMessage(string);
		SaveOccupyArea(OccupyID);
		return 1;
	}
	if(strcmp(cmd, "/��������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/�������� [��������ȣ]");
	    new OccupyID = strval(tmp);
	    if(Occupy_AreaInfo[OccupyID][oCreate] == 0) return SendErrorMessage(playerid, "���� �������Դϴ�. [/��������Ȳ]");
	    if(Occupy_AreaInfo[OccupyID][oOccupy] == 0) return SendErrorMessage(playerid, "�̹� �������� ���ܵ� �����Դϴ�.");
	    Occupy_AreaInfo[OccupyID][oOccupy] = 0;
	    format(string, sizeof(string), "���� %s�Կ� %s�������� ���ܵǾ����ϴ�.",PlayerInfo[playerid][pAdminName], Occupy_AreaInfo[OccupyID][oName]);
		SendOOCNoticeMessage(string);
		SaveOccupyArea(OccupyID);
		return 1;
	}
	if(strcmp(cmd, "/��������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    new VehicleID;
	    if(IsPlayerInAnyVehicle(playerid))
	    {
	        VehicleID = GetPlayerVehicleID(playerid);
	        SetVehicleToRespawnEx(VehicleID);
	        format(string, sizeof(string), "����� %d�� ������ �������Ͽ����ϴ�.", VehicleID);
	        SendMessage(playerid, string);
	    }
	    else
	    {
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) return SendErrorMessage(playerid, "/�������� [����ȣ]");
	        VehicleID = strval(tmp);
	        SetVehicleToRespawnEx(VehicleID);
	        format(string, sizeof(string), "����� %d�� ������ �������Ͽ����ϴ�.", VehicleID);
	        SendMessage(playerid, string);
	    }
	    return 1;
	}
	if(strcmp(cmd, "/�����������", true) == 0 || strcmp(cmd, "/������", true) == 0)
	{
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    new v_spawn[MAX_VEHICLES];
	    for(new i = 0; i < MAX_PLAYERS; i ++)
            if(IsPlayerConnected(i) && IsPlayerLogin(i))
                if(IsPlayerInAnyVehicle(i))
                    v_spawn[GetPlayerVehicleID(i)] = 1;
	    for(new v = 0; v < MAX_VEHICLES; v ++)
	        if(VehicleInfo[v][vCreate] == 1)
	            if(v_spawn[v] != 1)
	                SetVehicleToRespawnEx(v);
		format(string, sizeof(string), "���� %s���� ��������� ���������ֽ��ϴ�.",PlayerInfo[playerid][pAdminName]);
		SendOOCNoticeMessage(string);
	    return 1;
	}
	if(strcmp(cmd, "/������⸧", true) == 0 || strcmp(cmd, "/������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    for(new v = 0; v < MAX_VEHICLES; v ++)
	        if(VehicleInfo[v][vCreate] == 1){
                VehicleInfo[v][vFuel] = 100;
                SaveCountryVehicle(v); }
	    return 1;
	}
	if(strcmp(cmd, "/����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/���� [�÷��̾��ȣ]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    if(PlayerInfo[playerid][pSatellite] == 1) return SendErrorMessage(playerid, "������ ���� �ٽ� �õ����ּ���. [/��������]");
	    GetPlayerPos(playerid, PlayerInfo[playerid][pS_LPosX], PlayerInfo[playerid][pS_LPosY], PlayerInfo[playerid][pS_LPosZ]);
		SetPlayerInterior(playerid, GetPlayerInterior(giveplayerid));
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(giveplayerid));
		TogglePlayerSpectating(playerid, 1);
	    PlayerSpectatePlayer(playerid, giveplayerid);
	    PlayerInfo[playerid][pSatellite] = 1;
	    return 1;
	}
	if(strcmp(cmd, "/�ڷ���Ʈ", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    PlayerInfo[playerid][pTeleport] = -1;
	    ShowPlayerDialog(playerid, DIALOG_TELEPORT, DIALOG_STYLE_LIST, "�ڷ���Ʈ", "�����̵�\n�������̵�", "Ȯ��", "���");
	    return 1;
	}
	if(strcmp(cmd, "/��������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    if(!PlayerInfo[playerid][pSatellite]) return SendErrorMessage(playerid, "������ �̹� ������ִ� �����Դϴ�.");
	    SetPlayerInteriorEx(playerid, PlayerInfo[playerid][pInterior]);
	    SetPlayerVirtualWorldEx(playerid, PlayerInfo[playerid][pVirtualWorld]);
	    SetPlayerPos(playerid, PlayerInfo[playerid][pS_LPosX], PlayerInfo[playerid][pS_LPosY], PlayerInfo[playerid][pS_LPosZ]);
	    TogglePlayerSpectating(playerid, 0);
	    PlayerInfo[playerid][pSatellite] = 0;
	    return 1;
	}
	if(strcmp(cmd, "/����", true) == 0)
	{
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendErrorMessage(playerid, "/���� [�÷��̾��ȣ] [�����ȣ] [źâ]");
		new giveplayerid = strval(tmp);
		if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendErrorMessage(playerid, "/���� �÷��̾��ȣ [�����ȣ] [źâ]");
		new weaponid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendErrorMessage(playerid, "/���� �÷��̾��ȣ �����ȣ [źâ]");
		new ammo = strval(tmp);
		new weaponname[32]; GetWeaponName(weaponid, weaponname, sizeof(weaponname));
		format(string, sizeof(string), "���� %s���� %s�Կ��� %s�� %d�� �־����ϴ�.",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid), weaponname, ammo);
		SendAdminMessage(string);
		format(string, sizeof(string), "���� %s�Կ� ���� %s�� %d�� �߰��Ǿ����ϴ�.", PlayerInfo[playerid][pAdminName], weaponname, ammo);
		SendMessage(giveplayerid, string);
		GivePlayerWeaponEx(giveplayerid, weaponid, ammo);
		return 1;
	}
	if(strcmp(cmd, "/�ð�", true) == 0)
	{
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        if(PlayerInfo[playerid][pDeMorgan]) format(string, sizeof(string), "��𸣰� : %d�� ", PlayerInfo[playerid][pDeMorganTimer]);
		if(PlayerInfo[playerid][pJail] == 1) format(string, sizeof(string), "%s��â : %d�� ",string, PlayerInfo[playerid][pJailTimer]);
		if(PlayerInfo[playerid][pJail] == 2) format(string, sizeof(string), "%s���� : %d��",string, PlayerInfo[playerid][pJailTimer]);
        if(strlen(string)) SendMessage(playerid, string);
	    return 1;
	}
	if(strcmp(cmd, "/�������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/������� [�÷��̾��ȣ] [����]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/������� �÷��̾��ȣ [����]");
		format(string, sizeof(string), "���� %s���� %s���� ��� �����Ͽ����ϴ�. [���� : %s]",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid), result);
		SendAdminMessage(string, COLOR_WARNING);
		format(string, sizeof(string), "���� %s�Կ��� ��� �����޾ҽ��ϴ�. [���� : %s]", PlayerInfo[playerid][pAdminName], result);
		SendMessage(giveplayerid, string, COLOR_WARNING);
		if(PlayerInfo[giveplayerid][pWarning] <= 0)
			PlayerInfo[giveplayerid][pWarning] = 0;
		else
			PlayerInfo[giveplayerid][pWarning] --;
	    return 1;
	}
	if(strcmp(cmd, "/��Ų����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/��Ų���� [�÷��̾��ȣ] [��Ų��ȣ]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendErrorMessage(playerid, "/��Ų���� �÷��̾��ȣ [��Ų��ȣ]");
		new skin = strval(tmp);
		format(string, sizeof(string), "%s���� ��Ų�� %d�� �ٲپ����ϴ�.", PlayerNameEx(giveplayerid), skin);
		SendMessage(playerid, string);
		format(string, sizeof(string), "���� %s�Կ� ���� ��Ų�� %d�� �ٲ�����ϴ�.", PlayerInfo[playerid][pAdminName], skin);
		SendMessage(giveplayerid, string);
		SetPlayerSkinEx(giveplayerid, skin);
	    return 1;
	}
	if(strcmp(cmd, "/ip��", true) == 0 || strcmp(cmd, "/�����ǹ�", true) == 0 || strcmp(cmd, "/ipban", true) == 0 || strcmp(cmd, "/���߰�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, MessageText[2]);

		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[32];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/ip�� [ip]");
		format(string, sizeof(string), "���� %s���� IP���� �Ͽ����ϴ�. [IP : %s]",PlayerInfo[playerid][pAdminName], result);
		SendAdminMessage(string, COLOR_WARNING);
		BanAdd(_,result, "�� �߰�", playerid, 3);
	    return 1;
	}
	if(strcmp(cmd, "/������", true) == 0)
	{
		if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/������ [�÷��̾��ȣ] [����]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/������ �÷��̾��ȣ [����]");
		format(string, sizeof(string), "���� %s���� %s���� ������ ó�� �Ͽ����ϴ�. [���� : %s]",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid), result);
		SendAdminMessage(string, COLOR_WARNING);
		format(string, sizeof(string), "���� %s�Կ� ���� ������ ó�� ���ϼ̽��ϴ�. [���� : %s]",PlayerInfo[playerid][pAdminName], result);
		SendMessage(giveplayerid, string, COLOR_WARNING);
		BanAdd(giveplayerid, _, result, playerid, 2);
		return 1;
	}
	if(strcmp(cmd, "/��", true) == 0 || strcmp(cmd, "/������", true) == 0 || strcmp(cmd, "/����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/������ [�÷��̾��ȣ] [����]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/������ �÷��̾��ȣ [����]");
		format(string, sizeof(string), "���� %s���� %s���� ������ ó���Ͽ����ϴ�. [���� : %s]",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid), result);
		SendAdminMessage(string, COLOR_WARNING);
		format(string, sizeof(string), "���� %s�Կ� ���� ������ ó�� ���ϼ̽��ϴ�. [���� : %s]",PlayerInfo[playerid][pAdminName], result);
		SendMessage(giveplayerid, string, COLOR_WARNING);
		BanAdd(giveplayerid, _, result, playerid, 1);
		return 1;
	}
	if(strcmp(cmd, "/������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx); // strtok result value 24
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/������ [�÷��̾��̸�/IP]");

        mysql_format(MySQL, string, sizeof(string), "SELECT * FROM `ban` WHERE (`Name` = '%s' OR `IP` = '%s') LIMIT 1",tmp,tmp);
	    new Cache:result = mysql_query(MySQL, string, true);
		if(cache_num_rows(MySQL) > 0)
		{
		    format(string, sizeof(string), "���� %s���� %s�� �������� �����Ͽ����ϴ�.",PlayerInfo[playerid][pAdminName], tmp);
			SendAdminMessage(string, COLOR_WARNING);

            new query[128];
			format(query, sizeof(query), "DELETE FROM `ban` WHERE (`Name` = '%s' OR `IP` = '%s') LIMIT 1",tmp,tmp);
			mysql_query(MySQL, query, false);
		}
		else SendErrorMessage(playerid, "�������� �ʴ� �÷��̾� �����Դϴ�.");
		cache_delete(result);
		return 1;
	}
	if(strcmp(cmd, "/���̵��", true) == 0 || strcmp(cmd, "/�ƹ�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/���̵�� [�÷��̾��ȣ] [����]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/���̵�� �÷��̾��ȣ [����]");
		format(string, sizeof(string), "���� %s���� %s���� ������ �������ֽ��ϴ�. [���� : %s]",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid), result);
		SendAdminMessage(string, COLOR_WARNING);
		IDBan(giveplayerid, playerid, result);
		return 1;
	}
	if(strcmp(cmd, "/���̵������", true) == 0 || strcmp(cmd, "/�ƹ�����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/���̵������ [�÷��̾��ȣ/�̸�]");
		new giveplayerid = strval(tmp);
		if(giveplayerid == INVALID_PLAYER_ID && IsPlayerConnected(giveplayerid))
		{
		    if(PlayerInfo[giveplayerid][pIDBan] == 0) return SendErrorMessage(playerid, "�� �÷��̾�� ���̵�� ���°� �ƴմϴ�.");

		    format(string, sizeof(string), "���� %s���� %s���� ���� ������ �����Ͽ����ϴ�.",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid));
			SendAdminMessage(string, COLOR_WARNING);

		    strmid(PlayerInfo[giveplayerid][pgIDBanName], "", 0, 128, 128);
			PlayerInfo[giveplayerid][pIDBanDate][0] = 0;
			PlayerInfo[giveplayerid][pIDBanDate][1] = 0;
			PlayerInfo[giveplayerid][pIDBanDate][2] = 0;
			PlayerInfo[giveplayerid][pIDBan] = 0;
			PlayerInfo[giveplayerid][pIDBanReason] = 0;
		    return 1;
		}
		mysql_format(MySQL, string, sizeof(string), "SELECT * FROM `user` WHERE (`pName` = '%s' and `pIDBan` = '1') LIMIT 1",tmp);
	    new Cache:result = mysql_query(MySQL, string, true);
		if(cache_num_rows(MySQL) > 0)
		{
		    format(string, sizeof(string), "���� %s���� %s���� ���� ������ �����Ͽ����ϴ�. 3",PlayerInfo[playerid][pAdminName], tmp);
			SendAdminMessage(string, COLOR_WARNING);

			new query[512];
            format(query, sizeof(query), "UPDATE `user` SET `pIDBan` = '%d', `pIDBanDate_0` = '%d', `pIDBanDate_1` = '%d', `pIDBanDate_2` = '%d', `pIDBanReason` = '%s', `pgIDBanName` = '%s' WHERE `pName` = '%s'",
			0,0,0,0,"","",tmp);
			mysql_query(MySQL, query, false);
		}
		else SendErrorMessage(playerid, "�������� �ʴ� �÷��̾� �����̰ų� ���̵���� ������ ���� �÷��̾��Դϴ�.");
		cache_delete(result);
		return 1;
	}
	if(strcmp(cmd, "/Ī������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/Ī������ [�÷��̾��ȣ] [����]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/Ī������ �÷��̾��ȣ [����]");
		format(string, sizeof(string), "���� %s���� %s���� Ī���� �����Ͽ����ϴ�. [���� : %s]",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid), result);
		SendAdminMessage(string, COLOR_PRAISE);
		format(string, sizeof(string), "���� %s�Կ��� Ī���� �����޾ҽ��ϴ�. [���� : %s]", PlayerInfo[playerid][pAdminName], result);
		SendMessage(giveplayerid, string, COLOR_PRAISE);
		if(PlayerInfo[giveplayerid][pPraise] <= 0) PlayerInfo[giveplayerid][pPraise] = 0;
		else PlayerInfo[giveplayerid][pPraise] --;
	    return 1;
	}
	if(strcmp(cmd, "/Ī��", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
     	tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/Ī�� [�÷��̾��ȣ] [����]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/Ī�� �÷��̾��ȣ [����]");
		format(string, sizeof(string), "���� %s���� %s�Կ��� Ī���� ���־����ϴ�. [���� : %s]",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid), result);
		SendAdminMessage(string, COLOR_PRAISE);
		format(string, sizeof(string), "���� %s�Կ��� Ī���� �޾ҽ��ϴ�. [���� : %s]", PlayerInfo[playerid][pAdminName], result);
		SendMessage(giveplayerid, string, COLOR_PRAISE);
		PlayerInfo[giveplayerid][pPraise] ++;
	    return 1;
	}
	if(strcmp(cmd, "/���", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
     	tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/��� [�÷��̾��ȣ] [����]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/��� �÷��̾��ȣ [����]");
		format(string, sizeof(string), "���� %s���� %s�Կ��� ��� �־����ϴ�. [���� : %s]",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid), result);
		SendAdminMessage(string, COLOR_WARNING);
		format(string, sizeof(string), "���� %s�Կ��� ��� �޾ҽ��ϴ�. [���� : %s]", PlayerInfo[playerid][pAdminName], result);
		SendMessage(giveplayerid, string, COLOR_WARNING);
		PlayerInfo[giveplayerid][pWarning] ++;
		if(PlayerInfo[giveplayerid][pWarning] >= 10)
		{
		    PlayerInfo[giveplayerid][pWarning] = 10;
		    IDBan(giveplayerid, playerid, "��� 10�� ����");
		    format(string, sizeof(string), "%���� ��� �����Ǿ� 10���� �Ѿ����Ƿ� �ڵ����� ���̵�� ó�� ���ϼ̽��ϴ�.", PlayerNameEx(giveplayerid));
			SendAdminMessage(string, COLOR_WARNING);
		    format(string, sizeof(string), "��� �����Ǿ� 10���� �Ѿ����Ƿ� �ڵ����� ���̵�� �Ǿ����ϴ�.");
			SendMessage(giveplayerid, string, COLOR_WARNING);
		}
	    return 1;
	}
	if(strcmp(cmd, "/��𸣰�Ȯ��", true) == 0 || strcmp(cmd, "/���Ȯ��", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 1) return SendErrorMessage(playerid, MessageText[2]);
	    new str[512]; strmid(str, ""#C_GRAY"Second\tName"#C_WHITE"", 0, 512, 512);
	    for(new i = 0; i < MAX_PLAYERS; i ++)
	        if(IsPlayerLogin(i))
		        if(PlayerInfo[i][pDeMorgan] == 1)
					format(str, sizeof(str), "%s\n%d\t%s",str,PlayerInfo[i][pDeMorganTimer],PlayerNameEx(i));
		ShowPlayerDialog(playerid, DIALOG_DEMORGAN, DIALOG_STYLE_LIST, "��𸣰� Ȯ��", str, "Ȯ��", "");
	    return 1;
	}
	if(strcmp(cmd, "/��𸣰�", true) == 0 || strcmp(cmd, "/���", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 1) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendErrorMessage(playerid, "/��𸣰� [�÷��̾��ȣ] [�ð�/��]");
		new giveplayerid = strval(tmp);
		if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		if(PlayerInfo[giveplayerid][pJail] > 0) return SendErrorMessage(playerid, "�� �÷��̾�� �̹� ������ �ֱ� ������ ��𸣰��� ���� �� �����ϴ�.");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendErrorMessage(playerid, "/��𸣰� �÷��̾��ȣ [�ð�/��]");
		new minute = strval(tmp);
		format(string, sizeof(string), "���� %s���� %s�Կ��� ��𸣰��� ���½��ϴ�. [%d��]",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid), minute);
		SendAdminMessage(string);
		format(string, sizeof(string), "���� %s�Կ� ���� ��𸣰��� %d�е��� �����ϴ�.", PlayerInfo[playerid][pAdminName], minute);
		SendMessage(giveplayerid, string);
		PlayerInfo[giveplayerid][pDeMorgan] = 1;
		PlayerInfo[giveplayerid][pDeMorganTimer] = minute * 60;
	    return 1;
	}
	if(strcmp(cmd, "/�����ڷ���", true) == 0 || strcmp(cmd, "/���η���", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 5) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendErrorMessage(playerid, "/�����ڷ��� [�÷��̾��ȣ] [����]");
	    new giveplayerid = strval(tmp);
		if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendErrorMessage(playerid, "/�����ڷ��� �÷��̾��ȣ [����]");
	    new level = strval(tmp);
	    format(string, sizeof(string), "%s(%d)�Կ��� ������ %d������ �־����ϴ�.",PlayerNameEx(giveplayerid), giveplayerid, level);
		SendMessage(playerid, string);
		format(string, sizeof(string), "���� %s�Կ� ���� �����ڷ����� %d�� �����Ǿ����ϴ�.", PlayerInfo[playerid][pAdminName], level);
		SendMessage(giveplayerid, string);
		PlayerInfo[giveplayerid][pAdmin] = level;
		printf("���� %s���� %s(%d)�Կ��� ������ %d������ �־����ϴ�.",PlayerInfo[playerid][pAdminName],PlayerNameEx(giveplayerid), giveplayerid,level);
		return 1;
	}
	if(strcmp(cmd, "/�Ӹ��˻�", true) == 0 || strcmp(cmd, "/�ӼӸ��˻�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    if(PlayerInfo[playerid][pCh_Whisper] == 0)
	    {
	        SendMessage(playerid, "�ӼӸ� �˻縦 �����մϴ�.");
	        PlayerInfo[playerid][pCh_Whisper] = 1;
	    }
	    else if(PlayerInfo[playerid][pCh_Whisper] == 1)
	    {
	        SendMessage(playerid, "�ӼӸ� �˻縦 �����Ͽ����ϴ�.");
	        PlayerInfo[playerid][pCh_Whisper] = 0;
	    }
	    return 1;
	}
	if(strcmp(cmd, "/�Ѱ˻�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendErrorMessage(playerid, "/�Ѱ˻� [�÷��̾��ȣ]");
		new giveplayerid = strval(tmp);
		if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		new weaponid[MAX_WEAPON_SLOT], ammo[MAX_WEAPON_SLOT], index = 0;
		for(new w = 0; w < MAX_WEAPON_SLOT; w ++)
		{
		    if(w == 0) continue;
			GetPlayerWeaponData(giveplayerid, w, weaponid[w], ammo[w]);
			new slot = GetWeaponSlot(weaponid[w]);
			if(slot > 0)
			{
			    index++;
			    if(index == 1) { format(string, sizeof(string), "%s %d��", GetWeaponNameEx(weaponid[w]), ammo[w]); continue; }
			    if(strlen(string)) { format(string, sizeof(string), "%s | %s %d��",string, GetWeaponNameEx(weaponid[w]), ammo[w]); continue; }
			    if((index % 5) == 0) { SendMessage(playerid, string, COLOR_WARNING); index = 0; strmid(string, "", 0, 256, 256); }
			}
			else if(w == MAX_WEAPON_SLOT-1)
			    if((index % 5) != 0)
			        SendMessage(playerid, string, COLOR_WARNING);
		}
	    return 1;
	}
	if(strcmp(cmd, "/����Ȯ��", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendErrorMessage(playerid, "/�����̸� [�÷��̾��ȣ] [�̸�]");
		new giveplayerid = strval(tmp);
		if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		My_Information(giveplayerid, playerid);
		return 1;
	}
	if(strcmp(cmd, "/����ä��", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    if(NewbieChannel == 1)
	    {
	        format(string, sizeof(string), "���� %s�Կ� ���� ����ä���� �������ϴ�.",PlayerInfo[playerid][pAdminName]);
	        SendOOCNoticeMessage(string);
	        NewbieChannel = 0;
	    }
	    if(NewbieChannel == 0)
	    {
	        format(string, sizeof(string), "���� %s�Կ� ���� ����ä���� ���ǽ��ϴ�.",PlayerInfo[playerid][pAdminName]);
	        SendOOCNoticeMessage(string);
	        NewbieChannel = 1;
	    }
		return 1;
	}
	if(strcmp(cmd, "/�����̸�", true) == 0 || strcmp(cmd, "/������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendErrorMessage(playerid, "/�����̸� [�÷��̾��ȣ] [�̸�]");
		new giveplayerid = strval(tmp);
		if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		if(PlayerInfo[playerid][pAdmin] < 1) return SendErrorMessage(playerid, MessageText[14]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/�����̸� �÷��̾��ȣ [�̸�]");
		format(string, sizeof(string), "���� %s���� ���� �̸��� %s�� ���� �Ͽ����ϴ�.",PlayerInfo[giveplayerid][pAdminName], result);
		SendMessage(playerid, string);
		format(string, sizeof(string), "���� %s�Կ� ���� ���� �̸��� %s�� ���� �Ǿ����ϴ�.", PlayerInfo[playerid][pAdminName], result);
		SendMessage(giveplayerid, string);
		printf("���� %s���� %s���� ���� �̸��� %s�� ���� �Ͽ����ϴ�.",PlayerInfo[playerid][pAdminName],PlayerInfo[giveplayerid][pAdminName], result);
		strmid(PlayerInfo[giveplayerid][pAdminName], result, 0, 128, 128);
		return 1;
	}
	if(strcmp(cmd, "/����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
        new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/���� [����]");
		format(string, sizeof(string), "TWWRP NOTICE %s : "#C_WHITE"%s", PlayerInfo[playerid][pAdminName], result);
		SendOOCNoticeMessage(string, COLOR_NOTICE);
		return 1;
	}
	if(strcmp(cmd, "/me", true) == 0 || strcmp(cmd, "/do", true) == 0 || strcmp(cmd, "/�ൿ", true) == 0)
	{
	    if(PlayerInfo[playerid][pChatBan] == 1) return SendErrorMessage(playerid, MessageText[18]);
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/me [�ൿ]");
		format(string, sizeof(string), "* (�ൿ) %s %s", PlayerNameEx(playerid, 2), result);
		SendAroundMessage(playerid, 10.0, COLOR_ACT, COLOR_ACT, COLOR_ACT, COLOR_ACT, COLOR_ACT, string);
	    return 1;
	}
	if(strcmp(cmd, "/c", true) == 0 || strcmp(cmd, "/������", true) == 0)
	{
	    if(PlayerInfo[playerid][pChatBan] == 1) return SendErrorMessage(playerid, MessageText[18]);
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/c [�Ҹ�]");
		format(string, sizeof(string), "%s�۰� ���� %s..", PlayerNameEx(playerid, 2), result);
		SendAroundMessage(playerid, 15.0, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5, string);
		return 1;
	}
	if(strcmp(cmd, "/s", true) == 0 || strcmp(cmd, "/��ġ��", true) == 0)
	{
	    if(PlayerInfo[playerid][pChatBan] == 1) return SendErrorMessage(playerid, MessageText[18]);
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/s [�Ҹ�]");
		format(string, sizeof(string), "%s ��ħ %s!", PlayerNameEx(playerid, 2), result);
		SendAroundMessage(playerid, 15.0, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5, string);
		return 1;
	}
	if(strcmp(cmd, "/st", true) == 0 || strcmp(cmd, "/����", true) == 0)
	{
	    if(PlayerInfo[playerid][pChatBan] == 1) return SendErrorMessage(playerid, MessageText[18]);
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/st [����]");
		format(string, sizeof(string), "* (����) %s %s", PlayerNameEx(playerid, 2), result);
		SendAroundMessage(playerid, 10.0, COLOR_STATE, COLOR_STATE, COLOR_STATE, COLOR_STATE, COLOR_STATE, string);
	    return 1;
	}
	if(strcmp(cmd, "/b", true) == 0)
	{
	    if(PlayerInfo[playerid][pChatBan] == 1) return SendErrorMessage(playerid, MessageText[18]);
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[256];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/b [�Ҹ�]");
		if(!PlayerInfo[playerid][pAdminWork])
		{
			format(string, sizeof(string), "[OOC] %s(%d): %s", PlayerNameEx(playerid), playerid, result);
			SendAroundMessage(playerid, 10.0, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5, string);
		}
		return 1;
	}
	if(strcmp(cmd, "/ow", true) == 0 || strcmp(cmd, "/occpm", true) == 0)
	{
	    if(PlayerInfo[playerid][pChatBan] == 1) return SendErrorMessage(playerid, MessageText[18]);
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendErrorMessage(playerid, "/occpm [�÷��̾��ȣ] [����]");
		new giveplayerid = strval(tmp);
		if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/occpm �÷��̾��ȣ [����]");
  		format(string, sizeof(string), "[OOC PM] %s(%d) > %s",PlayerNameEx(playerid),playerid, result);
  		SendClientMessage(giveplayerid, 0xD0D0D0FF, string);
  		format(string, sizeof(string), "[OOC PM] %s(%d) > %s",PlayerNameEx(giveplayerid),giveplayerid, result);
  		SendClientMessage(playerid, 0x9F9F9FFF, string);

  		format(string, sizeof(string), "Whisper Check : %s(%d)�� %s(%d)���� - %s",PlayerNameEx(playerid),playerid,PlayerNameEx(giveplayerid),giveplayerid, result); printf(string);
		for(new i = 0; i < MAX_PLAYERS; i ++)
		{
		    if(IsPlayerConnected(i) && IsPlayerLogin(i))
		    	if(PlayerInfo[i][pCh_Whisper] == 1)
		    	    if(PlayerInfo[i][pAdmin] >= 3)
		    	        SendMessage(i, string, 0xA851FFFF);
					else PlayerInfo[i][pCh_Whisper] = 0;
		}
		return 1;
	}
	if(strcmp(cmd, "/so", true) == 0 || strcmp(cmd, "/�Ҹ�", true) == 0)
	{
	    if(PlayerInfo[playerid][pChatBan] == 1) return SendErrorMessage(playerid, MessageText[18]);
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/so [�Ҹ�]");
		format(string, sizeof(string), "* %s %s", PlayerNameEx(playerid, 2), result);
		SendAroundMessage(playerid, 10.0, COLOR_SOUND, COLOR_SOUND, COLOR_SOUND, COLOR_SOUND, COLOR_SOUND, string);
	    return 1;
	}
	if(strcmp(cmd, "/ä�ñ���", true) == 0 || strcmp(cmd, "/ä��", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/ä�ñ��� [�÷��̾��ȣ]");
	    new giveplayerid = strval(tmp);
	    if(!PlayerInfo[giveplayerid][pChatBan])
	    {
		    format(string, sizeof(string), "���� %s���� %s�Կ��� ä�ñ����� ���ϼ̽��ϴ�.",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid));
			SendAdminMessage(string);
			format(string, sizeof(string), "���� %s�Կ� ���� ä�ñ����� �Ǿ����ϴ�.", PlayerInfo[playerid][pAdminName]);
			SendMessage(giveplayerid, string);
			PlayerInfo[giveplayerid][pChatBan] = 1;
		}
		else if(PlayerInfo[giveplayerid][pChatBan] == 1)
		{
		    format(string, sizeof(string), "���� %s���� %s���� ä�ñ����� Ǯ�����ϴ�.",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid));
			SendAdminMessage(string);
			format(string, sizeof(string), "���� %s�Կ� ���� ä�ñ����� Ǯ�ǽ��ϴ�.", PlayerInfo[playerid][pAdminName]);
			SendMessage(giveplayerid, string);
			PlayerInfo[giveplayerid][pChatBan] = 0;
		}
		return 1;
	}
	if(strcmp(cmd, "/�õ�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "���� �������� ž�����ּ���.");
	    new vehicleid = GetPlayerVehicleID(playerid);
		if(IsPlayerVehicleStart(playerid, vehicleid) == 0) return SendErrorMessage(playerid, "����� �õ� �� �� ���� �����Դϴ�.");
	    return 1;
	}
	if(strcmp(cmd, "/����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pCorps] != 3) return SendErrorMessage(playerid, "�ǹ����� �ƴմϴ�.");
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) SendErrorMessage(playerid, "/���� [�÷��̾��ȣ]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    if(!IsGivePlayerDistance(3.0, playerid, giveplayerid)) return SendErrorMessage(playerid, MessageText[13]);
	    if(PlayerInfo[giveplayerid][pDie] != 2) return SendErrorMessage(playerid, MessageText[16]);
	    if(PlayerInfo[playerid][pSmokeStart] == 1) return SendErrorMessage(playerid, "��踦 ���ּ���.");
	    if(PlayerInfo[playerid][pBeerStart] == 1) return SendErrorMessage(playerid, "���ָ� �����ּ���.");
	    if(PlayerInfo[playerid][pFirstaid] == 1) return SendErrorMessage(playerid, "����� �̹� ����óġ�� �õ��ϰ� �ֽ��ϴ�.");
		SendMessage(playerid, "�����̽��ٸ� ��Ÿ���ּ���.");
		format(string, sizeof(string), "/me ����� %s�� ����� �´�� ������ ������ �ǰ� ��ġ�ϰ� �ϰ�, ���� ��� ���� �̿��Ͽ� 100ȸ �����ش�.",PlayerNameEx(giveplayerid));
		OnPlayerCommandText(playerid, string);
		PlayerInfo[playerid][pFirstaid] = 1; PlayerInfo[playerid][pgFirstaid] = giveplayerid;
	    ApplyAnimation(playerid, "MEDIC", "CPR", 4.1, 1, 1, 1, 1, 1, 1);
	    PlayerInfo[playerid][pDoingGage] = 0;
	    SetPlayerProgressBarMaxValue(playerid, DoingBar[playerid], 100.0);
		ShowPlayerProgressBar(playerid, DoingBar[playerid]);
		SetPlayerProgressBarValue(playerid, DoingBar[playerid], PlayerInfo[playerid][pDoingGage]);
	    return 1;
	}
	if(strcmp(cmd, "/����", true) == 0 ||strcmp(cmd, "/����������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendErrorMessage(playerid, "/���������� [�÷��̾��ȣ]");
		new giveplayerid = strval(tmp);
		if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		if(PlayerInfo[giveplayerid][pDie] != 2) return SendErrorMessage(playerid, MessageText[16]);
		format(string, sizeof(string), "���� %s���� %s���� �������¸� Ǯ���־����ϴ�.",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid));
		SendAdminMessage(string);
		format(string, sizeof(string), "���� %s�Կ� ���� �������¿��� Ǯ�������ϴ�.",PlayerInfo[playerid][pAdminName]);
		SendMessage(giveplayerid, string);
		PlayerInfo[giveplayerid][pDie] = 0;
		PlayerInfo[giveplayerid][pDieTime] = 0;
		ClearAnimations(giveplayerid);
		SetPlayerHealthEx(giveplayerid, 30.0);
		TogglePlayerControllable(giveplayerid, 1);
	    return 1;
	}
	if(strcmp(cmd, "/���̵�ű", true) == 0 || strcmp(cmd, "/��ű", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/���̵�ű [�÷��̾��ȣ]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    format(string, sizeof(string), "���� %s���� %s���� �����Ͽ����ϴ�. [���� : ���̵�ҷ�]",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid));
		SendAdminMessage(string);
		format(string, sizeof(string), "���� %s�Կ� ���� ������ϼ̽��ϴ�. [���� : ���̵�ҷ�] [Ex : Hojin_Kim]", PlayerInfo[playerid][pAdminName]);
		SendMessage(giveplayerid, string);
	    KickEx(giveplayerid, 1);
	    return 1;
	}
	if(strcmp(cmd, "/ű", true) == 0 || strcmp(cmd, "/����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/ű [�÷��̾��ȣ] [����]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/ű �÷��̾��ȣ [����]");
		format(string, sizeof(string), "���� %s���� %s���� �����Ͽ����ϴ�. [���� : %s]",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid), result); SendAdminMessage(string);
		format(string, sizeof(string), "���� %s�Կ� ���� ������ϼ̽��ϴ�. [���� : %s]", PlayerInfo[playerid][pAdminName], result); SendMessage(giveplayerid, string);
	    KickEx(giveplayerid, 1);
	    return 1;
	}
	if(strcmp(cmd, "/����", true) == 0)
	{
	    if(NewbieChannel == 0) return SendErrorMessage(playerid, "���� ä���� �����ֽ��ϴ�.");
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/���� [����]");
		format(string, sizeof(string), "* [Answer] %s(%d) : %s",PlayerNameEx(playerid),playerid,result);
		SendICNoticeMessage(string, COLOR_ANSWER);
		return 1;
	}
	if(strcmp(cmd, "/������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/������ [�÷��̾��ȣ]");
		new giveplayerid = strval(tmp);
		if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		format(string, sizeof(string), "���� %s���� %s�� ���������ֽ��ϴ�.",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid));
		SendAdminMessage(string);
		format(string, sizeof(string), "���� %s�Կ� ���� �������Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName]);
		SendMessage(giveplayerid, string);
		SetPlayerHealthEx(giveplayerid, 50.0);
		OnPlayerSpawn(giveplayerid);
	    return 1;
	}
	if(strcmp(cmd, "/����", true) == 0)
	{
	    if(NewbieChannel == 0) return SendErrorMessage(playerid, "���� ä���� �����ֽ��ϴ�.");
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/���� [����]");
		format(string, sizeof(string), "* [Question] %s(%d) : %s",PlayerNameEx(playerid),playerid,result);
		SendICNoticeMessage(string, COLOR_QUESTION);
		return 1;
	}
	if(strcmp(cmd, "/������", true) == 0 || strcmp(cmd, "/�����ڹ���", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/�����ڹ��� [����]");
		format(string, sizeof(string), "%s(%d)���� ���� : %s",PlayerNameEx(playerid),playerid,result);
		SendAdminMessage(string, 0xA65300FF);
		format(string, sizeof(string), ""#C_GRAY"������ ���ǳ��� : "#C_WHITE"%s",result);
		SendMessage(playerid, string, 0x000000FF);
		return 1;
	}
	if(strcmp(cmd, "/�亯", true) == 0 || strcmp(cmd, "/��", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 1) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendErrorMessage(playerid, "/�亯 [�÷��̾��ȣ] [����]");
		new giveplayerid = strval(tmp);
		if(!IsPlayerConnected(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/�亯 �÷��̾��ȣ [����]");
		format(string, sizeof(string), "%s���� %s�Կ��� �亯 : "#C_WHITE"%s",PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid),result);
		SendAdminMessage(string);
		format(string, sizeof(string), "%s���� �亯 : "#C_WHITE"%s",PlayerInfo[playerid][pAdminName], result);
		SendMessage(giveplayerid, string, 0xAA55FFFF);
	    return 1;
	}
	if(strcmp(cmd, "/admin", true) == 0 || strcmp(cmd, "/a", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 1) return SendErrorMessage(playerid, MessageText[2]);
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/admin [��ȭ]");
		format(string, sizeof(string), ""#"{850BFF}""Admin %s : "#C_WHITE"%s",PlayerInfo[playerid][pAdminName], result); SendAdminMessage(string);
	    return 1;
	}
	if(strcmp(cmd, "/��������", true) == 0 || strcmp(cmd, "/����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 1) return SendErrorMessage(playerid, MessageText[2]);
		if(PlayerInfo[playerid][pAdminWork] == 0)
		{
		    PlayerInfo[playerid][pAdminWork] = 1;
		    new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			format(string, sizeof(string), "[��������]\n%s",PlayerInfo[playerid][pAdminName]);
			PlayerInfo[playerid][p3DAdminLabel] = Create3DTextLabel(string, 0x0098E1FF, x, y, z + 1.2, 10.0, 0);
			Attach3DTextLabelToPlayer(PlayerInfo[playerid][p3DAdminLabel], playerid, 0,0,0);
		    GetPlayerHealth(playerid, PlayerInfo[playerid][pW_Health]);
	     	GetPlayerArmour(playerid, PlayerInfo[playerid][pW_Armour]);
		    SetPlayerHealthEx(playerid, 100);
		    format(string, sizeof(string), "���� %s���� ���������� �����Ͽ����ϴ�.", PlayerInfo[playerid][pAdminName]);
			SendOOCNoticeMessage(string, 0x55AAAAFF);
			SetPlayerSkin(playerid, 264);
			for(new i = 0; i < MAX_PLAYERS; i ++)
			    if(IsPlayerConnected(i))
					ShowPlayerNameTagForPlayer(i, playerid, false);
            PlayerInfoTag(playerid, false);
		}
		else if(PlayerInfo[playerid][pAdminWork] == 1)
		{
		    PlayerInfo[playerid][pAdminWork] = 0;
		    Delete3DTextLabel(PlayerInfo[playerid][p3DAdminLabel]);
		    SetPlayerHealthEx(playerid, PlayerInfo[playerid][pW_Health]);
		    SetPlayerArmourEx(playerid, PlayerInfo[playerid][pW_Armour]);
		    format(string, sizeof(string), "���� %s���� ���������� �����Ͽ����ϴ�.", PlayerInfo[playerid][pAdminName]);
			SendOOCNoticeMessage(string, 0x55AAAAFF);
			SetPlayerSkinEx(playerid, PlayerInfo[playerid][pClothes]);
			for(new i = 0; i < MAX_PLAYERS; i ++)
			    if(IsPlayerConnected(i))
					ShowPlayerNameTagForPlayer(i, playerid, true);
            PlayerInfoTag(playerid, true);
		}
	    return 1;
	}
	if(strcmp(cmd, "/��", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/�� [�÷��̾��ȣ]");
	    new giveplayerid = strval(tmp);
	    format(string, sizeof(string), "���� %s���� %s���� ��ǽ��ϴ�.", PlayerInfo[playerid][pAdmin], PlayerNameEx(giveplayerid)); SendAdminMessage(string);
	    format(string, sizeof(string), "���� %s�Կ� ���� ������ϴ�.",PlayerInfo[playerid][pAdmin]); SendMessage(giveplayerid, string);
	    TogglePlayerControllable(giveplayerid, 0);
	    return 1;
	}
	if(strcmp(cmd, "/����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/���� [�÷��̾��ȣ]");
	    new giveplayerid = strval(tmp);
	    format(string, sizeof(string), "���� %s���� %s���� �쿴���ϴ�.", PlayerInfo[playerid][pAdmin], PlayerNameEx(giveplayerid)); SendAdminMessage(string);
	    format(string, sizeof(string), "���� %s�Կ� ���� ��ҽ��ϴ�.",PlayerInfo[playerid][pAdmin]); SendMessage(giveplayerid, string);
	    TogglePlayerControllable(giveplayerid, 1);
	    return 1;
	}
	if(strcmp(cmd, "/ü��", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/ü�� [�÷��̾��ȣ] [ü��]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
        tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/ü�� �÷��̾��ȣ [ü��]");
	    new Float:health = floatstr(tmp);
		SetPlayerHealthEx(giveplayerid, health);
	    format(string, sizeof(string), "%s���� ü���� %f�� �����Ͽ����ϴ�.", PlayerNameEx(giveplayerid), health); SendMessage(playerid, string);
	    format(string, sizeof(string), "���� %s�Կ� ���� ü���� %f�� ����Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName], health); SendMessage(giveplayerid, string);
	    return 1;
	}
	if(strcmp(cmd, "/�Ƹ�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/�Ƹ� [�÷��̾��ȣ] [�Ƹ�]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
        tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/�Ƹ� �÷��̾��ȣ [�Ƹ�]");
	    new Float:armour = floatstr(tmp);
		SetPlayerArmourEx(giveplayerid, armour);
	    format(string, sizeof(string), "%s���� �ƸӸ� %f�� �����Ͽ����ϴ�.", PlayerNameEx(giveplayerid), armour); SendMessage(playerid, string);
	    format(string, sizeof(string), "���� %s�Կ� ���� �ƸӰ� %f�� ����Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName], armour); SendMessage(giveplayerid, string);
	    return 1;
	}
	if(strcmp(cmd, "/��������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 5) return SendErrorMessage(playerid, MessageText[2]);
	    format(string, sizeof(string), "%s���� ������ �����Ͽ����ϴ�.",PlayerInfo[playerid][pAdminName]);
	    SendOOCNoticeMessage(string);
	    SendRconCommand("exit");
		return 1;
	}
	if(strcmp(cmd, "/����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, MessageText[2]);
	    format(string, sizeof(string), "%s���� ������ �����Ͽ����ϴ�.",PlayerInfo[playerid][pAdminName]);
	    SendOOCNoticeMessage(string);
		SetTimer("RebootServer", 500, false);
		return 1;
	}
	if(strcmp(cmd, "/��������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(!IsPlayerCountryCommander(playerid)) return SendErrorMessage(playerid, MessageText[7]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/������� [�÷��̾��ȣ]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		if(PlayerInfo[playerid][pCountry] != PlayerInfo[giveplayerid][pCountry]) return SendErrorMessage(playerid, MessageText[6]);
		PlayerInfo[giveplayerid][pMedal] --;
		format(string, sizeof(string), "%s���� �����Ѱ��� �����Ͽ����ϴ�.",PlayerNameEx(giveplayerid));
		SendMessage(playerid, string);
	    format(string, sizeof(string), "��ɰ� %s�Կ� ���� ������ �Ѱ��� �ݳ��Ǿ����ϴ�.",PlayerNameEx(playerid));
		SendMessage(giveplayerid, string);
		return 1;
	}
	if(strcmp(cmd, "/�������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(!IsPlayerCountryCommander(playerid)) return SendErrorMessage(playerid, MessageText[7]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/������� [�÷��̾��ȣ]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		if(PlayerInfo[playerid][pCountry] != PlayerInfo[giveplayerid][pCountry]) return SendErrorMessage(playerid, MessageText[6]);
		PlayerInfo[giveplayerid][pMedal] ++;
		format(string, sizeof(string), "%s�Կ��� �����Ѱ��� �����Ͽ����ϴ�.",PlayerNameEx(giveplayerid));
		SendMessage(playerid, string);
	    format(string, sizeof(string), "��ɰ� %s�Կ� ���� ������ �Ѱ� �����Ͽ����ϴ�.",PlayerNameEx(playerid));
		SendMessage(giveplayerid, string);
	    return 1;
	}
	if(strcmp(cmd, "/�Ҵ�Ȯ��", true) == 0 || strcmp(cmd, "/�Ҵ��ȣȮ��", true) == 0 || strcmp(cmd, "/�Ҵ��ȣ", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
     	new type = GetPlayerJointCommand(playerid, 6, 3, 4, 1);
     	if(type > 0)
		{
		    new str[512], country[12];
		    strmid(str, "��ȣ\t�Ҵ��ȣ\t����\t�̸�", 0, 512, 512);
		    for(new i = 0; i < MAX_PLATOON; i ++)
		    {
		        if(PlatoonInfo[i][p_tCreate] == 1)
		        {
		            if(PlatoonInfo[i][p_tCountry] == 1) strmid(country, "�̱�", 0, 12, 12);
		            if(PlatoonInfo[i][p_tCountry] == 2) strmid(country, "���þ�", 0, 12, 12);
					format(str, sizeof(str), "%s\n%d\t%d\t\t%s\t%s", str, PlatoonInfo[i][p_tNumber],PlatoonInfo[i][p_t_Number],country,PlatoonInfo[i][p_tName]);
		        }
		    }
		    ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_LIST, "�Ҵ��ȣ", str, "Ȯ��", "");
		    SendMessage(playerid, "�Ҵ� ���� ��ɾ ����� �� '��ȣ'���� �ִ� ��ȣ�� ����ؾ� �մϴ�. [�� : /�Ҵ����Ӹ� /�Ҵ뼳��]");
		}
     	return 1;
    }
	if(strcmp(cmd, "/��޼���", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
     	new type = GetPlayerJointCommand(playerid, 6, 3, 3, 1);
	    if(type > 0)
		{
		    tmp = strtok(cmdtext, idx);
		    if(!strlen(tmp)) return SendErrorMessage(playerid, "/��޼��� [�÷��̾��ȣ] [���]");
		    new giveplayerid = strval(tmp);
		    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
			if(PlayerInfo[playerid][pCountry] != PlayerInfo[giveplayerid][pCountry]) return SendErrorMessage(playerid, MessageText[6]);
		    tmp = strtok(cmdtext, idx);
		    if(!strlen(tmp)) return SendErrorMessage(playerid, "/��޼��� �÷��̾��ȣ [���]");
		    new Level = strval(tmp);
		    if(Level <= 19)
		    {
				if(type == 1)
				{
				    if(PlayerInfo[playerid][pCountry] == PlayerInfo[giveplayerid][pCountry])
				    {
						format(string, sizeof(string), "%s���� ����� %s[%d]�� �����Ͽ����ϴ�.",PlayerNameEx(giveplayerid),ArmyClass(Level),Level);
						SendMessage(playerid, string);
					    format(string, sizeof(string), "��ɰ� %s�Կ� ���� ����� %s[%d]�� �����Ǿ����ϴ�.",PlayerNameEx(playerid),ArmyClass(Level),Level);
						SendMessage(giveplayerid, string);
						SetPlayerClass(giveplayerid, Level);
					}
				}
				else if(type == 2)
				{
				    format(string, sizeof(string), "���� %s���� %s���� ����� %s[%d]�� �����Ͽ����ϴ�.",PlayerInfo[playerid][pAdminName],PlayerNameEx(giveplayerid),ArmyClass(Level),Level);
					SendAdminMessage(string);
				    format(string, sizeof(string), "���� %s�Կ� ���� ����� %s[%d]�� �����Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName],ArmyClass(Level),Level);
					SendMessage(giveplayerid, string);
					SetPlayerClass(giveplayerid, Level);
				}
			}
			else return SendErrorMessage(playerid, "����� 0 ~ 19���� ���� �� �� �ֽ��ϴ�.");
		}
		else
		{
		    SendErrorMessage(playerid, MessageText[7]);
		}
		return 1;
	}
	if(strcmp(cmd, "/��������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    PlayerInfo[playerid][pWork] = 0;
	    ResetPlayerWeaponsEx(playerid);
	    OnPlayerCommandText(playerid, "/me ��� ���⸦ ������, ������ �����Ѵ�.");
	    return 1;
	}
	if(strcmp(cmd, "/�������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/������� [��й�ȣ]");
		if(4 <= strlen(tmp) < 10)
		{
	        new password[128];
		    SHA512(tmp, password, 128);
			strmid(PlayerInfo[playerid][pPassword], password, 0, 128, 128);
			OnPlayerSave(playerid);
			format(string, sizeof(string), "����� ��й�ȣ�� %s�� ���� �Ǿ����ϴ�.", tmp);
			SendMessage(playerid, string);
		}
		else return SendErrorMessage(playerid, "��й�ȣ�� 4���� �̻�, 10���� �̸��̾�� �մϴ�.");
	    return 1;
	}
	if(strcmp(cmd, "/����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    PlayerInfo[playerid][pWork] = 0;
	    ResetPlayerWeaponsEx(playerid);
	    new Float:health; GetPlayerHealth(playerid, health);
	    if(health > 50.0) SetPlayerHealthEx(playerid, 50.0);
	    SetPlayerArmourEx(playerid, 0.0);
	    OnPlayerCommandText(playerid, "/me ��� ���⸦ ������, ������ �Ѵ�.");
	    OnPlayerCommandText(playerid, "/��");
	    return 1;
	}
	if(strcmp(cmd, "/�Ҵ���", true) == 0)
	{
		if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(!IsPlayerPlatoonLeader(playerid)) return SendErrorMessage(playerid, MessageText[8]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/�Ҵ��ʴ� [�÷��̾��ȣ] [���]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    if(PlayerInfo[playerid][pCountry] != PlayerInfo[giveplayerid][pCountry]) return SendErrorMessage(playerid, MessageText[6]);
	    if(PlayerInfo[playerid][pPlatoon] != PlayerInfo[giveplayerid][pPlatoon]) return SendErrorMessage(playerid, MessageText[11]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/�Ҵ��ʴ� �÷��̾��ȣ [���]");
	    new level = strval(tmp);
	    if(level > 2) return SendErrorMessage(playerid, "�Ҵ����� 1~2���� �����մϴ�.");
	    SetPlayerPlatoonLevel(playerid, PlayerInfo[playerid][pPlatoon], level);
	    format(string, sizeof(string), "�Ҵ��� %s�Կ� ���� %s�Ҵ� %s������� ����Ǿ����ϴ�.",PlayerNameEx(playerid), PlatoonInfo[PlayerInfo[playerid][pPlatoon]][p_tName], PlatRankName(level));
		SendMessage(giveplayerid, string);
	    format(string, sizeof(string), "%s���� %s�Ҵ��� %s������� �����Ͽ����ϴ�.",PlayerNameEx(giveplayerid), PlatoonInfo[PlayerInfo[playerid][pPlatoon]][p_tName], PlatRankName(level));
		SendMessage(playerid, string);
	    return 1;
	}
	if(strcmp(cmd, "/�Ҵ��ʴ�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(!IsPlayerPlatoonLeader(playerid)) return SendErrorMessage(playerid, MessageText[8]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/�Ҵ��ʴ� [�÷��̾��ȣ]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		if(PlayerInfo[playerid][pCountry] != PlayerInfo[giveplayerid][pCountry]) return SendErrorMessage(playerid, MessageText[6]);
		if(PlayerInfo[giveplayerid][pPlatoon]) return SendErrorMessage(playerid, MessageText[12]);
		if(!IsGivePlayerDistance(3.0, playerid, giveplayerid)) return SendErrorMessage(playerid, MessageText[13]);
		if(PlayerInfo[playerid][pPlatoonType] == 4)
	        if(PlayerInfo[giveplayerid][pCorps] != 1) return SendErrorMessage(playerid, "�������� �δ� �ʴ������ ������ �������̾�� �մϴ�.");
		PlayerInfo[giveplayerid][pCorps] = 4;
		SetPlayerPlatoonLevel(giveplayerid, PlayerInfo[playerid][pPlatoon], 1);
		format(string, sizeof(string), "�Ҵ��� %s�Կ� ���� %s�Ҵ뿡 ���ԵǾ����ϴ�.",PlayerNameEx(playerid),PlatoonInfo[PlayerInfo[playerid][pPlatoon]][p_tName]);
		SendMessage(giveplayerid, string);
	    format(string, sizeof(string), "%s���� %s�Ҵ뿡 �ʴ� �Ͽ����ϴ�.",PlayerNameEx(giveplayerid), PlatoonInfo[PlayerInfo[playerid][pPlatoon]][p_tName]);
		SendMessage(playerid, string);
		return 1;
	}
	if(strcmp(cmd, "/�Ҵ��߹�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(!IsPlayerPlatoonLeader(playerid)) return SendErrorMessage(playerid, MessageText[8]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/�Ҵ��߹� [�÷��̾��ȣ]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		if(PlayerInfo[playerid][pCountry] != PlayerInfo[giveplayerid][pCountry]) return SendErrorMessage(playerid, MessageText[6]);
		if(PlayerInfo[playerid][pPlatoon] != PlayerInfo[giveplayerid][pPlatoon]) return SendErrorMessage(playerid, MessageText[11]);
		SetPlayerPlatoonLevel(giveplayerid, 0, 0);
		if(PlatoonInfo[PlayerInfo[playerid][pPlatoon]][p_tType] == 4) PlayerInfo[giveplayerid][pCorps] = 1;
		format(string, sizeof(string), "�Ҵ��� %s�Կ� ���� �Ҵ뿡�� �߹� ���Ͽ����ϴ�.",PlayerNameEx(playerid));
		SendMessage(giveplayerid, string);
	    format(string, sizeof(string), "%s���� �Ҵ뿡�� �߹��Ͽ����ϴ�.",PlayerNameEx(giveplayerid));
		SendMessage(playerid, string);
		return 1;
	}
	if(strcmp(cmd, "/����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(!IsPlayerCountryCommander(playerid)) return SendErrorMessage(playerid, MessageText[7]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/���� [����]");
		if(PlayerInfo[playerid][pCountry] == 1)
		{
			format(string, sizeof(string), "%s ���� %s : "#C_WHITE"%s",CountryNameEx(PlayerInfo[playerid][pCountry]),PlayerNameEx(playerid, 2), result);
			SendCountryMessage(string, -1, HexToInt(COLOR_USA));
		}
		else if(PlayerInfo[playerid][pCountry] == 2)
		{
			format(string, sizeof(string), "%s ���� %s : "#C_WHITE"%s",CountryNameEx(PlayerInfo[playerid][pCountry]),PlayerNameEx(playerid, 2), result);
			SendCountryMessage(string, -1, HexToInt(COLOR_RUSIA));
		}
		return 1;
	}
	if(strcmp(cmd, "/������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(!IsPlayerCountryCommander(playerid)) return SendErrorMessage(playerid, MessageText[7]);
	    new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[128];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result)) return SendErrorMessage(playerid, "/������ [����]");
		if(PlayerInfo[playerid][pCountry] == 1)
		{
			format(string, sizeof(string), "%s ������ %s : "#C_WHITE"%s",CountryNameEx(PlayerInfo[playerid][pCountry]), PlayerNameEx(playerid, 2), result);
			SendCountryMessage(string, PlayerInfo[playerid][pCountry], HexToInt(COLOR_USA));
		}
		else if(PlayerInfo[playerid][pCountry] == 2)
		{
			format(string, sizeof(string), "%s ������ %s : "#C_WHITE"%s",CountryNameEx(PlayerInfo[playerid][pCountry]), PlayerNameEx(playerid, 2), result);
			SendCountryMessage(string, PlayerInfo[playerid][pCountry], HexToInt(COLOR_RUSIA));
		}
		return 1;
	}
	if(strcmp(cmd, "/�Ҵ����Ӹ�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    new type = GetPlayerJointCommand(playerid, 6, 3, 4, 1);
	    if(type > 0)
		{
		    tmp = strtok(cmdtext, idx);
		    if(!strlen(tmp)) return SendErrorMessage(playerid, "/�Ҵ����Ӹ� [�÷��̾��ȣ] [�Ҵ�]");
		    new giveplayerid = strval(tmp);
		    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		    tmp = strtok(cmdtext, idx);
		    if(!strlen(tmp)) return SendErrorMessage(playerid, "/�Ҵ����Ӹ� �÷��̾��ȣ [�Ҵ�]");
		    new Platoon = strval(tmp);
		    if(PlayerInfo[giveplayerid][pCountry] != PlatoonInfo[Platoon][p_tCountry]) return SendErrorMessage(playerid, "�Ҵ�� �÷��̾��� ���� ������ ���� �ʽ��ϴ�.");
			SetPlayerPlatoonLevel(giveplayerid, Platoon, 3);
			if(type == 1)
			{
			    format(string, sizeof(string), "��ɰ� %s�Կ� ���ؼ� %s�Ҵ� �Ҵ������� �Ӹ� �޾ҽ��ϴ�.",PlayerNameEx(playerid), PlatoonInfo[Platoon][p_tName]);
				SendMessage(giveplayerid, string);
			    format(string, sizeof(string), "%s�Կ��� %s�Ҵ��� �Ҵ������� �Ӹ� �Ͽ����ϴ�.",PlayerNameEx(giveplayerid), PlatoonInfo[Platoon][p_tName]);
				SendMessage(playerid, string);
			}
			else if(type == 2)
			{
				format(string, sizeof(string), "���� %s���� %s�Կ��� %s���� %s�Ҵ��� �Ҵ������� �Ӹ� �Ͽ����ϴ�.", PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid),CountryNameEx(PlayerInfo[giveplayerid][pCountry]), PlatoonInfo[Platoon][p_tName]);
				SendAdminMessage(string);
			    format(string, sizeof(string), "���� %s�Կ� ���ؼ� %s�Ҵ� �Ҵ������� �Ӹ� �޾ҽ��ϴ�.",PlayerInfo[playerid][pAdminName], PlatoonInfo[Platoon][p_tName]);
				SendMessage(giveplayerid, string);
			}
		}
		else
		{
		    SendErrorMessage(playerid, MessageText[7]);
		}
		return 1;
	}
	if(strcmp(cmd, "/���ֱ�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/���ֱ� [�÷��̾��ȣ] [��]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/���ֱ� �÷��̾��ȣ [��]");
	    new Money = strval(tmp);
	    GivePlayerMoneyEx(playerid, Money);
	    format(string, sizeof(string), "���� %s���� %s���� ���� %d$ �������ֽ��ϴ�.", PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid), Money);
		SendAdminMessage(string);
	    format(string, sizeof(string), "���� %s�Կ� ���� ���� %d$ �����Ͽ����ϴ�.",PlayerInfo[playerid][pAdminName], Money);
		SendMessage(giveplayerid, string);
	    return 1;
	}
	if(strcmp(cmd, "/����", true) == 0 || strcmp(cmd, "/sav", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pSaveTimer] <= 0)
	    {
	        OnPlayerSave(playerid);
	    	SendMessage(playerid, "������ ���̽��� �����Ͽ����ϴ�.");
	    	PlayerInfo[playerid][pSaveTimer] = 10;
		}
		else
		{
		    format(string, sizeof(string), "�ٽ� �õ����ּ���. [%d��]",PlayerInfo[playerid][pSaveTimer]);
		    SendErrorMessage(playerid, string);
		}
	    return 1;
	}
	if(strcmp(cmd, "/�������", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
        for(new i = 0; i < MAX_PLAYERS; i ++)
        {
			if(IsPlayerConnected(i) && IsPlayerLogin(i))
			{
				OnPlayerSave(i);
			}
		}
		format(string, sizeof(string), "���� %s���� ��� ������ �����͸� �����Ͽ����ϴ�.",PlayerInfo[playerid][pAdminName]);
		SendOOCNoticeMessage(string);
	    return 1;
	}
	if(strcmp(cmd, "/�Ҵ뼳��", true) == 0 || strcmp(cmd, "/�Ҵ�����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/�Ҵ뼳�� [�÷��̾��ȣ] [�Ҵ�]");
	    new giveplayerid = strval(tmp);
	    if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/�Ҵ뼳�� �÷��̾��ȣ [�Ҵ�]");
	    new platoonID = strval(tmp);
	    if(PlatoonInfo[platoonID][p_tCreate] == 1)
	    {
	        if(PlayerInfo[giveplayerid][pCountry] != PlatoonInfo[platoonID][p_tCountry]) return SendErrorMessage(playerid, "�� �÷��̾�� ���õ� �Ҵ�� ���� ������ ���� �ʽ��ϴ�.");
	        if(PlayerInfo[giveplayerid][pPlatoonType] == 4) PlayerInfo[giveplayerid][pCorps] = 1;
	        if(PlatoonInfo[platoonID][p_tType] == 4) PlayerInfo[giveplayerid][pCorps] = 4;
	        SetPlayerPlatoonLevel(giveplayerid, platoonID, 1);
	        format(string, sizeof(string), "���� %s���� %s���� �Ҵ븦 %s[%d]�� �����Ͽ����ϴ�. [ID : %d]", PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid), PlatoonInfo[platoonID][p_tName], PlatoonInfo[platoonID][p_t_Number], platoonID);
			SendAdminMessage(string);
	    	format(string, sizeof(string), "���� %s�Կ� ���� �Ҵ밡 %s[%d]�� �����Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName], PlatoonInfo[platoonID][p_tName], PlatoonInfo[platoonID][p_t_Number]);
			SendMessage(giveplayerid, string);
	    }
	    return 1;
	}
	if(strcmp(cmd, "/����ȯ", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    new ModelID, color1, color2, Float:x,Float:y,Float:z, VehicleID;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendMessage(playerid, "/����ȯ [����ȣ] [����1] [����2]");
		ModelID = strval(tmp);
		if(ModelID < 400 || ModelID > 611) return SendErrorMessage(playerid, "�� ������ 400 ~ 611������ ��ȯ �� �� �ֽ��ϴ�.");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendMessage(playerid, "/����ȯ ����ȣ [����1] [����2]");
		color1 = strval(tmp);
		if(0 > color1 > 126) return SendMessage(playerid, "���ڵ�� 0~126������ �����մϴ�");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendMessage(playerid, "/����ȯ ����ȣ ����1 [����2]");
		color2 = strval(tmp);
		if(0 > color2 > 126) return SendMessage(playerid, "���ڵ�� 0~126������ �����մϴ�");
		GetPlayerPos(playerid, x,y,z);
		VehicleID = CreateVehicle(ModelID, x,y,z, 0.0, color1, color2, -1);
		SetVehicleHealthEx(VehicleID, 10000.0);
		VehicleInfo[VehicleID][vEngine] = true;
		return 1;
	}
	if(strcmp(cmd, "/����", true) == 0 || strcmp(cmd, "/ȯ�漳��", true) == 0 || strcmp(cmd, "/�ɼ�", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        format(string, sizeof(string), "����� ��ġ : %s",
		SettingON_OFF(PlayerInfo[playerid][pSet_Spec]));
        ShowPlayerDialog(playerid, DIALOG_SETTING, DIALOG_STYLE_LIST, "�ɼ�", string, "Ȯ��", "���");
        return 1;
    }
    if(strcmp(cmd, "/help", true) == 0 || strcmp(cmd, "/����", true) == 0 || strcmp(cmd, "/?", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
		format(string, sizeof(string), ""#C_RED">"#C_WHITE" ��������\n"#C_RED">"#C_WHITE" ��ɾ��\n"#C_RED">"#C_WHITE" �ִԵ���\n"#C_RED">"#C_WHITE" ��������\n"#C_RED">"#C_WHITE" �Ҵ뵵��");
        ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "TWWRP HELP", string, "Ȯ��","���");
        return 1;
    }
    if(strcmp(cmd, "/�̱���ȯ", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
		new Float:pos[3], interior = GetPlayerInterior(playerid), virtualworld = GetPlayerVirtualWorld(playerid); GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
		format(string, sizeof(string), "���� %s�Կ� ���� ��ȯ �Ǿ����ϴ�. [Interior : %d] [VirtualWorld : %d]",PlayerInfo[playerid][pAdminName],interior,virtualworld);
		for(new i = 0; i < MAX_PLAYERS; i ++)
		{
		    if(playerid == i) continue;
		    if(IsPlayerConnected(i) && IsPlayerLogin(i))
		    {
		        if(PlayerInfo[i][pCountry] == 1)
		        {
		            GetPlayerFrontPos(playerid, pos[0], pos[1], pos[2], 1.0);
		            SetPlayerPos(i, pos[0], pos[1], pos[2]);
		            SetPlayerInteriorEx(i, interior);
		            SetPlayerVirtualWorldEx(i, virtualworld);
		            SendMessage(i,string);
		        }
		    }
		}
		format(string, sizeof(string), "���� %s�Կ� ���� ��� �̱� ������ ��ȯ �Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName]);
		SendAdminMessage(string);
	    return 1;
	}
	if(strcmp(cmd, "/���þƼ�ȯ", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
		new Float:pos[3], interior = GetPlayerInterior(playerid), virtualworld = GetPlayerVirtualWorld(playerid); GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
		format(string, sizeof(string), "���� %s�Կ� ���� ��ȯ �Ǿ����ϴ�. [Interior : %d] [VirtualWorld : %d]",PlayerInfo[playerid][pAdminName],interior,virtualworld);
		for(new i = 0; i < MAX_PLAYERS; i ++)
		{
		    if(playerid == i) continue;
		    if(IsPlayerConnected(i) && IsPlayerLogin(i))
		    {
		        if(PlayerInfo[i][pCountry] == 2)
		        {
		            GetPlayerFrontPos(playerid, pos[0], pos[1], pos[2], 1.0);
		            SetPlayerPos(i, pos[0], pos[1], pos[2]);
		            SetPlayerInteriorEx(i, interior);
		            SetPlayerVirtualWorldEx(i, virtualworld);
		            SendMessage(i,string);
		        }
		    }
		}
		format(string, sizeof(string), "���� %s�Կ� ���� ��� ���þ� ������ ��ȯ �Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName]);
		SendAdminMessage(string);
	    return 1;
	}
	if(strcmp(cmd, "/�̱�ü��", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    format(string, sizeof(string), "���� %s�Կ� ���� ü���� 100.0���� ���� �Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName]);
		for(new i = 0; i < MAX_PLAYERS; i ++)
		{
		    if(IsPlayerConnected(i) && IsPlayerLogin(i))
		    {
		        if(PlayerInfo[i][pCountry] == 1)
		        {
		            SetPlayerHealthEx(i, 100.0);
		            SendMessage(i,string);
		        }
		    }
		}
		format(string, sizeof(string), "���� %s�Կ� ���� ��� �̱� ������ ü���� 100.0���� ���� �Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName]);
		SendAdminMessage(string);
	    return 1;
	}
	if(strcmp(cmd, "/���þ�ü��", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    format(string, sizeof(string), "���� %s�Կ� ���� ü���� 100.0���� ���� �Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName]);
		for(new i = 0; i < MAX_PLAYERS; i ++)
		{
		    if(IsPlayerConnected(i) && IsPlayerLogin(i))
		    {
		        if(PlayerInfo[i][pCountry] == 2)
		        {
		            SetPlayerHealthEx(i, 100.0);
		            SendMessage(i,string);
		        }
		    }
		}
		format(string, sizeof(string), "���� %s�Կ� ���� ��� ���þ� ������ ü���� 100.0���� ���� �Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName]);
		SendAdminMessage(string);
	    return 1;
	}
	if(strcmp(cmd, "/���ü��", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    format(string, sizeof(string), "���� %s�Կ� ���� ü���� 100.0���� ���� �Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName]);
		for(new i = 0; i < MAX_PLAYERS; i ++)
		{
		    if(IsPlayerConnected(i) && IsPlayerLogin(i))
		    {
	            SetPlayerHealthEx(i, 100.0);
	            SendMessage(i,string);
		    }
		}
		format(string, sizeof(string), "���� %s�Կ� ���� ��� ������ ü���� 100.0���� ���� �Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName]);
		SendAdminMessage(string);
	    return 1;
	}
	if(strcmp(cmd, "/��ξƸ�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    format(string, sizeof(string), "���� %s�Կ� ���� �ƸӰ� 100.0���� ���� �Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName]);
		for(new i = 0; i < MAX_PLAYERS; i ++)
		{
		    if(IsPlayerConnected(i) && IsPlayerLogin(i))
		    {
	            SetPlayerArmourEx(i, 100.0);
	            SendMessage(i,string);
		    }
		}
		format(string, sizeof(string), "���� %s�Կ� ���� ��� ������ �ƸӰ� 100.0���� ���� �Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName]);
		SendAdminMessage(string);
	    return 1;
	}
	if(strcmp(cmd, "/�̱��Ƹ�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    format(string, sizeof(string), "���� %s�Կ� ���� �ƸӰ� 100.0���� ���� �Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName]);
		for(new i = 0; i < MAX_PLAYERS; i ++)
		{
		    if(IsPlayerConnected(i) && IsPlayerLogin(i))
		    {
		        if(PlayerInfo[i][pCountry] == 1)
		        {
		            SetPlayerArmourEx(i, 100.0);
		            SendMessage(i,string);
				}
		    }
		}
		format(string, sizeof(string), "���� %s�Կ� ���� ��� �̱� ������ �ƸӰ� 100.0���� ���� �Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName]);
		SendAdminMessage(string);
	    return 1;
	}
	if(strcmp(cmd, "/���þƾƸ�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
	    format(string, sizeof(string), "���� %s�Կ� ���� �ƸӰ� 100.0���� ���� �Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName]);
		for(new i = 0; i < MAX_PLAYERS; i ++)
		{
		    if(IsPlayerConnected(i) && IsPlayerLogin(i))
		    {
		        if(PlayerInfo[i][pCountry] == 2)
		        {
		            SetPlayerArmourEx(i, 100.0);
		            SendMessage(i,string);
				}
		    }
		}
		format(string, sizeof(string), "���� %s�Կ� ���� ��� ���þ� ������ �ƸӰ� 100.0���� ���� �Ǿ����ϴ�.",PlayerInfo[playerid][pAdminName]);
		SendAdminMessage(string);
	    return 1;
	}
	if(strcmp(cmd, "/��μ�ȯ", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pAdmin] < 2) return SendErrorMessage(playerid, MessageText[2]);
		new Float:pos[3], interior = GetPlayerInterior(playerid), virtualworld = GetPlayerVirtualWorld(playerid); GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
		for(new i = 0; i < MAX_PLAYERS; i ++)
		{
		    if(playerid == i) continue;
		    if(IsPlayerConnected(i) && IsPlayerLogin(i))
		    {
	            GetPlayerFrontPos(playerid, pos[0], pos[1], pos[2], 1.0);
	            SetPlayerPos(i, pos[0], pos[1], pos[2]);
	            SetPlayerInteriorEx(i, interior);
	            SetPlayerVirtualWorldEx(i, virtualworld);
	            format(string, sizeof(string), "���� %s�Կ� ���� ��ȯ �Ǿ����ϴ�. [Interior : %d] [VirtualWorld : %d]",PlayerInfo[playerid][pAdminName], interior,virtualworld);
	            SendMessage(i,string);
		    }
		}
		format(string, sizeof(string), "���� %s�Կ� ���� ��� ������ ��ȯ �Ǿ����ϴ�.");
		SendAdminMessage(string);
	    return 1;
	}
    if(strcmp(cmd, "/adminhelp", true) == 0 || strcmp(cmd, "/ah", true) == 0 || strcmp(cmd, "/���ε���", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        if(PlayerInfo[playerid][pAdmin] < 0) return SendErrorMessage(playerid, MessageText[2]);
        if(PlayerInfo[playerid][pAdmin] >= 1) SendMessage(playerid, "Admin Help Lv.1) /�亯 /admin /�������� /��� /��ȯ /�� /��𸣰� /��𸣰�Ȯ��",COLOR_ADMIN);
        if(PlayerInfo[playerid][pAdmin] >= 2) SendMessage(playerid, "Admin Help Lv.2) /���� /�������� /ip /ű /�� /���� /������� /�ڷ���Ʈ /������ /���� /��� /������� /�Ѱ˻� /���̵�ű",COLOR_ADMIN);
        if(PlayerInfo[playerid][pAdmin] >= 2) SendMessage(playerid, "Admin Help Lv.2) /ä�ñ��� /��Ų���� /�������� /����������� /�̱���ȯ /���þƼ�ȯ /���ü�� /��ξƸ�",COLOR_ADMIN);
        if(PlayerInfo[playerid][pAdmin] >= 3) SendMessage(playerid, "Admin Help Lv.3) /ü�� /�Ƹ� /����ȯ /���ֱ� /��޼��� /�Ҵ뼳�� /��ǥ�̵� /���� /���׸��� /���߾���� /����Ȯ�� /����ä��",COLOR_ADMIN);
        if(PlayerInfo[playerid][pAdmin] >= 3) SendMessage(playerid, "Admin Help Lv.3) /�Ӹ��˻� /������⸧ /���ɰ��� /���̵�� /������ /������ /����������",COLOR_ADMIN);
        if(PlayerInfo[playerid][pAdmin] >= 4) SendMessage(playerid, "Admin Help Lv.4) /���������� /�������� /�ǹ����� /���� /���� /�Ѽǰ��� /�Ҵ����Ӹ� /ip�� /ip���� /������ /�Ҵ��ȣ /��ǰ���� /�õ�����",COLOR_ADMIN);
        if(PlayerInfo[playerid][pAdmin] >= 5) SendMessage(playerid, "Admin Help Lv.5) /�������� /���� /�����̸� /�����ڷ��� /���̵���",COLOR_ADMIN);
        return 1;
    }
    if(strcmp(cmd, "/�õ�����", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, MessageText[2]);
		if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "������ ž�� �� �ٽ� �õ����ּ���.");
		new ModelID = GetVehicleModel(GetPlayerVehicleID(playerid));
		PlayerInfo[playerid][pVehicleStart_Cre] = 1;
        format(string, sizeof(string), "�Ҵ� : %s\n��� : %s",GetVehicleStartupInfo(ModelID, 1), GetVehicleStartupInfo(ModelID, 2));
        ShowPlayerDialog(playerid, DIALOG_VEHICLE_STARTUP, DIALOG_STYLE_LIST, "�õ�����", string, "Ȯ��", "����");
        return 1;
    }
    if(strcmp(cmd, "/�Ҵ����", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, MessageText[2]);
        PlayerInfo[playerid][pPlatoonCre] = 0;
        ShowPlayerDialog(playerid, DIALOG_PLATOON, DIALOG_STYLE_LIST, "�Ѽ� ����", ""#C_RED"> "#C_WHITE"�Ҵ����\n"#C_RED"> "#C_WHITE"�Ҵ����\n"#C_RED"> "#C_WHITE"�Ҵ����", "Ȯ��","���");
        return 1;
    }
    if(strcmp(cmd, "/����������", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, MessageText[2]);
        PlayerInfo[playerid][pOccupyAreaCre] = 0; PlayerInfo[playerid][pOccupyAreaEditType] = 0;
        format(string, sizeof(string), ""#C_RED"> "#C_WHITE"������ ����\n"#C_RED"> "#C_WHITE"������ ����\n"#C_RED"> "#C_WHITE"������ ����");
        ShowPlayerDialog(playerid, DIALOG_OCCUPY_AREA, DIALOG_STYLE_LIST, "������ ����", string, "Ȯ��","���");
        return 1;
    }
    if(strcmp(cmd, "/��������", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, MessageText[2]);
        PlayerInfo[playerid][pGangzoneNameEdit] = 0;
        if(!PlayerInfo[playerid][pGangzoneCre]) format(string, sizeof(string), ""#C_RED"> "#C_WHITE"��������\n"#C_RED"> "#C_WHITE"��������\n"#C_RED"> "#C_WHITE"��������");
        else if(0 < PlayerInfo[playerid][pGangzoneCre] <= 2) format(string, sizeof(string), ""#C_RED"> "#C_WHITE"Ȯ��\n"#C_RED"> "#C_WHITE"�������� ���");
        ShowPlayerDialog(playerid, DIALOG_GANGZONE, DIALOG_STYLE_LIST, "��������", string, "Ȯ��","���");
        return 1;
    }
    if(strcmp(cmd, "/�ǹ�����", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, MessageText[2]);
        PlayerInfo[playerid][pEnterEdit] = 0; PlayerInfo[playerid][pEnterList] = -1;
        if(PlayerInfo[playerid][pCreEnterID] == -1) format(string, sizeof(string), ""#C_RED"> "#C_WHITE"�ǹ�����\n"#C_RED"> "#C_WHITE"�ǹ�����\n"#C_RED"> "#C_WHITE"�ǹ�����");
        else format(string, sizeof(string), ""#C_RED"> "#C_WHITE"�ǹ� ��������\n"#C_RED"> "#C_WHITE"�ǹ����� ���");
        ShowPlayerDialog(playerid, DIALOG_BUILD, DIALOG_STYLE_LIST, "�ǹ�����", string, "Ȯ��","���");
        return 1;
    }
    if(strcmp(cmd, "/��ǰ����", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, MessageText[2]);
        PlayerInfo[playerid][pProductEdit] = 0;
        format(string, sizeof(string), ""#C_RED"> "#C_WHITE"��ǰ����\n"#C_RED"> "#C_WHITE"��ǰ����\n"#C_RED"> "#C_WHITE"��ǰ����");
        ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_LIST, "��ǰ����", string, "Ȯ��","���");
        return 1;
    }
    if(strcmp(cmd, "/������", true) == 0 || strcmp(cmd, "/����", true) == 0 || strcmp(cmd, "/������", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        My_Information(playerid, playerid);
        OnPlayerCommandText(playerid, "/me �� �ɷ��ִ� �������� Ȯ���Ѵ�.");
        return 1;
    }
    if(strcmp(cmd, "/������", true) == 0)
    {
        if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
        tmp = strtok(cmdtext, idx);
        if(!strlen(tmp)) return SendErrorMessage(playerid, "/������ [�÷��̾��ȣ]");
		new giveplayerid = strval(tmp);
		if(!IsPlayerConnected(giveplayerid) && !IsPlayerLogin(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
	    if(!IsGivePlayerDistance(2.0, playerid, giveplayerid)) return SendErrorMessage(playerid, MessageText[13]);
        My_Information(playerid, giveplayerid);
        format(string, sizeof(string), "/me %s���� �������� �����ݴϴ�.", PlayerNameEx(giveplayerid));
        OnPlayerCommandText(playerid, string);
        return 1;
    }
	if(strcmp(cmd, "/��ǥ�̵�", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
     	if(PlayerInfo[playerid][pAdmin] < 3) return SendErrorMessage(playerid, MessageText[2]);
	    new Float:Pos[3], InteriorID;
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/��ǥ�̵� [PosX] [PosY] [PosZ] [Interior]");
	    Pos[0] = strval(tmp);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/��ǥ�̵� PosX [PosY] [PosZ] [Interior]");
	    Pos[1] = strval(tmp);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/��ǥ�̵� PosX PosY [PosZ] [Interior]");
	    Pos[2] = strval(tmp);
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendErrorMessage(playerid, "/��ǥ�̵� PosX PosY PosZ [Interior]");
	    InteriorID = strval(tmp);
	    SetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	    SetPlayerInteriorEx(playerid, InteriorID);
	    format(string, sizeof(string), "%f,%f,%f�� �̵��Ͽ����ϴ�. InteriorID : %d",Pos[0], Pos[1], Pos[2], InteriorID);
	    SendMessage(playerid, string);
	    return 1;
	}
	if(strcmp(cmd, "/���", true) == 0 || strcmp(cmd, "/��", true) == 0 || strcmp(cmd, "/����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
     	if(PlayerInfo[playerid][pAdmin] < 1) return SendErrorMessage(playerid, MessageText[2]);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendMessage(playerid, "/��� [�÷��̾��ȣ]");
		new giveplayerid = strval(tmp);
		if(!IsPlayerConnected(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		new Float:gx,Float:gy,Float:gz,interior,virtualworld,VehicleID=-1;
		interior = GetPlayerInterior(giveplayerid);
		virtualworld = GetPlayerVirtualWorld(giveplayerid);
		GetPlayerFrontPos(giveplayerid, gx, gy, gz, 1.0);
		format(string, sizeof(string), "%s�Կ��� �ڷ���Ʈ �Ǿ����ϴ�. [INT : %d VirtualWorld : %d]",PlayerNameEx(giveplayerid), interior, virtualworld);
		SendMessage(playerid, string);
        if(IsPlayerInAnyVehicle(playerid))
        {
            VehicleID = GetPlayerVehicleID(playerid);
			SetVehiclePos(VehicleID, gx, gy + 5, gz);
	    }
	    else SetPlayerPosEx(playerid, gx, gy, gz, interior, virtualworld);
		return 1;
	}
	if(strcmp(cmd, "/��ȯ", true) == 0 || strcmp(cmd, "/��", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
     	if(PlayerInfo[playerid][pAdmin] < 1) return SendErrorMessage(playerid, MessageText[2]);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendMessage(playerid, "/��ȯ [�÷��̾��ȣ]");
		new giveplayerid = strval(tmp);
		if(!IsPlayerConnected(giveplayerid)) return SendErrorMessage(playerid, MessageText[5]);
		new Float:x,Float:y,Float:z,interior,virtualworld,VehicleID=-1;
		interior = GetPlayerInterior(playerid);
		virtualworld = GetPlayerVirtualWorld(playerid);
		GetPlayerFrontPos(playerid, x, y, z, 1.0);
		format(string, sizeof(string), "%s�Կ��� �ڷ���Ʈ �Ǿ����ϴ�. [INT : %d VirtualWorld : %d]",PlayerNameEx(playerid), interior, virtualworld);
		SendMessage(giveplayerid, string);
        if(IsPlayerInAnyVehicle(playerid))
        {
            VehicleID = GetPlayerVehicleID(giveplayerid);
			SetVehiclePos(VehicleID, x, y + 5, z);
	    }
	    else return SetPlayerPosEx(giveplayerid, x,y,z,interior,virtualworld);
	}
	//animation
	if(strcmp(cmd, "/�յ��", true) == 0)
	{
    	if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
		ApplyAnimation(playerid,"ROB_BANK","SHP_HandsUp_Scr",4.1,0,1,1,0,1);
		return 1;
	}
	if(strcmp(cmd, "/����", true) == 0)
	{
	    if(!IsPlayerLogin(playerid)) return SendErrorMessage(playerid, MessageText[0]);
	    if(PlayerInfo[playerid][pBattalionRadio] == 1) return SendErrorMessage(playerid, "������ ����߿��� ��� �� �� �����ϴ�.");
	    ApplyAnimation(playerid,"PED","facgum",4.1,0,1,1,1,1);
	    return 1;
	}
	else
	{
		format(string, sizeof(string), "���� ��ɾ� �Դϴ�. [%s]", cmdtext);
		SendClientMessage(playerid, COLOR_ERROR, string);
		return 1;
	}
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(PlayerInfo[playerid][pDie] != 0) return 0;
    if(IsPlayerLogin(playerid))
    {
        if(newkeys == KEY_ANALOG_LEFT)
        {
            if(PlayerInfo[playerid][pTut] != 2) return 0;
            if(PlayerInfo[playerid][pDeMorgan] != 0) return 0;
            if(!IsPlayerInAnyVehicle(playerid))
            {
            	if(PlayerInfo[playerid][pBattalionRadio] == 0)
            	{
            	    PlayerInfo[playerid][pBattalionRadio] = 1;
            	    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
            	    SendMessage(playerid, "��� �����⸦ �ֽ��ϴ�.");
            	    
            	}
            	else if(PlayerInfo[playerid][pBattalionRadio] == 1)
            	{
            	    PlayerInfo[playerid][pBattalionRadio] = 0;
            	    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
            	    SendMessage(playerid, "��� �����⸦ �����Ͽ����ϴ�.");
            	}
			}
        }
        if(newkeys & KEY_YES)
        {
            new string[512];
            strmid(string, ""#C_GRAY"Number\tName"#C_WHITE"", 0, 512, 512);
            if(PlayerInfo[playerid][pDeMorgan] != 0) return 0;
            for(new i = 0; i < MAX_INVENTORY; i ++)
            {
                if(PlayerInfo[playerid][pI_Number][i] > 0)
                {
					format(string, sizeof(string), "%s\n%d\t\t%s",string, PlayerInfo[playerid][pI_Number][i], ItemInfo[PlayerInfo[playerid][pI_ItemID][i]][_ItemName] );
                }
            }
            ShowPlayerDialog(playerid, DIALOG_INVENTORY, DIALOG_STYLE_LIST, "����", string, "Ȯ��", "���");
        }
        if(newkeys & KEY_FIRE)
        {
            new animindex = GetPlayerAnimationIndex(playerid);
			if(animindex == 1167 || animindex == 1365 || animindex == 1161 || animindex == 1162 || animindex == 1163 || animindex == 1160)
			{
	            new weaponid = GetPlayerWeapon(playerid), slot = GetWeaponSlot(weaponid);
	            if(!IsPlayerCloseWeapon(weaponid))
	            {
	                if(PlayerInfo[playerid][pAmmoHackCheck] > 0) KillTimer(PlayerInfo[playerid][pAmmoHackCheck]);
		            GetPlayerWeaponData(playerid, slot, PlayerInfo[playerid][pWeaponID][slot], PlayerInfo[playerid][pAmmo][slot]);
		            PlayerInfo[playerid][pAmmoHackCheck] = SetTimerEx("AmmoHackCheck", 2000, false, "d", playerid);
		        }
			}
        }
        if(oldkeys & KEY_FIRE)
        {
            if(PlayerInfo[playerid][pAmmoHackCheck] > 0){
			KillTimer(PlayerInfo[playerid][pAmmoHackCheck]); PlayerInfo[playerid][pAmmoHackCheck] = -1;}
			if(PlayerInfo[playerid][pC4Emplace] == 1)
		    {
		        if(PlayerInfo[playerid][pC4EmplaceTimer] > 0) KillTimer(PlayerInfo[playerid][pC4EmplaceTimer]);
				PlayerInfo[playerid][pDoingGage] = 0;
		    	HidePlayerProgressBar(playerid, DoingBar[playerid]);
		    	ClearAnimations(playerid);
			}
        }
        if(newkeys == KEY_SECONDARY_ATTACK)
        {
            if(PlayerInfo[playerid][pSmokeStart] == 1)
		    {
		        OnPlayerCommandText(playerid, "/me �ǿ�� ��踦 ���ٴڿ� ������ �Ҿ��� �����ϱ� ���� �߷� ��´�.");
				PlayerInfo[playerid][pSmokeStart] = 0;
				ApplyAnimation(playerid,"PED","DAM_LegR_frmBK",4.1,0,1,1,1,1);
		    }
		    if(PlayerInfo[playerid][pBeerStart] == 1)
		    {
		        PlayerInfo[playerid][pBeerStart] = 0;
		    }
		    else
		    {
		        if(PlayerInfo[playerid][pCountry] == 1)
			    {
			        if(IsPlayerInRangeOfPoint(playerid, 2.0, 202.6366,1887.6580,17.6481))
	            	{
						new string[256];
						new Message0[] = ""#C_GRAY"______________________________�̱� �ӽüҴ� ����______________________________"#C_WHITE"\n\n";
						new Message1[] = "�ӽüҴ�� ���� �Ҵ밡 �������� ���� ���ε��� ��Ƶ� �Ҵ�ν�\n";
						new Message2[] = "�� �Ҵ뿡�� ����RP�� �˾ư���, ������ ��� ���ư������� �ľ��� �� �ֽ��ϴ�.\n";
						format(string, sizeof(string), "%s%s%s",Message0,Message1,Message2);
	            	    ShowPlayerDialog(playerid, DIALOG_TEMP_PLATOON, DIALOG_STYLE_MSGBOX, "�ӽüҴ� ����", string, "����", "���");
	            	}
	            }
	            if(PlayerInfo[playerid][pCountry] == 2)
			    {
			        if(IsPlayerInRangeOfPoint(playerid, 2.0, -1289.2260,440.8935,7.1809))
	            	{
	            	    new string[256];
						new Message0[] = ""#C_GRAY"______________________�̱� �ӽüҴ� ����______________________"#C_WHITE"\n\n";
						new Message1[] = "�ӽüҴ�� ���� �Ҵ밡 �������� ���� ���ε��� ��Ƶ� �Ҵ�ν�\n";
						new Message2[] = "�� �Ҵ뿡�� ����RP�� �˾ư���, ������ ��� ���ư������� �ľ��� �� �ֽ��ϴ�.\n";
						format(string, sizeof(string), "%s%s%s",Message0,Message1,Message2);
	            	    ShowPlayerDialog(playerid, DIALOG_TEMP_PLATOON, DIALOG_STYLE_MSGBOX, "�ӽüҴ� ����", string, "����", "���");
	            	}
	            }
				for(new p_d = 0; p_d < MAX_PRODUCT; p_d ++)
				{
				    if(IsPlayerInRangeOfPoint(playerid, 1.0, ProductInfo[p_d][p_dPos][0], ProductInfo[p_d][p_dPos][1], ProductInfo[p_d][p_dPos][2]))
				    {
				        new string[256], name[52], max_buy;
				        
				        for(new i = 0, l = sizeof(ItemInfo); i < l; i ++)
					    {
					    	if(ItemInfo[i][_ModelID] == ProductInfo[p_d][p_dObjectID])
					    	{
					    	    max_buy = ItemInfo[i][_LimitNum];
					    	    strmid(name, ItemInfo[i][_ItemName], 0, 52, 52);
					    	    PlayerInfo[playerid][pBuyItem][3] = ItemInfo[i][_ItemID];
					    	    break;
					    	}
					    	else if(i == l -1) return SendErrorMessage(playerid, "��ǰ ���� ������ �߻� �Ͽ����ϴ�. �����ڵ� : 1001");
						}
				        format(string, sizeof(string), ""#C_GRAY"- %s ���� - "#C_WHITE"\n�̸� : %s\n���� : %d$\n�ִ� ���� ���� ���� : %d��\n",
						name,name,ProductInfo[p_d][p_dMoney],max_buy);
						PlayerInfo[playerid][pBuyItem][0] = ProductInfo[p_d][p_dObjectID];
						PlayerInfo[playerid][pBuyItem][1] = ProductInfo[p_d][p_dMoney];
						PlayerInfo[playerid][pBuyItem][2] = max_buy;
				        ShowPlayerDialog(playerid, DIALOG_PRODUCT_BUY, DIALOG_STYLE_INPUT, "��ǰ����", string, "����","���");
				        break;
				    }
				}
	            for(new e = 0; e < MAX_ENTER; e ++)
			  	{
			  	    if(EnterInfo[e][eCreate] == 1)
			  	    {
			  	        new virtualworld = GetPlayerVirtualWorld(playerid);
			  	        if(IsPlayerInRangeOfPoint(playerid, 1.0, EnterInfo[e][ePosX], EnterInfo[e][ePosY], EnterInfo[e][ePosZ]))
			  	        {
			  	            if(virtualworld == EnterInfo[e][eVirtualWorld])
			  	            {
				  	            SetPlayerPosEx(playerid, EnterInfo[e][eInPosX], EnterInfo[e][eInPosY], EnterInfo[e][eInPosZ], EnterInfo[e][eInInterior], EnterInfo[e][eInVirtualWorld]);
								if(EnterInfo[e][eType] == 1 || EnterInfo[e][eType] == 2)
								{
									TogglePlayerControllable(playerid, 0);
					  	            Enter(playerid);
					  	        }
					  	        if(EnterInfo[e][eType] == 2)
					  	        {
					  	            if(PlayerInfo[playerid][pSex] == 1) SetPlayerSkin(playerid, 252);
					  	            else if(PlayerInfo[playerid][pSex] == 2) SetPlayerSkin(playerid, 251);
					  	        }
				  	    		return 1;
				  	    	}
			  	        }
			  	        else if(IsPlayerInRangeOfPoint(playerid, 1.0, EnterInfo[e][eInPosX], EnterInfo[e][eInPosY], EnterInfo[e][eInPosZ]))
			  	        {
			  	            if(virtualworld == EnterInfo[e][eInVirtualWorld])
			  	            {
				  	            SetPlayerPosEx(playerid, EnterInfo[e][ePosX], EnterInfo[e][ePosY], EnterInfo[e][ePosZ], EnterInfo[e][eInterior], EnterInfo[e][eVirtualWorld]);
	                            if(EnterInfo[e][eType] == 1 || EnterInfo[e][eType] == 2)
								{
									TogglePlayerControllable(playerid, 0);
									Enter(playerid);
								}
								if(EnterInfo[e][eType] == 2)
					  	        {
					  	            SetPlayerSkinEx(playerid, PlayerInfo[playerid][pClothes]);
					  	        }
				  	    		return 1;
				  	    	}
			  	        }
			  	    }
			  	}
			  	for(new i = 0; i < MAX_MOVE_OBJECT; i ++)
				{
	                if(MoveObjectInfo[i][mCreate] == 1)
	                {
	                    if(IsPlayerInRangeOfPoint(playerid, MoveObjectInfo[i][mDistance], MoveObjectInfo[i][mPosX],MoveObjectInfo[i][mPosY],MoveObjectInfo[i][mPosZ]))
	                    {
	                        if(MoveObjectTimer[i] <= 0)
	                        {
	                        	if(MoveObjectInfo[i][mType] == 0)
	                        	{
	                        	    if(!MoveObjectInfo[i][mState])
	                        	    {
		                        	    MoveDynamicObject(MoveObjectInfo[i][mObjectID], MoveObjectInfo[i][mPosX2],MoveObjectInfo[i][mPosY2],MoveObjectInfo[i][mPosZ2], MoveObjectInfo[i][mSpeed]);
		                        	    MoveObjectTimer[i] = 5;
		                        	    MoveObjectInfo[i][mState] = 1;
		                            }
		                            else if(MoveObjectInfo[i][mState] == 1)
	                        	    {
		                        	    MoveDynamicObject(MoveObjectInfo[i][mObjectID], MoveObjectInfo[i][mPosX],MoveObjectInfo[i][mPosY],MoveObjectInfo[i][mPosZ], MoveObjectInfo[i][mSpeed]);
		                        	    MoveObjectTimer[i] = 5;
		                        	    MoveObjectInfo[i][mState] = 0;
		                            }
	                        	    return 1;
	                        	}
	                        	MoveDynamicObject(MoveObjectInfo[i][mObjectID], MoveObjectInfo[i][mPosX2],MoveObjectInfo[i][mPosY2],MoveObjectInfo[i][mPosZ2], MoveObjectInfo[i][mSpeed]);
	                        	SetTimerEx("MoveOjbctEntry", 3000, false, "dd",playerid, i);
	                        	MoveObjectTimer[i] = 5;
							}
							else
							{
							    new string[128];
							    format(string, sizeof(string), "�ٽ� �õ����ּ���. [%d�� ����]", MoveObjectTimer[i]);
							    SendErrorMessage(playerid, string);
							}
							return 1;
	                    }
	                    else if(IsPlayerInRangeOfPoint(playerid, MoveObjectInfo[i][mDistance], MoveObjectInfo[i][mPosX2],MoveObjectInfo[i][mPosY2],MoveObjectInfo[i][mPosZ2]))
	                    {
	                        if(MoveObjectInfo[i][mType] == 0)
	                        {
	                            if(MoveObjectTimer[i] <= 0)
	                        	{
		                            if(!MoveObjectInfo[i][mState])
		                    	    {
		                        	    MoveDynamicObject(MoveObjectInfo[i][mObjectID], MoveObjectInfo[i][mPosX2],MoveObjectInfo[i][mPosY2],MoveObjectInfo[i][mPosZ2], MoveObjectInfo[i][mSpeed]);
		                        	    MoveObjectTimer[i] = 5;
		                        	    MoveObjectInfo[i][mState] = 1;
		                            }
		                            else if(MoveObjectInfo[i][mState] == 1)
		                            {
			                        	MoveDynamicObject(MoveObjectInfo[i][mObjectID], MoveObjectInfo[i][mPosX],MoveObjectInfo[i][mPosY],MoveObjectInfo[i][mPosZ], MoveObjectInfo[i][mSpeed]);
			                        	MoveObjectTimer[i] = 5;
			                        	MoveObjectInfo[i][mState] = 0;
			                        }
		                        }
	                            else
	                            {
	                                new string[128];
								    format(string, sizeof(string), "�ٽ� �õ����ּ���. [%d�� ����]", MoveObjectTimer[i]);
								    SendErrorMessage(playerid, string);
	                            }
	                        }
	                        return 1;
	                    }
					}
				}
				if(IsPlayerInRangeOfPoint(playerid, 2.0,1214.6433,-251.8133,1021.7993))
				{
				    if(PlayerInfo[playerid][pNPCQwest] == 0)
			        {
			            new string[512];
						new Message0[] = "\t"#C_GRAY"The World War Role Play�� ���� ���� ȯ���մϴ�.\t\t\n\n"#C_WHITE"";
						new Message1[] = "���� ���� �Ʒ��� �Ǿ����� �ʽ��ϴ�.\n";
						new Message2[] = "���� �Ʒ��� �����ð� �����ôٸ� 'Ȯ��'�� �����ּ���.\n\n";
						format(string, sizeof(string), "%s%s%s",Message0,Message1,Message2);
						ShowPlayerDialog(playerid, DIALOG_BASIC_TRAINING, DIALOG_STYLE_MSGBOX, "�����Ʒ�", string, "Ȯ��", "���");
			        }
			        else if(PlayerInfo[playerid][pNPCQwest] == 6)
					{
					    ShowPlayerDialog(playerid, DIALOG_BASIC_TRAINING, DIALOG_STYLE_LIST, "��������", "������\n����\n�ǹ���", "����","");
					}
				}
			    else if(IsPlayerInRangeOfPoint(playerid, 2.0,1213.0793,-246.6340,1021.7993))
			    {
			        if(PlayerInfo[playerid][pNPCQwest] == 2 || PlayerInfo[playerid][pNPCQwest] == 5)
			        {
			            if(PlayerInfo[playerid][pNPCQwest] == 2) PlayerInfo[playerid][pNPCQwest] = 3;
						ShowPlayerDialog(playerid, DIALOG_BASIC_TRAINING, DIALOG_STYLE_LIST, "�����Ʒ� �� 1��", "AK47/M4 ���ݺ�\nMP5 �ǹ���\nMP5 ����", "Ȯ��", "���");
			        }
			    }if(IsPlayerInRangeOfPoint(playerid, 2.0, 296.4462,-38.3054,1001.5156)) //�̱� �����
			    {
			        if(PlayerInfo[playerid][pCountry] == 1)
			        {
			            if(PlayerInfo[playerid][pPlatoon] == 0) return SendErrorMessage(playerid, "�Ҵ밡���� �Ǿ����� �ʽ��ϴ�.");
						new string[128];
						format(string, sizeof(string), ""#C_RED"> "#C_WHITE"����\n"#C_RED"> "#C_WHITE"ȯ��");
			            ShowPlayerDialog(playerid, DIALOG_ARME, DIALOG_STYLE_LIST, "�����", string, "Ȯ��", "���");
			        }
			    }
			    if(IsPlayerInRangeOfPoint(playerid, 2.0, 295.4839,-80.6940,1001.5156)) //���þ� �����
			    {
			        if(PlayerInfo[playerid][pCountry] == 2)
			        {
			            if(PlayerInfo[playerid][pPlatoon] == 0) return SendErrorMessage(playerid, "�Ҵ밡���� �Ǿ����� �ʽ��ϴ�.");
						new string[128];
						format(string, sizeof(string), ""#C_RED"> "#C_WHITE"����\n"#C_RED"> "#C_WHITE"ȯ��");
			            ShowPlayerDialog(playerid, DIALOG_ARME, DIALOG_STYLE_LIST, "�����", string, "Ȯ��", "���");
			        }
			    }
			}
        }
        if(newkeys & KEY_CROUCH)
        {
            if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
            {
                for(new i = 0; i < MAX_MOVE_OBJECT; i ++)
				{
                    if(MoveObjectInfo[i][mCreate] == 1 && MoveObjectInfo[i][mType] == 1)
                    {
                        if(IsPlayerInRangeOfPoint(playerid, 10.0, MoveObjectInfo[i][mPosX],MoveObjectInfo[i][mPosY],MoveObjectInfo[i][mPosZ]))
                        {
                            if(MoveObjectTimer[i] <= 0)
                            {
                            	MoveDynamicObject(MoveObjectInfo[i][mObjectID], MoveObjectInfo[i][mPosX2],MoveObjectInfo[i][mPosY2],MoveObjectInfo[i][mPosZ2], MoveObjectInfo[i][mSpeed]);
                            	SetTimerEx("MoveOjbctEntry", 3000, false, "dd",playerid, i);
                            	MoveObjectTimer[i] = 5;
							}
							else
							{
							    new string[128];
							    format(string, sizeof(string), "�ٽ� �õ����ּ���. [%d�� ����]", MoveObjectTimer[i]);
							    SendErrorMessage(playerid, string);
							}
							return 1;
                        }
                    }
                }
            }
        }
		if(newkeys == KEY_CTRL_BACK)
		{
		    if(!IsPlayerInAnyVehicle(playerid))
		    {
		        new Number = 0;
		        for(new DropItemID = 0; DropItemID < MAX_DROP_ITEM; DropItemID ++)
		        {
		            PlayerInfo[playerid][pTakeItem][Number] = -1;
		            if(DropItemInfo[DropItemID][iCreate] == 1)
		            {
				        if(IsPlayerInRangeOfPoint(playerid, 2.0, DropItemInfo[DropItemID][iPosX], DropItemInfo[DropItemID][iPosY], DropItemInfo[DropItemID][iPosZ]))
				        {
				            PlayerInfo[playerid][pTakeItem][Number] = DropItemID;
				            Number ++;
				            //break;
				        }
					}
				}
				if(Number == 1) // ������ �������� �� �� �� ��
				{
				    new dropid = PlayerInfo[playerid][pTakeItem][Number - 1], index = ItemIDFind(playerid, DropItemInfo[dropid][iItemID]), itemid = DropItemInfo[dropid][iItemID], number;
					if(0 < DropItemInfo[dropid][iItemID] > 46)
					{
					    if(index != -1)
					    {
					        if(ItemInfo[itemid][_LimitNum] <= PlayerInfo[playerid][pI_Number][index]) return 0;
					        if(ItemInfo[itemid][_LimitNum] < (PlayerInfo[playerid][pI_Number][index] + DropItemInfo[dropid][iNumber]))
					            number = ItemInfo[itemid][_LimitNum] - PlayerInfo[playerid][pI_Number][index];
					        else number = DropItemInfo[dropid][iNumber];
					    }
					    else
					    {
						    if(ItemInfo[itemid][_LimitNum] < DropItemInfo[dropid][iNumber])
						    	number = ItemInfo[itemid][_LimitNum];
						    else number = DropItemInfo[dropid][iNumber];
					    }
				    }
				    else number = DropItemInfo[dropid][iNumber];
				    new string[128];
				    format(string, sizeof(string), "/me %s�� �ݴ´�. [%d��]", DropItemInfo[dropid][iName], number);
				    OnPlayerCommandText(playerid, string);
				    GivePlayerItemEx(playerid, itemid, number);
	                DeleteDropItem(dropid, number);
				}
				else if(Number > 1) // ������ �������� �� �� �̻��� ��
				{
				    new string[256];
					format(string, sizeof(string), ""#"{E0D674}""��� ȸ���ϱ�\n\n"#C_GRAY"Number\tItem Name");
					for(new DropItemID = 0; DropItemID < MAX_DROP_ITEM; DropItemID ++)
					{
					    if(PlayerInfo[playerid][pTakeItem][DropItemID] == -1) break;
					    if(DropItemInfo[DropItemID][iItemID] <= 0 || DropItemInfo[DropItemID][iNumber] <= 0) continue;
					    format(string, sizeof(string), "%s\n%d\t\t%s", string, DropItemInfo[DropItemID][iNumber], DropItemInfo[DropItemID][iName]);
					}
				    ShowPlayerDialog(playerid, DIALOG_TAKE_WEAPON, DIALOG_STYLE_LIST, "����ȸ��", string, "Ȯ��", "���");
				}
			}
		}
		if(newkeys == KEY_HANDBRAKE)
		{
		    if(!IsPlayerInAnyVehicle(playerid))
	    	{
		    	if(PlayerInfo[playerid][pC4Emplace] == 1)
			    {
			        C4EmplaceMode(playerid, false);
			        PlayerInfo[playerid][pDoingGage] = 0;
					HidePlayerProgressBar(playerid, DoingBar[playerid]);
					ClearAnimations(playerid);
			    }
			}
		}
		if(newkeys == KEY_FIRE)
		{
		    if(!IsPlayerInAnyVehicle(playerid))
	    	{
				if(PlayerInfo[playerid][pOccupy_ING] == 1) return 0;
				if(PlayerInfo[playerid][pSmokeStart] == 1) return 0;
				if(PlayerInfo[playerid][pBeerStart] == 1) return 0;
			    if(PlayerInfo[playerid][pC4Emplace] == 1)
			    {
			        new index = -1;
			        for(new o = 0; o < MAX_BOMB; o ++)
					{
					    if(PlayerInfo[playerid][pC4Object][o] == -1)
					    {
					        index = o;
							break;
						}
						else if(o == MAX_BOMB-1) index = -1;
					}
					if(index > -1)
					{
				        for(new i = 0; i < MAX_INVENTORY; i ++)
						{
				            if(PlayerInfo[playerid][pI_ItemID][i] == 50 && PlayerInfo[playerid][pI_Number][i] > 0)
				            {
						        new animindex = GetPlayerAnimationIndex(playerid);
						        if(animindex == 1189 || animindex == 1136 || animindex == 1275)
						        {
						            if(PlayerInfo[playerid][pC4EmplaceTimer] > 0) KillTimer(PlayerInfo[playerid][pC4EmplaceTimer]);
						            ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.0, 1, 0, 0, 0, 0);
						            PlayerInfo[playerid][pDoingGage] = 0;
						            SetPlayerProgressBarMaxValue(playerid, DoingBar[playerid], 50.0);
		                            ShowPlayerProgressBar(playerid, DoingBar[playerid]);
									SetPlayerProgressBarValue(playerid, DoingBar[playerid], PlayerInfo[playerid][pDoingGage]);
									PlayerInfo[playerid][pC4EmplaceTimer] = SetTimerEx("C4Emplace", 100, true, "d", playerid);
						        }
						        break;
							}
							else if(i == MAX_INVENTORY -1) index = -1;
						}
					}
					if(index == -1)
					{
					    if(PlayerInfo[playerid][pC4EmplaceTimer] > 0) KillTimer(PlayerInfo[playerid][pC4EmplaceTimer]);
						C4EmplaceMode(playerid, false);
						PlayerInfo[playerid][pDoingGage] = 0;
						HidePlayerProgressBar(playerid, DoingBar[playerid]);
						ClearAnimations(playerid);
					}
			    }
			}
		}
		if(newkeys & KEY_SPRINT)
		{
		    if(!IsPlayerInAnyVehicle(playerid))
		    {
		        if(PlayerInfo[playerid][pFirstaid] == 1)
		        {
		            if(IsPlayerLogin(PlayerInfo[playerid][pgFirstaid]) && PlayerInfo[PlayerInfo[playerid][pgFirstaid]][pDie] == 2)
		            {
			            PlayerInfo[playerid][pDoingGage] ++;
			            SetPlayerProgressBarValue(playerid, DoingBar[playerid], PlayerInfo[playerid][pDoingGage]);
			            if(PlayerInfo[playerid][pDoingGage] >= 100)
			            {
			                new string[128];
			                PlayerInfo[playerid][pDoingGage] = 0;
			                PlayerInfo[playerid][pFirstaid] = 0;
			                PlayerInfo[PlayerInfo[playerid][pgFirstaid]][pDie] = 0;
			                SetPlayerHealthEx(PlayerInfo[playerid][pgFirstaid], 30.0);
			                HidePlayerProgressBar(playerid, DoingBar[playerid]);
			                OnPlayerCommandText(PlayerInfo[playerid][pgFirstaid], "/����");
			                OnPlayerCommandText(PlayerInfo[playerid][pgFirstaid], "/me ����óġ�� �ް� �Ͼ��.");
			                format(string, sizeof(string), "%s�Կ� ���� ���� ���¿��� Ǯ�������ϴ�.",PlayerNameEx(playerid));
			                SendMessage(PlayerInfo[playerid][pgFirstaid], string);
			            }
					}
					else
					{
					    SendMessage(playerid, "������ ������ �����ų�, ���� ���°� �ƴմϴ�.");
					}
		        }
		        if(!PlayerInfo[playerid][pDoing])
		        {
			        for(new o = 0; o < MAX_OCCUPY_AREA; o ++)
			        {
			        	if(Occupy_AreaInfo[o][oCreate] == 1)
			        	{
			        	    if(IsPlayerInRangeOfPoint(playerid, 3.0, Occupy_AreaInfo[o][oPosX], Occupy_AreaInfo[o][oPosY], Occupy_AreaInfo[o][oPosZ]))
			        	    {
				        	    if(Occupy_AreaInfo[o][oCountry] != PlayerInfo[playerid][pCountry])
				        	    {
				        	        if(Occupy_AreaInfo[o][oOccupy] == 1)
				        	    	{
					        	        new g = GetAreaNumber(o);
					        	        if(g == -1) return SendErrorMessage(playerid, "�� ������ �ֺ��� ������ ���� �������� �� �մϴ�.");
					        	        SetPlayerProgressBarMaxValue(playerid, DoingBar[playerid], 200.0);
					        	        PlayerInfo[playerid][pDoingGage] = 0;
					        	        PlayerInfo[playerid][pOccupyTimer] = SetTimerEx("Occupy_ING", 100, true, "dd", playerid, o);
					        	        PlayerInfo[playerid][pOccupy_ING] = 1;
					        	        PlayerInfo[playerid][pOccupy_Area] = o;
					        	        PlayerInfo[playerid][pOccupy_Gangzone] = g;
					        	        PlayerInfo[playerid][pDoing] = 1;
					        	        GangzoneInfo[g][gFlash] = 1;
					        	        ShowPlayerProgressBar(playerid, DoingBar[playerid]);
										SetPlayerProgressBarValue(playerid, DoingBar[playerid], PlayerInfo[playerid][pDoingGage]);
										TextDrawShowForPlayer(playerid, DoingTD[playerid]);
					        	        GangZoneFlashForAllEx(playerid, o, g);
					        	        break;
									}
									else return SendErrorMessage(playerid, "������ ���ܵ� �����Դϴ�.");
				        	    }
							}
						}
					}
				}
		    }
		}
		if(oldkeys & KEY_SPRINT)
		{
		    if(PlayerInfo[playerid][pOccupy_ING] == 1)
		    {
			    KillTimer(PlayerInfo[playerid][pOccupyTimer]);
			    PlayerInfo[playerid][pOccupyTimer] = -1;
				GangZoneStopFlashForAll(GangzoneInfo[PlayerInfo[playerid][pOccupy_Gangzone]][gGangzone]);
				TextDrawHideForPlayer(playerid, DoingTD[playerid]);
			    HidePlayerProgressBar(playerid, DoingBar[playerid]);
			    PlayerInfo[playerid][pOccupy_ING] = 0;
			    GangzoneInfo[PlayerInfo[playerid][pOccupy_Gangzone]][gFlash] = 0;
			    PlayerInfo[playerid][pDoingGage] = 0;
			    PlayerInfo[playerid][pDoing] = 0;
			    PlayerInfo[playerid][pOccupy_Gangzone] = 0;
			}
		}
    }
    return 1;
}
public OnVehicleSpawn(vehicleid)
{
	SetVehicleHealthEx(vehicleid, VehicleInfo[vehicleid][vHealth]);
	return 1;
}
public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	new Float:health;
    GetVehicleHealth(vehicleid, health);

	SetVehicleHealthEx(vehicleid, health);
	if(health < 300.0)
	{
	    SetVehicleHealthEx(vehicleid, 300.0);
	    
	    new vehlcieid = GetPlayerVehicleID(playerid);
	    VehicleAct(vehlcieid, "������ �Ŀ� �Ǿ�, �õ��� �ڵ������� ����Ǿ���.");
	}
	return 1;
}
public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid)
{
    return 1;
}
public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid)
{
    if(IsPlayerLogin(playerid))
	{
	    if(PlayerInfo[playerid][pTut] != 2) return 1;
        //amount = 1;
	    new Float:health, Float:armour, Float:restvalue = 0;
	    GetPlayerHealth(playerid, health);
	    GetPlayerArmour(playerid, armour);
	    switch(weaponid)
		{
			//case 30 : amount = 10;
		}
	    if(armour > 0.0)
	    {
	        GivePlayerArmourEx(playerid, -amount);
	        if(PlayerInfo[playerid][pArmour] < 0)
	        {
				restvalue = PlayerInfo[playerid][pArmour];
	            SetPlayerArmourEx(playerid, 0);
	            if(restvalue < 0.0)
		        {
		            GivePlayerHealthEx(playerid, restvalue);
		        }
	        }
	    }
	    else
	    {
            GivePlayerHealthEx(playerid, -amount);
		}
		return 1;
		//SetPlayerShowInfo(playerid);
	}
	return 1;
}
public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
	    if(IsPlayerLogin(clickedplayerid))
	    {
	    	PlayerInfo[playerid][pgClickID] = clickedplayerid;
	    	strmid(PlayerInfo[playerid][pgClickName], PlayerNameEx(clickedplayerid), 0, MAX_PLAYER_NAME+1, MAX_PLAYER_NAME+1);
	    	ShowPlayerDialog(playerid, DIALOG_PLAYERCLICK, DIALOG_STYLE_LIST, PlayerNameEx(clickedplayerid), "���\n��ȯ\n��������", "Ȯ��", "���");
		}
	}
	return 1;
}
public Occupy_ING(playerid, OccupyID)
{
    if(IsPlayerLogin(playerid) && PlayerInfo[playerid][pDoing] == 1)
    {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, Occupy_AreaInfo[OccupyID][oPosX], Occupy_AreaInfo[OccupyID][oPosY], Occupy_AreaInfo[OccupyID][oPosZ]) && Occupy_AreaInfo[OccupyID][oOccupy] == 1)
		{
	        if(PlayerInfo[playerid][pDoingGage] < 200)
	        {
	            PlayerInfo[playerid][pDoingGage] ++;
				SetPlayerProgressBarValue(playerid, DoingBar[playerid], PlayerInfo[playerid][pDoingGage]);
				return 1;
			}
			else
			{
			    new Year, Month, Day, Hour, Minute, Second, string[256];
			    getdate(Year, Month, Day); gettime(Hour, Minute, Second);
			    format(string, sizeof(string), "%s������ %s�������� �����Ͽ����ϴ�. [%d��-%d��-%d�� %d��%d��]",
				CountryNameEx(PlayerInfo[playerid][pCountry]),
				Occupy_AreaInfo[OccupyID][oName],
				Year, Month, Day, Hour, Minute);
			    SendICNoticeMessage(string);
			    SetAreaColorEx(PlayerInfo[playerid][pOccupy_Gangzone], PlayerInfo[playerid][pCountry]);

			    KillTimer(PlayerInfo[playerid][pOccupyTimer]);
				PlayerInfo[playerid][pOccupyTimer] = -1;
				GangZoneStopFlashForAll(GangzoneInfo[PlayerInfo[playerid][pOccupy_Gangzone]][gGangzone]);
				TextDrawHideForPlayer(playerid, DoingTD[playerid]);
			    HidePlayerProgressBar(playerid, DoingBar[playerid]);
			    PlayerInfo[playerid][pOccupy_ING] = 0;
			    PlayerInfo[playerid][pDoingGage] = 0;
			    PlayerInfo[playerid][pDoing] = 0;
			    GangzoneInfo[PlayerInfo[playerid][pOccupy_Gangzone]][gFlash] = 0;
			    PlayerInfo[playerid][pOccupy_Gangzone] = 0;
			    return 1;
			}
		}
	}
	KillTimer(PlayerInfo[playerid][pOccupyTimer]);
	PlayerInfo[playerid][pOccupyTimer] = -1;
	GangZoneStopFlashForAll(GangzoneInfo[PlayerInfo[playerid][pOccupy_Gangzone]][gGangzone]);
	TextDrawHideForPlayer(playerid, DoingTD[playerid]);
    HidePlayerProgressBar(playerid, DoingBar[playerid]);
    PlayerInfo[playerid][pOccupy_ING] = 0;
    PlayerInfo[playerid][pDoingGage] = 0;
    PlayerInfo[playerid][pDoing] = 0;
    GangzoneInfo[PlayerInfo[playerid][pOccupy_Gangzone]][gFlash] = 0;
    PlayerInfo[playerid][pOccupy_Gangzone] = 0;
	return 1;
}
public OnPlayerUpdate(playerid)
{
	if(IsPlayerLogin(playerid))
	{
 		/*new string2[32];
	    format(string2, sizeof(string2), "AnimIndex - %d", GetPlayerAnimationIndex(playerid));
	    SendMessage(playerid, string2);
	    */
		if(PlayerInfo[playerid][pPlatoon])
		{
		    if(PlayerInfo[playerid][pPlatoonType] != PlatoonInfo[PlayerInfo[playerid][pPlatoon]][p_tType])
		    	PlayerInfo[playerid][pPlatoonType] = PlatoonInfo[PlayerInfo[playerid][pPlatoon]][p_tType];
	    }
	    if(PlayerInfo[playerid][pInfoTage] == 1)
	    {
		    if(PlayerInfo[playerid][pOldClass] != PlayerInfo[playerid][pClass] || PlayerInfo[playerid][pOldCorps] != PlayerInfo[playerid][pCorps] || PlayerInfo[playerid][pOldPlatoon] != PlayerInfo[playerid][pPlatoon] || strcmp(PlatoonInfo[PlayerInfo[playerid][pPlatoon]][p_tName], PlayerInfo[playerid][pOldPlatoonName], true) == -1)
			{
			    PlayerInfoTag(playerid, true);
			}
		}
		if(PlayerInfo[playerid][pAdminWork] == 1)
		{
		    new Float:health; GetPlayerHealth(playerid, health);
		    if(health <= 90)
		    {
		        SetPlayerHealth(playerid, 100);
		    }
		}
	    if(PlayerInfo[playerid][pNPCQwest] == 4)
	    {
		    if(IsPlayerInRangeOfPoint(playerid, 2.0,QwestInfo[playerid][qPosX],QwestInfo[playerid][qPosY],QwestInfo[playerid][qPosZ]))
		    {
		        new string[32];
		        PlayerInfo[playerid][pClockMode] = 1; PlayerInfo[playerid][pClockMinute] = 0; PlayerInfo[playerid][pClockSecond] = 30; PlayerInfo[playerid][pNPCQwest] = 5; PlayerInfo[playerid][pNPCQwestTimer] = 30;
		        TextDrawShowForPlayer(playerid, TimerTD[playerid][0]); TextDrawShowForPlayer(playerid, TimerTD[playerid][1]); TextDrawShowForPlayer(playerid, TimerTD[playerid][2]);
			    format(string, sizeof(string), "0%d:%d",PlayerInfo[playerid][pClockMinute],PlayerInfo[playerid][pClockSecond]); TextDrawSetString(TimerTD[playerid][2], string);
		        RemovePlayerMapIcon(playerid, 1);
		        SendMessage(playerid, "����� ������ ����� 30�ʰ� ������ �� �ֽ��ϴ�.");
		    }
		}
	}
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_REGISTER)
	{
	    new string[256], playerip[32];
	    GetPlayerIp(playerid, playerip, sizeof(playerip));
		if(response)
		{
			if(4 <= strlen(inputtext) < 10)
			{
			    new password[128];
			    SHA512(inputtext, password, 128);
				strmid(PlayerInfo[playerid][pPassword], password, 0, 128, 128);
				orm_save(PlayerInfo[playerid][ORM_ID], "OnPlayerLogin", "d", playerid);
			}
			else
			{
			    format(string,sizeof(string), ""#C_GRAY"\tThe World War Role Play Game\n\n"#C_WHITE"����� �����ͺ��̽��� �߰ߵ��� �ʾҽ��ϴ�.\n���Ͻô� ��й�ȣ�� �Է��ϰ� 'ȸ������'�� Ŭ�����ּ���.\n\n"#C_SOFTRED"������ IP : %s",playerip);
		    	ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD,"ȸ������",string,"ȸ������","");
			    SendErrorMessage(playerid, "��й�ȣ�� 4���� �̻�, 10���� �̸��̾�� �մϴ�.");
			}
		}
		else
		{
		    format(string,sizeof(string), ""#C_GRAY"\tThe World War Role Play Game\n\n"#C_WHITE"����� �����ͺ��̽��� �߰ߵ��� �ʾҽ��ϴ�.\n���Ͻô� ��й�ȣ�� �Է��ϰ� 'ȸ������'�� Ŭ�����ּ���.\n\n"#C_SOFTRED"������ IP : %s",playerip);
		    ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD,"ȸ������",string,"ȸ������","");
		    SendErrorMessage(playerid, "�ٽ� �Է��ϼ���.");
		}
	    return 1;
	}
	if(dialogid == DIALOG_LOGIN)
	{
	    new string[256], playerip[32];
	    GetPlayerIp(playerid, playerip, sizeof(playerip));
		if(response)
		{
		    if(!strlen(inputtext))
		    {
		        format(string,sizeof(string), ""#C_GRAY"\tThe World War Role Play Game\n\n"#C_WHITE"����� �����ͺ��̽��� �߰� �Ǿ����ϴ�.\n��й�ȣ�� �Է��ϰ� '�α���'�� Ŭ�����ּ���.\n\n"#C_SOFTRED"������ IP : %s",playerip);
			    ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,"�α���",string,"�α���","");
			    SendErrorMessage(playerid, "�ٽ� �Է��ϼ���.");
			    return 1;
		    }
		    new query[256],
				password[128];
		    SHA512(inputtext, password, 128);
			strmid(password, password, 0, 128, 128); // ��Ȯ�� 128-bit�� ����
			mysql_format(MySQL, query, sizeof(query),"SELECT * FROM `user` WHERE `pName` = '%s' AND `pPassword` = '%s' LIMIT 1",PlayerNameEx(playerid), password);
			new Cache:result = mysql_query(MySQL, query, true);
			new MySQLDataBaseRow = cache_num_rows(MySQL);
			if(MySQLDataBaseRow > 0)
			{
			    orm_save(PlayerInfo[playerid][ORM_ID], "OnPlayerLogin", "d", playerid);
			}
			else
			{
			    format(string,sizeof(string), ""#C_GRAY"\tThe World War Role Play Game\n\n"#C_WHITE"����� �����ͺ��̽��� �߰� �Ǿ����ϴ�.\n��й�ȣ�� �Է��ϰ� '�α���'�� Ŭ�����ּ���.\n\n"#C_SOFTRED"������ IP : %s",playerip);
		    	ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,"�α���",string,"�α���","");
			    SendErrorMessage(playerid, "��й�ȣ�� ���� �ʽ��ϴ�.");
			}
			cache_delete(result);
		}
		else
		{
		    format(string,sizeof(string), ""#C_GRAY"\tThe World War Role Play Game\n\n"#C_WHITE"����� �����ͺ��̽��� �߰� �Ǿ����ϴ�.\n��й�ȣ�� �Է��ϰ� '�α���'�� Ŭ�����ּ���.\n\n"#C_SOFTRED"������ IP : %s",playerip);
		    ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,"�α���",string,"�α���","");
		    SendErrorMessage(playerid, "�ٽ� �Է��ϼ���.");
		}
	    return 1;
	}
	if(dialogid == DIALOG_HELP)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
	            new string[256];
	            format(string, sizeof(string), ""#C_WHITE"\n\n%s - INFO\n\n��ǥ : %s\n������Ŀ : %s\n������Ʈ����Ŀ : %s\nī�� : %s\nVersion %s\n\n",SERVER_NAME,MANAGER,MODEMAKER,OBJECTMAKER,FORUM,SCRIPT_VERSION);
				ShowPlayerDialog(playerid, DIALOG_SERVER_INFO, DIALOG_STYLE_MSGBOX, "TWWRP INFO", string, "Ȯ��", "����");
			}
	        if(listitem == 1)
	        {
	            SendMessage(playerid, "_______________________________________________________________________________________________________________________");
	            SendMessage(playerid, "�⺻ ��ɾ� - /������ /������ /���� /���� /���� /������ /ȯ�漳�� /ź�� /�ϻ������ /�屳���� /��� /��αݾ� /ź��");
	            SendMessage(playerid, "�⺻ ��ɾ� - /���� /�������");
	            SendMessage(playerid, "ä�� ��ɾ� - /s /c /me /st /so /Ȯ����");
	            SendMessage(playerid, "���� ��ɾ� - /���� /Ȯ�λ�� /�ѹ����� /����� /��ź��ġ /���� /��������Ȳ /�������� /����");
	        }
	        if(listitem == 2)
	        {
	            SendMessage(playerid, "____________________________");
	            SendMessage(playerid, "/�ɱ� /�漺");
	        }
	        if(listitem == 3) //��������
	        {
	            if(PlayerInfo[playerid][pCorps] == 0) return SendErrorMessage(playerid, "����� ���� ������ �����ϴ�.");
				else if(PlayerInfo[playerid][pCorps] == 1)
				{
				    SendMessage(playerid, "_______________________________________");
					SendMessage(playerid, "������ : /������ /��ź�� /�ڰ���ź��");
				}
				else if(PlayerInfo[playerid][pCorps] == 2)
				{
				    SendMessage(playerid, "_________________________________________________");
				    SendMessage(playerid, "���� : /�ٸ�[1-3] /������ũ /�⸧���� /��������");
				}
				else if(PlayerInfo[playerid][pCorps] == 3)
				{
				    SendMessage(playerid, "___________________________");
				    SendMessage(playerid, "�ǹ��� : /���� /ġ�� /����");
				}
				else if(PlayerInfo[playerid][pCorps] == 4)
				{
				    SendMessage(playerid, "___________________________________________________________________");
				}
	        }
	        if(listitem == 4) //�Ҵ뵵��
	        {
	            SendMessage(playerid, "______________________________________________________");
	            if(IsPlayerPlatoonLeader(playerid))
					SendMessage(playerid, "�Ҵ��� ��ɾ� : /�Ҵ��ʴ� /�Ҵ��߹� /�Ҵ��� /��ں�");
	            SendMessage(playerid, "�Ҵ� ��ɾ� : /�Ҵ���� /bd /�Ҵ�Ż��");
	        }
	    }
	    else
	    {
	    }
	    return 1;
	}
	if(dialogid == DIALOG_TELEPORT)
	{
	    if(response)
	    {
			if(PlayerInfo[playerid][pTeleport] == -1)
			{
		        if(listitem == 0)
		        {
		            PlayerInfo[playerid][pTeleport] = 1;
		            ShowPlayerDialog(playerid, DIALOG_TELEPORT, DIALOG_STYLE_LIST, "�����̵�", "�̱�\n���þ�", "�̵�", "����");
		        }
		        if(listitem == 1)
		        {
		            PlayerInfo[playerid][pTeleport] = 2;
		            new Number = 0, string[512];
					strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
					for(new o = 0; o < MAX_OCCUPY_AREA; o ++)
					{
						PlayerInfo[playerid][pTeleportOccupy][Number] = -1; if(Occupy_AreaInfo[o][oCreate] != 1) continue;
						format(string, sizeof(string), "%s\n%d\t%s",string,Occupy_AreaInfo[o][oNumber], Occupy_AreaInfo[o][oName]);
						PlayerInfo[playerid][pTeleportOccupy][Number] = o;
						Number++;
					}
					ShowPlayerDialog(playerid, DIALOG_TELEPORT, DIALOG_STYLE_LIST, "������ �̵�", string, "�̵�", "����");
		        }
			}
			else
			{
			    if(PlayerInfo[playerid][pTeleport] == 1)
			 	{
			 	    if(listitem == 0)
				    {
				        SetPlayerPosEx(playerid, 202.3986,1888.7009,17.6481, 0, 0);
			            SetPlayerFacingAngle(playerid, 0.0);
			            SendMessage(playerid, "�̱����� �̵��Ͽ����ϴ�.");
				    }
				    if(listitem == 1)
				    {
        				SetPlayerPosEx(playerid, -1289.2861,443.1602,7.1809, 0, 0);
			            SetPlayerFacingAngle(playerid, 0.0);
			            SendMessage(playerid, "���þƷ� �̵��Ͽ����ϴ�.");
				    }
				    return 1;
				}
				else if(PlayerInfo[playerid][pTeleport] == 2)
			 	{
			 	    if(listitem == 0)
			 	    {
			 	        PlayerInfo[playerid][pTeleport] = 2;
			            new Number = 0, string[512];
						strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
						for(new o = 0; o < MAX_OCCUPY_AREA; o ++)
						{
							PlayerInfo[playerid][pTeleportOccupy][Number] = -1; if(Occupy_AreaInfo[o][oCreate] != 1) continue;
							format(string, sizeof(string), "%s\n%d\t%s",string,Occupy_AreaInfo[o][oNumber], Occupy_AreaInfo[o][oName]);
							PlayerInfo[playerid][pTeleportOccupy][Number] = o;
							Number++;
						}
						ShowPlayerDialog(playerid, DIALOG_TELEPORT, DIALOG_STYLE_LIST, "������ �̵�", string, "�̵�", "����");
			 	    }
			 	    else
			 	    {
	                    new OccupyID = PlayerInfo[playerid][pTeleportOccupy][listitem - 1], string[128];
	                    SetPlayerPosEx(playerid, Occupy_AreaInfo[OccupyID][oPosX], Occupy_AreaInfo[OccupyID][oPosY], Occupy_AreaInfo[OccupyID][oPosZ] + 0.5, 0, 0);
	                    SetPlayerFacingAngle(playerid, 0.0);
	                    format(string, sizeof(string), "������ %s�� �̵��Ͽ����ϴ�.",Occupy_AreaInfo[OccupyID][oName]);
	                    SendMessage(playerid, string);
	                }
			 	    return 1;
			 	}
			}
	    }
	    else
	    {
	        if(PlayerInfo[playerid][pTeleport] == 1)
                OnPlayerCommandText(playerid, "/�ڷ���Ʈ");
	        else if(PlayerInfo[playerid][pTeleport] == 2)
                OnPlayerCommandText(playerid, "/�ڷ���Ʈ");
	    }
	    return 1;
	}
	if(dialogid == DIALOG_SERVER_INFO)
	{
	    if(!response)
	    {
		    OnPlayerCommandText(playerid, "/?");
		}
		return 1;
	}
	if(dialogid == DIALOG_SEX)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
	            ClearChat(playerid, 20);
	            PlayerInfo[playerid][pSex] = 1;
	            SendMessage(playerid, "����� ������ �����Դϴ�, ����� ���̸� �����ּ���.");
	        }
	        if(listitem == 1)
	        {
	            ClearChat(playerid, 20);
	            PlayerInfo[playerid][pSex] = 2;
	            SendMessage(playerid, "����� ������ �����Դϴ�, ����� ���̸� �����ּ���.");
	        }
			new string[256]; strmid(string, "���̴� 19������ 60������ ���Ͻ� �� �ֽ��ϴ�."#C_WHITE"", 0, 256, 256);
			for(new i = 19; i <= 60; i ++)
			{
				format(string, sizeof(string), "%s\n%d��",string, i);
			}
	        ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_LIST, "����", string, "Ȯ��", "����");
	    }
	    else
	    {
	        ClearChat(playerid, 20);
	        ShowPlayerDialog(playerid, DIALOG_SEX, DIALOG_STYLE_LIST, "����", "����\n����", "Ȯ��","");
			SendMessage(playerid, "����� ������ �����ּ���.");
	    }
	    return 1;
	}
	if(dialogid == DIALOG_AGE)
	{
		if(response)
		{
			if(listitem == 0)
			{
			    new string[256]; strmid(string, "���̴� 19������ 60������ ���Ͻ� �� �ֽ��ϴ�."#C_WHITE"", 0, 256, 256);
				for(new i = 19; i <= 60; i ++)
				{
					format(string, sizeof(string), "%s\n%d��",string, i);
				}
		        ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_LIST, "����", string, "Ȯ��", "����");
			    return 1;
			}
		    ClearChat(playerid, 20);
			new string[128], PlayerAge = (listitem + 18);
			PlayerInfo[playerid][pAge] = PlayerAge;
			format(string, sizeof(string), "����� ���̴� %d�� �Դϴ�, ����� ������ �����ּ���.", PlayerAge);
			SendMessage(playerid, string);
			ShowPlayerDialog(playerid, DIALOG_COUNTRY, DIALOG_STYLE_LIST, "����", "�̱�\n���þ�", "Ȯ��", "����");
		}
		else
		{
		    ClearChat(playerid, 20);
	        ShowPlayerDialog(playerid, DIALOG_SEX, DIALOG_STYLE_LIST, "����", "����\n����", "Ȯ��","");
			SendMessage(playerid, "����� ������ �����ּ���.");
		}
		return 1;
	}
	if(dialogid == DIALOG_COUNTRY)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
	            ClearChat(playerid, 20);
	            PlayerInfo[playerid][pCountry] = 1;
	            SendMessage(playerid, "����� ������ �̱��Դϴ�.");
	        }
	        if(listitem == 1)
	        {
	            ClearChat(playerid, 20);
	            PlayerInfo[playerid][pCountry] = 2;
	            SendMessage(playerid, "����� ������ ���þ��Դϴ�.");
	        }
	        SetTimerEx("FadeOut", FADE_DELAY, false, "dd",playerid,0);
	        SetTimerEx("Tutorial", 3000, false, "d", playerid);
	        PlayerInfo[playerid][pTut] = 1;
	    }
	    else
	    {
	        ClearChat(playerid, 20);
	        SendMessage(playerid, "����� ���̸� �����ּ���.");
	        new string[128]; strmid(string, ""#C_TUTCOLOR"���̴� 19������ 60������ ���Ͻ� �� �ֽ��ϴ�."#C_WHITE"", 0, 256, 256);
			for(new i = 19; i <= 60; i ++)
			{
				format(string, sizeof(string), "%s\n%d��",string, i);
			}
	        ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_LIST, "����", string, "Ȯ��", "����");
	    }
	    return 1;
	}
	if(dialogid == DIALOG_BASIC_TRAINING)
	{
	    if(response)
	    {
			if(PlayerInfo[playerid][pNPCQwest] == 0)
			{
			    new string[256];
			    format(string, sizeof(string), "\t\t\t"#C_GRAY"The World War Role Play - �����Ʒ� �� 1��\t\t\n\n"#C_WHITE"����� ���ϴ� ������ ���� �� �̸� ���� �׽�Ʈ�� �Ͽ�, ���ϴ� ������ ������ �� �ֽ��ϴ�.\nüũ����Ʈ�� ���� 'F'Ű�� �����ֽ� �� ���ϴ� ���⸦ �����غ�����.\n\n");
			    ShowPlayerDialog(playerid, DIALOG_BASIC_TRAINING, DIALOG_STYLE_MSGBOX, "�����Ʒ� �� 1��", string, "Ȯ��", "����");
			    PlayerInfo[playerid][pNPCQwest] = 1;
			}
			else if(PlayerInfo[playerid][pNPCQwest] == 1)
			{
			    PlayerInfo[playerid][pNPCQwest] = 2;
			    SendMessage(playerid, "���� �Ⱦ����� �̵��Ͽ� FŰ�� �����ּ���.");
			}
			else if(PlayerInfo[playerid][pNPCQwest] == 3)
			{
       			if(listitem == 0){
			    	if(PlayerInfo[playerid][pCountry] == 1)
						GivePlayerWeaponEx(playerid, 31, 90);
					else if(PlayerInfo[playerid][pCountry] == 2)
				        GivePlayerWeaponEx(playerid, 30, 90);}
			    if(listitem == 1){
			        GivePlayerWeaponEx(playerid, 29, 90);}
			    if(listitem == 2){
			        GivePlayerWeaponEx(playerid, 29, 90);}
			    PlayerInfo[playerid][pNPCQwest] = 4;
			    QwestCheckPointEx(playerid, 1224.7917,-242.9920,1021.7993);
			    SendMessage(playerid, "�ڿ��ִ� ��������� �̵����ּ���.");
			}
			else if(PlayerInfo[playerid][pNPCQwest] == 5)
			{
			    if(listitem == 0)
				{
			    	if(PlayerInfo[playerid][pCountry] == 1)
			    	{
			    	    ResetPlayerWeaponsEx(playerid);
						GivePlayerWeaponEx(playerid, 31, 90);
				    }
					else if(PlayerInfo[playerid][pCountry] == 2)
					{
					    ResetPlayerWeaponsEx(playerid);
				        GivePlayerWeaponEx(playerid, 30, 90);
					}
				}
			    if(listitem == 1){
			        ResetPlayerWeaponsEx(playerid);
			        GivePlayerWeaponEx(playerid, 29, 90);}
			    if(listitem == 2){
			    	ResetPlayerWeaponsEx(playerid);
			        GivePlayerWeaponEx(playerid, 29, 90);}
			}
			else if(PlayerInfo[playerid][pNPCQwest] == 6)
			{
                PlayerInfo[playerid][pCorps] = listitem + 1;
			    new string[1024];
				new Message0[] = "\t\t\t\t"#C_GRAY"The World War Role Play - �����Ʒ� �� 2��\t\t\n\n"#C_WHITE"";
				new Message1[] = "Role Playing\n��������� �ٸ� �� �ϳ��� ���� ���󼼰迡�� ��ư���, ���󼼰��� ���� ���ҿ� ���� å�Ӱ��� ���� �� �Դϴ�.\n";
				new Message2[] = "In Character\n���󼼰迡 �ִ� �� �ٸ� �ھ�, ���󼼰��� ��Ģ�� �°� ��ư��� ĳ���ʹ�.\n";
				new Message3[] = "Out Of Character\nIC���� ĳ���� �ۿ� �ִ� ��¥ ���� ��ư��� �ִ� ���踦 ���մϴ�.\n";
				new Message4[] = "�Ŀ����̹�\n�ൿ ��ɾ�� ���� �� �Ǵ� ���� ���� ����ϴ� ���� ���մϴ�.\n";
				new Message5[] = "��Ÿ���̹�\n���󼼰��� IC���� �����δ� ������ �� ���� �ܾ ���ڸ� ����ϴ� ���� ���ϸ�,'����', '����', '���'���� ����ŵ�ϴ�.\n";
				new Message6[] = "NonRP\n���Ǽ��迡���� ���� �� �Ǵ� �ൿ�� �ϴ� ������ ���մϴ�. ��) ��������, �ػ��� ��\n";
				new Message7[] = "BadRP\n���������� ������ �Ǵ� RP�� �ϴ� ���� ���մϴ�.\n\n";
				new Message8[] = "���� �˷��帮�� ���� ������� �Դϴ�. ���� IC����� �̵��ؾ� �մϴ�. ���� �̵��Ͻ÷��� '�̵�'�� Ŭ�����ּ���.\n";
				format(string, sizeof(string), "%s%s%s%s%s%s%s%s%s",Message0,Message1,Message2,Message3,Message4,Message5,Message6,Message7,Message8);
			    PlayerInfo[playerid][pNPCQwest] = 8;
			    ShowPlayerDialog(playerid, DIALOG_BASIC_TRAINING, DIALOG_STYLE_MSGBOX, "�����Ʒ� �� 2��", string, "���̽��̵�","����");
			}
			else if(PlayerInfo[playerid][pNPCQwest] == 8)
			{
			    PlayerInfo[playerid][pNPCQwest] = 9;
			    TogglePlayerControllable(playerid, 0);
				SetTimerEx("FadeOut", FADE_DELAY, false, "id",playerid,0);
				SetTimerEx("TutorialEnd", 2000, false, "dd", playerid,1);
				SetTimerEx("TutorialEnd", 3000, false, "dd", playerid,2);
			}
	    }
	    else
	    {
			if(PlayerInfo[playerid][pNPCQwest] == 1)
			{
			    PlayerInfo[playerid][pNPCQwest] = 0;
			    new string[512];
				new Message0[] = "\t"#C_GRAY"The World War Role Play�� ���� ���� ȯ���մϴ�.\n\n"#C_WHITE"";
				new Message1[] = "���� ���� �Ʒ��� �Ǿ����� �ʽ��ϴ�.\n";
				new Message2[] = "���� �Ʒ��� �����ð� �����ôٸ� 'Ȯ��'�� �����ּ���.\n\n";
				format(string, sizeof(string), "%s%s%s",Message0,Message1,Message2);
				ShowPlayerDialog(playerid, DIALOG_BASIC_TRAINING, DIALOG_STYLE_MSGBOX, "�����Ʒ�", string, "Ȯ��", "���");
			}
			else if(PlayerInfo[playerid][pNPCQwest] == 3)
			    ShowPlayerDialog(playerid, DIALOG_BASIC_TRAINING, DIALOG_STYLE_LIST, "�����Ʒ� �� 1��", "AK47/M4 ���ݺ�\nMP5 �ǹ���\nMP5 ����", "Ȯ��", "���");
			else if(PlayerInfo[playerid][pNPCQwest] == 6)
			{
			    ShowPlayerDialog(playerid, DIALOG_BASIC_TRAINING, DIALOG_STYLE_LIST, "��������", "������\n����\n�ǹ���", "����","");
			}
			else if(PlayerInfo[playerid][pNPCQwest] == 8)
			{
			    PlayerInfo[playerid][pNPCQwest] = 6;
			    ShowPlayerDialog(playerid, DIALOG_BASIC_TRAINING, DIALOG_STYLE_LIST, "��������", "������\n����\n�ǹ���", "����","");
			}
	    }
	    return 1;
	}
	if(dialogid == DIALOG_BUILD)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
	        if(PlayerInfo[playerid][pCreEnterID] != -1 && PlayerInfo[playerid][pCreEnterName] == 1)
	        {
	            if(listitem == 0) PlayerInfo[playerid][pCreEnterType] = 1;
	            if(listitem == 1) PlayerInfo[playerid][pCreEnterType] = 2;
	            if(listitem == 2) PlayerInfo[playerid][pCreEnterType] = 3;
	            PlayerInfo[playerid][pCreEnterName] = 2;
	            new Float:x,Float:y,Float:z, interior, virtualworld;
	         	GetPlayerPos(playerid, x,y,z); interior = GetPlayerInterior(playerid); virtualworld = GetPlayerVirtualWorld(playerid);
			    PlayerInfo[playerid][pCreEnterPos2][0] = x;PlayerInfo[playerid][pCreEnterPos2][1] = y;PlayerInfo[playerid][pCreEnterPos2][2] = z;
                PlayerInfo[playerid][pCreEnterInt2] = interior; PlayerInfo[playerid][pCreEnterVW2] = virtualworld;

			    new string[256];
			    format(string, sizeof(string), "\t\t"#C_GRAY"- Enter Create -"#C_WHITE"\n\n������ǥ : %f,%f,%f\n������ǥ : %f,%f,%f\n\n���� ���׸��� ��ȣ : %d ���� �������� : %d\n���� ���׸��� ��ȣ : %d ���� �������� : %d\n"
				,PlayerInfo[playerid][pCreEnterPos1][0],PlayerInfo[playerid][pCreEnterPos1][1],PlayerInfo[playerid][pCreEnterPos1][2],
				PlayerInfo[playerid][pCreEnterPos2][0],PlayerInfo[playerid][pCreEnterPos2][1],PlayerInfo[playerid][pCreEnterPos2][2],
				PlayerInfo[playerid][pCreEnterInt1], PlayerInfo[playerid][pCreEnterVW1], PlayerInfo[playerid][pCreEnterInt2], PlayerInfo[playerid][pCreEnterVW2]);
			    ShowPlayerDialog(playerid, DIALOG_BUILD, DIALOG_STYLE_INPUT, "�ǹ�����", string, "Ȯ��","����");
				return 1;
	        }
	        else if(PlayerInfo[playerid][pCreEnterID] != -1 && PlayerInfo[playerid][pCreEnterName] == 2)
			{
				if(strlen(inputtext))
				{
					//new type = 0; if(PlayerInfo[playerid][pCreEnterInt2] == PlayerInfo[playerid][pCreEnterInt1]) type = 1;
					PlayerInfo[playerid][pCreEnterID] = -1; PlayerInfo[playerid][pCreEnterName] = 0;

				    if(EnterEntering(_,PlayerInfo[playerid][pCreEnterPos1][0],PlayerInfo[playerid][pCreEnterPos1][1],
					PlayerInfo[playerid][pCreEnterPos1][2],PlayerInfo[playerid][pCreEnterPos2][0],PlayerInfo[playerid][pCreEnterPos2][1],
					PlayerInfo[playerid][pCreEnterPos2][2],PlayerInfo[playerid][pCreEnterVW1],PlayerInfo[playerid][pCreEnterInt1],PlayerInfo[playerid][pCreEnterVW2],
				 	PlayerInfo[playerid][pCreEnterInt2],PlayerInfo[playerid][pCreEnterType],inputtext) == 1)
				 	    SendMessage(playerid, "����/������ �ϳ� ���� �Ͽ����ϴ�.");
				    else
				        SendMessage(playerid, "�� �̻� �ǹ��� ������ �ڸ��� �����ϴ�.");
				    PlayerInfo[playerid][pCreEnterPos1][0] = 0;PlayerInfo[playerid][pCreEnterPos1][1] = 0;PlayerInfo[playerid][pCreEnterPos1][2] = 0;
				    PlayerInfo[playerid][pCreEnterPos2][0] = 0;PlayerInfo[playerid][pCreEnterPos2][1] = 0;PlayerInfo[playerid][pCreEnterPos2][2] = 0;
		          	PlayerInfo[playerid][pCreEnterInt1] = 0; PlayerInfo[playerid][pCreEnterVW1] = 0; PlayerInfo[playerid][pCreEnterID] = -1;
		          	PlayerInfo[playerid][pCreEnterInt2] = 0; PlayerInfo[playerid][pCreEnterVW2] = 0; PlayerInfo[playerid][pCreEnterName] = 0;
		        }
		        else
		        {
		            PlayerInfo[playerid][pCreEnterName] = 2;
				    new string[256];
				    format(string, sizeof(string), "\t\t"#C_GRAY"- Enter Create -"#C_WHITE"\n\n������ǥ : %f,%f,%f\n������ǥ : %f,%f,%f\n\n���� ���׸��� ��ȣ : %d ���� �������� : %d\n���� ���׸��� ��ȣ : %d ���� �������� : %d\n"
					,PlayerInfo[playerid][pCreEnterPos1][0],PlayerInfo[playerid][pCreEnterPos1][1],PlayerInfo[playerid][pCreEnterPos1][2],
					PlayerInfo[playerid][pCreEnterPos2][0],PlayerInfo[playerid][pCreEnterPos2][1],PlayerInfo[playerid][pCreEnterPos2][2],
					PlayerInfo[playerid][pCreEnterInt1], PlayerInfo[playerid][pCreEnterVW1], PlayerInfo[playerid][pCreEnterInt2], PlayerInfo[playerid][pCreEnterVW2]);
				    ShowPlayerDialog(playerid, DIALOG_BUILD, DIALOG_STYLE_INPUT, "�ǹ�����", string, "Ȯ��","����");
		        }
                return 1;
			}
			else
			{
		        if(listitem == 0)
		        {
		            if(PlayerInfo[playerid][pCreEnterID] == -1)
		            {
			            for(new e = 0; e < MAX_ENTER; e ++)
			            {
			                if(!EnterInfo[e][eCreate])
			                {
			                    new Float:x,Float:y,Float:z, interior, virtualworld;
			                    GetPlayerPos(playerid, x,y,z); interior = GetPlayerInterior(playerid); virtualworld = GetPlayerVirtualWorld(playerid);
			                    PlayerInfo[playerid][pCreEnterPos1][0] = x;PlayerInfo[playerid][pCreEnterPos1][1] = y;PlayerInfo[playerid][pCreEnterPos1][2] = z;
			                    PlayerInfo[playerid][pCreEnterInt1] = interior; PlayerInfo[playerid][pCreEnterVW1] = virtualworld; PlayerInfo[playerid][pCreEnterID] = e;
			                    PlayerInfo[playerid][pCreEnterName] = 0;
								SendMessage(playerid, "�� ��Ҵ� �ǹ��� �Ա��� ���� �Ǿ����ϴ�.");
								SendMessage(playerid, "[/��ǥ�̵�]���� �ǹ� ���η� �̵��Ͽ� �ⱸ �տ��� [/�ǹ�����]�� Ÿ�������ּ���.");
								return 1;
			                }
			            }
					}
					else
					{
					    PlayerInfo[playerid][pCreEnterName] = 1;
					    ShowPlayerDialog(playerid, DIALOG_BUILD, DIALOG_STYLE_LIST, "�ǹ�����", "�ǹ�\n�����\n�⺻", "Ȯ��","�缳��");
						return 1;
					}
		        }
		        if(listitem == 1)
		        {
		            if(PlayerInfo[playerid][pCreEnterID] == -1)
		            {
		                new Number = 0, string[512]; PlayerInfo[playerid][pEnterList] = -1;
						strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
						for(new e = 0; e < MAX_ENTER; e ++)
						{
							PlayerInfo[playerid][pEnterNumber][Number] = -1; if(EnterInfo[e][eCreate] != 1) continue;
							format(string, sizeof(string), "%s\n%d\t%s",string,EnterInfo[e][eID], EnterInfo[e][eName]);
							PlayerInfo[playerid][pEnterNumber][Number] = e;
							Number++;
						}
		                ShowPlayerDialog(playerid, DIALOG_BUILD_EDIT, DIALOG_STYLE_LIST, "�ǹ�����", string, "����", "����");
		                return 1;
		            }
					else
					{
		            	PlayerInfo[playerid][pCreEnterPos1][0] = 0;PlayerInfo[playerid][pCreEnterPos1][1] = 0;PlayerInfo[playerid][pCreEnterPos1][2] = 0;
					    PlayerInfo[playerid][pCreEnterPos2][0] = 0;PlayerInfo[playerid][pCreEnterPos2][1] = 0;PlayerInfo[playerid][pCreEnterPos2][2] = 0;
			          	PlayerInfo[playerid][pCreEnterInt1] = 0; PlayerInfo[playerid][pCreEnterVW1] = 0; PlayerInfo[playerid][pCreEnterID] = -1;
			          	PlayerInfo[playerid][pCreEnterInt2] = 0; PlayerInfo[playerid][pCreEnterVW2] = 0; PlayerInfo[playerid][pCreEnterName] = 0;
			          	OnPlayerCommandText(playerid, "/�ǹ�����");
			          	return 1;
					}
		        }
		        if(listitem == 2)
		        {
		            new Number = 0, string[512]; PlayerInfo[playerid][pEnterList] = -1;
					strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
					for(new e = 0; e < MAX_ENTER; e ++)
					{
						PlayerInfo[playerid][pEnterNumber][Number] = -1; if(EnterInfo[e][eCreate] != 1) continue;
						format(string, sizeof(string), "%s\n%d\t%s",string,EnterInfo[e][eID], EnterInfo[e][eName]);
						PlayerInfo[playerid][pEnterNumber][Number] = e;
						Number++;
					}
	                ShowPlayerDialog(playerid, DIALOG_BUILD_DELETE, DIALOG_STYLE_LIST, "�ǹ�����", string, "����", "����");
					return 1;
		        }
			}
	    }
	    else
	    {
			if(PlayerInfo[playerid][pCreEnterID] != -1 && PlayerInfo[playerid][pCreEnterName] == 1)
            	PlayerInfo[playerid][pCreEnterName] = 0;
			if(PlayerInfo[playerid][pCreEnterName] == 2){
			    PlayerInfo[playerid][pCreEnterName] = 1;
				ShowPlayerDialog(playerid, DIALOG_BUILD, DIALOG_STYLE_LIST, "�ǹ�����", "�ǹ�\n�����\n�⺻", "Ȯ��","�缳��");}
	    }
	    return 1;
	}
	if(dialogid == DIALOG_BUILD_DELETE)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
	        if(listitem == 0)
	        {
	            new Number = 0, string[512]; PlayerInfo[playerid][pEnterList] = -1;
				strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
				for(new e = 0; e < MAX_ENTER; e ++)
				{
					PlayerInfo[playerid][pEnterNumber][Number] = -1; if(EnterInfo[e][eCreate] != 1) continue;
					format(string, sizeof(string), "%s\n%d\t%s",string,EnterInfo[e][eID], EnterInfo[e][eName]);
					PlayerInfo[playerid][pEnterNumber][Number] = e;
					Number++;
				}
                ShowPlayerDialog(playerid, DIALOG_BUILD_DELETE, DIALOG_STYLE_LIST, "�ǹ�����", string, "����", "����");
                return 1;
	        }
	        new string[128], EnterID = PlayerInfo[playerid][pEnterNumber][listitem - 1];
	        format(string, sizeof(string), "�ǹ��� ���� �Ǿ����ϴ�. [ID : %d]",EnterInfo[EnterID][eID]);
	        SendMessage(playerid, string);
	        DeleteEnterEnter(EnterID);
	    }
	    else
	    {
	        OnPlayerCommandText(playerid, "/�ǹ�����");
	    }
	    return 1;
	}
    if(dialogid == DIALOG_BUILD_EDIT)
    {
        if(response)
        {
            if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
            if(PlayerInfo[playerid][pEnterEdit] == 1)
		    {
		        new EnterID = PlayerInfo[playerid][pEnterList], string[256];
		        if(!strlen(inputtext))
		        {
		            PlayerInfo[playerid][pEnterEdit] = 1;
			        format(string, sizeof(string), ""#C_GRAY"\t- %s -\n\n"#C_WHITE"���ο� �ǹ� �̸��� �������ּ���.",EnterInfo[EnterID][eName]);
			        ShowPlayerDialog(playerid, DIALOG_BUILD_EDIT, DIALOG_STYLE_INPUT, "�ǹ� �̸�����", string, "Ȯ��", "����");
			        return 1;
		        }
		        else
		        {
		            strmid(EnterInfo[EnterID][eName], inputtext, 0, 128, 128);
		            format(string, sizeof(string), "�ǹ� �̸��� %s�� �ٲ�����ϴ�. [ID : %d]",EnterInfo[EnterID][eName],EnterInfo[EnterID][eID]);
					SendMessage(playerid, string);
					DestroyPickup(EnterInfo[EnterID][ePickup]);
					Delete3DTextLabel(EnterInfo[EnterID][e3DLabel]);
					EnterInfo[EnterID][ePickup] = CreatePickup(EnterInfo[EnterID][epickupid],1,EnterInfo[EnterID][ePosX],EnterInfo[EnterID][ePosY],EnterInfo[EnterID][ePosZ],EnterInfo[EnterID][eVirtualWorld]);
				    EnterInfo[EnterID][e3DLabel] = Create3DTextLabel(EnterInfo[EnterID][eName],COLOR_BUILD,EnterInfo[EnterID][ePosX],EnterInfo[EnterID][ePosY],EnterInfo[EnterID][ePosZ],5.0,0);
		            SaveEnter(EnterID);
		        }
		        return 1;
		    }
			else if(PlayerInfo[playerid][pEnterEdit] == 2)
			{
			    new EnterID = PlayerInfo[playerid][pEnterList], string[256];
			    if(listitem == 0) EnterInfo[EnterID][eType] = 1;
	            if(listitem == 1) EnterInfo[EnterID][eType] = 2;
	            if(listitem == 2) EnterInfo[EnterID][eType] = 3;
	            format(string, sizeof(string), "�ǹ� ������ %dŸ������ �ٲ�����ϴ�. [ID : %d]",EnterInfo[EnterID][eType], EnterInfo[EnterID][eID]);
				SendMessage(playerid, string);
			    SaveEnter(EnterID);
				return 1;
			}
			if(PlayerInfo[playerid][pEnterList] == -1)
			{
				if(listitem == 0)
				{
				    new Number = 0, string[512]; PlayerInfo[playerid][pEnterList] = -1;
					strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
					for(new e = 0; e < MAX_ENTER; e ++)
					{
						PlayerInfo[playerid][pEnterNumber][Number] = -1; if(EnterInfo[e][eCreate] != 1) continue;
						format(string, sizeof(string), "%s\n%d\t%s",string,EnterInfo[e][eID], EnterInfo[e][eName]);
						PlayerInfo[playerid][pEnterNumber][Number] = e;
						Number++;
					}
	                ShowPlayerDialog(playerid, DIALOG_BUILD_EDIT, DIALOG_STYLE_LIST, "�ǹ�����", string, "����", "����");
					return 1;
				}
	            PlayerInfo[playerid][pEnterList] = PlayerInfo[playerid][pEnterNumber][listitem - 1]; //-1�ϴ� ���� listitem = 0 �ǹ��� �ƴϰ� LIST�̱� ����.
	            ShowPlayerDialog(playerid, DIALOG_BUILD_EDIT, DIALOG_STYLE_LIST, "�ǹ�����", "�ǹ� �̸�����\n������ġ\n������ġ\n�ǹ�����", "Ȯ��", "����");
				return 1;
			}
			else
			{
			    if(listitem == 0)
			    {
			        new EnterID = PlayerInfo[playerid][pEnterList], string[256]; PlayerInfo[playerid][pEnterEdit] = 1;
			        format(string, sizeof(string), ""#C_GRAY"\t- %s -\n\n"#C_WHITE"���ο� �ǹ� �̸��� �������ּ���.",EnterInfo[EnterID][eName]);
			        ShowPlayerDialog(playerid, DIALOG_BUILD_EDIT, DIALOG_STYLE_INPUT, "�ǹ� �̸�����", string, "Ȯ��", "����");
			    }
			    if(listitem == 1)
			    {
			        new EnterID = PlayerInfo[playerid][pEnterList], string[256];
					GetPlayerPos(playerid, EnterInfo[EnterID][ePosX],EnterInfo[EnterID][ePosY],EnterInfo[EnterID][ePosZ]);
					EnterInfo[EnterID][eInterior] = GetPlayerInterior(playerid); EnterInfo[EnterID][eVirtualWorld] = GetPlayerVirtualWorld(playerid);
					format(string, sizeof(string), "���� ��ǥ�� %f,%f,%f���� �ٲ�����ϴ�. [ID : %d] [Interior : %d] [VirtualWorld : %d]",EnterInfo[EnterID][ePosX],EnterInfo[EnterID][ePosY],EnterInfo[EnterID][ePosZ],EnterInfo[EnterID][eID],EnterInfo[EnterID][eInterior],EnterInfo[EnterID][eVirtualWorld]);
					SendMessage(playerid, string);
					DestroyPickup(EnterInfo[EnterID][ePickup]);
					Delete3DTextLabel(EnterInfo[EnterID][e3DLabel]);
					EnterInfo[EnterID][ePickup] = CreatePickup(EnterInfo[EnterID][epickupid],1,EnterInfo[EnterID][ePosX],EnterInfo[EnterID][ePosY],EnterInfo[EnterID][ePosZ],EnterInfo[EnterID][eVirtualWorld]);
				    EnterInfo[EnterID][e3DLabel] = Create3DTextLabel(EnterInfo[EnterID][eName],COLOR_BUILD,EnterInfo[EnterID][ePosX],EnterInfo[EnterID][ePosY],EnterInfo[EnterID][ePosZ],5.0,0);
					SaveEnter(EnterID);
					return 1;
				}
			    if(listitem == 2)
			    {
			        new EnterID = PlayerInfo[playerid][pEnterList], string[256];
					GetPlayerPos(playerid, EnterInfo[EnterID][eInPosX],EnterInfo[EnterID][eInPosY],EnterInfo[EnterID][eInPosZ]);
					EnterInfo[EnterID][eInInterior] = GetPlayerInterior(playerid); EnterInfo[EnterID][eInVirtualWorld] = GetPlayerVirtualWorld(playerid);
			        format(string, sizeof(string), "���� ��ǥ�� %f,%f,%f���� �ٲ�����ϴ�. [ID : %d] [Interior : %d] [VirtualWorld : %d]",EnterInfo[EnterID][eInPosX],EnterInfo[EnterID][eInPosY],EnterInfo[EnterID][eInPosZ],EnterInfo[EnterID][eID],EnterInfo[EnterID][eInInterior],EnterInfo[EnterID][eInVirtualWorld]);
					SendMessage(playerid, string);
					DestroyPickup(EnterInfo[EnterID][eInPickup]);
					EnterInfo[EnterID][eInPickup] = CreatePickup(EnterInfo[EnterID][epickupid],1,EnterInfo[EnterID][eInPosX],EnterInfo[EnterID][eInPosY],EnterInfo[EnterID][eInPosZ],EnterInfo[EnterID][eInVirtualWorld]);
					SaveEnter(EnterID);
					return 1;
			    }
			    if(listitem == 3)
		    	{
		    	    PlayerInfo[playerid][pEnterEdit] = 2;
			        ShowPlayerDialog(playerid, DIALOG_BUILD_EDIT, DIALOG_STYLE_LIST, "�ǹ�����", "�ǹ�\n�����\n�⺻", "Ȯ��", "����");
			        return 1;
			    }
			}
        }
        else
        {
            if(PlayerInfo[playerid][pEnterEdit] == 1)
                PlayerInfo[playerid][pEnterEdit] = 0;
            if(PlayerInfo[playerid][pEnterList] == -1)
			{
            	OnPlayerCommandText(playerid, "/�ǹ�����");
            }
            else
            {
                new Number = 0, string[512]; PlayerInfo[playerid][pEnterList] = -1;
				strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
				for(new e = 0; e < MAX_ENTER; e ++)
				{
					PlayerInfo[playerid][pEnterNumber][Number] = -1; if(EnterInfo[e][eCreate] != 1) continue;
					format(string, sizeof(string), "%s\n%d\t%s",string,EnterInfo[e][eID], EnterInfo[e][eName]);
					PlayerInfo[playerid][pEnterNumber][Number] = e;
					Number++;
				}
                ShowPlayerDialog(playerid, DIALOG_BUILD_EDIT, DIALOG_STYLE_LIST, "�ǹ�����", string, "����", "����");
                return 1;
            }
        }
	    return 1;
	}
	if(dialogid == DIALOG_GANGZONE)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
	        if(PlayerInfo[playerid][pGangzoneCre] == 3)
	        {
	            if(strlen(inputtext))
	            {
	                new string[128]; PlayerInfo[playerid][pGangzoneCre] = 0;
					if(CreateGangZone(PlayerInfo[playerid][pGangzoneS_PosX],PlayerInfo[playerid][pGangzoneS_PosY],PlayerInfo[playerid][pGangzoneE_PosX],PlayerInfo[playerid][pGangzoneE_PosY],inputtext) == 1)
					    format(string, sizeof(string), "������ ���� �Ǿ����ϴ�. [������ : %s]",inputtext);
					else format(string, sizeof(string), "���� ������ ��ҵǾ����ϴ�. [���� : ���� ���� �ڸ� ����]");
				    SendMessage(playerid, string);
				    return 1;
	            }
	            else
	            {
	                GetPlayerPos(playerid, PlayerInfo[playerid][pGangzoneE_PosX],PlayerInfo[playerid][pGangzoneE_PosY],PlayerInfo[playerid][pGangzoneE_PosZ]);
				    ShowPlayerDialog(playerid, DIALOG_GANGZONE, DIALOG_STYLE_INPUT, "��������", "�� ������ �̸��� �����ּ���.","Ȯ��","���");
				    PlayerInfo[playerid][pGangzoneCre] = 3;
				    return 1;
	            }
	        }
	        if(listitem == 0)
	        {
				if(PlayerInfo[playerid][pGangzoneCre] == 1)
				{
				    if(listitem == 0)
				    {
					    GetPlayerPos(playerid, PlayerInfo[playerid][pGangzoneS_PosX],PlayerInfo[playerid][pGangzoneS_PosY],PlayerInfo[playerid][pGangzoneS_PosZ]);
					    SendMessage(playerid, "������ ���� ������ ��ܿ��� '/��������'�� Ÿ���� ���ּ���.");
					    PlayerInfo[playerid][pGangzoneCre] = 2;
					    return 1;
				    }
				}
				else if(PlayerInfo[playerid][pGangzoneCre] == 2)
				{
				    GetPlayerPos(playerid, PlayerInfo[playerid][pGangzoneE_PosX],PlayerInfo[playerid][pGangzoneE_PosY],PlayerInfo[playerid][pGangzoneE_PosZ]);
				    ShowPlayerDialog(playerid, DIALOG_GANGZONE, DIALOG_STYLE_INPUT, "��������", "�� ������ �̸��� �����ּ���.","Ȯ��","���");
				    PlayerInfo[playerid][pGangzoneCre] = 3;
				    return 1;
				}
				else
				{
		            for(new g = 0; g < MAX_GANGZONE; g ++)
					{
					    if(!GangzoneInfo[g][gCreate])
					    {
	               			SendMessage(playerid, "������ ������ ���� ���� �ϴܿ��� '/��������'�� Ÿ���� ���ּ���.");
	               			PlayerInfo[playerid][pGangzoneCre] = 1;
	               			break;
		                }
		                else if(g == MAX_GANGZONE-1)
		                    return SendErrorMessage(playerid, "�� �̻� ������ �߰��� �ڸ��� �����ϴ�.");
		            }
				}
	        }
	        if(listitem == 1)
	        {
	            if(PlayerInfo[playerid][pGangzoneCre] == 1 || PlayerInfo[playerid][pGangzoneCre] == 2)
                    PlayerInfo[playerid][pGangzoneCre] = 0;
				else
				{
		            new Number = 0, string[512]; PlayerInfo[playerid][pGangzoneList] = -1; PlayerInfo[playerid][pGangzoneNameEdit] = 0;
					strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
					for(new g = 0; g < MAX_GANGZONE; g ++)
					{
					    if(GangzoneInfo[g][gCreate] != 1) continue;
						PlayerInfo[playerid][pGangzoneNumber][Number] = -1;
						format(string, sizeof(string), "%s\n%d\t%s",string,GangzoneInfo[g][gNumber], GangzoneInfo[g][gName]);
						PlayerInfo[playerid][pGangzoneNumber][Number] = g;
						Number++;
					}
	                ShowPlayerDialog(playerid, DIALOG_GANGZONE_EDIT, DIALOG_STYLE_LIST, "��������", string, "����", "����");
		            return 1;
				}
                return 1;
	        }
	        if(listitem == 2)
	        {
	            new Number = 0, string[512]; PlayerInfo[playerid][pGangzoneList] = -1; PlayerInfo[playerid][pGangzoneNameEdit] = 0;
				strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
				for(new g = 0; g < MAX_GANGZONE; g ++)
				{
				    if(GangzoneInfo[g][gCreate] != 1) continue;
					PlayerInfo[playerid][pGangzoneNumber][Number] = -1;
					format(string, sizeof(string), "%s\n%d\t%s",string,GangzoneInfo[g][gNumber], GangzoneInfo[g][gName]);
					PlayerInfo[playerid][pGangzoneNumber][Number] = g;
					Number++;
				}
                ShowPlayerDialog(playerid, DIALOG_GANGZONE_DELETE, DIALOG_STYLE_LIST, "��������", string, "����", "����");
	            return 1;
	        }
	    }
	    else
	    {
			if(PlayerInfo[playerid][pGangzoneCre] == 3)
				PlayerInfo[playerid][pGangzoneCre] = 0;
	    }
	    return 1;
	}
	if(dialogid == DIALOG_GANGZONE_DELETE)
	{
		if(response)
		{
		    if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
		    if(listitem == 0)
		    {
		        new Number = 0, string[512]; PlayerInfo[playerid][pGangzoneList] = -1; PlayerInfo[playerid][pGangzoneNameEdit] = 0;
				strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
				for(new g = 0; g < MAX_GANGZONE; g ++)
				{
				    if(GangzoneInfo[g][gCreate] != 1) continue;
					PlayerInfo[playerid][pGangzoneNumber][Number] = -1;
					format(string, sizeof(string), "%s\n%d\t%s",string,GangzoneInfo[g][gNumber], GangzoneInfo[g][gName]);
					PlayerInfo[playerid][pGangzoneNumber][Number] = g;
					Number++;
				}
                ShowPlayerDialog(playerid, DIALOG_GANGZONE_DELETE, DIALOG_STYLE_LIST, "��������", string, "����", "����");
	            return 1;
		    }
		    new GangzoneID = PlayerInfo[playerid][pGangzoneNumber][listitem - 1], string[128];
		    format(string, sizeof(string), "������ ���� �Ͽ����ϴ�. [�̸� : %s] [��ȣ : %d]",GangzoneInfo[GangzoneID][gName],GangzoneInfo[GangzoneID][gNumber]);
		    SendMessage(playerid, string);
		    DeleteGangzone(GangzoneID);
		}
		else
		{
		    OnPlayerCommandText(playerid, "/��������");
		}
		return 1;
	}
	if(dialogid == DIALOG_GANGZONE_EDIT)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
	        if(PlayerInfo[playerid][pGangzoneNameEdit] == 1)
	        {
	            if(strlen(inputtext))
	            {
		            new GangzoneID = PlayerInfo[playerid][pGangzoneList], string[256];
		            strmid(GangzoneInfo[GangzoneID][gName], inputtext, 0, 128, 128);
		            format(string, sizeof(string), "���� �̸��� %s�� �ٲ�����ϴ�. [ID : %d]",inputtext, GangzoneID);
		            SendMessage(playerid, string);
		            PlayerInfo[playerid][pGangzoneNameEdit] = 0;
		            SaveGangzone(GangzoneInfo[GangzoneID][gNumber]);
		        }
		        else
		        {
		            ShowPlayerDialog(playerid, DIALOG_GANGZONE_EDIT, DIALOG_STYLE_INPUT, "���� �̸�����", "�����Ͻ� ���� �̸��� �������ּ���.", "Ȯ��","����");
	                PlayerInfo[playerid][pGangzoneNameEdit] = 1;
		        }
	            return 1;
	        }
	        if(PlayerInfo[playerid][pGangzoneList] == -1)
			{
			    if(listitem == 0)
		        {
		            new Number = 0, string[512]; PlayerInfo[playerid][pGangzoneList] = -1; PlayerInfo[playerid][pGangzoneNameEdit] = 0;
					strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
					for(new g = 0; g < MAX_GANGZONE; g ++)
					{
						PlayerInfo[playerid][pGangzoneNumber][Number] = -1; if(GangzoneInfo[g][gCreate] != 1) continue;
						format(string, sizeof(string), "%s\n%d\t%s",string,GangzoneInfo[g][gNumber], GangzoneInfo[g][gName]);
						PlayerInfo[playerid][pGangzoneNumber][Number] = g;
						Number++;
					}
	                ShowPlayerDialog(playerid, DIALOG_GANGZONE_EDIT, DIALOG_STYLE_LIST, "��������", string, "����", "����");
	                return 1;
	            }
	        	PlayerInfo[playerid][pGangzoneList] = PlayerInfo[playerid][pGangzoneNumber][listitem - 1];
	        	ShowPlayerDialog(playerid, DIALOG_GANGZONE_EDIT, DIALOG_STYLE_LIST, "��������", "���� �̸�����\n�ּ���ǥ ����\n�ִ���ǥ ����", "����", "����");
				return 1;
	        }
	        else
	        {
		        if(listitem == 0)
		        {
		            ShowPlayerDialog(playerid, DIALOG_GANGZONE_EDIT, DIALOG_STYLE_INPUT, "���� �̸�����", "�����Ͻ� ���� �̸��� �������ּ���.", "Ȯ��","����");
          			PlayerInfo[playerid][pGangzoneNameEdit] = 1;
					return 1;
		        }
				if(listitem == 1)
				{
				    new GangzoneID = PlayerInfo[playerid][pGangzoneList], string[256];
				    GetPlayerPos(playerid, GangzoneInfo[GangzoneID][gS_PosX], GangzoneInfo[GangzoneID][gS_PosY], GangzoneInfo[GangzoneID][gS_PosZ]);
				    format(string, sizeof(string), "������ �ּ� ��ǥ�� %f,%f���� �����Ͽ����ϴ�. [�̸� : %s] [��ȣ : %d]",GangzoneInfo[GangzoneID][gS_PosX], GangzoneInfo[GangzoneID][gS_PosY],GangzoneInfo[GangzoneID][gName],GangzoneInfo[GangzoneID][gNumber]);
					SendMessage(playerid, string);
					ResetGangzone(GangzoneID);
                    SaveGangzone(GangzoneInfo[GangzoneID][gNumber]);
					return 1;
				}
				if(listitem == 2)
				{
				    new GangzoneID = PlayerInfo[playerid][pGangzoneList], string[256];
				    GetPlayerPos(playerid, GangzoneInfo[GangzoneID][gE_PosX], GangzoneInfo[GangzoneID][gE_PosY], GangzoneInfo[GangzoneID][gE_PosZ]);
				    format(string, sizeof(string), "������ �ִ� ��ǥ�� %f,%f���� �����Ͽ����ϴ�. [�̸� : %s] [��ȣ : %d]",GangzoneInfo[GangzoneID][gE_PosX], GangzoneInfo[GangzoneID][gE_PosY],GangzoneInfo[GangzoneID][gName],GangzoneInfo[GangzoneID][gNumber]);
                    SendMessage(playerid, string);
					ResetGangzone(GangzoneID);
                    SaveGangzone(GangzoneInfo[GangzoneID][gNumber]);
					return 1;
				}
			}
	        return 1;
	    }
	    else
	    {
	        if(PlayerInfo[playerid][pGangzoneList] == -1)
	       	{
				OnPlayerCommandText(playerid, "/��������");
	       	}
			else if(PlayerInfo[playerid][pGangzoneList] >= 0)
			{
			    new Number = 0, string[512]; PlayerInfo[playerid][pGangzoneList] = -1; PlayerInfo[playerid][pGangzoneNameEdit] = 0;
				strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
				for(new g = 0; g < MAX_GANGZONE; g ++)
				{
					PlayerInfo[playerid][pGangzoneNumber][Number] = -1; if(GangzoneInfo[g][gCreate] != 1) continue;
					format(string, sizeof(string), "%s\n%d\t%s",string,GangzoneInfo[g][gNumber], GangzoneInfo[g][gName]);
					PlayerInfo[playerid][pGangzoneNumber][Number] = g;
					Number++;
				}
                ShowPlayerDialog(playerid, DIALOG_GANGZONE_EDIT, DIALOG_STYLE_LIST, "��������", string, "����", "����");
			}
	    }
	    return 1;
	}
	if(dialogid == DIALOG_OCCUPY_AREA)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
	        if(listitem == 0)
	        {
				if(CheckGangzone(playerid) == 1)
				{
		            for(new o = 0; o < MAX_OCCUPY_AREA; o ++)
		            {
		                if(!Occupy_AreaInfo[o][oCreate])
		                {
		            		GetPlayerPos(playerid, PlayerInfo[playerid][pOccupyAreaPosX], PlayerInfo[playerid][pOccupyAreaPosY], PlayerInfo[playerid][pOccupyAreaPosZ]);
		            		PlayerInfo[playerid][pOccupyAreaCre] = 1;
		            		ShowPlayerDialog(playerid, DIALOG_OCCUPY_AREA_CRE, DIALOG_STYLE_INPUT, "������ ����",""#C_GRAY"\t\t���ο� ������ ����\n\n"#C_WHITE"���� �߰��� ������ �̸��� ������ �� '����'�� Ŭ�����ּ���.","����","���");
							return 1;
		                }
		            }
				}
				else
				{
				    SendErrorMessage(playerid, MessageText[4]);
				}
	        }
			if(listitem == 1)
			{
                new Number = 0, string[512]; PlayerInfo[playerid][pOccupyAreaList] = -1; PlayerInfo[playerid][pOccupyAreaEditType] = 0;
				strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
				for(new o = 0; o < MAX_OCCUPY_AREA; o ++)
				{
					PlayerInfo[playerid][pOccupyAreaNumber][Number] = -1; if(Occupy_AreaInfo[o][oCreate] != 1) continue;
					format(string, sizeof(string), "%s\n%d\t%s",string,Occupy_AreaInfo[o][oNumber], Occupy_AreaInfo[o][oName]);
					PlayerInfo[playerid][pOccupyAreaNumber][Number] = o;
					Number++;
				}
				ShowPlayerDialog(playerid, DIALOG_OCCUPY_AREA_EDIT, DIALOG_STYLE_LIST, "������ ����", string, "����", "����");
			}
			if(listitem == 2)
			{
			    new Number = 0, string[512]; PlayerInfo[playerid][pOccupyAreaList] = -1; PlayerInfo[playerid][pOccupyAreaEditType] = 0;
				strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
				for(new o = 0; o < MAX_OCCUPY_AREA; o ++)
				{
					PlayerInfo[playerid][pOccupyAreaNumber][Number] = -1; if(Occupy_AreaInfo[o][oCreate] != 1) continue;
					format(string, sizeof(string), "%s\n%d\t%s",string,Occupy_AreaInfo[o][oNumber], Occupy_AreaInfo[o][oName]);
					PlayerInfo[playerid][pOccupyAreaNumber][Number] = o;
					Number++;
				}
				ShowPlayerDialog(playerid, DIALOG_OCCUPY_AREA_DELETE, DIALOG_STYLE_LIST, "������ ����", string, "����", "����");
			}
	    }
	    else
	    {
	        PlayerInfo[playerid][pOccupyAreaCre] = 0;
	    }
	    return 1;
	}
	if(dialogid == DIALOG_OCCUPY_AREA_DELETE)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
	        if(listitem == 0)
	        {
	            new Number = 0, string[512]; PlayerInfo[playerid][pOccupyAreaList] = -1; PlayerInfo[playerid][pOccupyAreaEditType] = 0;
				strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
				for(new o = 0; o < MAX_OCCUPY_AREA; o ++)
				{
					PlayerInfo[playerid][pOccupyAreaNumber][Number] = -1; if(Occupy_AreaInfo[o][oCreate] != 1) continue;
					format(string, sizeof(string), "%s\n%d\t%s",string,Occupy_AreaInfo[o][oNumber], Occupy_AreaInfo[o][oName]);
					PlayerInfo[playerid][pOccupyAreaNumber][Number] = o;
					Number++;
				}
				ShowPlayerDialog(playerid, DIALOG_OCCUPY_AREA_DELETE, DIALOG_STYLE_LIST, "������ ����", string, "����", "����");
	        }
	        else
	        {
	            PlayerInfo[playerid][pOccupyAreaList] = PlayerInfo[playerid][pOccupyAreaNumber][listitem - 1]; new string[256];
		        format(string, sizeof(string), "�ǹ��� ���� �Ǿ����ϴ�. [�̸� : %s] [��ȣ : %d]",Occupy_AreaInfo[PlayerInfo[playerid][pOccupyAreaList]][oName],PlayerInfo[playerid][pOccupyAreaList]);
		        SendMessage(playerid, string);
		        DeleteOccupyArea(PlayerInfo[playerid][pOccupyAreaList]);
		        PlayerInfo[playerid][pOccupyAreaList] = -1;
	        }
	        return 1;
	    }
	    else
	    {
	        OnPlayerCommandText(playerid, "/����������");
	    }
	    return 1;
	}
	if(dialogid == DIALOG_OCCUPY_AREA_EDIT)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
	        if(PlayerInfo[playerid][pOccupyAreaEditType] == 1)
	        {
				if(strlen(inputtext))
				{
				    new OccupyAreaID = PlayerInfo[playerid][pOccupyAreaList], string[256];
				    strmid(Occupy_AreaInfo[OccupyAreaID][oName], inputtext, 0, 128, 128);
				    format(string, sizeof(string), "������ �̸��� %s�� �ٲ�����ϴ�. [ID : %d]",Occupy_AreaInfo[OccupyAreaID][oName], Occupy_AreaInfo[OccupyAreaID][oNumber]);
					SendMessage(playerid, string);
					DestroyPickup(Occupy_AreaInfo[OccupyAreaID][oPickup]);
		    		Occupy_AreaInfo[OccupyAreaID][oPickup] = CreatePickup(2914,1,Occupy_AreaInfo[OccupyAreaID][oPosX],Occupy_AreaInfo[OccupyAreaID][oPosY],Occupy_AreaInfo[OccupyAreaID][oPosZ] - PickupDown,0);
				    SaveOccupyArea(OccupyAreaID);
				    PlayerInfo[playerid][pOccupyAreaList] = -1;
				}
				else
				{
				    PlayerInfo[playerid][pOccupyAreaEditType] = 1;
				    ShowPlayerDialog(playerid, DIALOG_OCCUPY_AREA_EDIT, DIALOG_STYLE_LIST, "������ ����", ""#C_GRAY"\t\t������ �̸�����\n\n"#C_WHITE"�����Ͻ� ������ �̸��� �����Ͻ� ��, 'Ȯ��'�� �����ּ���.", "Ȯ��", "����");
				}
	            return 1;
	        }
	        else if(PlayerInfo[playerid][pOccupyAreaEditType] == 2)
	        {
	            if(listitem == 0)
	            {
	                new OccupyAreaID = PlayerInfo[playerid][pOccupyAreaList];
	                new g = GetAreaNumber(OccupyAreaID);
	                if(g == -1) return SendErrorMessage(playerid, "�ֺ��� ������ �����ϴ�.");
	                SetAreaColorEx(g, 1);
	                new string[128];
	                format(string, sizeof(string), "���� %s���� %s�������� �Ҽӱ����� �̱����� ���� �Ͽ����ϴ�.",PlayerInfo[playerid][pAdminName],Occupy_AreaInfo[OccupyAreaID][oName]);
	                SendAdminMessage(string);
	                //SaveOccupyArea(OccupyAreaID);
	            }
	            if(listitem == 1)
	            {
	                new OccupyAreaID = PlayerInfo[playerid][pOccupyAreaList];
	                new g = GetAreaNumber(OccupyAreaID);
	                if(g == -1) return SendErrorMessage(playerid, "�ֺ��� ������ �����ϴ�.");
	                SetAreaColorEx(g, 2);
	                new string[128];
	                format(string, sizeof(string), "���� %s���� %s�������� �Ҽӱ����� ���þƷ� ���� �Ͽ����ϴ�.",PlayerInfo[playerid][pAdminName],Occupy_AreaInfo[OccupyAreaID][oName]);
	                SendAdminMessage(string);
	                //SaveOccupyArea(OccupyAreaID);
	            }
	        }
	        else
	        {
		        if(PlayerInfo[playerid][pOccupyAreaList] == -1)
		        {
			        if(listitem == 0)
			        {
			            new Number = 0, string[512]; PlayerInfo[playerid][pOccupyAreaList] = -1; PlayerInfo[playerid][pOccupyAreaEditType] = 0;
						strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
						for(new o = 0; o < MAX_OCCUPY_AREA; o ++)
						{
							PlayerInfo[playerid][pOccupyAreaNumber][Number] = -1; if(Occupy_AreaInfo[o][oCreate] != 1) continue;
							format(string, sizeof(string), "%s\n%d\t%s",string,Occupy_AreaInfo[o][oNumber], Occupy_AreaInfo[o][oName]);
							PlayerInfo[playerid][pOccupyAreaNumber][Number] = o;
							Number++;
						}
						ShowPlayerDialog(playerid, DIALOG_OCCUPY_AREA_EDIT, DIALOG_STYLE_LIST, "������ ����", string, "����", "����");
						return 1;
			        }
			        else
			        {
			            PlayerInfo[playerid][pOccupyAreaList] = PlayerInfo[playerid][pOccupyAreaNumber][listitem - 1];
			            ShowPlayerDialog(playerid, DIALOG_OCCUPY_AREA_EDIT, DIALOG_STYLE_LIST, "������ ����", "������ �̸�����\n������ ��ġ����\n������ ��������", "Ȯ��", "����");
			        }
				}
				else
				{
				    if(listitem == 0)
				    {
						PlayerInfo[playerid][pOccupyAreaEditType] = 1;
				        ShowPlayerDialog(playerid, DIALOG_OCCUPY_AREA_EDIT, DIALOG_STYLE_LIST, "������ ����", ""#C_GRAY"\t\t������ �̸�����\n\n"#C_WHITE"�����Ͻ� ������ �̸��� �����Ͻ� ��, 'Ȯ��'�� �����ּ���.", "Ȯ��", "����");
					}
				    if(listitem == 1)
				    {
				        if(CheckGangzone(playerid) == 1)
						{
					        new OccupyAreaID = PlayerInfo[playerid][pOccupyAreaList], string[256];
					        GetPlayerPos(playerid, Occupy_AreaInfo[OccupyAreaID][oPosX], Occupy_AreaInfo[OccupyAreaID][oPosY], Occupy_AreaInfo[OccupyAreaID][oPosZ]);
					        format(string, sizeof(string), "������ ��ġ�� %f,%f,%f�� �ٲ�����ϴ�. [ID : %d]",Occupy_AreaInfo[OccupyAreaID][oPosX], Occupy_AreaInfo[OccupyAreaID][oPosY], Occupy_AreaInfo[OccupyAreaID][oPosZ],Occupy_AreaInfo[OccupyAreaID][oPosX], Occupy_AreaInfo[OccupyAreaID][oPosY], Occupy_AreaInfo[OccupyAreaID][oNumber]);
							SendMessage(playerid, string);
							DestroyPickup(Occupy_AreaInfo[OccupyAreaID][oPickup]);
			    			Occupy_AreaInfo[OccupyAreaID][oPickup] = CreatePickup(2914,1,Occupy_AreaInfo[OccupyAreaID][oPosX],Occupy_AreaInfo[OccupyAreaID][oPosY],Occupy_AreaInfo[OccupyAreaID][oPosZ] - PickupDown,0);
							SaveOccupyArea(OccupyAreaID);
							PlayerInfo[playerid][pOccupyAreaList] = -1;
						}
						else
						{
						    SendErrorMessage(playerid, MessageText[4]);
						}
				    }
				    if(listitem == 2)
					{
				        PlayerInfo[playerid][pOccupyAreaEditType] = 2;
				        ShowPlayerDialog(playerid, DIALOG_OCCUPY_AREA_EDIT, DIALOG_STYLE_LIST, "������ ����", "�̱�\n���þ�", "Ȯ��", "����");
				    }
				}
			}
			return 1;
	    }
	    else
	    {
	        if(PlayerInfo[playerid][pOccupyAreaEditType] == 1)
	            return ShowPlayerDialog(playerid, DIALOG_OCCUPY_AREA_EDIT, DIALOG_STYLE_LIST, "������ ����", "������ �̸�����\n������ ��ġ����", "Ȯ��", "����");
	        if(PlayerInfo[playerid][pOccupyAreaList] == -1)
	            return OnPlayerCommandText(playerid, "/����������");
	        else
			{
	            new Number = 0, string[512]; PlayerInfo[playerid][pOccupyAreaList] = -1; PlayerInfo[playerid][pOccupyAreaEditType] = 0;
				strmid(string, ""#C_GRAY"ID\tName"#C_WHITE"", 0, 512, 512);
				for(new o = 0; o < MAX_OCCUPY_AREA; o ++)
				{
					PlayerInfo[playerid][pOccupyAreaNumber][Number] = -1; if(Occupy_AreaInfo[o][oCreate] != 1) continue;
					format(string, sizeof(string), "%s\n%d\t%s",string,Occupy_AreaInfo[o][oNumber], Occupy_AreaInfo[o][oName]);
					PlayerInfo[playerid][pOccupyAreaNumber][Number] = o;
					Number++;
				}
				ShowPlayerDialog(playerid, DIALOG_OCCUPY_AREA_EDIT, DIALOG_STYLE_LIST, "������ ����", string, "����", "����");
	        }
	    }
	    return 1;
	}
	if(dialogid == DIALOG_OCCUPY_AREA_CRE)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
	        if(PlayerInfo[playerid][pOccupyAreaCre] == 1)
	        {
	            if(CheckGangzone(playerid) == 1)
				{
		            if(strlen(inputtext))
		            {
			            new string[128];
			            PlayerInfo[playerid][pOccupyAreaCre] = 0;
			            if(CreateOccupyArea(PlayerInfo[playerid][pOccupyAreaPosX], PlayerInfo[playerid][pOccupyAreaPosY], PlayerInfo[playerid][pOccupyAreaPosZ],inputtext) == 1)
			                format(string, sizeof(string), "�������� �ϳ� �߰��Ͽ����ϴ�. %f,%f,%f [�̸� : %s]",PlayerInfo[playerid][pOccupyAreaPosX], PlayerInfo[playerid][pOccupyAreaPosY], PlayerInfo[playerid][pOccupyAreaPosZ],inputtext);
			            else
			                format(string, sizeof(string), "�� �̻� �������� �߰� �� �� �����ϴ�.");
			            SendMessage(playerid, string);
					}
					else
					{
	        			GetPlayerPos(playerid, PlayerInfo[playerid][pOccupyAreaPosX], PlayerInfo[playerid][pOccupyAreaPosY], PlayerInfo[playerid][pOccupyAreaPosZ]);
	            		PlayerInfo[playerid][pOccupyAreaCre] = 1;
	            		ShowPlayerDialog(playerid, DIALOG_OCCUPY_AREA_CRE, DIALOG_STYLE_INPUT, "������ ����",""#C_GRAY"\t\t���ο� ������ ����\n\n"#C_WHITE"���� �߰��� ������ �̸��� ������ �� '����'�� Ŭ�����ּ���.","����","���");
					}
				}
				else
				{
				    SendErrorMessage(playerid, MessageText[4]);
				}
				return 1;
	        }
	    }
	    else
	    {
			OnPlayerCommandText(playerid, "/����������");
	    }
	    return 1;
	}
	if(dialogid == DIALOG_PLATOON)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
	        if(listitem == 0)
	        {
				for(new p_t = 1; p_t < MAX_PLATOON; p_t ++)
				{
					if(!PlatoonInfo[p_t][p_tCreate])
					{
					    PlayerInfo[playerid][pPlatoonCre] = 1;
					    ShowPlayerDialog(playerid, DIALOG_PLATOON_CRE, DIALOG_STYLE_INPUT, "�Ҵ��߰�", ""#C_GRAY"\t\t\t- �Ҵ��߰� -\n"#C_WHITE"�� �Ҵ��� �Ҵ��ȣ�� �����ֽ� �� 'Ȯ��'�� Ŭ�����ּ���", "Ȯ��","����");
						return 1;
					}
					else if(p_t == MAX_PLATOON-1)
						return SendErrorMessage(playerid, "�Ҵ븦 ���̻� ���� �� �����ϴ�.");
				}
	        }
	        if(listitem == 1)
	        {
	            new Number = 1, string[512], country[52]; PlayerInfo[playerid][pPlatoonEditState] = -1; PlayerInfo[playerid][pPlatoonEditList] = -1;
				strmid(string, ""#C_GRAY"ID\tCountry\tType\t\tName"#C_WHITE"", 0, 512, 512);
				for(new p_t = 1; p_t < MAX_PLATOON; p_t ++)
				{
					PlayerInfo[playerid][pPlatoonEditNumber][Number] = -1; if(PlatoonInfo[p_t][p_tCreate] != 1) continue;
					if(PlatoonInfo[p_t][p_tCountry] == 1) strmid(country, "�̱�", 0, 52, 52);
					else if(PlatoonInfo[p_t][p_tCountry] == 2) strmid(country, "���þ�", 0, 52, 52);
					format(string, sizeof(string), "%s\n%d\t%s\t\t%s\t%s",string,PlatoonInfo[p_t][p_tNumber],country, _FactionName[PlatoonInfo[p_t][p_tType]-1][_fName],PlatoonInfo[p_t][p_tName]);
					PlayerInfo[playerid][pPlatoonEditNumber][Number] = p_t;
					Number++;
				}
				ShowPlayerDialog(playerid, DIALOG_PLATOON_EDIT, DIALOG_STYLE_LIST, "�Ҵ�����", string, "����", "����");
	        }
	        if(listitem == 2)
	        {
	            new Number = 1, string[512], country[52]; PlayerInfo[playerid][pPlatoonEditState] = -1; PlayerInfo[playerid][pPlatoonEditList] = -1;
				strmid(string, ""#C_GRAY"ID\tCountry\tType\t\tName"#C_WHITE"", 0, 512, 512);
				for(new p_t = 1; p_t < MAX_PLATOON; p_t ++)
				{
					PlayerInfo[playerid][pPlatoonEditNumber][Number] = -1; if(PlatoonInfo[p_t][p_tCreate] != 1) continue;
					if(PlatoonInfo[p_t][p_tCountry] == 1) strmid(country, "�̱�", 0, 52, 52);
					else if(PlatoonInfo[p_t][p_tCountry] == 2) strmid(country, "���þ�", 0, 52, 52);
					format(string, sizeof(string), "%s\n%d\t%s\t\t%s\t%s",string,PlatoonInfo[p_t][p_tNumber],country, _FactionName[PlatoonInfo[p_t][p_tType]-1][_fName],PlatoonInfo[p_t][p_tName]);
					PlayerInfo[playerid][pPlatoonEditNumber][Number] = p_t;
					Number++;
				}
				ShowPlayerDialog(playerid, DIALOG_PLATOON_DELETE, DIALOG_STYLE_LIST, "�Ҵ����", string, "����", "����");
	        }
	    }
	    else
	    {
	    }
	    return 1;
	}
	if(dialogid == DIALOG_PLATOON_DELETE)
	{
		if(response)
		{
		    if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
		    if(listitem == 0)
		    {
		        new Number = 1, string[512], country[52]; PlayerInfo[playerid][pPlatoonEditState] = -1; PlayerInfo[playerid][pPlatoonEditList] = -1;
				strmid(string, ""#C_GRAY"ID\tCountry\tType\t\tName"#C_WHITE"", 0, 512, 512);
				for(new p_t = 1; p_t < MAX_PLATOON; p_t ++)
				{
					PlayerInfo[playerid][pPlatoonEditNumber][Number] = -1; if(PlatoonInfo[p_t][p_tCreate] != 1) continue;
					if(PlatoonInfo[p_t][p_tCountry] == 1) strmid(country, "�̱�", 0, 52, 52);
					else if(PlatoonInfo[p_t][p_tCountry] == 2) strmid(country, "���þ�", 0, 52, 52);
					format(string, sizeof(string), "%s\n%d\t%s\t\t%s\t%s",string,PlatoonInfo[p_t][p_tNumber],country, _FactionName[PlatoonInfo[p_t][p_tType]-1][_fName],PlatoonInfo[p_t][p_tName]);
					PlayerInfo[playerid][pPlatoonEditNumber][Number] = p_t;
					Number++;
				}
				ShowPlayerDialog(playerid, DIALOG_PLATOON_DELETE, DIALOG_STYLE_LIST, "�Ҵ����", string, "����", "����");
		    }
		    else
		    {
		        new PlatoonID = PlayerInfo[playerid][pPlatoonEditNumber][listitem], string[256];
		        format(string, sizeof(string), "���� %s���� �Ҵ� �ϳ��� ���� �Ͽ����ϴ�. [ID : %d] [Name : %s]",PlayerInfo[playerid][pAdminName],PlatoonID,PlatoonInfo[PlatoonID][p_tName]);
		        SendAdminMessage(string);
		        DeletePlatoon(PlatoonID);
		    }
		}
		else
		{
		}
		return 1;
	}
	if(dialogid == DIALOG_PLATOON_EDIT)
	{
		if(response)
		{
		    if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
		    if(PlayerInfo[playerid][pPlatoonEditList] == -1)
			{
			    if(listitem == 0)
			    {
			        new Number = 1, string[512], country[52]; PlayerInfo[playerid][pPlatoonEditState] = -1; PlayerInfo[playerid][pPlatoonEditList] = -1;
					strmid(string, ""#C_GRAY"ID\tCountry\tType\t\tName"#C_WHITE"", 0, 512, 512);
					for(new p_t = 1; p_t < MAX_PLATOON; p_t ++)
					{
						PlayerInfo[playerid][pPlatoonEditNumber][Number] = -1; if(PlatoonInfo[p_t][p_tCreate] != 1) continue;
						if(PlatoonInfo[p_t][p_tCountry] == 1) strmid(country, "�̱�", 0, 52, 52);
						else if(PlatoonInfo[p_t][p_tCountry] == 2) strmid(country, "���þ�", 0, 52, 52);
						format(string, sizeof(string), "%s\n%d\t%s\t\t%s\t%s",string,PlatoonInfo[p_t][p_tNumber],country, _FactionName[PlatoonInfo[p_t][p_tType]-1][_fName],PlatoonInfo[p_t][p_tName]);
						PlayerInfo[playerid][pPlatoonEditNumber][Number] = p_t;
						Number++;
					}
					ShowPlayerDialog(playerid, DIALOG_PLATOON_EDIT, DIALOG_STYLE_LIST, "�Ҵ�����", string, "����", "����");
					return 1;
			    }
			    else
			    {
					PlayerInfo[playerid][pPlatoonEditList] = PlayerInfo[playerid][pPlatoonEditNumber][listitem];//�Ѽ� �ѹ��� 1���� �����ϱ� ������ Listitem - 1 �� �� �� �ʿ䰡 ����
					ShowPlayerDialog(playerid, DIALOG_PLATOON_EDIT, DIALOG_STYLE_LIST, "�Ҵ�����", "�Ҵ� �̸�����\n�Ҵ� ��ȣ����\n�Ҵ� ���Һ���\n�Ҵ� ��������", "Ȯ��","����");
					return 1;
				}
			}
		    else if(PlayerInfo[playerid][pPlatoonEditList])
		    {
			    if(PlayerInfo[playerid][pPlatoonEditState] == 1)
			    {
			        new PlatoonID = PlayerInfo[playerid][pPlatoonEditList], string[256];
			        strmid(PlatoonInfo[PlatoonID][p_tName], inputtext, 0, 128, 128);
			        format(string, sizeof(string), "���� %s�Կ� ���� �Ҵ� �̸��� ����Ǿ����ϴ�. [ID : %d] [Name : %s]",PlayerInfo[playerid][pAdminName],PlatoonID,PlatoonInfo[PlatoonID][p_tName]);
			        SendAdminMessage(string);
			        SavePlatoon(PlatoonID);
			        return 1;
			    }
			    else if(PlayerInfo[playerid][pPlatoonEditState] == 2)
			    {
			        new PlatoonID = PlayerInfo[playerid][pPlatoonEditList];
					if(_FactionName[listitem][_fType] != 2)
				        for(new p_t = 1; p_t < MAX_PLATOON; p_t ++)
				            if(PlatoonInfo[p_t][p_tCountry] == PlatoonInfo[PlatoonID][p_tCountry])
								if(PlatoonInfo[p_t][p_tType] == _FactionName[listitem][_fType]){
								    SendErrorMessage(playerid, "�ϹݼҴ� �� �δ뿪���� �ٸ� �δ�� �ߺ��Ǹ� �� �˴ϴ�.");
								    new string[128];
							        PlayerInfo[playerid][pPlatoonEditState] = 2;
								    for(new p_i = 0; p_i < sizeof(_FactionName); p_i ++)
								    {
								        if(p_i == 0) {format(string, sizeof(string), "%s",_FactionName[p_i][_fName]); continue;}
										format(string, sizeof(string), "%s\n%s",string,_FactionName[p_i][_fName]);
								    }
							        ShowPlayerDialog(playerid, DIALOG_PLATOON_EDIT, DIALOG_STYLE_LIST, "�Ҵ�����", string, "Ȯ��","����"); return 0;}
				    new string[256];
			        PlatoonInfo[PlatoonID][p_tType] = _FactionName[listitem][_fType];
			        format(string, sizeof(string), "���� %s�Կ� ���� �Ҵ� ������ %s�� �ٲ�����ϴ�. [Name : %s]",PlayerInfo[playerid][pAdminName],_FactionName[listitem][_fName], PlatoonInfo[PlatoonID][p_tName]);
			        SendAdminMessage(string);
			        SavePlatoon(PlatoonID);
			        return 1;
			    }
			    else if(PlayerInfo[playerid][pPlatoonEditState] == 3)
			    {
					new number = strval(inputtext);
					for(new p_t = 1; p_t < MAX_PLATOON; p_t ++)
						if(PlatoonInfo[p_t][p_t_Number] == number){
							SendErrorMessage(playerid, "�̹� �� �Ҵ��ȣ�� ��ϵ� �Ҵ밡 �����մϴ�.");
							ShowPlayerDialog(playerid, DIALOG_PLATOON_EDIT, DIALOG_STYLE_INPUT, "�Ҵ�����", ""#C_GRAY"\t\t- �Ҵ����� -\n"#C_WHITE"�� �Ҵ��� �Ҵ��ȣ�� �����ֽ� �� 'Ȯ��'�� Ŭ�����ּ���", "Ȯ��","����"); return 0;}
					if(0 < number < 1000)
					{
				        new PlatoonID = PlayerInfo[playerid][pPlatoonEditList], string[256];
				        PlatoonInfo[PlatoonID][p_t_Number] = number;
				        format(string, sizeof(string), "���� %s�Կ� ���� �Ҵ� ��ȣ�� %d�� ����Ǿ����ϴ�. [Name : %s]",PlayerInfo[playerid][pAdminName],number, PlatoonInfo[PlatoonID][p_tName]);
				        SendAdminMessage(string);
				        SavePlatoon(PlatoonID);
					}
					else
					{
					    ShowPlayerDialog(playerid, DIALOG_PLATOON_EDIT, DIALOG_STYLE_INPUT, "�Ҵ�����", ""#C_GRAY"\t\t- �Ҵ����� -\n"#C_WHITE"�� �Ҵ��� �Ҵ��ȣ�� �����ֽ� �� 'Ȯ��'�� Ŭ�����ּ���", "Ȯ��","����");
					    SendErrorMessage(playerid, "�Ҵ� ��ȣ�� 1 ~ 999������ �����մϴ�.");
					}
					return 1;
			    }
			    else if(PlayerInfo[playerid][pPlatoonEditState] == 4)
			    {
			        new PlatoonID = PlayerInfo[playerid][pPlatoonEditList], string[256];
			        if(listitem == 0)
			            PlatoonInfo[PlatoonID][p_tCountry] = 1;
			        if(listitem == 1)
			            PlatoonInfo[PlatoonID][p_tCountry] = 2;
			        new country[52];
			        if(PlatoonInfo[PlatoonID][p_tCountry] == 1) strmid(country, "�̱�", 0, 52, 52);
					else if(PlatoonInfo[PlatoonID][p_tCountry] == 2) strmid(country, "���þ�", 0, 52, 52);
                    format(string, sizeof(string), "���� %s�Կ� ���� �Ҵ뱹���� %s(��)�� �����Ͽ����ϴ�. [Name : %s]",PlayerInfo[playerid][pAdminName],country, PlatoonInfo[PlatoonID][p_tName]);
			        SendAdminMessage(string);
			        SavePlatoon(PlatoonID);
			    }
			    else if(PlayerInfo[playerid][pPlatoonEditState] == -1)
			    {
			        if(listitem == 0)
				    {
				        PlayerInfo[playerid][pPlatoonEditState] = 1;
				        ShowPlayerDialog(playerid, DIALOG_PLATOON_EDIT, DIALOG_STYLE_INPUT, "�Ҵ�����", ""#C_GRAY"\t\t\t- �Ҵ� �̸����� -\n\n"#C_WHITE"�� �Ҵ��� ���ο� �̸��� ���Ͻ� �� 'Ȯ��'�� Ŭ�����ּ���.", "Ȯ��","����");
				    }
				    if(listitem == 1)
				    {
				        PlayerInfo[playerid][pPlatoonEditState] = 3;
				        ShowPlayerDialog(playerid, DIALOG_PLATOON_EDIT, DIALOG_STYLE_INPUT, "�Ҵ�����", ""#C_GRAY"\t\t- �Ҵ����� -\n"#C_WHITE"�� �Ҵ��� �Ҵ��ȣ�� �����ֽ� �� 'Ȯ��'�� Ŭ�����ּ���", "Ȯ��","����");
				    }
				    if(listitem == 2)
				    {
				        new string[128];
				        PlayerInfo[playerid][pPlatoonEditState] = 2;
					    for(new p_i = 0; p_i < sizeof(_FactionName); p_i ++)
					    {
					        if(p_i == 0) {format(string, sizeof(string), "%s",_FactionName[p_i][_fName]); continue;}
							format(string, sizeof(string), "%s\n%s",string,_FactionName[p_i][_fName]);
					    }
				        ShowPlayerDialog(playerid, DIALOG_PLATOON_EDIT, DIALOG_STYLE_LIST, "�Ҵ�����", string, "Ȯ��","����");
				    }
				    if(listitem == 3)
				    {
				        PlayerInfo[playerid][pPlatoonEditState] = 4;
					    ShowPlayerDialog(playerid, DIALOG_PLATOON_EDIT, DIALOG_STYLE_LIST, "�Ҵ�����", "�̱�\n���þ�", "Ȯ��","����");
				    }
			    }
			}
		}
		else
		{
		    if(PlayerInfo[playerid][pPlatoonEditList] == -1)
				OnPlayerCommandText(playerid, "/�Ҵ����");
			else
			{
                if(PlayerInfo[playerid][pPlatoonEditState] == -1)
                {
                    new Number = 1, string[512], country[52]; PlayerInfo[playerid][pPlatoonEditState] = -1; PlayerInfo[playerid][pPlatoonEditList] = -1;
					strmid(string, ""#C_GRAY"ID\tCountry\tType\t\tName"#C_WHITE"", 0, 512, 512);
					for(new p_t = 1; p_t < MAX_PLATOON; p_t ++)
					{
						PlayerInfo[playerid][pPlatoonEditNumber][Number] = -1; if(PlatoonInfo[p_t][p_tCreate] != 1) continue;
						if(PlatoonInfo[p_t][p_tCountry] == 1) strmid(country, "�̱�", 0, 52, 52);
						else if(PlatoonInfo[p_t][p_tCountry] == 2) strmid(country, "���þ�", 0, 52, 52);
						format(string, sizeof(string), "%s\n%d\t%s\t\t%s\t%s",string,PlatoonInfo[p_t][p_tNumber],country, _FactionName[PlatoonInfo[p_t][p_tType]-1][_fName],PlatoonInfo[p_t][p_tName]);
						PlayerInfo[playerid][pPlatoonEditNumber][Number] = p_t;
						Number++;
					}
					ShowPlayerDialog(playerid, DIALOG_PLATOON_EDIT, DIALOG_STYLE_LIST, "�Ҵ�����", string, "����", "����");
                }
                else{ PlayerInfo[playerid][pPlatoonEditState] = -1; ShowPlayerDialog(playerid, DIALOG_PLATOON_EDIT, DIALOG_STYLE_LIST, "�Ҵ�����", "�Ҵ� �̸�����\n�Ҵ� ��ȣ����\n�Ҵ� ���Һ���", "Ȯ��","����");}
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_PLATOON_CRE)
	{
	    if(response)
	    {
			if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
	        if(PlayerInfo[playerid][pPlatoonCre] == 1)
	        {
	            new number = strval(inputtext);
				for(new p_t = 1; p_t < MAX_PLATOON; p_t ++)
					if(PlatoonInfo[p_t][p_t_Number] == number){
						SendErrorMessage(playerid, "�̹� �� �Ҵ��ȣ�� ��ϵ� �Ҵ밡 �����մϴ�.");
						ShowPlayerDialog(playerid, DIALOG_PLATOON_CRE, DIALOG_STYLE_INPUT, "�Ҵ��߰�", ""#C_GRAY"\t\t\t- �Ҵ��߰� -\n"#C_WHITE"�� �Ҵ��� �Ҵ��ȣ�� �����ֽ� �� 'Ȯ��'�� Ŭ�����ּ���", "Ȯ��","����"); return 0;}
				if(0 < number < 1000)
				{
				    PlayerInfo[playerid][pPlatoonCre] = 2;
				    PlayerInfo[playerid][pPlatoonNumber] = number;
				    ShowPlayerDialog(playerid, DIALOG_PLATOON_CRE, DIALOG_STYLE_INPUT, "�Ҵ��߰�", ""#C_GRAY"\t\t\t- �Ҵ��߰� -\n"#C_WHITE"�߰��Ͻ� �Ҵ��� �Ҵ��̸��� ���� �� 'Ȯ��'�� Ŭ�����ּ���.", "Ȯ��","����");
				}
				else
				{
				    ShowPlayerDialog(playerid, DIALOG_PLATOON_CRE, DIALOG_STYLE_INPUT, "�Ҵ��߰�", ""#C_GRAY"\t\t\t- �Ҵ��߰� -\n"#C_WHITE"�� �Ҵ��� �Ҵ��ȣ�� �����ֽ� �� 'Ȯ��'�� Ŭ�����ּ���", "Ȯ��","����");
					SendErrorMessage(playerid, "�Ҵ� ��ȣ�� 1 ~ 999������ �����մϴ�.");
				}
				return 1;
	        }
	        else if(PlayerInfo[playerid][pPlatoonCre] == 2)
	        {
				if(strlen(inputtext))
				{
				    PlayerInfo[playerid][pPlatoonCre] = 3;
				    strmid(PlayerInfo[playerid][pPlatoonCreName], inputtext, 0, 128, 128);
				    ShowPlayerDialog(playerid, DIALOG_PLATOON_CRE, DIALOG_STYLE_LIST, "�Ҵ��߰�", "�̱�\n���þ�", "Ȯ��","����");
				}
				else
				{
				    PlayerInfo[playerid][pPlatoonCre] = 2;
					ShowPlayerDialog(playerid, DIALOG_PLATOON_CRE, DIALOG_STYLE_INPUT, "�Ҵ��߰�", ""#C_GRAY"\t\t\t- �Ҵ��߰� -\n"#C_WHITE"�߰��Ͻ� �Ҵ��� �Ҵ��̸��� ���� �� 'Ȯ��'�� Ŭ�����ּ���.", "Ȯ��","����");
				}
				return 1;
			}
			else if(PlayerInfo[playerid][pPlatoonCre] == 3)
	        {
	            new string[256];
	            if(listitem == 0)
	                PlayerInfo[playerid][pPlatoonCreContry] = 1;
				else if(listitem == 1)
				    PlayerInfo[playerid][pPlatoonCreContry] = 2;
				PlayerInfo[playerid][pPlatoonCre] = 4;
	            for(new pl = 0; pl < sizeof(_FactionName); pl ++)
			    {
			        if(pl == 0) {format(string, sizeof(string), "%s",_FactionName[pl][_fName]); continue;}
					format(string, sizeof(string), "%s\n%s",string,_FactionName[pl][_fName]);
			    }
                ShowPlayerDialog(playerid, DIALOG_PLATOON_CRE, DIALOG_STYLE_LIST, "�Ҵ��߰�", string, "Ȯ��","����");
	        }
			else if(PlayerInfo[playerid][pPlatoonCre] == 4)
			{
			    for(new p_t = 1; p_t < MAX_PLATOON; p_t ++)
			    {
			        if(_FactionName[listitem][_fType] != 2)
			    	{
				        if(PlatoonInfo[p_t][p_tCountry] == PlayerInfo[playerid][pPlatoonCreContry])
				        {
				            if(PlatoonInfo[p_t][p_tType] == _FactionName[listitem][_fType])
							{
				                SendErrorMessage(playerid, "�ϹݼҴ� �� �δ뿪���� �ٸ� �δ�� �ߺ��Ǹ� �� �˴ϴ�.");
							    new string[128];
						        PlayerInfo[playerid][pPlatoonCre] = 4;
							    for(new p_i = 0; p_i < sizeof(_FactionName); p_i ++)
							    {
							        if(p_i == 0) { format(string, sizeof(string), "%s",_FactionName[p_i][_fName]); continue; }
									format(string, sizeof(string), "%s\n%s",string,_FactionName[p_i][_fName]);
							    }
						        ShowPlayerDialog(playerid, DIALOG_PLATOON_CRE, DIALOG_STYLE_LIST, "�Ҵ��߰�", string, "Ȯ��","����");
								return 0;
							}
					    }
				    }
					if(PlatoonInfo[p_t][p_t_Number] == PlayerInfo[playerid][pPlatoonNumber])
					{
						return SendErrorMessage(playerid, "�Ҵ��ȣ�� �ٸ� �Ҵ�� ���� �Ҵ� ������ ��ҵǾ����ϴ�, �ٽ� �õ����ּ���.");
				    }
				}
				new string[256];
                if(CreatePlatoon(PlayerInfo[playerid][pPlatoonNumber], PlayerInfo[playerid][pPlatoonCreName], _FactionName[listitem][_fType], PlayerInfo[playerid][pPlatoonCreContry]) == 1)
                {
   					format(string, sizeof(string), "���� %s���� �Ҵ� �ϳ��� ��������ϴ�. [Name : %s] [Type : %s]",PlayerInfo[playerid][pAdminName],PlayerInfo[playerid][pPlatoonCreName], _FactionName[listitem][_fName]);
					SendAdminMessage(string);
				}
                else
                {
                    format(string, sizeof(string), "�� �̻� �Ҵ븦 �߰��� �� �����ϴ�.");
					SendErrorMessage(playerid, string);
				}
			    return 1;
			}
	    }
	    else
	    {
	        if(PlayerInfo[playerid][pPlatoonCre] == 1)
	            OnPlayerCommandText(playerid, "/�Ҵ����");
			else if(PlayerInfo[playerid][pPlatoonCre] == 2){
	            PlayerInfo[playerid][pPlatoonCre] = 1; ShowPlayerDialog(playerid, DIALOG_PLATOON_CRE, DIALOG_STYLE_INPUT, "�Ҵ��߰�", ""#C_GRAY"\t\t\t- �Ҵ��߰� -\n"#C_WHITE"�� �Ҵ��� �Ҵ��ȣ�� �����ֽ� �� 'Ȯ��'�� Ŭ�����ּ���", "Ȯ��","����");}
	        else if(PlayerInfo[playerid][pPlatoonCre] == 3){
	            PlayerInfo[playerid][pPlatoonCre] = 2; ShowPlayerDialog(playerid, DIALOG_PLATOON_CRE, DIALOG_STYLE_INPUT, "�Ҵ��߰�", ""#C_GRAY"\t\t\t- �Ҵ��߰� -\n"#C_WHITE"�߰��Ͻ� �Ҵ��� �Ҵ��̸��� ���� �� 'Ȯ��'�� Ŭ�����ּ���.", "Ȯ��","����");}
	    }
	    return 1;
	}
	if(dialogid == DIALOG_TAKE_WEAPON)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
	            new dropid = -1, string[256];
	            for(new w = 0; w < MAX_DROP_ITEM; w ++)
	            {
	                if(PlayerInfo[playerid][pTakeItem][w] == -1) return 0;//break;
	                dropid = PlayerInfo[playerid][pTakeItem][w];
	                if(!DropItemInfo[dropid][iCreate]) continue;

	                new number = 0, itemid = DropItemInfo[dropid][iItemID], index = ItemIDFind(playerid, DropItemInfo[dropid][iItemID]);
	                if(0 < DropItemInfo[dropid][iItemID] > 46)
					{
		                if(index != -1)
					    {
					        if(ItemInfo[itemid][_LimitNum] <= PlayerInfo[playerid][pI_Number][index]) return 0;
					        if(ItemInfo[itemid][_LimitNum] < (PlayerInfo[playerid][pI_Number][index] + DropItemInfo[dropid][iNumber]))
					            number = ItemInfo[itemid][_LimitNum] - PlayerInfo[playerid][pI_Number][index];
					        else number = DropItemInfo[dropid][iNumber];
					    }
					    else
					    {
						    if(ItemInfo[itemid][_LimitNum] < DropItemInfo[dropid][iNumber])
						    	number = ItemInfo[itemid][_LimitNum];
						    else number = DropItemInfo[dropid][iNumber];
					    }
					}
					else number = DropItemInfo[dropid][iNumber];

					GivePlayerItemEx(playerid, DropItemInfo[dropid][iItemID], number);
	                if(!strlen(string)) format(string, sizeof(string), "%s",DropItemInfo[dropid][iName]);
					else format(string, sizeof(string), "%s, %s",string,DropItemInfo[dropid][iName]);
	                DeleteDropItem(dropid, number);
	            }
			    format(string, sizeof(string), "/me %s�� �ݴ´�. [%d��]", string);
			    OnPlayerCommandText(playerid, string);
			    return 1;
	        }
	        if(listitem == 1)
	        {
	            new string[256];
				format(string, sizeof(string), ""#"{E0D674}""��� ȸ���ϱ�\n\n"#C_GRAY"Number\tItem Name");
				for(new DropItemID = 0; DropItemID < MAX_DROP_ITEM; DropItemID ++)
				{
				    if(PlayerInfo[playerid][pTakeItem][DropItemID] == -1) break;
				    if(DropItemInfo[DropItemID][iItemID] <= 0 || DropItemInfo[DropItemID][iNumber] <= 0) continue;
				    format(string, sizeof(string), "%s\n%d\t\t%s", string, DropItemInfo[DropItemID][iNumber], DropItemInfo[DropItemID][iName]);
				}
			    ShowPlayerDialog(playerid, DIALOG_TAKE_WEAPON, DIALOG_STYLE_LIST, "����ȸ��", string, "Ȯ��", "���");
	        }
	        else
	        {
				new dropid = PlayerInfo[playerid][pTakeItem][listitem - 2], number = 0, itemid = DropItemInfo[dropid][iItemID], index = ItemIDFind(playerid, DropItemInfo[dropid][iItemID]), string[128];
                if(0 < DropItemInfo[dropid][iItemID] > 46)
				{
					if(index != -1)
				    {
				        if(ItemInfo[itemid][_LimitNum] <= PlayerInfo[playerid][pI_Number][index]) return 0;
				        if(ItemInfo[itemid][_LimitNum] < (PlayerInfo[playerid][pI_Number][index] + DropItemInfo[dropid][iNumber]))
				            number = ItemInfo[itemid][_LimitNum] - PlayerInfo[playerid][pI_Number][index];
				        else number = DropItemInfo[dropid][iNumber];
				    }
				    else
				    {
					    if(ItemInfo[itemid][_LimitNum] < DropItemInfo[dropid][iNumber])
					    	number = ItemInfo[itemid][_LimitNum];
					    else number = DropItemInfo[dropid][iNumber];
				    }
				}
				else number = DropItemInfo[dropid][iNumber];

			    format(string, sizeof(string), "/me %s�� �ݴ´�. [%d��]", DropItemInfo[dropid][iName],number);
			    OnPlayerCommandText(playerid, string);
				GivePlayerItemEx(playerid, DropItemInfo[dropid][iItemID], number);
				DeleteDropItem(dropid, number);
	        }
	    }
	    else
	    {
	    }
	    return 1;
	}
	if(dialogid == DIALOG_PLAYERCLICK)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
	        new giveplayerid = PlayerInfo[playerid][pgClickID];
	        if(IsPlayerLogin(giveplayerid))
	        {
	            if(strcmp(PlayerInfo[playerid][pgClickName], PlayerNameEx(giveplayerid), true) == 0)
	            {
					new string[256];
			        if(listitem == 0)
			        {
                        new Float:gx,Float:gy,Float:gz,interior,virtualworld,VehicleID=-1;
						interior = GetPlayerInterior(giveplayerid);
						virtualworld = GetPlayerVirtualWorld(giveplayerid);
						GetPlayerFrontPos(giveplayerid, gx, gy, gz, 1.0);
						SetPlayerInteriorEx(playerid, interior);
						SetPlayerVirtualWorldEx(playerid, virtualworld);
						format(string, sizeof(string), "%s�Կ��� �ڷ���Ʈ �Ǿ����ϴ�. [INT : %d VirtualWorld : %d]",PlayerNameEx(giveplayerid), interior, virtualworld);
						SendMessage(playerid, string);
				        if(IsPlayerInAnyVehicle(playerid))
				        {
				            VehicleID = GetPlayerVehicleID(playerid);
							SetVehiclePos(VehicleID, gx, gy + 5, gz);
					    }
					    else SetPlayerPos(playerid,gx,gy, gz);
			        }
			        if(listitem == 1)
			        {
			            new Float:x,Float:y,Float:z,interior,virtualworld,VehicleID=-1;
			            interior = GetPlayerInterior(playerid);
						virtualworld = GetPlayerVirtualWorld(playerid);
						GetPlayerFrontPos(playerid, x, y, z, 1.0);
						SetPlayerInteriorEx(giveplayerid, interior);
						SetPlayerVirtualWorldEx(giveplayerid, virtualworld);
						format(string, sizeof(string), "%s�Կ��� �ڷ���Ʈ �Ǿ����ϴ�. [INT : %d VirtualWorld : %d]",PlayerNameEx(playerid), interior, virtualworld);
						SendMessage(giveplayerid, string);
				        if(IsPlayerInAnyVehicle(playerid))
				        {
				            VehicleID = GetPlayerVehicleID(giveplayerid);
							SetVehiclePos(VehicleID, x, y + 5, z);
					    }
					    else SetPlayerPos(giveplayerid,x, y, z);
			        }
			        if(listitem == 2)
			        {
			            ShowPlayerDialog(playerid, DIALOG_INFOEDIT, DIALOG_STYLE_LIST, "��������", "��������\n��������\n��޼���\n�Ҵ뼳��", "Ȯ��", "����");
			        }
			        return 1;
				}
				else
				{
				    SendErrorMessage(playerid, "���õ� �÷��̾��ȣ�� �̸��� ���� �ʽ��ϴ�. �ٽ� �õ����ּ���.");
				}
			}
			else
			{
			    SendErrorMessage(playerid, "���õ� �÷��̾�� ���� �α����� ���� �ʾҽ��ϴ�. �ٽ� �õ����ּ���.");
			}
	    }
	    else
	    {
	    }
	    return 1;
	}
	if(dialogid == DIALOG_INFOEDIT)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
	        new giveplayerid = PlayerInfo[playerid][pgClickID];
	        if(IsPlayerLogin(giveplayerid))
	        {
	            if(strcmp(PlayerInfo[playerid][pgClickName], PlayerNameEx(giveplayerid), true) == 0)
	            {
	                new string[256];
	                if(listitem == 0)
	                {
	                    if(PlayerInfo[giveplayerid][pSex] == 1)
	                    {
	                        PlayerInfo[giveplayerid][pSex] = 2;
	                        format(string, sizeof(string), "���� %s���� %s���� ������ �������� ���� �Ͽ����ϴ�.", PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid));
	                        SendAdminMessage(string);
	                        format(string, sizeof(string), "���� %s�Կ� ���� ������ �������� ���� �Ǿ����ϴ�.", PlayerInfo[playerid][pAdminName]);
	                        SendMessage(giveplayerid, string);
	                    }
	                    else if(PlayerInfo[giveplayerid][pSex] == 2)
	                    {
	                        PlayerInfo[giveplayerid][pSex] = 1;
	                        format(string, sizeof(string), "���� %s���� %s���� ������ �������� ���� �Ͽ����ϴ�.", PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid));
	                        SendAdminMessage(string);
	                        format(string, sizeof(string), "���� %s�Կ� ���� ������ �������� ���� �Ǿ����ϴ�.", PlayerInfo[playerid][pAdminName]);
	                        SendMessage(giveplayerid, string);
	                    }
	                    OnPlayerSpawn(giveplayerid);
	                }
	                if(listitem == 1)
	                {
	                    if(PlayerInfo[giveplayerid][pCountry] == 1)
	                    {
							ChangePlayerCountry(giveplayerid, 2);
	                        format(string, sizeof(string), "���� %s���� %s���� ������ ���þƷ� ���� �Ͽ����ϴ�.", PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid));
	                        SendAdminMessage(string);
	                        format(string, sizeof(string), "���� %s�Կ� ���� ����� ������ ���þƷ� ����Ǿ����ϴ�.", PlayerInfo[playerid][pAdminName]);
	                        SendMessage(giveplayerid, string);
	                    }
	                    else if(PlayerInfo[giveplayerid][pCountry] == 2)
	                    {
	                        ChangePlayerCountry(giveplayerid, 1);
	                        format(string, sizeof(string), "���� %s���� %s���� ������ �̱����� ���� �Ͽ����ϴ�.", PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid));
	                        SendAdminMessage(string);
	                        format(string, sizeof(string), "���� %s�Կ� ���� ����� ������ �̱����� ����Ǿ����ϴ�.", PlayerInfo[playerid][pAdminName]);
	                        SendMessage(giveplayerid, string);
	                    }
	                    OnPlayerSpawn(giveplayerid);
	                }
	                if(listitem == 2)
	                {
	                    for(new i = 0; i < MAX_CLASS; i ++)
	                    {
	                        if(i == 0) { format(string, sizeof(string), "%s",ArmyClass(i)); continue; }
	                        format(string, sizeof(string), "%s\n%s",string,ArmyClass(i));
	                    }
	                    ShowPlayerDialog(playerid, DIALOG_INFOEDIT_CLASS, DIALOG_STYLE_LIST, "��޼���", string, "Ȯ��", "����");
	                }
	                if(listitem == 3)
	                {
	                }
	                return 1;
	            }
	            else
				{
				    SendErrorMessage(playerid, "���õ� �÷��̾��ȣ�� �̸��� ���� �ʽ��ϴ�. �ٽ� �õ����ּ���.");
				}
			}
			else
			{
			    SendErrorMessage(playerid, "���õ� �÷��̾�� ���� �α����� ���� �ʾҽ��ϴ�. �ٽ� �õ����ּ���.");
			}
		}
		else
		{
		    ShowPlayerDialog(playerid, DIALOG_PLAYERCLICK, DIALOG_STYLE_LIST, PlayerNameEx(PlayerInfo[playerid][pgClickID]), "���\n��ȯ\n��������", "Ȯ��", "���");
		}
		return 1;
	}
	if(dialogid == DIALOG_INFOEDIT_CLASS)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
	        new giveplayerid = PlayerInfo[playerid][pgClickID];
	        if(IsPlayerLogin(giveplayerid))
	        {
	            if(strcmp(PlayerInfo[playerid][pgClickName], PlayerNameEx(giveplayerid), true) == 0)
	            {
	                new string[256];
	                SetPlayerClass(giveplayerid, listitem);
                    format(string, sizeof(string), "���� %s���� %s���� ����� %s�� ���� �Ͽ����ϴ�.", PlayerInfo[playerid][pAdminName], PlayerNameEx(giveplayerid), ArmyClass(listitem));
                    SendAdminMessage(string);
                    format(string, sizeof(string), "���� %s�Կ� ���� ����� %s�� ����Ǿ����ϴ�.", PlayerInfo[playerid][pAdminName], ArmyClass(listitem));
                    SendMessage(giveplayerid, string);
	            }
	            else
				{
				    SendErrorMessage(playerid, "���õ� �÷��̾��ȣ�� �̸��� ���� �ʽ��ϴ�. �ٽ� �õ����ּ���.");
				}
			}
			else
			{
			    SendErrorMessage(playerid, "���õ� �÷��̾�� ���� �α����� ���� �ʾҽ��ϴ�. �ٽ� �õ����ּ���.");
			}
	    }
	    else
	    {
	        ShowPlayerDialog(playerid, DIALOG_INFOEDIT, DIALOG_STYLE_LIST, "��������", "��������\n��������\n��޼���\n�Ҵ뼳��", "Ȯ��", "����");
	    }
	    return 1;
	}
	if(dialogid == DIALOG_INVENTORY)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
	            new string[512];
	            strmid(string, ""#C_GRAY"Number\tName"#C_WHITE"", 0, 512, 512);
	            for(new i = 0; i < MAX_INVENTORY; i ++)
	            {
	                if(PlayerInfo[playerid][pI_Number][i] > 0)
	                {
						format(string, sizeof(string), "%s\n%d\t\t%s",string, PlayerInfo[playerid][pI_Number][i], ItemInfo[PlayerInfo[playerid][pI_ItemID][i]][_ItemName] );
	                }
				}
				ShowPlayerDialog(playerid, DIALOG_INVENTORY, DIALOG_STYLE_LIST, "����", string, "Ȯ��", "���");
	        }
	        else
	        {
	            new string[256];
	            PlayerInfo[playerid][pI_Select] = listitem - 1;
	            PlayerInfo[playerid][pI_SelectCheck] = PlayerInfo[playerid][pI_ItemID][PlayerInfo[playerid][pI_Select]];
	            format(string, sizeof(string), ""#C_GRAY"[��ǰ�� %s ���� %d]"#C_WHITE"\n�����ۻ��\n�����۹�����",ItemInfo[PlayerInfo[playerid][pI_ItemID][PlayerInfo[playerid][pI_Select]]][_ItemName],
				PlayerInfo[playerid][pI_Number][PlayerInfo[playerid][pI_Select]]);
	            ShowPlayerDialog(playerid, DIALOG_INVENTORY_USE, DIALOG_STYLE_LIST, "����", string, "Ȯ��", "����");
	        }
	    }
	    else
	    {
	    }
	    return 1;
	}
	if(dialogid == DIALOG_INVENTORY_USE)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pI_ItemID][PlayerInfo[playerid][pI_Select]] != PlayerInfo[playerid][pI_SelectCheck]) return SendErrorMessage(playerid, MessageText[15]);
	        if(listitem == 0)
	        {
	            new string[256]; format(string, sizeof(string), ""#C_GRAY"[��ǰ�� %s ���� %d]"#C_WHITE"\n�����ۻ��\n�����۹�����",ItemInfo[PlayerInfo[playerid][pI_ItemID][PlayerInfo[playerid][pI_Select]]][_ItemName],
				PlayerInfo[playerid][pI_Number][PlayerInfo[playerid][pI_Select]]);
	            ShowPlayerDialog(playerid, DIALOG_INVENTORY_USE, DIALOG_STYLE_LIST, "����", string, "Ȯ��", "����");
	        }
			if(listitem == 1)
			{
			    new select = PlayerInfo[playerid][pI_Select];
			    if(PlayerInfo[playerid][pI_Number][select] > 0)
			    {
				    switch(PlayerInfo[playerid][pI_ItemID][select])
				    {
						case 47 :
						{
							new string[512], str[128], Number = 0, Float:gx, Float:gy, Float:gz;
							strmid(string, ""#C_GRAY"�÷��̾� ��ȣ\t�̸�"#C_WHITE"", 0, 512, 512);
							format(str, sizeof(str), "���� %d��",PlayerInfo[playerid][pI_Number][select]);
							for(new i = 0; i < MAX_PLAYERS; i ++)
							{
							    PlayerInfo[playerid][pgMorphine][Number] = -1;
								if(IsPlayerConnected(i) && IsPlayerLogin(i))
								{
								    if(PlayerInfo[i][pAdminWork] == 1) continue;
								    if(PlayerInfo[i][pDie] == 2)
								    {
								        GetPlayerPos(i, gx, gy, gz);
								        if(IsPlayerInRangeOfPoint(playerid, 2.5, gx, gy, gz))
								        {
											format(string, sizeof(string), "%s\n%d\t\t%s",string,i,PlayerNameEx(i));
									        PlayerInfo[playerid][pgMorphine][Number] = i;
											Number ++;
										}
								    }
								}
							}
							ShowPlayerDialog(playerid, DIALOG_MORPHINE, DIALOG_STYLE_LIST, str, string, "Ȯ��", "����");
						}
						case 48 : //�˾�
						{
						    if(PlayerInfo[playerid][pPillEat] == 1) { new string[128]; format(string, sizeof(string), "�ٽ� �õ����ּ���. [%d��]",PlayerInfo[playerid][pPillTimer]); SendErrorMessage(playerid, string); return 0; }
						    new Float:health;
						    GetPlayerHealth(playerid, health);
						    if(health >= 100) return SendErrorMessage(playerid, "�� �̻� ü���� ȸ���� �� �����ϴ�.");
						    SetTimerEx("PillEatTimer", 1000, false, "df", playerid,PILLHEALTH);
						    PlayerInfo[playerid][pPillEat] = 1;
						    PlayerInfo[playerid][pPillTimer] = 10;
						    RemoveItemEx(playerid, 48, 1);
							ApplyAnimation(playerid, "VENDING", "VEND_Drink_P", 4.0, 0, 1, 1, 1000, 1);
					    }
					    case 49 : //������
					    {
					        PlayerInfo[playerid][pPhoneTakeMode] = 0;
					        new string[128];
					        format(string, sizeof(string), "���� ���ļ� : %d\n"#C_RED" > "#C_WHITE"��ȭ�ϱ�\n"#C_RED"> "#C_WHITE"���ļ� ����", PlayerInfo[playerid][pPhoneFrequency]);
					        ShowPlayerDialog(playerid, DIALOG_PHONE_TALK, DIALOG_STYLE_LIST, "������", string, "Ȯ��", "���");
					    }
					    case 50 : //C4
					    {
					        OnPlayerCommandText(playerid, "/��ź��ġ");
					    }
					    case 51 : //����ź��
					    {

					    }
					    case 52 : //���
					    {
							OnPlayerCommandText(playerid, "/���");
					    }
					    case 53 : //����
					    {
                            OnPlayerCommandText(playerid, "/����");
					    }
				    }
				}
				else
				{
					PlayerInfo[playerid][pI_ItemID][select] = 0;
					PlayerInfo[playerid][pI_Number][select] = 0;
				}
			}
			if(listitem == 2)
			{
			    new string[128]; format(string, sizeof(string), "%s ������ [���� %d��]",ItemInfo[PlayerInfo[playerid][pI_ItemID][PlayerInfo[playerid][pI_Select]]][_ItemName],
				PlayerInfo[playerid][pI_Number][PlayerInfo[playerid][pI_Select]]);
			    ShowPlayerDialog(playerid, DIALOG_INVENTORY_DELETE, DIALOG_STYLE_INPUT, string, ""#C_GRAY"\t\t - ������ ������ - \n\n"#C_WHITE"������ ������ �����ֽ� �� 'Ȯ��'�� Ŭ�����ּ���.", "Ȯ��", "����");
			}
		}
		else
		{
            OnPlayerKeyStateChange(playerid, KEY_YES, -1);
		}
		return 1;
	}
	if(dialogid == DIALOG_INVENTORY_DELETE)
	{
		if(response)
		{
		    if(PlayerInfo[playerid][pI_ItemID][PlayerInfo[playerid][pI_Select]] != PlayerInfo[playerid][pI_SelectCheck]) return SendErrorMessage(playerid, MessageText[15]);
		    new Number = strval(inputtext);
		    if(0 < Number <= PlayerInfo[playerid][pI_Number][PlayerInfo[playerid][pI_Select]])
		        DropPlayerItem(playerid, PlayerInfo[playerid][pI_ItemID][PlayerInfo[playerid][pI_Select]], Number);
		    else
		    {
		        new string[128]; format(string, sizeof(string), "%s ������ [���� %d��]",ItemInfo[PlayerInfo[playerid][pI_ItemID][PlayerInfo[playerid][pI_Select]]][_ItemName],
				PlayerInfo[playerid][pI_Number][PlayerInfo[playerid][pI_Select]]);
			    ShowPlayerDialog(playerid, DIALOG_INVENTORY_DELETE, DIALOG_STYLE_INPUT, string, ""#C_GRAY"\t\t - ������ ������ - \n\n"#C_WHITE"������ ������ �����ֽ� �� 'Ȯ��'�� Ŭ�����ּ���.", "Ȯ��", "����");
				format(string, sizeof(string), "1�� �̻� %d�� ���� ���� �� �ֽ��ϴ�.",PlayerInfo[playerid][pI_Number][PlayerInfo[playerid][pI_Select]]);
				SendErrorMessage(playerid, string);
			}
		}
		else
		{
		    new string[128];
		    format(string, sizeof(string), ""#C_GRAY"[��ǰ�� %s ���� %d]"#C_WHITE"\n�����ۻ��\n�����۹�����",ItemInfo[PlayerInfo[playerid][pI_ItemID][PlayerInfo[playerid][pI_Select]]][_ItemName],
			PlayerInfo[playerid][pI_Number][PlayerInfo[playerid][pI_Select]]);
            ShowPlayerDialog(playerid, DIALOG_INVENTORY_USE, DIALOG_STYLE_LIST, "����", string, "Ȯ��", "����");
		}
		return 1;
	}
	if(dialogid == DIALOG_MORPHINE)
	{
	    if(response)
	    {
	        /*
	        for(new i = 0; i < MAX_INVENTORY; i ++)
	            if(PlayerInfo[playerid][pI_ItemID][i] == 47 && PlayerInfo[playerid][pI_Number][i] > 0) break;
	            else if(i == MAX_INVENTORY - 1) return SendErrorMessage(playerid, "������ �����ϰ� ���� �ʽ��ϴ�.");
	        */
	        if(listitem == 0)
	        {
	            new string[512], str[128], Number = 0, Float:gx, Float:gy, Float:gz;
				strmid(string, ""#C_GRAY"�÷��̾� ��ȣ\t�̸�"#C_WHITE"", 0, 512, 512);
				for(new i = 0; i < MAX_PLAYERS; i ++)
				{
				    PlayerInfo[playerid][pgMorphine][Number] = -1;
					if(IsPlayerConnected(i) && IsPlayerLogin(i))
					{
					    if(PlayerInfo[i][pAdminWork] == 1) continue;
					    if(PlayerInfo[i][pDie] == 2)
					    {
					        GetPlayerPos(i, gx, gy, gz);
					        if(IsPlayerInRangeOfPoint(playerid, 2.5, gx, gy, gz))
					        {
								format(string, sizeof(string), "%s\n%d\t\t%s",string,i,PlayerNameEx(i));
						        PlayerInfo[playerid][pgMorphine][Number] = i;
								Number ++;
							}
					    }
					}
				}
				ShowPlayerDialog(playerid, DIALOG_MORPHINE, DIALOG_STYLE_LIST, str, string, "Ȯ��", "����");
	        }
	        else
	        {
	            new giveplayerid = PlayerInfo[playerid][pgMorphine][listitem - 1], string[52];
	            format(string, sizeof(string), "/���� %d",giveplayerid);
	            OnPlayerCommandText(playerid, string);
	        }
	    }
	    else
	    {
	    }
	    return 1;
	}
	if(dialogid == DIALOG_PHONE_TALK)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pPhoneTakeMode] == 0)
	        {
				if(listitem == 0)
				{
				    PlayerInfo[playerid][pPhoneTakeMode] = 0;
				    new string[128];
			        format(string, sizeof(string), "���� ���ļ� : %d\n"#C_RED" > "#C_WHITE"��ȭ�ϱ�\n"#C_RED"> "#C_WHITE"���ļ� ����", PlayerInfo[playerid][pPhoneFrequency]);
			        ShowPlayerDialog(playerid, DIALOG_PHONE_TALK, DIALOG_STYLE_LIST, "������", string, "Ȯ��", "���");
				}
				if(listitem == 1)
				{
				    PlayerInfo[playerid][pPhoneTakeMode] = 1;
				    ShowPlayerDialog(playerid, DIALOG_PHONE_TALK, DIALOG_STYLE_LIST, "������", "", "Ȯ��", "����");
				}
				if(listitem == 2)
				{
				    PlayerInfo[playerid][pPhoneTakeMode] = 2;
				    ShowPlayerDialog(playerid, DIALOG_PHONE_TALK, DIALOG_STYLE_LIST, "������", "", "Ȯ��", "����");
				}
				return 1;
			}
			else if(PlayerInfo[playerid][pPhoneTakeMode] == 1)
			{
			    new string[128];
			    PlayerInfo[playerid][pPhoneTakeMode] = 0;
			    format(string, sizeof(string), "/z %s",inputtext);
			    OnPlayerCommandText(playerid, string);
			}
			else if(PlayerInfo[playerid][pPhoneTakeMode] == 2)
			{
				new num = strval(inputtext);
			    new string[128];
			    PlayerInfo[playerid][pPhoneTakeMode] = 0;
			    format(string, sizeof(string), "/���ļ� %d",num);
			    OnPlayerCommandText(playerid, string);
			}
	    }
	    else
	    {
	    }
	    return 1;
	}
	if(dialogid == DIALOG_ARME)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pPlatoon] == 0) return SendErrorMessage(playerid, "�Ҵ밡���� �Ǿ����� �ʽ��ϴ�.");
			if(listitem == 0)
			{
			    if(PlayerInfo[playerid][pWork] == 0)
			    {
					PlayerInfo[playerid][pWork] = 1;
					ResetPlayerWeaponsEx(playerid);
					if(PlayerInfo[playerid][pPlatoonType] == 1)
					{
					    if(PlayerInfo[playerid][pCountry] == 1)
					    {
							GivePlayerWeaponEx(playerid, 31, 250);
				        }
				        if(PlayerInfo[playerid][pCountry] == 2)
					    {
							GivePlayerWeaponEx(playerid, 30, 250);
				        }
					}
					else if(PlayerInfo[playerid][pPlatoonType] == 2)
					{
					    if(PlayerInfo[playerid][pCountry] == 1)
					    {
							GivePlayerWeaponEx(playerid, 31, 400);
				        }
				        if(PlayerInfo[playerid][pCountry] == 2)
					    {
							GivePlayerWeaponEx(playerid, 30, 400);
				        }
					}
					else if(PlayerInfo[playerid][pPlatoonType] == 3)
					{
					    if(PlayerInfo[playerid][pCountry] == 1)
					    {
							GivePlayerWeaponEx(playerid, 31, 400);
							GivePlayerWeaponEx(playerid, 22, 60);
				        }
				        if(PlayerInfo[playerid][pCountry] == 2)
					    {
							GivePlayerWeaponEx(playerid, 30, 400);
							GivePlayerWeaponEx(playerid, 22, 60);
				        }
					}
					else if(PlayerInfo[playerid][pPlatoonType] == 4)
					{
					    if(PlayerInfo[playerid][pCountry] == 1)
					    {
							GivePlayerWeaponEx(playerid, 34, 50);
							GivePlayerWeaponEx(playerid, 29, 90);
							if(PlayerInfo[playerid][pClass] >= 10) {} else GivePlayerWeaponEx(playerid, 23, 50);
				        }
				        if(PlayerInfo[playerid][pCountry] == 2)
					    {
					        GivePlayerWeaponEx(playerid, 34, 50);
							GivePlayerWeaponEx(playerid, 29, 90);
							if(PlayerInfo[playerid][pClass] >= 10) {} else GivePlayerWeaponEx(playerid, 23, 50);
				        }
					}
					else if(PlayerInfo[playerid][pPlatoonType] == 5)
					{
					    if(PlayerInfo[playerid][pCountry] == 1)
					    {
							GivePlayerWeaponEx(playerid, 29, 400);
							if(PlayerInfo[playerid][pClass] >= 10) {} else GivePlayerWeaponEx(playerid, 22, 60);
				        }
				        if(PlayerInfo[playerid][pCountry] == 2)
					    {
							GivePlayerWeaponEx(playerid, 29, 400);
							if(PlayerInfo[playerid][pClass] >= 10) {} else GivePlayerWeaponEx(playerid, 22, 60);
				        }
					}
					else if(PlayerInfo[playerid][pPlatoonType] == 6)
					{
					    if(PlayerInfo[playerid][pCountry] == 1)
					    {
							GivePlayerWeaponEx(playerid, 31, 250);
							if(PlayerInfo[playerid][pClass] >= 10) {} else GivePlayerWeaponEx(playerid, 24, 28);
				        }
				        if(PlayerInfo[playerid][pCountry] == 2)
					    {
							GivePlayerWeaponEx(playerid, 30, 250);
							if(PlayerInfo[playerid][pClass] >= 10) {} else GivePlayerWeaponEx(playerid, 24, 28);
				        }
					}
					if(PlayerInfo[playerid][pClass] >= 4)
					{
					    GivePlayerWeaponEx(playerid, 4, 1);
					}
					if(PlayerInfo[playerid][pClass] >= 5)
					{
					    GivePlayerWeaponEx(playerid, 33, 15);
					}
					if(PlayerInfo[playerid][pClass] >= 10)
					{
					    GivePlayerWeaponEx(playerid, 24, 28);
					}
					SetPlayerHealthEx(playerid, 100.0);
				    SetPlayerArmourEx(playerid, 100.0);
					SendMessage(playerid, "������ �Ͽ����ϴ�.");
				}
				else if(PlayerInfo[playerid][pWork] == 1)
				{
				    SetPlayerHealthEx(playerid, 50.0);
				    SetPlayerArmourEx(playerid, 0.0);
				    PlayerInfo[playerid][pWork] = 0;
				    SendMessage(playerid, "������ �����Ͽ����ϴ�.");
				    ResetPlayerWeaponsEx(playerid);
				}
			}
			if(listitem == 1)
			{
			    ShowPlayerDialog(playerid, DIALOG_ARME_CLOTHES, DIALOG_STYLE_LIST, "ȯ��", "����\n�纹", "Ȯ��", "����");
			}
	    }
	    else
	    {
	    }
	    return 1;
	}
	if(dialogid == DIALOG_ARME_CLOTHES)
	{
		if(response)
		{
		    if(listitem == 0)
		    {
				if(PlayerInfo[playerid][pCountry] == 1)
					if(PlayerInfo[playerid][pPlatoonType] == 1 || PlayerInfo[playerid][pPlatoonType] == 2 || PlayerInfo[playerid][pPlatoonType] == 3)
						if(PlayerInfo[playerid][pSex] == 1) SetPlayerSkinEx(playerid, 285); else SetPlayerSkinEx(playerid, 287);
				    else if(PlayerInfo[playerid][pPlatoonType] == 4)
				        SetPlayerSkinEx(playerid, 29);
				    else if(PlayerInfo[playerid][pPlatoonType] == 5)
				        SetPlayerSkinEx(playerid, 163);
				    else if(PlayerInfo[playerid][pPlatoonType] == 6)
				        SetPlayerSkinEx(playerid, 61);
				if(PlayerInfo[playerid][pCountry] == 2)
				    if(PlayerInfo[playerid][pPlatoonType] == 1 || PlayerInfo[playerid][pPlatoonType] == 2 || PlayerInfo[playerid][pPlatoonType] == 3)
						if(PlayerInfo[playerid][pSex] == 1) SetPlayerSkinEx(playerid, 287); else SetPlayerSkinEx(playerid, 192);
				    else if(PlayerInfo[playerid][pPlatoonType] == 4)
				        SetPlayerSkinEx(playerid, 98);
				    else if(PlayerInfo[playerid][pPlatoonType] == 5)
				        SetPlayerSkinEx(playerid, 164);
				    else if(PlayerInfo[playerid][pPlatoonType] == 6)
				        SetPlayerSkinEx(playerid, 255);
		    }
		    if(listitem == 1)
		    {
		        if(PlayerInfo[playerid][pCountry] == 1)
		            if(PlayerInfo[playerid][pSex] == 1)
		                SetPlayerSkinEx(playerid, 60);
		            else if(PlayerInfo[playerid][pSex] == 2)
		                SetPlayerSkinEx(playerid, 250);
		        if(PlayerInfo[playerid][pCountry] == 2)
		            if(PlayerInfo[playerid][pSex] == 1)
		                SetPlayerSkinEx(playerid, 91);
		            else if(PlayerInfo[playerid][pSex] == 2)
		                SetPlayerSkinEx(playerid, 85);
		    }
		}
		else
		{
		    new string[128];
			format(string, sizeof(string), ""#C_RED"> "#C_WHITE"����\n"#C_RED"> "#C_WHITE"ȯ��");
            ShowPlayerDialog(playerid, DIALOG_ARME, DIALOG_STYLE_LIST, "�����", string, "Ȯ��", "���");
		}
		return 1;
	}
	if(dialogid == DIALOG_PRODUCT)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4) return SendErrorMessage(playerid, "���� ������ �����Ͽ� �۾��� ��ҵǾ����ϴ�.");
	        if(PlayerInfo[playerid][pProductEdit] == 0)
	        {
		        if(listitem == 0)
		        {
		            for(new i = 0; i < MAX_PRODUCT; i ++)
					{
					    if(!ProductInfo[i][p_dCreate])
							break;
						else if(i == MAX_PRODUCT -1) return SendErrorMessage(playerid, "�� �̻� ��ǰ�� �߰��� �� �����ϴ�.");
				    }
		            ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_LIST, "��ǰ����", ""#C_RED"> "#C_WHITE"����\n"#C_RED"> "#C_WHITE"������\n"#C_RED"> "#C_WHITE"C4\n"#C_RED"> "#C_WHITE"�˾�\n"#C_RED"> "#C_WHITE"����ź��\n"#C_RED"> "#C_WHITE"���\n"#C_RED"> "#C_WHITE"����", "Ȯ��", "����");
		            PlayerInfo[playerid][pProductEdit] = 1;
		        }
		        if(listitem == 1)
		        {
					new string[512], number = 0;
					strmid(string, "��ȣ\t��ǰ��ȣ\t����\t��ǰ�̸�", 0, 512, 512);
		            for(new i = 0; i < MAX_PRODUCT; i ++)
		            {
		                PlayerInfo[playerid][pProductNumber][number] = -1;
		                if(ProductInfo[i][p_dCreate] == 1)
		                {
		                	format(string, sizeof(string), "%s\n%d\t%d\t\t%d$\t%s",string, ProductInfo[i][p_dNumber], ProductInfo[i][p_dObjectID], ProductInfo[i][p_dMoney], ObjectNameEx(ProductInfo[i][p_dObjectID]));
                            PlayerInfo[playerid][pProductNumber][number] = i;
                            number++;
						}
		            }
		            ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_LIST, "��ǰ����", string, "Ȯ��", "����");
		            PlayerInfo[playerid][pProductEdit] = 2;
		        }
		        if(listitem == 2)
		        {
		            new string[512], number = 0;
					strmid(string, "��ȣ\t��ǰ��ȣ\t����\t��ǰ�̸�", 0, 512, 512);
		            for(new i = 0; i < MAX_PRODUCT; i ++)
		            {
		                PlayerInfo[playerid][pProductNumber][number] = -1;
		                if(ProductInfo[i][p_dCreate] == 1)
		                {
		                	format(string, sizeof(string), "%s\n%d\t%d\t\t%d$\t%s",string, ProductInfo[i][p_dNumber], ProductInfo[i][p_dObjectID], ProductInfo[i][p_dMoney], ObjectNameEx(ProductInfo[i][p_dObjectID]));
                            PlayerInfo[playerid][pProductNumber][number] = i;
                            number++;
						}
		            }
		            PlayerInfo[playerid][pProductEdit] = 3;
		            ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_LIST, "��ǰ����", string, "Ȯ��", "����");
		        }
			}
			else if(PlayerInfo[playerid][pProductEdit] == 1)//����
			{
			    new objectid;
			    if(listitem == 0) objectid = 1580;
			    if(listitem == 1) objectid = 330;
			    if(listitem == 2) objectid = 1252;
			    if(listitem == 3) objectid = 2709;
			    if(listitem == 4) objectid = 2041;
			    if(listitem == 5) objectid = 1485;
			    if(listitem == 6) objectid = 1546;
			    PlayerInfo[playerid][pProductOjbectID] = objectid;
			    PlayerInfo[playerid][pProductEdit] = 4;
			    ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_INPUT, "��ǰ����", ""#C_WHITE"�� ��ǰ�� ������ �������ּ���.", "Ȯ��", "����");
			}
			else if(PlayerInfo[playerid][pProductEdit] == 2)//����
			{
			    if(listitem == 0)
			    {
			        new string[512], number = 0;
					strmid(string, "��ȣ\t��ǰ��ȣ\t����\t��ǰ�̸�", 0, 512, 512);
		            for(new i = 0; i < MAX_PRODUCT; i ++)
		            {
		                PlayerInfo[playerid][pProductNumber][number] = -1;
		                if(ProductInfo[i][p_dCreate] == 1)
		                {
		                	format(string, sizeof(string), "%s\n%d\t%d\t\t%d$\t%s",string, ProductInfo[i][p_dNumber], ProductInfo[i][p_dObjectID], ProductInfo[i][p_dMoney], ObjectNameEx(ProductInfo[i][p_dObjectID]));
                            PlayerInfo[playerid][pProductNumber][number] = i;
						}
		            }
		            PlayerInfo[playerid][pProductEdit] = 2;
		            ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_LIST, "��ǰ����", string, "Ȯ��", "����");
		            return 1;
			    }
			    else
			    {
			        PlayerInfo[playerid][pProductEdit] = 5;
			    	PlayerInfo[playerid][pProductNumber_] = PlayerInfo[playerid][pProductNumber][listitem - 1];
			    	ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_LIST, "��ǰ����", "��ǰ����\n���ݺ���\n��ġ����", "Ȯ��", "����");
			    }
			}
			else if(PlayerInfo[playerid][pProductEdit] == 3)//��ǰ����
			{
			    if(listitem == 0)
			    {
			        new string[512], number = 0;
					strmid(string, "��ȣ\t��ǰ��ȣ\t����\t��ǰ�̸�", 0, 512, 512);
		            for(new i = 0; i < MAX_PRODUCT; i ++)
		            {
		                PlayerInfo[playerid][pProductNumber][number] = -1;
		                if(ProductInfo[i][p_dCreate] == 1)
		                {
		                	format(string, sizeof(string), "%s\n%d\t%d\t\t%d$\t%s",string, ProductInfo[i][p_dNumber], ProductInfo[i][p_dObjectID], ProductInfo[i][p_dMoney], ObjectNameEx(ProductInfo[i][p_dObjectID]));
                            PlayerInfo[playerid][pProductNumber][number] = i;
						}
		            }
		            PlayerInfo[playerid][pProductEdit] = 3;
		            ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_LIST, "��ǰ����", string, "Ȯ��", "����");
		            return 1;
			    }
			    else
			    {
			        new id = PlayerInfo[playerid][pProductNumber][listitem - 1];
			        new string[128];
			    	format(string, sizeof(string), "��ǰ�� ���� �Ǿ����ϴ�. [�̸� : %s] [��ȣ : %d]", ObjectNameEx(ProductInfo[id][p_dObjectID]),ProductInfo[id][p_dNumber]);
			    	SendMessage(playerid, string);
			    	
           			DeleteProduct(ProductInfo[id][p_dNumber]);
			    }
			}
			else if(PlayerInfo[playerid][pProductEdit] == 4)//����Ȯ��
			{
				new money = strval(inputtext);
				if(0 < money <= 500)
				{
				    new name[52], Float:pos[3], string[256];
				    GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
				    
				    for(new i = 0, l = sizeof(ItemInfo); i < l; i ++)
				    {
				    	if(ItemInfo[i][_ModelID] == PlayerInfo[playerid][pProductOjbectID])
				    	{
				    	    strmid(name, ItemInfo[i][_ItemName], 0, 52, 52);
				    	    break;
				    	}
				    	else if(i == l -1) return SendErrorMessage(playerid, "��ǰ ���� ������ �߻� �Ͽ����ϴ�. �����ڵ� : 1000");
					}
					format(string, sizeof(string), "��ǰ �ϳ��� ���� �Ͽ����ϴ�. [�̸� : %d] [���� : %d$]",name,money);

					if(CreateProduct(PlayerInfo[playerid][pProductOjbectID], money, pos[0], pos[1], pos[2]) == 1) SendMessage(playerid, string);
					else return SendErrorMessage(playerid, "�� �̻� ��ǰ�� �߰��� �� �����ϴ�.");
				}
				else return SendErrorMessage(playerid, "������ 1~500$���� ���� �����մϴ�.");
			}
			else if(PlayerInfo[playerid][pProductEdit] == 5)
			{
			    if(listitem == 0)
			    {
			        PlayerInfo[playerid][pProductEdit] = 6;
			        ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_LIST, "��ǰ����", ""#C_RED"> "#C_WHITE"����\n"#C_RED"> "#C_WHITE"������\n"#C_RED"> "#C_WHITE"C4\n"#C_RED"> "#C_WHITE"�˾�\n"#C_RED"> "#C_WHITE"����ź��\n"#C_RED"> "#C_WHITE"���\n"#C_RED"> "#C_WHITE"����", "Ȯ��", "����");
			    }
			    if(listitem == 1)
			    {
			        PlayerInfo[playerid][pProductEdit] = 7;
			        new string[128];
			        format(string, sizeof(string), "\t"#C_GRAY"- %s ���ݺ��� -\n"#C_WHITE"���Ͻô� ��ǰ�� ������ �������ּ���.");
			        ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_INPUT, "���ݺ���", string, "Ȯ��", "����");
			    }
			    if(listitem == 2)
			    {
					new Float:x,Float:y,Float:z; GetPlayerPos(playerid, x, y, z);
			    	ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dPos][0] = x;
			    	ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dPos][1] = y;
			    	ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dPos][2] = z;
			    	
			    	new string[128];
			    	format(string, sizeof(string), "��ǰ�� ��ġ�� ���� �Ǿ����ϴ�. [�̸� : %s] [%.2f,%.2f,%.2f]",
					ObjectNameEx(ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dObjectID]),
					
                    ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dPos][0],
                    ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dPos][1],
                    ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dPos][2]);
                    
                    DestroyPickup(ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dPickup]);
                    ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dPickup] = CreatePickup(ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dObjectID],1,ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dPos][0],ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dPos][1],ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dPos][2],0);
                    
			    	SendMessage(playerid, string);
			        SaveProduct(ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dNumber]);
			    }
			}
			else if(PlayerInfo[playerid][pProductEdit] == 6)//�����ۺ���
			{
			    new objectid, string[128];
			    if(listitem == 0) objectid = 1580;
			    if(listitem == 1) objectid = 330;
			    if(listitem == 2) objectid = 1252;
			    if(listitem == 3) objectid = 2709;
			    if(listitem == 4) objectid = 2041;
			    if(listitem == 5) objectid = 1485;
			    if(listitem == 6) objectid = 1546;
			    
			    format(string, sizeof(string), "��ǰ�� %s�� ���� �Ǿ����ϴ�. [��ȣ : %d]",ObjectNameEx(ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dObjectID]), ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dNumber]);
			    SendMessage(playerid, string);
			    
				ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dObjectID] = objectid;
				
				DestroyPickup(ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dPickup]);
    			ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dPickup] = CreatePickup(ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dObjectID],1,ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dPos][0],ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dPos][1],ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dPos][2],0);
				
				SaveProduct(ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dNumber]);
			}
			else if(PlayerInfo[playerid][pProductEdit] == 7)//���ݺ���
			{
			    new price = strval(inputtext);
				if(0 < price <= 500)
				{
				    new string[256];
				    format(string, sizeof(string), "��ǰ ������ %d$�� ���� �Ǿ����ϴ�. [�̸� : %d] [���� : %d$]",ObjectNameEx(ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dObjectID]),price);
				    SendMessage(playerid, string);
				    ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dMoney] = price;
				    SaveProduct(ProductInfo[PlayerInfo[playerid][pProductNumber_]][p_dNumber]);
				}
				else
				{
				    PlayerInfo[playerid][pProductEdit] = 7;
			        new string[128];
			        format(string, sizeof(string), "\t"#C_GRAY"- %s ���ݺ��� -\n"#C_WHITE"���Ͻô� ��ǰ�� ������ �������ּ���.");
			        ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_INPUT, "���ݺ���", string, "Ȯ��", "����");
			        SendErrorMessage(playerid, "������ 1~500$���� ���� �����մϴ�.");
				}
			}
			return 1;
	    }
	    else
	    {
	        if(PlayerInfo[playerid][pProductEdit] == 0) return 1;
	        if(0 < PlayerInfo[playerid][pProductEdit] <= 3)
	            OnPlayerCommandText(playerid, "/��ǰ����");
	        else if(PlayerInfo[playerid][pProductEdit] == 4)
	        {
	            for(new i = 0; i < MAX_PRODUCT; i ++)
				{
				    if(!ProductInfo[i][p_dCreate])
						break;
					else if(i == MAX_PRODUCT -1) return SendErrorMessage(playerid, "�� �̻� ��ǰ�� �߰��� �� �����ϴ�.");
			    }
	            ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_LIST, "��ǰ����", ""#C_RED"> "#C_WHITE"����\n"#C_RED"> "#C_WHITE"������\n"#C_RED"> "#C_WHITE"C4\n"#C_RED"> "#C_WHITE"�˾�\n"#C_RED"> "#C_WHITE"����ź��\n"#C_RED"> "#C_WHITE"���\n"#C_RED"> "#C_WHITE"����", "Ȯ��", "����");
	            PlayerInfo[playerid][pProductEdit] = 2;
	        }
	        else if(PlayerInfo[playerid][pProductEdit] == 5)
	        {
	            new string[512], number = 0;
				strmid(string, "��ȣ\t��ǰ��ȣ\t����\t��ǰ�̸�", 0, 512, 512);
	            for(new i = 0; i < MAX_PRODUCT; i ++)
	            {
	                PlayerInfo[playerid][pProductNumber][number] = -1;
	                if(ProductInfo[i][p_dCreate] == 1)
	                {
	                	format(string, sizeof(string), "%s\n%d\t%d\t\t%d$\t%s",string, ProductInfo[i][p_dNumber], ProductInfo[i][p_dObjectID], ProductInfo[i][p_dMoney], ObjectNameEx(ProductInfo[i][p_dObjectID]));
                        PlayerInfo[playerid][pProductNumber][number] = i;
					}
	            }
	            PlayerInfo[playerid][pProductEdit] = 2;
	            ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_LIST, "��ǰ����", string, "Ȯ��", "����");
	        }
	        else if(6 <= PlayerInfo[playerid][pProductEdit] <= 8)
	        {
	            PlayerInfo[playerid][pProductEdit] = 5;
		    	ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_LIST, "��ǰ����", "��ǰ����\n���ݺ���\n��ġ����", "Ȯ��", "����");
	        }
	    }
	    return 1;
	}
	if(dialogid == DIALOG_PRODUCT_BUY)
	{
	    if(response)
	    {
	        new number = strval(inputtext), index = ItemIDFind(playerid, PlayerInfo[playerid][pBuyItem][3]), string[256];
	        if(number <= 0)
	        {
	            for(new p_d = 0; p_d < MAX_PRODUCT; p_d ++)
				{
				    if(IsPlayerInRangeOfPoint(playerid, 1.0, ProductInfo[p_d][p_dPos][0], ProductInfo[p_d][p_dPos][1], ProductInfo[p_d][p_dPos][2]))
				    {
						new name[52], max_buy;

				        for(new i = 0, l = sizeof(ItemInfo); i < l; i ++)
					    {
					    	if(ItemInfo[i][_ModelID] == ProductInfo[p_d][p_dObjectID])
					    	{
					    	    max_buy = ItemInfo[i][_LimitNum];
					    	    strmid(name, ItemInfo[i][_ItemName], 0, 52, 52);
					    	    PlayerInfo[playerid][pBuyItem][3] = ItemInfo[i][_ItemID];
					    	    break;
					    	}
					    	else if(i == l -1) return SendErrorMessage(playerid, "��ǰ ���� ������ �߻� �Ͽ����ϴ�. �����ڵ� : 1001");
						}
				        format(string, sizeof(string), ""#C_GRAY"- %s ���� - "#C_WHITE"\n�̸� : %s\n���� : %d$\n�ִ� ���� ���� ���� : %d��\n",
						name,name,ProductInfo[p_d][p_dMoney],max_buy);
						PlayerInfo[playerid][pBuyItem][0] = ProductInfo[p_d][p_dObjectID];
						PlayerInfo[playerid][pBuyItem][1] = ProductInfo[p_d][p_dMoney];
						PlayerInfo[playerid][pBuyItem][2] = max_buy;
				        ShowPlayerDialog(playerid, DIALOG_PRODUCT_BUY, DIALOG_STYLE_INPUT, "��ǰ����", string, "����","���");
				        break;
				    }
				}
	            return 1;
	        }
            if(index != -1)
            {
	            if(number + PlayerInfo[playerid][pI_Number][index] > PlayerInfo[playerid][pBuyItem][2])
					return SendErrorMessage(playerid, "���� �� �� �ִ� �ѵ� ������ �Ѿ����ϴ�.");
			}
			else
			{
			    if(number > PlayerInfo[playerid][pBuyItem][2])
					return SendErrorMessage(playerid, "���� �� �� �ִ� �ѵ� ������ �Ѿ����ϴ�.");
			}
			new price = (PlayerInfo[playerid][pBuyItem][1] * number);
			if(price <= PlayerInfo[playerid][pMoney])
			{
	            format(string, sizeof(string), "%s�� %d�� ���� �Ͽ����ϴ�. [�� ���� : %d$]",ItemInfo[PlayerInfo[playerid][pBuyItem][3]][_ItemName], number, price);
	            SendMessage(playerid, string);
	            GivePlayerMoneyEx(playerid, -price);
	            GivePlayerItemEx(playerid, PlayerInfo[playerid][pBuyItem][3], number);
			}
			else return SendErrorMessage(playerid, MessageText[19]);
	    }
	    else
	    {
	    }
	    return 1;
	}
	if(dialogid == DIALOG_CUSTOM)
	{
	    if(PlayerInfo[playerid][pCustom] == 1)
	    {
		    if(response)
		    {
				ShowPlayerDialog(playerid, DIALOG_CUSTOM, DIALOG_STYLE_MSGBOX, "Ŀ���� ������Ʈ �˻�", "Ŀ���� ������Ʈ�� ����ִ��� �˻����Դϴ�.", "Ȯ��","");
		    }
		    else
		    {
	        	ShowPlayerDialog(playerid, DIALOG_CUSTOM, DIALOG_STYLE_MSGBOX, "Ŀ���� ������Ʈ �˻�", "Ŀ���� ������Ʈ�� ����ִ��� �˻����Դϴ�.", "Ȯ��","");
		    }
		}
	    return 1;
	}
	if(dialogid == DIALOG_TEMP_PLATOON)
	{
	    if(response)
	    {
	        if(PlayerInfo[playerid][pPlatoon] == 0)
	        {
	            if(PlayerInfo[playerid][pCountry] == 1)
	            {
	                for(new i = 0; i < MAX_PLATOON; i ++)
	                {
						if(PlatoonInfo[i][p_tCreate] == 1)
						{
						    if(PlatoonInfo[i][p_tCountry] == 1)
						    {
						        if(PlatoonInfo[i][p_tType] == 1)
						        {
						            SetPlayerPlatoonLevel(playerid, PlatoonInfo[i][p_tNumber], 1);
						            SendMessage(playerid, "�ӽüҴ뿡 ���ԵǾ����ϴ�.");
									return 1;
						        }
						    }
						}
						if(i == MAX_PLATOON -1) return SendErrorMessage(playerid, "�̱��� ���� �ӽüҴ밡 �������� �ʽ��ϴ�.");
	                }
	            }
	            if(PlayerInfo[playerid][pCountry] == 2)
				{
	                for(new i = 0; i < MAX_PLATOON; i ++)
	                {
						if(PlatoonInfo[i][p_tCreate] == 1)
						{
						    if(PlatoonInfo[i][p_tCountry] == 2)
						    {
						        if(PlatoonInfo[i][p_tType] == 1)
						        {
						            SetPlayerPlatoonLevel(playerid, PlatoonInfo[i][p_tNumber], 1);
						            SendMessage(playerid, "�ӽüҴ뿡 ���ԵǾ����ϴ�.");
									return 1;
						        }
						    }
						}
						if(i == MAX_PLATOON -1) return SendErrorMessage(playerid, "���þƿ� ���� �ӽüҴ밡 �������� �ʽ��ϴ�.");
	                }
	            }
	        }
	        else return SendErrorMessage(playerid, "����� �̹� �Ҵ밡 �ֽ��ϴ�.");
	    }
		else
		{
		}
		return 1;
	}
	if(dialogid == DIALOG_VEHICLE_STARTUP)
	{
	    new string[256];
	    if(response)
	    {
	       	if(PlayerInfo[playerid][pVehicleStart_Cre] == 1)
	        {
	            if(listitem == 0)
	            {
	                ShowPlayerDialog(playerid, DIALOG_VEHICLE_STARTUP, DIALOG_STYLE_LIST, "�õ�����", "�߰�\n����", "Ȯ��", "����");
	            	PlayerInfo[playerid][pVehicleStart_Cre] = 2;
	            }
	            if(listitem == 1)
	            {
	                for(new i = 0; i < MAX_CLASS; i ++)
                    {
                        if(i == 0) { format(string, sizeof(string), "%s",ArmyClass(i)); continue; }
                        format(string, sizeof(string), "%s\n%s",string,ArmyClass(i));
                    }
	                ShowPlayerDialog(playerid, DIALOG_VEHICLE_STARTUP, DIALOG_STYLE_LIST, "�õ�����", string, "Ȯ��", "����");
	                PlayerInfo[playerid][pVehicleStart_Cre] = 3;
	            }
	            return 1;
	        }
	        else if(PlayerInfo[playerid][pVehicleStart_Cre] == 2)
	        {
	            if(listitem == 0)
	            {
	                new modelid = PlayerInfo[playerid][pVehicleStart_Model];
	                for(new i = 0; i < MAX_STARTUP_PLATOON; i ++)
	                {
						if(!VehiclestartupInfo[modelid][v_sPlatoon][i])
						{
						    new str[512], country[12], Number = 1;
						    strmid(str, ""#C_GRAY"ID\tCountry\tType\t\tName"#C_WHITE"", 0, 512, 512);
							for(new p_t = 1; p_t < MAX_PLATOON; p_t ++)
							{
								if(PlatoonInfo[p_t][p_tCreate] != 1) continue;
								if(PlatoonInfo[p_t][p_tCountry] == 1) strmid(country, "�̱�", 0, 52, 52);
								else if(PlatoonInfo[p_t][p_tCountry] == 2) strmid(country, "���þ�", 0, 52, 52);
								format(str, sizeof(str), "%s\n%d\t%s\t\t%s\t\t%s",str,PlatoonInfo[p_t][p_tNumber],country,_FactionName[PlatoonInfo[p_t][p_tType]-1][_fName],PlatoonInfo[p_t][p_tName]);
                                PlayerInfo[playerid][pPlatoonEditNumber][Number] = p_t;
								Number++;
							}
							ShowPlayerDialog(playerid, DIALOG_VEHICLE_STARTUP, DIALOG_STYLE_LIST, "�õ����� �߰�", str, "Ȯ��", "����");
							PlayerInfo[playerid][pVehicleStart_Cre] = 4;
						    break;
						}
						else if(i == MAX_STARTUP_PLATOON -1) return SendErrorMessage(playerid, "�� �̻� �� ������ �Ҵ� �õ� ������ �߰� �� �� �����ϴ�.");
	                }
	            }
	            if(listitem == 1)
	            {
	            }
	            return 1;
	        }
			else if(PlayerInfo[playerid][pVehicleStart_Cre] == 4)
			{
			    if(listitem == 0)
			    {
			        new modelid = PlayerInfo[playerid][pVehicleStart_Model];
	                for(new i = 0; i < MAX_STARTUP_PLATOON; i ++)
	                {
						if(!VehiclestartupInfo[modelid][v_sPlatoon][i])
						{
						    new str[512], country[12];
						    strmid(str, ""#C_GRAY"ID\tCountry\tType\t\tName"#C_WHITE"", 0, 512, 512);
							for(new p_t = 1; p_t < MAX_PLATOON; p_t ++)
							{
								if(PlatoonInfo[p_t][p_tCreate] != 1) continue;
								if(PlatoonInfo[p_t][p_tCountry] == 1) strmid(country, "�̱�", 0, 52, 52);
								else if(PlatoonInfo[p_t][p_tCountry] == 2) strmid(country, "���þ�", 0, 52, 52);
								format(str, sizeof(str), "%s\n%d\t%s\t\t%s\t\t%s",str,PlatoonInfo[p_t][p_tNumber],country,_FactionName[PlatoonInfo[p_t][p_tType]-1][_fName],PlatoonInfo[p_t][p_tName]);
							}
							ShowPlayerDialog(playerid, DIALOG_VEHICLE_STARTUP, DIALOG_STYLE_LIST, "�õ����� �߰�", str, "Ȯ��", "����");
							PlayerInfo[playerid][pVehicleStart_Cre] = 4;
						    break;
						}
						else if(i == MAX_STARTUP_PLATOON -1) return SendErrorMessage(playerid, "�� �̻� �� ������ �Ҵ� �õ� ������ �߰� �� �� �����ϴ�.");
	                }
			    }
			    else
			    {
			        new modelid = PlayerInfo[playerid][pVehicleStart_Model];
			        new PlatoonID = PlayerInfo[playerid][pPlatoonEditNumber][listitem];
			        
			        if(VehiclestartupInfo[modelid][v_sCreate] == 1)
					{
						for(new i = 0; i < MAX_STARTUP_PLATOON; i ++)
						{
						    if(VehiclestartupInfo[modelid][v_sPlatoon][i] == PlatoonID)
						        return SendErrorMessage(playerid, "�̹� �� �Ҽ��� �õ� ������ ���� �ֽ��ϴ�.");
						}
					}
			        
			        if(CreateVehicleStartup(modelid, PlatoonID, -1) == 0) return SendErrorMessage(playerid, "�� �̻� �� ������ �Ҵ� �õ� ������ �߰� �� �� �����ϴ�.");
			        format(string, sizeof(string), "���� %s���� %d�� ������ �õ������� %s�Ҵ뿡�� �Ӹ��Ͽ����ϴ�.",PlayerInfo[playerid][pAdminName], modelid, PlatoonInfo[PlatoonID][p_tName]);
			        SendAdminMessage(string);
			    }
			    return 1;
			}
	    }
	    else
	    {
	        //if(PlayerInfo[playerid][pVehicleStart_Cre] == 0) return SendMessage(playerid, "�õ� ���� �߰��� ����ϼ̽��ϴ�.");
	        /*else if(PlayerInfo[playerid][pVehicleStart_Cre] == 1)
	        {
	            PlayerInfo[playerid][pVehicleStart_Cre] = 0;
				format(string, sizeof(string), "\t\t"#C_GRAY"- �õ� ���� - \n\n"#C_WHITE"%s������ �õ� ������ ���� �����Դϴ�.\n'�߰�'��ư�� ���� �õ� ������ �߰��غ�����.");
			    ShowPlayerDialog(playerid, DIALOG_VEHICLE_STARTUP, DIALOG_STYLE_MSGBOX, "�õ�����", string, "�߰�", "���");
			    return 1;
	        }*/
	    }
	    return 1;
	}
	return 1;
}

public ServerON()
{
	if(ServerONCheck == 1)
	{
		for(new i = 0; i < 50; i ++)
		{
			print(" ");
		}
		ServerONCheck = 2;
		return SetTimer("ServerON", 500, false);
	}
	else if(ServerONCheck == 2)
	{
	    printf("%s - ON", SERVER_NAME);
		if(ServerDBConnect == 1)
		    printf("[INFO] MySQL Connect Success");
		else
		    printf("[ERROR] MySQL Connect Fail");
		if(ObjectLoadCheck == 1)
			printf("[INFO] Objectload Success");
		else
		    printf("[ERROR] Objectload Fail");
		if(LoadEnterCheck >= 0)
		    printf("[INFO] %d���� ����/���� �Ⱦ��� �ҷ��Խ��ϴ�.", LoadEnterCheck);
		if(LoadGangzoneCheck >= 0)
			printf("[INFO] %d���� ������ �ҷ��Խ��ϴ�.",LoadGangzoneCheck);
		if(OccupyAreaCheck >= 0)
		    printf("[INFO] %d���� �������� �ҷ��Խ��ϴ�.",OccupyAreaCheck);
		if(PlatoonCheck >= 0)
		    printf("[INFO] %d���� �Ҵ븦 �ҷ��Խ��ϴ�.",PlatoonCheck);
		if(CountryVehicleCheck >= 0)
			printf("[INFO] %d���� ���� ������ �ҷ��Խ��ϴ�.",CountryVehicleCheck);
		if(LoadProductCheck >= 0)
		    printf("[INFO] %d���� ��ǰ�� �ҷ��Խ��ϴ�.",LoadProductCheck);
	}
	return 1;
}

public ORMDB(playerid)
{
    if(!IsPlayerNPC(playerid))
	{
	    GetPlayerName(playerid, PlayerInfo[playerid][pName], MAX_PLAYER_NAME);
		new ORM:ormid = PlayerInfo[playerid][ORM_ID] = orm_create(MySQL_Table,MySQL);

		orm_addvar_int(ormid, PlayerInfo[playerid][pID], "ID");
	    orm_addvar_string(ormid, PlayerInfo[playerid][pName], MAX_PLAYER_NAME, "pName");
		orm_addvar_string(ormid, PlayerInfo[playerid][pPassword], 128, "pPassword");

  		orm_addvar_string(ormid, PlayerInfo[playerid][pAdminName], 128, "pAdminName");

		orm_addvar_int(ormid, PlayerInfo[playerid][pSex], "pSex");
		orm_addvar_int(ormid, PlayerInfo[playerid][pAdmin], "pAdmin");

		orm_addvar_int(ormid, PlayerInfo[playerid][pCountry], "pCountry");
		orm_addvar_int(ormid, PlayerInfo[playerid][pTut], "pTut");
		orm_addvar_int(ormid, PlayerInfo[playerid][pAge], "pAge");
		orm_addvar_int(ormid, PlayerInfo[playerid][pInterior], "pInterior");
		orm_addvar_int(ormid, PlayerInfo[playerid][pVirtualWorld], "pVirtualWorld");
		orm_addvar_float(ormid, PlayerInfo[playerid][pPosX], "pPosX");
		orm_addvar_float(ormid, PlayerInfo[playerid][pPosY], "pPosY");
		orm_addvar_float(ormid, PlayerInfo[playerid][pPosZ], "pPosZ");
		orm_addvar_float(ormid, PlayerInfo[playerid][pAngle], "pAngle");
		orm_addvar_int(ormid, PlayerInfo[playerid][pNPCQwest], "pNPCQwest");
		orm_addvar_int(ormid, PlayerInfo[playerid][pPlatoon], "pPlatoon");
		orm_addvar_int(ormid, PlayerInfo[playerid][pCorps], "pCorps");
		orm_addvar_int(ormid, PlayerInfo[playerid][pClass], "pClass");
		orm_addvar_int(ormid, PlayerInfo[playerid][pMoney], "pMoney");
		orm_addvar_int(ormid, PlayerInfo[playerid][pPlayHour], "pPlayHour");
		orm_addvar_int(ormid, PlayerInfo[playerid][pPlayMinute], "pPlayMinute");
		orm_addvar_int(ormid, PlayerInfo[playerid][pPlaySecond], "pPlaySecond");
		orm_addvar_float(ormid, PlayerInfo[playerid][pHealth], "pHealth");
		orm_addvar_float(ormid, PlayerInfo[playerid][pArmour], "pArmour");
		orm_addvar_int(ormid, PlayerInfo[playerid][pPlatoonLevel], "pPlatoonLevel");
		orm_addvar_int(ormid, PlayerInfo[playerid][pMedal], "pMedal");
		orm_addvar_int(ormid, PlayerInfo[playerid][pPlatoonType], "pPlatoonType");
		orm_addvar_int(ormid, PlayerInfo[playerid][pDeMorgan], "pDeMorgan");
		orm_addvar_int(ormid, PlayerInfo[playerid][pDeMorganTimer], "pDeMorganTimer");
		orm_addvar_int(ormid, PlayerInfo[playerid][pJail], "pJail");
		orm_addvar_int(ormid, PlayerInfo[playerid][pJailTimer], "pJailTimer");
		orm_addvar_int(ormid, PlayerInfo[playerid][pWarning], "pWarning");
		orm_addvar_int(ormid, PlayerInfo[playerid][pIDBan], "pIDBan");
		orm_addvar_int(ormid, PlayerInfo[playerid][pChatBan], "pChatBan");
		orm_addvar_int(ormid, PlayerInfo[playerid][pDie], "pDie");
		orm_addvar_int(ormid, PlayerInfo[playerid][pDieTime], "pDieTime");
		orm_addvar_int(ormid, PlayerInfo[playerid][pPhoneFrequency], "pPhoneFrequency");
		orm_addvar_int(ormid, PlayerInfo[playerid][pClothes], "pClothes");
		orm_addvar_int(ormid, PlayerInfo[playerid][pSet_Spec], "pSet_Spec");
		orm_addvar_int(ormid, PlayerInfo[playerid][pPraise], "pPraise");
		orm_addvar_int(ormid, PlayerInfo[playerid][pHungry], "pHungry");
		orm_addvar_int(ormid, PlayerInfo[playerid][pClean], "pClean");
		orm_addvar_int(ormid, PlayerInfo[playerid][pDonation], "pDonation");
		orm_addvar_string(ormid, PlayerInfo[playerid][pgIDBanName], 128, "pgIDBanName");
		orm_addvar_string(ormid, PlayerInfo[playerid][pIDBanReason], 128, "pIDBanReason");
		orm_addvar_int(ormid, PlayerInfo[playerid][pPhoneNum], "pPhoneNum");
		
		orm_addvar_int(ormid, PlayerInfo[playerid][pIDBanDate][0], "pIDBanDate_0");
		orm_addvar_int(ormid, PlayerInfo[playerid][pIDBanDate][1], "pIDBanDate_1");
		orm_addvar_int(ormid, PlayerInfo[playerid][pIDBanDate][2], "pIDBanDate_2");
		orm_addvar_int(ormid, PlayerInfo[playerid][pEnlistDate][0], "pEnlistDate_0");
		orm_addvar_int(ormid, PlayerInfo[playerid][pEnlistDate][1], "pEnlistDate_1");
		orm_addvar_int(ormid, PlayerInfo[playerid][pEnlistDate][2], "pEnlistDate_2");

		new string[128];
		for(new i = 0; i < MAX_WEAPON_SLOT; i ++)
		{
		    format(string, sizeof(string), "pWeaponID_%d",i); orm_addvar_int(ormid, PlayerInfo[playerid][pWeaponID][i], string);
		    format(string, sizeof(string), "pAmmo_%d",i); orm_addvar_int(ormid, PlayerInfo[playerid][pAmmo][i], string);
		}
		for(new i = 0; i < MAX_INVENTORY; i ++)
		{
		    format(string, sizeof(string), "pI_ItemID_%d",i); orm_addvar_int(ormid, PlayerInfo[playerid][pI_ItemID][i], string);
		    format(string, sizeof(string), "pI_Number_%d",i); orm_addvar_int(ormid, PlayerInfo[playerid][pI_Number][i], string);
		}
		orm_setkey(ormid, "pName");
		orm_select(ormid, "OnPlayerDataLoad", "i", playerid);
	}
	return 1;
}

public OnPlayerDataLoad(playerid)
{
    new playerip[32], string[256];
	GetPlayerIp(playerid, playerip, sizeof(playerip));
	switch(orm_errno(PlayerInfo[playerid][ORM_ID]))
	{
		case ERROR_OK:
		{
		    format(string,sizeof(string), ""#C_GRAY"\tThe World War Role Play Game\n\n"#C_WHITE"����� �����ͺ��̽��� �߰� �Ǿ����ϴ�.\n��й�ȣ�� �Է��ϰ� '�α���'�� Ŭ�����ּ���.\n\n"#C_SOFTRED"������ IP : %s",playerip);
		    ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,"�α���",string,"�α���","");
		}
		case ERROR_NO_DATA:
		{
		    format(string,sizeof(string), ""#C_GRAY"\tThe World War Role Play Game\n\n"#C_WHITE"����� �����ͺ��̽��� �߰ߵ��� �ʾҽ��ϴ�.\n���Ͻô� ��й�ȣ�� �Է��ϰ� 'ȸ������'�� Ŭ�����ּ���.\n\n"#C_SOFTRED"������ IP : %s",playerip);
		    ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD,"ȸ������",string,"ȸ������","");
		}
	}
	orm_setkey(PlayerInfo[playerid][ORM_ID], "ID");
	return 1;
}

public OnPlayerLogin(playerid)
{
	PlayerInfo[playerid][pLogin] = 1;
	if(PlayerInfo[playerid][pIDBan] == 1)
	{
	    new string[256], IDBanType[32];
	    if(PlayerInfo[playerid][pIDBan] == 1) strmid(IDBanType, "���̵��", 0, 32, 32);
	    format(string, sizeof(string), ""#C_GRAY"\t- %s - \n\n"#C_WHITE"�̸� : %s\n��¥ : %d�� %d�� %d��\n��� ������ : %s\n���� : %s\n\n",
		IDBanType,
		PlayerNameEx(playerid),
		PlayerInfo[playerid][pIDBanDate][0],
		PlayerInfo[playerid][pIDBanDate][1],
		PlayerInfo[playerid][pIDBanDate][2],
		PlayerInfo[playerid][pgIDBanName],
		PlayerInfo[playerid][pIDBanReason]);
	    ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, "���̵�� Ȯ��", string, "Ȯ��","");
	    KickEx(playerid, 1);
	}
	for(new i = 0; i < MAX_PLAYERS; i ++)
	    if(IsPlayerConnected(i))
	        if(PlayerInfo[i][pAdminWork] == 1)
				ShowPlayerNameTagForPlayer(playerid, i, false);
	OnPlayerSpawn(playerid);
	return 1;
}
public AutoSave()
{
    for(new i = 0; i < MAX_PLAYERS; i ++)
		OnPlayerSave(i);
	return 1;
}
public Player_Reset(playerid)
{
    new Rest[pInfo];
    Rest[pPassword] = -1;
    Rest[pCreEnterID] = -1;
    Rest[pCampfireID] = -1;
    for(new o = 0; o < MAX_BOMB; o ++)
    	Rest[pC4Object][o] = -1;
	PlayerInfo[playerid] = Rest;
	strmid(PlayerInfo[playerid][pAdminName], "None", 0, 128, 128);
	return 1;
}
public FadeIn(playerid, a)
{
	TextDrawBoxColor(BlackScreenTD[playerid], RGBToHex(0,0,0,a));
	TextDrawShowForPlayer(playerid, BlackScreenTD[playerid]);
	if (a) SetTimerEx("FadeIn", FADE_DELAY, false, "id", playerid, a-5); else TextDrawHideForPlayer(playerid, BlackScreenTD[playerid]);
	return 1;
}

public FadeOut(playerid, a)
{
	TextDrawBoxColor(BlackScreenTD[playerid], RGBToHex(0,0,0,a));
	TextDrawShowForPlayer(playerid, BlackScreenTD[playerid]);
	if (a < 255) SetTimerEx("FadeOut", FADE_DELAY, false, "id", playerid, a+5);
	return 1;
}
public Tutorial(playerid)
{
	if(IsPlayerConnected(playerid) && PlayerInfo[playerid][pLogin] == 1 && PlayerInfo[playerid][pTut] == 1)
	    OnPlayerSpawn(playerid);
	return 1;
}

public NPCConnect()
{
    return 1;
}

public Enter(playerid)
{
    SetTimerEx("FadeIn", FADE_DELAY, false, "id",playerid,255);
    SetTimerEx("Enter2", 3000, false, "d",playerid);
	return 1;
}
public Enter2(playerid)
{
    TogglePlayerControllable(playerid, 1);
    return 1;
}

public ServerTimer()
{
	for(new DropItemID = 0; DropItemID < MAX_DROP_ITEM; DropItemID ++)
	{
	    if(DropItemInfo[DropItemID][iCreate] == 1)
	    {
	    	DropItemInfo[DropItemID][iTimer] --;
	    	if(DropItemInfo[DropItemID][iTimer] <= 0)
	    	{
	    	    DeleteDropItem(DropItemID, -1);
	    	}
		}
	}
	for(new moveobjectid = 0; moveobjectid < MAX_MOVE_OBJECT; moveobjectid ++)
	{
	    if(MoveObjectTimer[moveobjectid] > 0)
	    {
	        MoveObjectTimer[moveobjectid] --;
	    }
	}
	for(new playerid = 0; playerid < MAX_PLAYERS; playerid ++)
	{
	    if(PlayerInfo[playerid][pAmourTimer] > 0)
	    {
	        PlayerInfo[playerid][pAmourTimer] --;
	        if(PlayerInfo[playerid][pAmourTimer] <= 0)
	        {
	            PlayerInfo[playerid][pAmourTimer] = 0;
	        }
	    }
	    if(PlayerInfo[playerid][pSaveTimer] > 0)
	    {
	        PlayerInfo[playerid][pSaveTimer] --;
	        if(PlayerInfo[playerid][pSaveTimer] <= 0)
	        {
	            PlayerInfo[playerid][pSaveTimer] = 0;
	            //SendMessage(playerid, "���� ");
	        }
	    }
	    if(PlayerInfo[playerid][pPillEat] == 1)
	    {
	        PlayerInfo[playerid][pPillTimer] --;
	        if(PlayerInfo[playerid][pPillTimer] <= 0)
	        {
	            PlayerInfo[playerid][pPillTimer] = 0;
	            PlayerInfo[playerid][pPillEat] = 0;
	        }
	    }
	    if(PlayerInfo[playerid][pDie] == 2)
	    {
	        PlayerInfo[playerid][pDieTime] --;
	        if(PlayerInfo[playerid][pDieTime] <= 0)
	        {
	            PlayerInfo[playerid][pDie] = 3;
	            SetTimerEx("FadeOut", FADE_DELAY, false, "dd",playerid,0);
				SetTimerEx("OnPlayerSpawn", 3000, false, "d",playerid);
	        }
	    }
	    if(PlayerInfo[playerid][pDeMorgan] == 1)
	    {
			PlayerInfo[playerid][pDeMorganTimer] --;
			if(PlayerInfo[playerid][pDeMorganTimer] <= 0)
			{
				PlayerInfo[playerid][pDeMorgan] = 0;
				PlayerInfo[playerid][pDeMorganTimer] = 0;
				OnPlayerSpawn(playerid);
			}
	    }
		if(PlayerInfo[playerid][pTut] == 2)
		{
		    if(PlayerInfo[playerid][pPlaySecond] >= 0)
		    {
		        PlayerInfo[playerid][pPlaySecond] ++;
		        if(PlayerInfo[playerid][pPlaySecond] >= 60)
		        {
		            PlayerInfo[playerid][pPlayMinute]++;
		            PlayerInfo[playerid][pPlaySecond] = 0;
		        }
	         	if(PlayerInfo[playerid][pPlayMinute] >= 60)
	         	{
		        	PlayerInfo[playerid][pPlayHour]++;
		        	PlayerInfo[playerid][pPlayMinute] = 0;
		        	PayDay(playerid);
		        }
		        if(PlayerInfo[playerid][pPlayHour] <= 20)
                    AutoPromotionClass(playerid);
		    }
		}
	    if(PlayerInfo[playerid][pNPCQwestTimer] > 0)
	    {
	        PlayerInfo[playerid][pNPCQwestTimer] --;
	        if(PlayerInfo[playerid][pNPCQwestTimer] <= 0)
	        {
	            PlayerInfo[playerid][pNPCQwestTimer] = 0;
	            PlayerInfo[playerid][pClockMode] = 0;
	            TextDrawHideForPlayer(playerid, TimerTD[playerid][0]); TextDrawHideForPlayer(playerid, TimerTD[playerid][1]); TextDrawHideForPlayer(playerid, TimerTD[playerid][2]);
	            SendMessage(playerid, "30�ʰ� ���������� �߽��ϴ�. �� ó�� �Ⱦ����� �̵����ּ���.");
	            PlayerInfo[playerid][pNPCQwest] = 6;
	            ResetPlayerWeaponsEx(playerid);
	        }
	    }
	    if(PlayerInfo[playerid][pClockMode] == 1)
		{
			new string[32];
	        if(PlayerInfo[playerid][pClockSecond] == 0)
	        {
	            PlayerInfo[playerid][pClockMinute] --;
	            PlayerInfo[playerid][pClockSecond] = 59;
	        }
	        else
	        {
	        	PlayerInfo[playerid][pClockSecond] --;
	        }
	        if(PlayerInfo[playerid][pClockMinute] < 10)
	        {
	            if(PlayerInfo[playerid][pClockSecond] < 10)
	            {
			        format(string, sizeof(string), "0%d:0%d",PlayerInfo[playerid][pClockMinute],PlayerInfo[playerid][pClockSecond]);
				}
				else
				{
					format(string, sizeof(string), "0%d:%d",PlayerInfo[playerid][pClockMinute],PlayerInfo[playerid][pClockSecond]);
				}
				TextDrawSetString(TimerTD[playerid][2], string);
			}
			else if(PlayerInfo[playerid][pClockSecond] < 10)
	       	{
				format(string, sizeof(string), "%d:%0d",PlayerInfo[playerid][pClockMinute],PlayerInfo[playerid][pClockSecond]);
			}
			else
			{
			    format(string, sizeof(string), "%d:%d",PlayerInfo[playerid][pClockMinute],PlayerInfo[playerid][pClockSecond]);
			}
			TextDrawSetString(TimerTD[playerid][2], string);
		}
	}
	return 1;
}
public OnPlayerSave(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        if(IsPlayerLogin(playerid))
		{
		    GetPlayerPos(playerid, PlayerInfo[playerid][pPosX], PlayerInfo[playerid][pPosY], PlayerInfo[playerid][pPosZ]);
		    GetPlayerFacingAngle(playerid, PlayerInfo[playerid][pAngle]);
    		orm_save(PlayerInfo[playerid][ORM_ID]);
    		return 1;
        }
    }
    return 1;
}
public TutorialEnd(playerid, type)
{
	if(IsPlayerConnected(playerid) || IsPlayerLogin(playerid))
	{
	    if(type == 1)
	    {
		    if(PlayerInfo[playerid][pCountry] == 1)
			{
				SetPlayerPos(playerid, -217.2061,251.7033,1004.4833);
				SetPlayerFacingAngle(playerid, 180.0);
				SetCameraBehindPlayer(playerid);
			}
			else if(PlayerInfo[playerid][pCountry] == 2)
			{
			    SetPlayerPos(playerid, 402.3184,591.0795,1021.4751);
				SetPlayerFacingAngle(playerid, 90.0);
				SetCameraBehindPlayer(playerid);
			}
			return 1;
		}
		else if(type == 2)
		{
		    SetPlayerVirtualWorldEx(playerid, 0);
	        SetPlayerInteriorEx(playerid, 1);
			new string[128], year, month, day; getdate(year, month, day);
			ClearChat(playerid, 20);
		    SetTimerEx("FadeIn", FADE_DELAY, false, "id",playerid,255);
		    TogglePlayerControllable(playerid, 1);
			format(string, sizeof(string), "%s�������� ���� �Ͽ����ϴ�.",CountryNameEx(PlayerInfo[playerid][pCountry]));
			SendMessage(playerid, string);
			SetPlayerClass(playerid, 0);
			PlayerInfo[playerid][pTut] = 2;
			SetCameraBehindPlayer(playerid);
		    PlayerDataCreate(playerid);
		    ApplyAnimation(playerid,"VENDING","VEND_Use",4.1,0,1,1,1,2500,1);
		    SetPlayerTeam(playerid, 255);
			SetTimerEx("DrinkAnim", 2500, false, "dd",playerid,2);
			PlayerInfoTag(playerid, true);
			PlayerInfo[playerid][pHealth] = 50.0; PlayerInfo[playerid][pArmour] = 0.0;
			PlayerInfo[playerid][pHungry] = 50; PlayerInfo[playerid][pClean] = 50;
			SetPlayerHealthEx(playerid, PlayerInfo[playerid][pHealth]);
			SetPlayerArmourEx(playerid, PlayerInfo[playerid][pArmour]);
			PlayerInfo[playerid][pEnlistDate][0] = year;
			PlayerInfo[playerid][pEnlistDate][1] = month;
			PlayerInfo[playerid][pEnlistDate][2] = day;
			GivePlayerMoneyEx(playerid, 10);
		}
	}
	return 1;
}
public OnPlayerEnterDynamicArea(playerid, areaid)
{
    for(new g = 0; g < MAX_GANGZONE; g ++)
	{
		if(GangzoneInfo[g][gCreate])
		{
			if(GangzoneInfo[g][gArea] == areaid)
	    	{
	    	    OnPlayerEnterGangzone(playerid, g);
				return 1;
			}
		}
	}
	return 1;
}
public OnPlayerLeaveDynamicArea(playerid, areaid)
{
    for(new g = 0; g < MAX_GANGZONE; g ++)
	{
		if(GangzoneInfo[g][gCreate])
		{
			if(GangzoneInfo[g][gArea] == areaid)
	    	{
	    	    OnPlayerExitGangzone(playerid, g);
	    	    return 1;
	    	}
	    }
	}
	return 1;
}
public OnPlayerEnterGangzone(playerid, zone)
{
	return 1;
}
public OnPlayerExitGangzone(playerid, zone)
{
	return 1;
}
public KickEx(playerid, type)
{
	if(type == 1){
		OnPlayerSave(playerid);
		SetTimerEx("KickEx", 100, false, "dd", playerid,2);}
	else if(type == 2)
	    Kick(playerid);
	return 1;
}
public DropPlayerWeapon(playerid, DropItemID, Float:x, Float:y, Float:z, Float:angle)
{
	if(IsPlayerConnected(playerid) && IsPlayerLogin(playerid))
	{
		new Float:objectX, Float:objectY, Float:objectZ;
		objectX = x; objectY = y; objectZ = z;
		objectX += (0.7 * floatsin(-angle, degrees));
		objectY += (0.7 * floatcos(-angle, degrees));
	    MapAndreas_FindZ_For2DCoord(objectX, objectY, objectZ);
	    if(z - objectZ < 1.3)
	    {
	        objectZ += 0.1;
			MoveObject(DropItemInfo[DropItemID][iObject], objectX, objectY, objectZ, 7.0);
		}
		else
		{
		    GetPlayerPos(playerid, objectX, objectY, objectZ);
		    objectX += (0.5 * floatsin(-angle, degrees));
			objectY += (0.5 * floatcos(-angle, degrees));
			objectZ += -0.9;
		    MoveObject(DropItemInfo[DropItemID][iObject], objectX, objectY, objectZ, 7.0);
		}
		DropItemInfo[DropItemID][iPosX] = objectX;
	    DropItemInfo[DropItemID][iPosY] = objectY;
	    DropItemInfo[DropItemID][iPosZ] = objectZ;
	    new string[128];
	    format(string, sizeof(string), "/me %s�� ������.",DropItemInfo[DropItemID][iName]);
	    OnPlayerCommandText(playerid, string);
	}
	return 1;
}
public AmmoHackCheck(playerid)
{
	if(IsPlayerConnected(playerid) && IsPlayerLogin(playerid))
	{
	    new weaponid = GetPlayerWeapon(playerid), slot = GetWeaponSlot(weaponid);
	    if(!IsPlayerCloseWeapon(weaponid))
        {
			new animindex = GetPlayerAnimationIndex(playerid);
			if(animindex == 1167 || animindex == 1365 || animindex == 1161 || animindex == 1162 || animindex == 1163 || animindex == 1160)
			{
			    new weapon, ammo;
			    GetPlayerWeaponData(playerid, slot, weapon, ammo);
				//new string[256]; format(string, sizeof(string), "%d_%d",PlayerInfo[playerid][pAmmo][slot],ammo);SendMessage(playerid, string);
			    if(PlayerInfo[playerid][pWeaponID][slot] == weapon && PlayerInfo[playerid][pAmmo][slot] <= ammo)
			    {
			        new string[256];
			        format(string, sizeof(string), "%s���� �Ѿ� ���������� �ǽɵ� �ڵ�ű ���ϼ̽��ϴ�.", PlayerNameEx(playerid));
			        SendAdminMessage(string);
					SendMessage(playerid, "�Ѿ����� �����Ǿ� �ڵ�ű �Ǿ����ϴ�.");
					KickEx(playerid, 1);
					return 1;
				}
				GetPlayerWeaponData(playerid, slot, PlayerInfo[playerid][pWeaponID][slot], PlayerInfo[playerid][pAmmo][slot]);
				if(PlayerInfo[playerid][pAmmoHackCheck] > 0) KillTimer(PlayerInfo[playerid][pAmmoHackCheck]);
				PlayerInfo[playerid][pAmmoHackCheck] = SetTimerEx("AmmoHackCheck", 2000, false, "d", playerid);
			}
		}
	}
	return 1;
}
public PillEatTimer(playerid, Float:health)
{
	if(PlayerInfo[playerid][pPillEat] == 1)
	{
		GivePlayerHealthEx(playerid, health);
		
	    return 1;
	}
	return 0;
}
public C4Emplace(playerid)
{
	if(IsPlayerConnected(playerid) && IsPlayerLogin(playerid))
	{
	    new index = -1;
	    for(new o = 0; o < MAX_BOMB; o ++)
		{
		    if(PlayerInfo[playerid][pC4Object][o] == -1)
		    {
		    	index = o;
				break;
			}
			else if(o == MAX_BOMB -1)
			{
			    if(PlayerInfo[playerid][pC4EmplaceTimer] > 0) KillTimer(PlayerInfo[playerid][pC4EmplaceTimer]);
				C4EmplaceMode(playerid, false);
				PlayerInfo[playerid][pDoingGage] = 0;
				HidePlayerProgressBar(playerid, DoingBar[playerid]);
				ClearAnimations(playerid);
			}
		}
	    ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.0, 1, 0, 0, 0, 0);
	    PlayerInfo[playerid][pDoingGage] ++;
		SetPlayerProgressBarValue(playerid, DoingBar[playerid], PlayerInfo[playerid][pDoingGage]);
		if(PlayerInfo[playerid][pDoingGage] >= 50)
		{
		    if(PlayerInfo[playerid][pC4EmplaceTimer] > 0) KillTimer(PlayerInfo[playerid][pC4EmplaceTimer]);
			PlayerInfo[playerid][pDoingGage] = 0;
			HidePlayerProgressBar(playerid, DoingBar[playerid]);
			ClearAnimations(playerid);
			new Float:objectX, Float:objectY, Float:objectZ, Float:angle;
			GetPlayerPos(playerid, objectX, objectY, objectZ);
			objectX += (0.5 * floatsin(-angle, degrees));
			objectY += (0.5 * floatcos(-angle, degrees));
			objectZ = objectZ - 1;
			GetPlayerFacingAngle(playerid, angle);
			PlayerInfo[playerid][pC4Object][index] = CreateDynamicObject(ItemInfo[50][_ModelID], objectX, objectY, objectZ, 90, 0.0, angle);
			OnPlayerCommandText(playerid, "/me C4�� ��ġ�Ѵ�.");

			for(new i = 0; i < MAX_INVENTORY; i ++)
			{
	            if(PlayerInfo[playerid][pI_ItemID][i] == 50 && PlayerInfo[playerid][pI_Number][i] > 0)
	            {
	                RemoveItemEx(playerid, 50, 1);
	                if(PlayerInfo[playerid][pI_ItemID][i] <= 0 || PlayerInfo[playerid][pI_Number][i] <= 0)
	                {
	                    PlayerInfo[playerid][pI_ItemID][i] = 0;
	                    PlayerInfo[playerid][pI_Number][i] = 0;
                     	C4EmplaceMode(playerid, false);
	                }
	                break;
	            }
	            else if(i == MAX_INVENTORY - 1) C4EmplaceMode(playerid, false);
			}
		}
	}
	else
	{
	    if(PlayerInfo[playerid][pC4EmplaceTimer] > 0) KillTimer(PlayerInfo[playerid][pC4EmplaceTimer]);
		C4EmplaceMode(playerid, false);
		PlayerInfo[playerid][pDoingGage] = 0;
		HidePlayerProgressBar(playerid, DoingBar[playerid]);
		ClearAnimations(playerid);
	}
	return 1;
}
public DrinkAnim(playerid, a)
{
	if(a == 1)
	{
    	ApplyAnimation(playerid,"VENDING","VEND_Use_pt2",1.4,0 ,1,1,1,0,1);
		SetTimerEx("DrinkAnim", 300, false, "dd",playerid,2);
	}
    else if(a == 2)
    {
        ApplyAnimation(playerid,"VENDING","VEND_Drink_P",1.4,0 ,1,1,1,0,1);
        SetTimerEx("DrinkAnim", 500, false, "dd",playerid,3);
    }
    else if(a == 3)
	{
        ApplyAnimation(playerid,"PED","facgum",4.1,0,1,1,1,1);
    }
}
public MoveOjbctEntry(playerid, number)
{
    MoveDynamicObject(MoveObjectInfo[number][mObjectID], MoveObjectInfo[number][mPosX],MoveObjectInfo[number][mPosY],MoveObjectInfo[number][mPosZ], 3.0);
	return 1;
}
public RebootServer()
{
    SendRconCommand("gmx");
	return 1;
}
public _SetVehicleToRespawnEx(VehicleID)
{
    SetVehicleZAngle(VehicleID, VehicleInfo[VehicleID][vAngle]);
	return 1;
}
public AntiHack()
{
	for(new i = 0; i < MAX_PLAYERS; i ++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(IsPlayerLogin(i))
	        {
	            if(PlayerInfo[i][pAntiHackDelay] == 0)
	            {
	                new Float:health;
	            	GetPlayerHealth(i, health);
		            if(health > PlayerInfo[i][pHealth]) { /*AntiHackSens(i, 1);*/ SetPlayerHealthEx(i, PlayerInfo[i][pHealth]); }

		            new Float:armour;
		            GetPlayerArmour(i, armour);
		            if(armour > PlayerInfo[i][pArmour]) { /*AntiHackSens(i, 2);*/ SetPlayerArmourEx(i, PlayerInfo[i][pArmour]); }
				}
				else PlayerInfo[i][pAntiHackDelay] --;
				if(PlayerInfo[i][pAntiHackDelay] < 0) PlayerInfo[i][pAntiHackDelay] = 0;
	            
	            if(GetPlayerMoney(i) != PlayerInfo[i][pMoney])
	            {
		            ResetPlayerMoney(i);
					SetPlayerMoneyEx(i, PlayerInfo[i][pMoney]);
					//AntiHackSens(i, 3);
				}
	        }
		}
	}
	for(new v = 0; v < MAX_VEHICLES; v ++)
	{
	    if(VehicleInfo[v][vCreate] == 1)
	    {
		    new Float:health;
		    GetVehicleHealth(v, health);
		    if(health > VehicleInfo[v][vHealth])
		    {
		        SetVehicleHealthEx(v, VehicleInfo[v][vHealth]);
		        AntiHackSens(v, 4);
		    }
		}
	}
	return 1;
}
public PayDay(playerid)
{
    GivePlayerMoneyEx(playerid, PlayerInfo[playerid][pClass] + 1);
    
    new string[128];
    format(string, sizeof(string), "_________Pay Day_________"); SendMessage(playerid, string, 0x247B8AFF);
    format(string, sizeof(string), "���� : %d$", PlayerInfo[playerid][pClass]); SendMessage(playerid, string, 0x247B8AFF);
    format(string, sizeof(string), "�������� : %d$", 1); SendMessage(playerid, string, 0x247B8AFF);
    format(string, sizeof(string), "�� ���� : %d$", PlayerInfo[playerid][pClass] + 1); SendMessage(playerid, string, 0x247B8AFF);
    
    OnPlayerSave(playerid);
	return 1;
}
public SetPlayerShowInfo(playerid)
{
	if(PlayerInfo[playerid][pTut] != 2) return 0;
	if(PlayerInfo[playerid][pShowInfo] == true)
	{
	    new string[5];
	    //for(new i = 0; i < 8; i ++) TextDrawHideForPlayer(playerid, PlayerTextInfo[playerid][i]);
	    format(string, sizeof(string), "%.0f",PlayerInfo[playerid][pHealth]); TextDrawSetString(PlayerTextInfo[playerid][1], string); 
	    format(string, sizeof(string), "%.0f",PlayerInfo[playerid][pArmour]); TextDrawSetString(PlayerTextInfo[playerid][3], string);
	    format(string, sizeof(string), "%d",PlayerInfo[playerid][pHungry]); TextDrawSetString(PlayerTextInfo[playerid][5], string);
	    format(string, sizeof(string), "%d",PlayerInfo[playerid][pClean]); TextDrawSetString(PlayerTextInfo[playerid][7], string);
	}
	else if(PlayerInfo[playerid][pShowInfo] == false)
	{
	    new string[5];
	    format(string, sizeof(string), "%.0f",PlayerInfo[playerid][pHealth]); TextDrawSetString(PlayerTextInfo[playerid][1], string);
	    format(string, sizeof(string), "%.0f",PlayerInfo[playerid][pArmour]); TextDrawSetString(PlayerTextInfo[playerid][3], string);
	    format(string, sizeof(string), "%d",PlayerInfo[playerid][pHungry]); TextDrawSetString(PlayerTextInfo[playerid][5], string);
	    format(string, sizeof(string), "%d",PlayerInfo[playerid][pClean]); TextDrawSetString(PlayerTextInfo[playerid][7], string);
	    for(new i = 0; i < 8; i ++) TextDrawShowForPlayer(playerid, PlayerTextInfo[playerid][i]);
		PlayerInfo[playerid][pShowInfo] = true;
	}
	return 1;
}
public VehicleEngenStart(playerid, vehicleid)
{
    new engine, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, true, lights, alarm, doors, bonnet, boot, objective);
	VehicleInfo[vehicleid][vEngine] = true;
	VehicleAct(vehicleid, "�õ��� �ɷȽ��ϴ�.");
	PlayerPlaySound(playerid, 1135, 0.0, 0.0, 0.0);
	return 1;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(IsPlayerInAnyVehicle(playerid))
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        if(VehicleInfo[vehicleid][vEngine] == false) SendMessage(playerid, "�� ������ �õ��� �ɷ����� �ʽ��ϴ�.");
		else if(VehicleInfo[vehicleid][vEngine] == true) SendMessage(playerid, "�� ������ �õ��� �ɷ��ֽ��ϴ�.");
        PlayerInfo[playerid][pOldVehicle] = vehicleid;
    }
	return 1;
}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	//PlayerInfo[playerid][pOldVehicle] = vehicleid;
	//SendMessage(playerid, "���� ž��");
    return 1;
}
public OnPlayerExitVehicle(playerid, vehicleid)
{
	//PlayerInfo[playerid][pOldVehicle] = vehicleid;
	//SendMessage(playerid, "������ ����");
    return 1;
}
stock AntiHackSens(playerid, type)
{
	new string[128];
	if(type == 1) //ü����
	{
		format(string, sizeof(string), "%s���� ü������ �õ��Ͽ����ϴ�.", PlayerNameEx(playerid));
	}
	else if(type == 2) //�Ƹ���
	{
	    format(string, sizeof(string), "%s���� �Ƹ����� �õ��Ͽ����ϴ�.", PlayerNameEx(playerid));
	}
	else if(type == 3) //����
	{
	    format(string, sizeof(string), "%s���� ������ �õ��Ͽ����ϴ�.", PlayerNameEx(playerid));
	}
	else if(type == 4)
	{
	    new vehicleid = playerid, player = -1;
	    for(new i = 0; i < MAX_PLAYERS; i ++)
	    {
	        if(IsPlayerConnected(i) && IsPlayerLogin(i))
	        {
	            if(IsPlayerInAnyVehicle(playerid))
	    		{
		            if(vehicleid == GetPlayerVehicleID(i))
		            {
		            	player = i;
		            	break;
		            }
				}
	        }
	    }
	    if(player == -1) return 0;
	    format(string, sizeof(string), "%s���� ���� �������� �õ��Ͽ����ϴ�. [������ȣ : %d]", PlayerNameEx(player), player);
	}
	SendAdminMessage(string, COLOR_WARNING);
	return 1;
}
stock ClearChat(playerid, size)
{
	for(new i = 0; i < size; i ++)
	{
	    SendClientMessage(playerid, -1, " ");
	}
	return 1;
}

stock SendMessage(playerid, Message[], Color = 0xFFFFFFFF)
{
	new string[128];
	if(Color == 0xFFFFFFFF)
	    format(string, sizeof(string), "[INFO] %s",Message);
	else
	    format(string, sizeof(string), "%s",Message);

	SendClientMessage(playerid, Color, string);
	return 1;
}

stock SendErrorMessage(playerid, Message[])
{
    new string[128];
	format(string, sizeof(string), Message);
	SendClientMessage(playerid, COLOR_ERROR, string);
	return 1;
}

stock QwestCheckPointEx(playerid, Float:x, Float:y, Float:z)
{
    QwestInfo[playerid][qPosX] = x;
	QwestInfo[playerid][qPosY] = y;
	QwestInfo[playerid][qPosZ] = z;
	SetPlayerMapIcon(playerid,1, x,y,z, 0,1,MAPICON_GLOBAL_CHECKPOINT);
	return 1;
}
stock DropPlayerItem(playerid, ItemID = -1, Number = -1, type = 1)
{
    new animindex = GetPlayerAnimationIndex(playerid);
	if(animindex == 1189 || animindex == 1275)
	{
		if(type == 1)
		{
		    new index = ItemIDFind(playerid, ItemID);
		    if(index == -1) return 0;
			if(PlayerInfo[playerid][pI_ItemID][index] <= 0 || PlayerInfo[playerid][pI_Number][index] <= 0) return 0;
		}
	    for(new DropItemID = 0; DropItemID < MAX_DROP_ITEM; DropItemID++)
		{
		    if(!DropItemInfo[DropItemID][iCreate])
		    {
				if(!IsPlayerInAnyVehicle(playerid))
				{
				    if(type == 1)
				    {
				        if(ItemID <= 0 || Number <= 0) return 0;
				        new Float:Pos[3], Float:angle, Float:DropX, Float:DropY, Float:distance = 0.5, Float:Speed = 4.0, Float:rpos[3], Float:plusz;
				        RemoveItemEx(playerid, ItemID, Number);
				        GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
				        GetPlayerFacingAngle(playerid, angle);

				        DropItemInfo[DropItemID][iCreate] = 1;
				        DropItemInfo[DropItemID][iModel] = ItemInfo[ItemID][_ModelID];
				        DropItemInfo[DropItemID][wType] = type;
				        DropItemInfo[DropItemID][iItemID] = ItemID;
				        DropItemInfo[DropItemID][iNumber] = Number;
				        DropItemInfo[DropItemID][iTimer] = DROP_ITEM_TIMER;

				        strmid(DropItemInfo[DropItemID][iName], ItemInfo[DropItemInfo[DropItemID][iItemID]][_ItemName], 0, 128, 128);
				        DropX = Pos[0], DropY = Pos[1];
				        DropX += (distance * floatsin(-angle, degrees));
						DropY += (distance * floatcos(-angle, degrees));

						switch(ItemID)
						{
						    case 47 : { rpos[0] = 0.0; rpos[1] = 0.0; rpos[2] = angle; plusz = - 0.1; }
						    case 48 : { rpos[0] = 0.0; rpos[1] = 0.0; rpos[2] = angle; plusz = 0.3; }
						    case 49 : { rpos[0] = 90.0; rpos[1] = 0.0; rpos[2] = angle+90.0; plusz = 0.1; }
						    case 50 : { rpos[0] = 90.0; rpos[1] = 0.0; rpos[2] = angle; plusz = 0.3; }
						    case 51 : { rpos[0] = 0.0; rpos[1] = 0.0; rpos[2] = angle+90.0; plusz = 0.3; }
						    case 52 : { rpos[0] = 0.0; rpos[1] = 0.0; rpos[2] = angle; plusz = 0; }
						    case 53 : { rpos[0] = 0.0; rpos[1] = 0.0; rpos[2] = angle; plusz = 0.3; }
						}
						
						DropItemInfo[DropItemID][iObject] = CreateObject(DropItemInfo[DropItemID][iModel], Pos[0], Pos[1], Pos[2] + plusz, rpos[0], rpos[1], rpos[2]);
				        MoveObject(DropItemInfo[DropItemID][iObject], DropX, DropY, Pos[2] + 0.8, Speed);
				        SetTimerEx("DropPlayerWeapon", 100, false, "ddffff",playerid, DropItemID, DropX, DropY, Pos[2],angle);
				        return 1;
				    }
				    else if(type == 2)
				    {
					    new weaponid = GetPlayerWeapon(playerid), slot = GetWeaponSlot(weaponid), ammo = -1;
					    if(slot > 0)
					    {
					    	GetPlayerWeaponData(playerid, slot, weaponid, ammo);
					        DropItemInfo[DropItemID][iModel] = ItemInfo[weaponid][_ModelID];
					        RemovePlayerWeaponEx(playerid);

					        DropItemInfo[DropItemID][iCreate] = 1;
					        DropItemInfo[DropItemID][wType] = type;
					        DropItemInfo[DropItemID][iItemID] = weaponid;
					        DropItemInfo[DropItemID][iNumber] = ammo;
					        DropItemInfo[DropItemID][iTimer] = DROP_ITEM_TIMER;

					        strmid(DropItemInfo[DropItemID][iName], ItemInfo[DropItemInfo[DropItemID][iItemID]][_ItemName], 0, 128, 128);
							new Float:Pos[3], Float:angle, Float:DropX, Float:DropY, Float:distance = 0.5, Float:Speed = 4.0;
							GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
							DropX = Pos[0], DropY = Pos[1];
							GetPlayerFacingAngle(playerid, angle);
							DropX += (distance * floatsin(-angle, degrees));
						    DropY += (distance * floatcos(-angle, degrees));
						    DropItemInfo[DropItemID][iObject] = CreateObject(DropItemInfo[DropItemID][iModel], Pos[0], Pos[1], Pos[2] + 0.3, 90, 0.0, angle + 180.0);
						    MoveObject(DropItemInfo[DropItemID][iObject], DropX, DropY, Pos[2] + 0.8, Speed);
						    SetTimerEx("DropPlayerWeapon", 100, false, "ddffff",playerid, DropItemID, DropX, DropY, Pos[2],angle);
							return 1;
						}
					}
				}
			}
		}
	}
	return 0;
}
stock CreateDropItem(playerid, ItemID = -1, Number = -1, type = 1)
{
    for(new DropItemID = 0; DropItemID < MAX_DROP_ITEM; DropItemID++)
	{
	    if(!DropItemInfo[DropItemID][iCreate])
	    {
			if(!IsPlayerInAnyVehicle(playerid))
			{
			    if(type == 1)
			    {
			        if(ItemID <= 0 || Number <= 0) return 0;
			        new Float:Pos[3], Float:angle, Float:DropX, Float:DropY, Float:distance = 0.5, Float:Speed = 4.0, Float:rpos[3], Float:plusz;
			        GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
			        GetPlayerFacingAngle(playerid, angle);

			        DropItemInfo[DropItemID][iCreate] = 1;
			        DropItemInfo[DropItemID][iModel] = ItemInfo[ItemID][_ModelID];
			        DropItemInfo[DropItemID][wType] = type;
			        DropItemInfo[DropItemID][iItemID] = ItemID;
			        DropItemInfo[DropItemID][iNumber] = Number;
			        DropItemInfo[DropItemID][iTimer] = DROP_ITEM_TIMER;

			        strmid(DropItemInfo[DropItemID][iName], ItemInfo[DropItemInfo[DropItemID][iItemID]][_ItemName], 0, 128, 128);
			        DropX = Pos[0], DropY = Pos[1];
			        DropX += (distance * floatsin(-angle, degrees));
					DropY += (distance * floatcos(-angle, degrees));
					switch(ItemID)
					{
					    case 47 : { rpos[0] = 0.0; rpos[1] = 0.0; rpos[2] = angle; plusz = - 0.1; }
					    case 48 : { rpos[0] = 0.0; rpos[1] = 0.0; rpos[2] = angle; plusz = 0.3; }
					    case 49 : { rpos[0] = 90.0; rpos[1] = 0.0; rpos[2] = angle+90.0; plusz = 0.1; }
					    case 50 : { rpos[0] = 90.0; rpos[1] = 0.0; rpos[2] = angle; plusz = 0.3; }
					    case 51 : { rpos[0] = 0.0; rpos[1] = 0.0; rpos[2] = angle+90.0; plusz = 0.3; }
					    case 52 : { rpos[0] = 0.0; rpos[1] = 0.0; rpos[2] = angle; plusz = 0; }
					    case 53 : { rpos[0] = 0.0; rpos[1] = 0.0; rpos[2] = angle; plusz = 0.3; }
					    default : { rpos[0] = 90.0; rpos[1] = 0.0; rpos[2] = angle + 180; plusz = 0.3; } // weapon.
					}
					DropItemInfo[DropItemID][iObject] = CreateObject(DropItemInfo[DropItemID][iModel], Pos[0], Pos[1], Pos[2] + plusz, rpos[0], rpos[1], rpos[2]);
			        MoveObject(DropItemInfo[DropItemID][iObject], DropX, DropY, Pos[2] + 0.8, Speed);
			        SetTimerEx("DropPlayerWeapon", 100, false, "ddffff",playerid, DropItemID, DropX, DropY, Pos[2],angle);
			        return 1;
			    }
			}
		}
	}
	return 0;
}
stock IsPlayerLogin(playerid)
{
	return PlayerInfo[playerid][pLogin];
}
stock PlayerNameEx(playerid, type = 1)
{
	new name[52];
	GetPlayerName(playerid, name, sizeof(name));
	if(type == 2) format(name, sizeof(name), "%s %s",ArmyClass(PlayerInfo[playerid][pClass]),name);
	return name;
}

stock SetPlayerInteriorEx(playerid, InteriorID)
{
	PlayerInfo[playerid][pInterior] = InteriorID;
 	SetPlayerInterior(playerid, InteriorID);
 	return 1;
}

stock GivePlayerWeaponEx(playerid, weaponid, ammo)
{
	new slot = GetWeaponSlot(weaponid);
	if(slot == 0) return 0;
	PlayerInfo[playerid][pWeaponID][slot] = weaponid;
	if(slot == 1) PlayerInfo[playerid][pAmmo][slot] = 1;
	else PlayerInfo[playerid][pAmmo][slot] += ammo;
	GivePlayerWeapon(playerid, weaponid, ammo);
	return 1;
}
stock RemovePlayerWeaponEx(playerid)
{
    new weaponid = GetPlayerWeapon(playerid), slot = GetWeaponSlot(weaponid), weapon[MAX_WEAPON_SLOT], ammo[MAX_WEAPON_SLOT];
    for(new w = 0; w < MAX_WEAPON_SLOT; w ++)
    {
        if(w == 0) continue;
        if(w == slot) continue;
        GetPlayerWeaponData(playerid, w, weapon[w], ammo[w]);
    }
    ResetPlayerWeaponsEx(playerid);
    for(new w = 0; w < MAX_WEAPON_SLOT; w ++){
    	if(w == 0) continue; if(w == slot) continue; GivePlayerWeaponEx(playerid, weapon[w], ammo[w]);}
	return 1;
}
stock ResetPlayerWeaponsEx(playerid)
{
	//new weapon[MAX_WEAPON_SLOT], ammo[MAX_WEAPON_SLOT];
    for(new slot = 0; slot < MAX_WEAPON_SLOT; slot++)
	{
	    PlayerInfo[playerid][pWeaponID][slot] = 0;
	    PlayerInfo[playerid][pAmmo][slot] = 0;
	}
	ResetPlayerWeapons(playerid);
	return 1;
}
stock GetWeaponSlot(weaponid)
{
	new slot = -1;
	switch(weaponid)
	{
		case 0,1: slot = 0;
		case 2 .. 9: slot = 1;
		case 10 .. 15: slot = 10;
		case 16 .. 18, 39: slot = 8;
		case 22 .. 24: slot =2;
		case 25 .. 27: slot = 3;
		case 28, 29, 32: slot = 4;
		case 30, 31: slot = 5;
		case 33, 34: slot = 6;
		case 35 .. 38: slot = 7;
		case 40: slot = 12;
		case 41 .. 43: slot = 9;
		case 44 .. 46: slot = 11;
	}
	return slot;
}
stock IsGivePlayerDistance(Float:Distance, playerid, giveplayerid)
{
    new Float:ix, Float:iy, Float:iz, Float:gx, Float:gy, Float:gz;
    GetPlayerPos(playerid, ix, iy, iz);
    GetPlayerPos(giveplayerid, gx, gy, gz);
    if(IsPlayerInRangeOfPoint(playerid, Distance, gx, gy, gz)) return 1;
    return 0;
}
stock My_Information(playerid, giveplayerid)//playerid = �����ٻ��, giveplayerid = ���� ���
{
	new string[1024];
	format(string, sizeof(string), "\t\t\t"#C_GRAY"- Infomation -\n\n"#C_WHITE"[Name] : %s\n\n[����] : %s [����] : %s [����] : %d [�޷�] : %d [���] : %s\n[����] : %s [�Ҵ�] : %dst [�Ҵ���] : %s [����] : %d��\n[Ī��] : %d [���] : %d/10 [�ð�] : %d [��] : %d [��] : %d",
	PlayerInfo[playerid][pName],
	CountryNameEx(PlayerInfo[playerid][pCountry]),
	SexNameEx(PlayerInfo[playerid][pSex]),
	PlayerInfo[playerid][pAge],
	PlayerInfo[playerid][pMoney],
	ArmyClass(PlayerInfo[playerid][pClass]),
	CorpsName(PlayerInfo[playerid][pCorps]),
	PlatoonInfo[PlayerInfo[playerid][pPlatoon]][p_t_Number],
	PlatRankName(PlayerInfo[playerid][pPlatoonLevel]),
	PlayerInfo[playerid][pMedal],
	PlayerInfo[playerid][pPraise],
	PlayerInfo[playerid][pWarning],
	PlayerInfo[playerid][pPlayHour],
	PlayerInfo[playerid][pPlayMinute],
	PlayerInfo[playerid][pPlaySecond]
	);
	ShowPlayerDialog(giveplayerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, "������", string, "Ȯ��","");
	return 1;
}
stock Soldier_Number(playerid, giveplayerid)
{
}
stock SetPlayerVirtualWorldEx(playerid, VirtualWorldID)
{
    PlayerInfo[playerid][pVirtualWorld] = VirtualWorldID;
    SetPlayerVirtualWorld(playerid, VirtualWorldID);
    return 1;
}
stock PlayerDataCreate(playerid)
{
    if(PlayerInfo[playerid][pCountry] == 1)
	{
		SetPlayerColor(playerid, HexToInt(COLOR_USA));
	}
	else if(PlayerInfo[playerid][pCountry] == 2)
	{
		SetPlayerColor(playerid, HexToInt(COLOR_RUSIA));
	}
	return 1;
}
stock CorpsName(Corps)
{
    new string[52];
	switch(Corps)
	{
	    case 0 : strmid(string, "�̼���", 0, 52, 52);
		case 1 : strmid(string, "������", 0, 52, 52);
		case 2 : strmid(string, "����", 0, 52, 52);
		case 3 : strmid(string, "�ǹ���", 0, 52, 52);
		case 4 : strmid(string, "�������ۺ�", 0, 52, 52);
	}
	return string;
}
stock SexNameEx(sex)
{
    new string[12];
    switch(sex)
	{
	    case 0 : strmid(string, "�߼�", 0, 12, 12);
		case 1 : strmid(string, "����", 0, 12, 12);
		case 2 : strmid(string, "����", 0, 12, 12);
	}
	return string;
}
stock CountryNameEx(country)
{
    new string[12];
    switch(country)
	{
	    case 0 : strmid(string, "����", 0, 12, 12);
		case 1 : strmid(string, "�̱�", 0, 12, 12);
		case 2 : strmid(string, "���þ�", 0, 12, 12);
	}
	return string;
}
stock PlatRankName(level)
{
	new string[52];
	switch(level)
	{
		case 0 : strmid(string, "�̼Ҽ�", 0, 52, 52);
		case 1 : strmid(string, "�Ҵ��", 0, 52, 52);
		case 2 : strmid(string, "�μҴ���", 0, 52, 52);
		case 3 : strmid(string, "�Ҵ���", 0, 52, 52);
	}
	return string;
}
stock ArmyClass(rnak)
{
	new string[52];
	switch(rnak)
	{
		case 0 : strmid(string, "�ź�", 0, 52, 52);
		case 1 : strmid(string, "�̺�", 0, 52, 52);
		case 2 : strmid(string, "�Ϻ�", 0, 52, 52);
		case 3 : strmid(string, "��", 0, 52, 52);
		case 4 : strmid(string, "����", 0, 52, 52);
		case 5 : strmid(string, "�ϻ�", 0, 52, 52);
		case 6 : strmid(string, "�߻�", 0, 52, 52);
		case 7 : strmid(string, "���", 0, 52, 52);
		case 8 : strmid(string, "����", 0, 52, 52);
		case 9 : strmid(string, "����", 0, 52, 52);
		case 10 : strmid(string, "����", 0, 52, 52);
		case 11 : strmid(string, "����", 0, 52, 52);
		case 12 : strmid(string, "����", 0, 52, 52);
		case 13 : strmid(string, "�ҷ�", 0, 52, 52);
		case 14 : strmid(string, "�߷�", 0, 52, 52);
		case 15 : strmid(string, "���", 0, 52, 52);
		case 16 : strmid(string, "����", 0, 52, 52);
		case 17 : strmid(string, "����", 0, 52, 52);
		case 18 : strmid(string, "����", 0, 52, 52);
		case 19 : strmid(string, "����", 0, 52, 52);
	}
	return string;
}

stock EnterEntering(pickupid = 1239, Float:x,Float:y,Float:z,Float:inx,Float:iny,Float:inz,virtualworld = 0,interior = 0, Invirtualworld = -1, Ininterior = 1, type, entername[] = "������")
{
	for(new e = 0; e < MAX_ENTER; e ++)
	{
	    if(!EnterInfo[e][eCreate])
		{
		    new entername2[128];
		    EnterInfo[e][ePickup] = CreatePickup(pickupid,1,x,y,z,virtualworld);
		    EnterInfo[e][eInPickup] = CreatePickup(pickupid,1,inx,iny,inz,Invirtualworld);
		    EnterInfo[e][e3DLabel] = Create3DTextLabel(entername,COLOR_BUILD,x,y,z,5.0,0);
		    EnterInfo[e][eID] = e;
		    EnterInfo[e][ePosX] = x;
		    EnterInfo[e][ePosY] = y;
		    EnterInfo[e][ePosZ] = z;
		    EnterInfo[e][eInterior] = interior;
		    EnterInfo[e][eVirtualWorld] = virtualworld;
		    EnterInfo[e][eInPosX] = inx;
		    EnterInfo[e][eInPosY] = iny;
		    EnterInfo[e][eInPosZ] = inz;
		    EnterInfo[e][eInInterior] = Ininterior;
		    EnterInfo[e][eInVirtualWorld] = Invirtualworld;
		    EnterInfo[e][eCreate] = 1;
		    EnterInfo[e][epickupid] = pickupid;
		    EnterInfo[e][eType] = type;
		    strmid(EnterInfo[e][eName], entername, 0, 128, 128);
			strmid(EnterInfo[e][eInNotice], entername2, 0, 128, 128);
		    new query[512];
		    mysql_format(MySQL, query, sizeof(query), "INSERT INTO `enter` (`Number`, `Create`, `PosX`,`PosY`,`PosZ`, `InPosX`, `InPosY`, `InPosZ`) VALUES ('%d','%d','%f','%f','%f','%f','%f','%f')",
			EnterInfo[e][eID],EnterInfo[e][eCreate],EnterInfo[e][ePosX],EnterInfo[e][ePosY],EnterInfo[e][ePosZ],EnterInfo[e][eInPosX],EnterInfo[e][eInPosY],EnterInfo[e][eInPosZ]);
			mysql_query(MySQL, query, false);
			SaveEnter(e);
		    return 1;
		}
	}
    return 0;
}
stock DeleteEnterEnter(e)
{
    new query[128];
    DestroyPickup(EnterInfo[e][ePickup]); Delete3DTextLabel(EnterInfo[e][e3DLabel]); DestroyPickup(EnterInfo[e][eInPickup]);
	format(query, sizeof(query), "DELETE FROM `enter` WHERE `Number` = '%d' LIMIT 1",EnterInfo[e][eID]);
	mysql_query(MySQL, query, false);
	new Rest[eInfo];
	EnterInfo[e] = Rest;
	return 1;
}
stock SaveEnter(EnterID)
{
	if(EnterInfo[EnterID][eCreate])
	{
		new query[1024];
		format(query, sizeof(query), "UPDATE `enter` SET");
		format(query, sizeof(query), "%s `Create` = '%d',", query, EnterInfo[EnterID][eCreate]);
		format(query, sizeof(query), "%s `PosX` = '%f',", query, EnterInfo[EnterID][ePosX]);
		format(query, sizeof(query), "%s `PosY` = '%f',", query, EnterInfo[EnterID][ePosY]);
		format(query, sizeof(query), "%s `PosZ` = '%f',", query, EnterInfo[EnterID][ePosZ]);
		format(query, sizeof(query), "%s `InPosX` = '%f',", query, EnterInfo[EnterID][eInPosX]);
		format(query, sizeof(query), "%s `InPosY` = '%f',", query, EnterInfo[EnterID][eInPosY]);
		format(query, sizeof(query), "%s `InPosZ` = '%f',", query, EnterInfo[EnterID][eInPosZ]);
		format(query, sizeof(query), "%s `pickupid` = '%d',", query, EnterInfo[EnterID][epickupid]);
		format(query, sizeof(query), "%s `Name` = '%s',", query, EnterInfo[EnterID][eName]);
		format(query, sizeof(query), "%s `InNotice` = '%s',", query, EnterInfo[EnterID][eInNotice]);
		format(query, sizeof(query), "%s `Interior` = '%d',", query, EnterInfo[EnterID][eInterior]);
		format(query, sizeof(query), "%s `Type` = '%d',", query, EnterInfo[EnterID][eType]);
		format(query, sizeof(query), "%s `InInterior` = '%d',", query, EnterInfo[EnterID][eInInterior]);
		format(query, sizeof(query), "%s `InVirtualWorld` = '%d',", query, EnterInfo[EnterID][eInVirtualWorld]);
		format(query, sizeof(query), "%s `VirtualWorld` = '%d'", query, EnterInfo[EnterID][eVirtualWorld]);
		format(query, sizeof(query), "%s WHERE `Number` = '%d'", query, EnterInfo[EnterID][eID]);
		mysql_format(MySQL, query, sizeof(query), "%s", query);
	    mysql_query(MySQL, query, false);
	    printf("%d�� �ǹ� ����",EnterID);
	}
	return 1;
}
stock LoadEnter()
{
    LoadEnterCheck = 0;
    new MySQLDataBaseRow, query[128];
    for(new EnterID = 0; EnterID < MAX_ENTER; EnterID ++)
    {
		mysql_format(MySQL, query, sizeof(query), "SELECT * FROM `enter` WHERE `Number` = '%d' LIMIT 1",EnterID);
	    new Cache:result = mysql_query(MySQL, query, true);
	 	MySQLDataBaseRow = cache_num_rows(MySQL);
		if(MySQLDataBaseRow > 0)
		{
		    new string[128];
			for(new r = 0; r < MySQLDataBaseRow; r++)
			{
				EnterInfo[EnterID][eCreate] = cache_get_field_content_int(r, "Create");
				EnterInfo[EnterID][ePosX] = cache_get_field_content_float(r, "PosX");
				EnterInfo[EnterID][ePosY] = cache_get_field_content_float(r, "PosY");
				EnterInfo[EnterID][ePosZ] = cache_get_field_content_float(r, "PosZ");
				EnterInfo[EnterID][eInPosX] = cache_get_field_content_float(r, "InPosX");
				EnterInfo[EnterID][eInPosY] = cache_get_field_content_float(r, "InPosY");
				EnterInfo[EnterID][eInPosZ] = cache_get_field_content_float(r, "InPosZ");
				EnterInfo[EnterID][epickupid] = cache_get_field_content_int(r, "pickupid");
				cache_get_field_content(r, "Name", string); strmid(EnterInfo[EnterID][eName], string, 0, 128, 128);
				cache_get_field_content(r, "InNotice", string); strmid(EnterInfo[EnterID][eInNotice], string, 0, 128, 128);
				EnterInfo[EnterID][eInterior] = cache_get_field_content_int(r, "Interior");
				EnterInfo[EnterID][eInInterior] = cache_get_field_content_int(r, "InInterior");
				EnterInfo[EnterID][eInVirtualWorld] = cache_get_field_content_int(r, "InVirtualWorld");
				EnterInfo[EnterID][eVirtualWorld] = cache_get_field_content_int(r, "VirtualWorld");
				EnterInfo[EnterID][eType] = cache_get_field_content_int(r, "Type");
				EnterInfo[EnterID][eID] = cache_get_field_content_int(r, "Number");

				EnterInfo[EnterID][ePickup] = CreatePickup(EnterInfo[EnterID][epickupid],1,EnterInfo[EnterID][ePosX],EnterInfo[EnterID][ePosY],EnterInfo[EnterID][ePosZ],EnterInfo[EnterID][eVirtualWorld]);
			    EnterInfo[EnterID][eInPickup] = CreatePickup(EnterInfo[EnterID][epickupid],1,EnterInfo[EnterID][eInPosX],EnterInfo[EnterID][eInPosY],EnterInfo[EnterID][eInPosZ],EnterInfo[EnterID][eInVirtualWorld]);
			    EnterInfo[EnterID][e3DLabel] = Create3DTextLabel(EnterInfo[EnterID][eName],COLOR_BUILD,EnterInfo[EnterID][ePosX],EnterInfo[EnterID][ePosY],EnterInfo[EnterID][ePosZ],5.0,0);
                LoadEnterCheck ++;
			}
		}
		cache_delete(result);
	}
	return 1;
}
stock AutoPromotionClass(playerid)
{
	new Check = 0;
	if(2 <= PlayerInfo[playerid][pPlayHour] < 6)
	{
	    if(PlayerInfo[playerid][pClass] == 0)
	    {
	        SetPlayerClass(playerid, PlayerInfo[playerid][pClass] + 1);
	        Check = 1;
	    }
	}
    else if(6 <= PlayerInfo[playerid][pPlayHour] < 12)
    {
	    if(PlayerInfo[playerid][pClass] == 1)
	    {
	        SetPlayerClass(playerid, PlayerInfo[playerid][pClass] + 1);
	        Check = 1;
	    }
    }
    else if(12 <= PlayerInfo[playerid][pPlayHour] < 20)
    {
	    if(PlayerInfo[playerid][pClass] == 2)
	    {
	        SetPlayerClass(playerid, PlayerInfo[playerid][pClass] + 1);
	        Check = 1;
	    }
    }
    else if(20 <= PlayerInfo[playerid][pPlayHour])
    {
	    if(PlayerInfo[playerid][pClass] == 3)
	    {
	        SetPlayerClass(playerid, PlayerInfo[playerid][pClass] + 1);
	        Check = 1;
        }
    }
	if(Check == 1)
	{
	    new string[256];
		format(string, sizeof(string), "�÷��̽ð��� �׿� %s���� %s(��)�� ���� �Ͽ����ϴ�.",ArmyClass(PlayerInfo[playerid][pClass]-1),ArmyClass(PlayerInfo[playerid][pClass]));
		SendMessage(playerid, string);
	}
	return 1;
}
stock SetPlayerClass(playerid, Class)
{
    PlayerInfo[playerid][pClass] = Class;
	return 1;
}
stock SetPlayerSkinEx(playerid, skin)
{
	SetPlayerSkin(playerid, skin);
	PlayerInfo[playerid][pClothes] = skin;
	return 1;
}
stock CreateGangZone(Float:S_X,Float:S_Y,Float:E_X,Float:E_Y,Name[],Color[] = COLOR_GANGZONE)
{
	for(new g = 0; g < MAX_GANGZONE; g ++)
	{
	    if(!GangzoneInfo[g][gCreate])
	    {
		    GangzoneInfo[g][gCreate] = 1;
		    strmid(GangzoneInfo[g][gName], Name, 0, 128, 128);
		    strmid(GangzoneInfo[g][gColor], Color, 0, 32, 32);
		    GangzoneInfo[g][gS_PosX] = S_X;
		    GangzoneInfo[g][gS_PosY] = S_Y;
		    GangzoneInfo[g][gE_PosX] = E_X;
		    GangzoneInfo[g][gE_PosY] = E_Y;
		    GangzoneInfo[g][gNumber] = g;
		    GangzoneInfo[g][gGangzone] = GangZoneCreate(GangzoneInfo[g][gS_PosX],GangzoneInfo[g][gS_PosY],GangzoneInfo[g][gE_PosX],GangzoneInfo[g][gE_PosY]);
		    GangZoneShowForAll(GangzoneInfo[g][gGangzone], HexToInt(GangzoneInfo[g][gColor]));
		    GangzoneInfo[g][gArea] = CreateDynamicRectangle(GangzoneInfo[g][gS_PosX],GangzoneInfo[g][gS_PosY],GangzoneInfo[g][gE_PosX],GangzoneInfo[g][gE_PosY]);
		    new query[128];
		    mysql_format(MySQL, query, sizeof(query), "INSERT INTO `gangzone` (`Number`, `Create`) VALUES ('%d','%d')",
			GangzoneInfo[g][gNumber],GangzoneInfo[g][gCreate]);
			mysql_query(MySQL, query, false);
		    SaveGangzone(GangzoneInfo[g][gNumber]);
		    return 1;
		}
	}
	return 0;
}
stock DeleteGangzone(g)
{
    new query[128];
    DestroyDynamicArea(GangzoneInfo[g][gArea]);
    GangZoneHideForAll(GangzoneInfo[g][gGangzone]);
    GangZoneDestroy(GangzoneInfo[g][gGangzone]);
	format(query, sizeof(query), "DELETE FROM `gangzone` WHERE `Number` = '%d' LIMIT 1",GangzoneInfo[g][gNumber]);
	mysql_query(MySQL, query, false);
	new Rest[gInfo];
	GangzoneInfo[g] = Rest;
	return 1;
}
stock SaveGangzone(g)
{
	if(GangzoneInfo[g][gCreate])
	{
		new query[1024];
		format(query, sizeof(query), "UPDATE `gangzone` SET");
		format(query, sizeof(query), "%s `Create` = '%d',", query, GangzoneInfo[g][gCreate]);
		format(query, sizeof(query), "%s `Name` = '%s',", query, GangzoneInfo[g][gName]);
		format(query, sizeof(query), "%s `Color` = '%s',", query, GangzoneInfo[g][gColor]);
		format(query, sizeof(query), "%s `S_PosX` = '%f',", query, GangzoneInfo[g][gS_PosX]);
		format(query, sizeof(query), "%s `S_PosY` = '%f',", query, GangzoneInfo[g][gS_PosY]);
		format(query, sizeof(query), "%s `E_PosX` = '%f',", query, GangzoneInfo[g][gE_PosX]);
		format(query, sizeof(query), "%s `E_PosY` = '%f'", query, GangzoneInfo[g][gE_PosY]);
		format(query, sizeof(query), "%s WHERE `Number` = '%d'", query, GangzoneInfo[g][gNumber]);
		mysql_format(MySQL, query, sizeof(query), "%s", query);
	    mysql_query(MySQL, query, false);
	    printf("%d�� ���� ����",g);
	}
	return 1;
}
stock LoadGangzone()
{
    LoadGangzoneCheck = 0;
    new MySQLDataBaseRow, query[128];
    for(new g = 0; g < MAX_GANGZONE; g ++)
    {
		mysql_format(MySQL, query, sizeof(query), "SELECT * FROM `gangzone` WHERE `Number` = '%d' LIMIT 1",g);
	    new Cache:result = mysql_query(MySQL, query, true);
	 	MySQLDataBaseRow = cache_num_rows(MySQL);
		if(MySQLDataBaseRow > 0)
		{
		    new string[128];
			for(new r = 0; r < MySQLDataBaseRow; r++)
			{
				GangzoneInfo[g][gCreate] = cache_get_field_content_int(r, "Create");
				GangzoneInfo[g][gS_PosX] = cache_get_field_content_float(r, "S_PosX");
				GangzoneInfo[g][gS_PosY] = cache_get_field_content_float(r, "S_PosY");
				GangzoneInfo[g][gE_PosX] = cache_get_field_content_float(r, "E_PosX");
				GangzoneInfo[g][gE_PosY] = cache_get_field_content_float(r, "E_PosY");
				GangzoneInfo[g][gNumber] = cache_get_field_content_int(r, "Number");
				cache_get_field_content(r, "Name", string); strmid(GangzoneInfo[g][gName], string, 0, 128, 128);
				cache_get_field_content(r, "Color", string); strmid(GangzoneInfo[g][gColor], string, 0, 128, 128);

                GangzoneInfo[g][gGangzone] = GangZoneCreate(GangzoneInfo[g][gS_PosX],GangzoneInfo[g][gS_PosY],GangzoneInfo[g][gE_PosX],GangzoneInfo[g][gE_PosY]);
                GangzoneInfo[g][gArea] = CreateDynamicRectangle(GangzoneInfo[g][gS_PosX],GangzoneInfo[g][gS_PosY],GangzoneInfo[g][gE_PosX],GangzoneInfo[g][gE_PosY]);
		    	LoadGangzoneCheck++;
			}
		}
		cache_delete(result);
	}
	return 1;
}

stock CreateProduct(objectid, money, Float:posx, Float:posy, Float:posz)
{
	for(new i = 0; i < MAX_PRODUCT; i ++)
	{
	    if(!ProductInfo[i][p_dCreate])
	    {
	        ProductInfo[i][p_dCreate] = 1;
	        ProductInfo[i][p_dMoney] = money;
	        ProductInfo[i][p_dNumber] = i;
	        ProductInfo[i][p_dObjectID] = objectid;
	        ProductInfo[i][p_dPos][0] = posx;
	        ProductInfo[i][p_dPos][1] = posy;
	        ProductInfo[i][p_dPos][2] = posz;
	        ProductInfo[i][p_dPickup] = CreatePickup(ProductInfo[i][p_dObjectID],1,ProductInfo[i][p_dPos][0],ProductInfo[i][p_dPos][1],ProductInfo[i][p_dPos][2],0);
	        
	        new query[128];
		    mysql_format(MySQL, query, sizeof(query), "INSERT INTO `product` (`Number`, `Create`) VALUES ('%d', '%d')",ProductInfo[i][p_dNumber], ProductInfo[i][p_dCreate]);
			mysql_query(MySQL, query, false);

		    SaveProduct(ProductInfo[i][p_dNumber]);
			return 1;
	    }
	}
	return 0;
}
stock DeleteProduct(p_d)
{
    DestroyPickup(ProductInfo[p_d][p_dPickup]);
    new query[128];
	format(query, sizeof(query), "DELETE FROM `product` WHERE `Number` = '%d' LIMIT 1",ProductInfo[p_d][p_dNumber]);
	mysql_query(MySQL, query, false);
	new Rest[p_dInfo];
	Rest[p_dPickup] = -1;
	ProductInfo[p_d] = Rest;
	return 1;
}
stock LoadProduct()
{
    LoadProductCheck = 0;
    new MySQLDataBaseRow, query[128];
    for(new p_d = 0; p_d < MAX_PRODUCT; p_d ++)
    {
		mysql_format(MySQL, query, sizeof(query), "SELECT * FROM `product` WHERE `Number` = '%d' LIMIT 1",p_d);
	    new Cache:result = mysql_query(MySQL, query, true);
	 	MySQLDataBaseRow = cache_num_rows(MySQL);
		if(MySQLDataBaseRow > 0)
		{
			for(new r = 0; r < MySQLDataBaseRow; r++)
			{
				ProductInfo[p_d][p_dCreate] = cache_get_field_content_int(r, "Create");
				ProductInfo[p_d][p_dPos][0] = cache_get_field_content_float(r, "PosX");
				ProductInfo[p_d][p_dPos][1] = cache_get_field_content_float(r, "PosY");
				ProductInfo[p_d][p_dPos][2] = cache_get_field_content_float(r, "PosZ");
				ProductInfo[p_d][p_dNumber] = cache_get_field_content_int(r, "Number");
				ProductInfo[p_d][p_dObjectID] = cache_get_field_content_int(r, "ObjectID");
				ProductInfo[p_d][p_dMoney] = cache_get_field_content_int(r, "Money");
                ProductInfo[p_d][p_dPickup] = CreatePickup(ProductInfo[p_d][p_dObjectID],1,ProductInfo[p_d][p_dPos][0],ProductInfo[p_d][p_dPos][1],ProductInfo[p_d][p_dPos][2],0);
		    	LoadProductCheck++;
			}
		}
		cache_delete(result);
	}
	return 1;
}
stock SaveProduct(p_d)
{
	if(ProductInfo[p_d][p_dCreate])
	{
		new query[1024];
		format(query, sizeof(query), "UPDATE `product` SET");
		format(query, sizeof(query), "%s `Create` = '%d',", query, ProductInfo[p_d][p_dCreate]);
		format(query, sizeof(query), "%s `ObjectID` = '%d',", query, ProductInfo[p_d][p_dObjectID]);
		format(query, sizeof(query), "%s `Money` = '%d',", query, ProductInfo[p_d][p_dMoney]);
		format(query, sizeof(query), "%s `PosX` = '%f',", query, ProductInfo[p_d][p_dPos][0]);
		format(query, sizeof(query), "%s `PosY` = '%f',", query, ProductInfo[p_d][p_dPos][1]);
		format(query, sizeof(query), "%s `PosZ` = '%f'", query, ProductInfo[p_d][p_dPos][2]);
		format(query, sizeof(query), "%s WHERE `Number` = '%d'", query, ProductInfo[p_d][p_dNumber]);
		mysql_format(MySQL, query, sizeof(query), "%s", query);
	    mysql_query(MySQL, query, false);
	    printf("%d�� ��ǰ ����",p_d);
	}
	return 1;
}
stock DeleteOccupyArea(o)
{
    DestroyPickup(Occupy_AreaInfo[o][oPickup]);
    new query[128];
	format(query, sizeof(query), "DELETE FROM `occupy_area` WHERE `Number` = '%d' LIMIT 1",Occupy_AreaInfo[o][oNumber]);
	mysql_query(MySQL, query, false);
	new Rest[oInfo];
	Rest[oPickup] = -1;
	Occupy_AreaInfo[o] = Rest;
	return 1;
}
stock CreateOccupyArea(Float:x,Float:y,Float:z,Name[])
{
	for(new o = 0; o < MAX_OCCUPY_AREA; o ++)
	{
		if(!Occupy_AreaInfo[o][oCreate])
		{
		    Occupy_AreaInfo[o][oPosX] = x; Occupy_AreaInfo[o][oPosY] = y; Occupy_AreaInfo[o][oPosZ] = z;
		    strmid(Occupy_AreaInfo[o][oName], Name, 0, 128, 128);
		    Occupy_AreaInfo[o][oNumber] = o;
		    Occupy_AreaInfo[o][oCreate] = 1;
		    Occupy_AreaInfo[o][oOccupy] = 0;
		    Occupy_AreaInfo[o][oPickup] = CreatePickup(2914,1,Occupy_AreaInfo[o][oPosX],Occupy_AreaInfo[o][oPosY],Occupy_AreaInfo[o][oPosZ] - PickupDown,0);
		    
      		new gangzoneID = GetAreaNumber(o);
   			if(gangzoneID != -1)
   			{
   			    if(strcmp(GangzoneInfo[gangzoneID][gColor], COLOR_GANGZONE, true) == 0)
   			        Occupy_AreaInfo[o][oCountry] = 0;
				if(strcmp(GangzoneInfo[gangzoneID][gColor], COLOR_USA, true) == 0)
   			        Occupy_AreaInfo[o][oCountry] = 1;
				if(strcmp(GangzoneInfo[gangzoneID][gColor], COLOR_RUSIA, true) == 0)
   			        Occupy_AreaInfo[o][oCountry] = 2;
   			}
   			
		    new query[128];
		    mysql_format(MySQL, query, sizeof(query), "INSERT INTO `occupy_area` (`Number`, `Create`) VALUES ('%d','%d')",
			Occupy_AreaInfo[o][oNumber],Occupy_AreaInfo[o][oCreate]);
			mysql_query(MySQL, query, false);
			SaveOccupyArea(Occupy_AreaInfo[o][oNumber]);
		    return 1;
		}
	}
	return 0;
}
stock SaveOccupyArea(OccupyAreaNumber)
{
	if(Occupy_AreaInfo[OccupyAreaNumber][oCreate])
	{
	    new query[1024];
		format(query, sizeof(query), "UPDATE `occupy_area` SET");
		format(query, sizeof(query), "%s `Country` = '%d',", query, Occupy_AreaInfo[OccupyAreaNumber][oCountry]);
		format(query, sizeof(query), "%s `Create` = '%d',", query, Occupy_AreaInfo[OccupyAreaNumber][oCreate]);
		format(query, sizeof(query), "%s `Name` = '%s',", query, Occupy_AreaInfo[OccupyAreaNumber][oName]);
		format(query, sizeof(query), "%s `Occupy` = '%d',", query, Occupy_AreaInfo[OccupyAreaNumber][oOccupy]);
		format(query, sizeof(query), "%s `PosX` = '%f',", query, Occupy_AreaInfo[OccupyAreaNumber][oPosX]);
		format(query, sizeof(query), "%s `PosY` = '%f',", query, Occupy_AreaInfo[OccupyAreaNumber][oPosY]);
		format(query, sizeof(query), "%s `PosZ` = '%f'", query, Occupy_AreaInfo[OccupyAreaNumber][oPosZ]);
		format(query, sizeof(query), "%s WHERE `Number` = '%d'", query, Occupy_AreaInfo[OccupyAreaNumber][oNumber]);
		mysql_format(MySQL, query, sizeof(query), "%s", query);
	    mysql_query(MySQL, query, false);
	    printf("%d�� ������ ����",OccupyAreaNumber);
	}
	return 1;
}
stock LoadOccupyArea()
{
    OccupyAreaCheck = 0;
    new MySQLDataBaseRow, query[128];
    for(new o = 0; o < MAX_OCCUPY_AREA; o ++)
    {
		mysql_format(MySQL, query, sizeof(query), "SELECT * FROM `occupy_area` WHERE `Number` = '%d' LIMIT 1",o);
	    new Cache:result = mysql_query(MySQL, query, true);
	 	MySQLDataBaseRow = cache_num_rows(MySQL);
		if(MySQLDataBaseRow > 0)
		{
		    new string[128];
			for(new r = 0; r < MySQLDataBaseRow; r++)
			{
			    Occupy_AreaInfo[o][oCountry] = cache_get_field_content_int(r, "Country");
			    Occupy_AreaInfo[o][oNumber] = cache_get_field_content_int(r, "Number");
				Occupy_AreaInfo[o][oCreate] = cache_get_field_content_int(r, "Create");
				Occupy_AreaInfo[o][oOccupy] = cache_get_field_content_int(r, "Occupy");
				Occupy_AreaInfo[o][oPosX] = cache_get_field_content_float(r, "PosX");
				Occupy_AreaInfo[o][oPosY] = cache_get_field_content_float(r, "PosY");
				Occupy_AreaInfo[o][oPosZ] = cache_get_field_content_float(r, "PosZ");
				cache_get_field_content(r, "Name", string); strmid(Occupy_AreaInfo[o][oName], string, 0, 128, 128);
				Occupy_AreaInfo[o][oPickup] = CreatePickup(2914,1,Occupy_AreaInfo[o][oPosX],Occupy_AreaInfo[o][oPosY],Occupy_AreaInfo[o][oPosZ] - PickupDown,0);
                OccupyAreaCheck ++;
			}
		}
		cache_delete(result);
	}
	return 1;
}
stock DeleteCountryVehicle(VehicleID)
{
	DestroyVehicle(VehicleInfo[VehicleID][vVehicleId]);
    new query[128];
	format(query, sizeof(query), "DELETE FROM `country_vehicle` WHERE `Number` = '%d' LIMIT 1",VehicleInfo[VehicleID][vNumber]);
	mysql_query(MySQL, query, false);
	new Rest[vInfo];
	VehicleInfo[VehicleID] = Rest;
	return 1;
}
stock CreateCountryVehicle(ModelID, Float:x, Float:y, Float:z, Float:angle, Color1, Color2, Country = 0, delay = -1)
{
	for(new VehicleID = 0; VehicleID < MAX_COUNTRY_VEHICLE; VehicleID ++)
	{
	    if(!VehicleInfo[VehicleID][vCreate])
	    {
	        VehicleInfo[VehicleID][vCreate] = 1;
	        VehicleInfo[VehicleID][vCountry] = Country;
	        VehicleInfo[VehicleID][vNumber] = VehicleID;
	        VehicleInfo[VehicleID][vModelID] = ModelID;
	        VehicleInfo[VehicleID][vAngle] = angle;
	        VehicleInfo[VehicleID][vFuel] = 100;
	        VehicleInfo[VehicleID][vHealth] = 1000.0;
	        VehicleInfo[VehicleID][vLock] = 0;
	        VehicleInfo[VehicleID][vEngine] = false;
	        VehicleInfo[VehicleID][vPosX] = x; VehicleInfo[VehicleID][vPosY] = y; VehicleInfo[VehicleID][vPosZ] = z;
			VehicleInfo[VehicleID][vColor1] = Color1; VehicleInfo[VehicleID][vColor2] = Color2;
			VehicleInfo[VehicleID][vVehicleID] = CreateVehicle(ModelID, Float:x, Float:y, Float:z, Float:angle, Color1, Color2, delay);

			/*new query[128];
		    mysql_format(MySQL, query, sizeof(query), "INSERT INTO `country_vehicle` (`Number`, `Create`) VALUES ('%d','%d')",
			VehicleInfo[VehicleID][vNumber],VehicleInfo[VehicleID][vCreate]);
			mysql_query(MySQL, query, false);
			SaveCountryVehicle(VehicleInfo[VehicleID][vNumber]);*/
			break;
	    }
	}
	return 1;
}
stock SaveCountryVehicle(VehicleID)
{
	if(VehicleInfo[VehicleID][vCreate])
	{
	    new query[1024];
		format(query, sizeof(query), "UPDATE `country_vehicle` SET");
		format(query, sizeof(query), "%s `Create` = '%d',", query, VehicleInfo[VehicleID][vCreate]);
		format(query, sizeof(query), "%s `Country` = '%d',", query, VehicleInfo[VehicleID][vCountry]);
		format(query, sizeof(query), "%s `Color1` = '%d',", query, VehicleInfo[VehicleID][vColor1]);
		format(query, sizeof(query), "%s `Color2` = '%d',", query, VehicleInfo[VehicleID][vColor2]);
		format(query, sizeof(query), "%s `ModelID` = '%d',", query, VehicleInfo[VehicleID][vModelID]);
		format(query, sizeof(query), "%s `Fuel` = '%d',", query, VehicleInfo[VehicleID][vFuel]);
		format(query, sizeof(query), "%s `Health` = '%f',", query, VehicleInfo[VehicleID][vHealth]);
		format(query, sizeof(query), "%s `vLock` = '%d',", query, VehicleInfo[VehicleID][vLock]);
		format(query, sizeof(query), "%s `Angle` = '%f',", query, VehicleInfo[VehicleID][vAngle]);
		format(query, sizeof(query), "%s `PosX` = '%f',", query, VehicleInfo[VehicleID][vPosX]);
		format(query, sizeof(query), "%s `PosY` = '%f',", query, VehicleInfo[VehicleID][vPosY]);
		format(query, sizeof(query), "%s `PosZ` = '%f'", query, VehicleInfo[VehicleID][vPosZ]);
		format(query, sizeof(query), "%s WHERE `Number` = '%d'", query, VehicleInfo[VehicleID][vNumber]);
		mysql_format(MySQL, query, sizeof(query), "%s", query);
	    mysql_query(MySQL, query, false);
	    printf("%d�� ���� ���� ����",VehicleID);
	}
	return 1;
}
stock LoadCountryVehicle()
{
    CountryVehicleCheck = 0;
    new MySQLDataBaseRow, query[128];
    for(new VehicleID = 0; VehicleID < MAX_COUNTRY_VEHICLE; VehicleID ++)
    {
		mysql_format(MySQL, query, sizeof(query), "SELECT * FROM `country_vehicle` WHERE `Number` = '%d' LIMIT 1",VehicleID);
	    new Cache:result = mysql_query(MySQL, query, true);
	 	MySQLDataBaseRow = cache_num_rows(MySQL);
		if(MySQLDataBaseRow > 0)
		{
			for(new r = 0; r < MySQLDataBaseRow; r++)
			{
			    VehicleInfo[VehicleID][vCreate] = cache_get_field_content_int(r, "Create");
				VehicleInfo[VehicleID][vCountry]= cache_get_field_content_int(r, "Country");
				VehicleInfo[VehicleID][vColor1] = cache_get_field_content_int(r, "Color1");
				VehicleInfo[VehicleID][vColor2] = cache_get_field_content_int(r, "Color2");
				VehicleInfo[VehicleID][vNumber] = cache_get_field_content_int(r, "Number");
				VehicleInfo[VehicleID][vFuel] = cache_get_field_content_int(r, "Fuel");
				VehicleInfo[VehicleID][vModelID] = cache_get_field_content_int(r, "ModelID");
				VehicleInfo[VehicleID][vPosX] = cache_get_field_content_float(r, "PosX");
				VehicleInfo[VehicleID][vPosY] = cache_get_field_content_float(r, "PosY");
				VehicleInfo[VehicleID][vPosZ] = cache_get_field_content_float(r, "PosZ");
				VehicleInfo[VehicleID][vAngle] = cache_get_field_content_float(r, "Angle");
				VehicleInfo[VehicleID][vHealth] = cache_get_field_content_float(r, "Health");
				VehicleInfo[VehicleID][vLock] = cache_get_field_content_int(r, "vLock");
				VehicleInfo[VehicleID][vVehicleID] = CreateVehicle(VehicleInfo[VehicleID][vModelID], VehicleInfo[VehicleID][vPosX], VehicleInfo[VehicleID][vPosY], VehicleInfo[VehicleID][vPosZ], VehicleInfo[VehicleID][vAngle], VehicleInfo[VehicleID][vColor1], VehicleInfo[VehicleID][vColor2], -1);
                CountryVehicleCheck ++;
			}
		}
		cache_delete(result);
	}
	return 1;
}
stock DeletePlatoon(PlatoonID)
{
	for(new i = 0; i < MAX_PLAYERS; i ++)
	{
	    if(IsPlayerConnected(i) && IsPlayerLogin(i))
	    {
	        if(PlayerInfo[i][pPlatoon] == PlatoonID)
	        {
	            PlayerInfo[i][pPlatoon] = 0;
	            PlayerInfo[i][pPlatoonType] = 0;
	            PlayerInfo[i][pPlatoonLevel] = 0;
	            SendMessage(i, "�Ҵ밡 �����Ǿ� �ڵ����� Ż��Ǿ����ϴ�.");
	            OnPlayerSave(i);
	        }
	    }
	}
    new query[256];
    format(query, sizeof(query), "UPDATE `user` SET `pPlatoon` = '0', `pPlatoonType` = '0', `pPlatoonLevel` = '0' WHERE `pPlatoon` = '%d'",PlatoonID);
	mysql_query(MySQL, query, false);
    
	format(query, sizeof(query), "DELETE FROM `platoon` WHERE `Number` = '%d' LIMIT 1",PlatoonInfo[PlatoonID][p_tNumber]);
	mysql_query(MySQL, query, false);
	new Rest[p_tInfo];
	PlatoonInfo[PlatoonID] = Rest;
	return 1;
}
stock CreatePlatoon(_Number, Name[], Type, Country)
{
	for(new p_t = 1; p_t < MAX_PLATOON; p_t ++)
	{
	    if(!PlatoonInfo[p_t][p_tCreate])
	    {
	        PlatoonInfo[p_t][p_tCreate] = 1;
	        PlatoonInfo[p_t][p_tNumber] = p_t;
	        PlatoonInfo[p_t][p_t_Number] = _Number;
	        PlatoonInfo[p_t][p_tType] = Type;
	        PlatoonInfo[p_t][p_tCountry] = Country;
	        strmid(PlatoonInfo[p_t][p_tName], Name, 0, 128, 128);

	        new query[128];
		    mysql_format(MySQL, query, sizeof(query), "INSERT INTO `platoon` (`Number`, `Create`) VALUES ('%d','%d')",
			PlatoonInfo[p_t][p_tNumber],PlatoonInfo[p_t][p_tCreate]);
			mysql_query(MySQL, query, false);
			SavePlatoon(PlatoonInfo[p_t][p_tNumber]);
	        return 1;
	    }
	}
	return 0;
}
stock SavePlatoon(PlatoonID)
{
	if(PlatoonInfo[PlatoonID][p_tCreate])
	{
	    new query[1024];
		format(query, sizeof(query), "UPDATE `platoon` SET");
		format(query, sizeof(query), "%s `Create` = '%d',", query, PlatoonInfo[PlatoonID][p_tCreate]);
		format(query, sizeof(query), "%s `_Number` = '%d',", query, PlatoonInfo[PlatoonID][p_t_Number]);
		format(query, sizeof(query), "%s `Country` = '%d',", query, PlatoonInfo[PlatoonID][p_tCountry]);
		format(query, sizeof(query), "%s `Name` = '%s',", query, PlatoonInfo[PlatoonID][p_tName]);
		format(query, sizeof(query), "%s `Type` = '%d'", query, PlatoonInfo[PlatoonID][p_tType]);
		format(query, sizeof(query), "%s WHERE `Number` = '%d'", query, PlatoonInfo[PlatoonID][p_tNumber]);
		mysql_format(MySQL, query, sizeof(query), "%s", query);
	    mysql_query(MySQL, query, false);
	    printf("%d�� �Ҵ� ����",PlatoonID);
	}
	return 1;
}
stock LoadPlatoon()
{
    PlatoonCheck = 0;
    new MySQLDataBaseRow, query[128];
    for(new p_t = 1; p_t < MAX_PLATOON; p_t ++)
    {
		mysql_format(MySQL, query, sizeof(query), "SELECT * FROM `platoon` WHERE `Number` = '%d' LIMIT 1",p_t);
	    new Cache:result = mysql_query(MySQL, query, true);
	 	MySQLDataBaseRow = cache_num_rows(MySQL);
		if(MySQLDataBaseRow > 0)
		{
		    new string[128];
			for(new r = 0; r < MySQLDataBaseRow; r++)
			{
			    PlatoonInfo[p_t][p_tNumber] = cache_get_field_content_int(r, "Number");
				PlatoonInfo[p_t][p_tCreate] = cache_get_field_content_int(r, "Create");
				PlatoonInfo[p_t][p_tCountry] = cache_get_field_content_int(r, "Country");
				PlatoonInfo[p_t][p_tType] = cache_get_field_content_int(r, "Type");
				PlatoonInfo[p_t][p_t_Number] = cache_get_field_content_int(r, "_Number");
				cache_get_field_content(r, "Name", string); strmid(PlatoonInfo[p_t][p_tName], string, 0, 128, 128);
                PlatoonCheck ++;
			}
		}
		cache_delete(result);
	}
	return 1;
}

stock CreateVehicleStartup(ModelID, PlatoonID, Class)
{
	if(VehiclestartupInfo[ModelID][v_sCreate] == 1)
	{
		for(new i = 0; i < MAX_STARTUP_PLATOON; i ++)
		{
		    if(!VehiclestartupInfo[ModelID][v_sPlatoon][i])
		    {
                VehiclestartupInfo[ModelID][v_sCreate] = 1;
		        VehiclestartupInfo[ModelID][v_sClass] = Class;
		        VehiclestartupInfo[ModelID][v_sPlatoon][i] = PlatoonID;
		        VehiclestartupInfo[ModelID][v_sModelID] = ModelID;
		        SaveVehiclestartup(ModelID);
		        return 1;
		    }
			else if(i == MAX_STARTUP_PLATOON-1) return 0;
		}
	}
    else if(!VehiclestartupInfo[ModelID][v_sCreate])
	{
        VehiclestartupInfo[ModelID][v_sCreate] = 1;
        VehiclestartupInfo[ModelID][v_sClass] = Class;
        VehiclestartupInfo[ModelID][v_sPlatoon][0] = PlatoonID;
        VehiclestartupInfo[ModelID][v_sModelID] = ModelID;

        new query[128];
	    mysql_format(MySQL, query, sizeof(query), "INSERT INTO `vehiclestartup` (`ModelID`, `Create`) VALUES ('%d','%d')",
		VehiclestartupInfo[ModelID][v_sModelID],VehiclestartupInfo[ModelID][v_sCreate]);
		mysql_query(MySQL, query, false);
		SaveVehiclestartup(VehiclestartupInfo[ModelID][v_sModelID]);
        return 1;
    }
	return 0;
}
stock SaveVehiclestartup(ModelID)
{
	if(VehiclestartupInfo[ModelID][v_sCreate])
	{
	    new query[1024];
		format(query, sizeof(query), "UPDATE `vehiclestartup` SET");
		format(query, sizeof(query), "%s `Create` = '%d',", query, VehiclestartupInfo[ModelID][v_sCreate]);
		format(query, sizeof(query), "%s `ModelID` = '%d',", query, VehiclestartupInfo[ModelID][v_sModelID]);
		format(query, sizeof(query), "%s `Class` = '%d',", query, VehiclestartupInfo[ModelID][v_sClass]);
		format(query, sizeof(query), "%s `Platoon_0` = '%d',", query, VehiclestartupInfo[ModelID][v_sPlatoon][0]);
		format(query, sizeof(query), "%s `Platoon_1` = '%d',", query, VehiclestartupInfo[ModelID][v_sPlatoon][1]);
		format(query, sizeof(query), "%s `Platoon_2` = '%d',", query, VehiclestartupInfo[ModelID][v_sPlatoon][2]);
		format(query, sizeof(query), "%s `Platoon_3` = '%d',", query, VehiclestartupInfo[ModelID][v_sPlatoon][3]);
		format(query, sizeof(query), "%s `Platoon_4` = '%d'", query, VehiclestartupInfo[ModelID][v_sPlatoon][4]);
		format(query, sizeof(query), "%s WHERE `ModelID` = '%d'", query, VehiclestartupInfo[ModelID][v_sModelID]);
		mysql_format(MySQL, query, sizeof(query), "%s", query);
	    mysql_query(MySQL, query, false);
	    printf("%d�� �� ���� ���� ����",ModelID);
	}
	return 1;
}
stock LoadVehiclestartup()
{
    new MySQLDataBaseRow, query[128];
    for(new modelid = 400; modelid < MAX_VEHICLE_MODEL; modelid ++)
    {
        VehiclestartupInfo[modelid][v_sClass] = -1;
		mysql_format(MySQL, query, sizeof(query), "SELECT * FROM `vehiclestartup` WHERE `ModelID` = '%d' LIMIT 1",modelid);
	    new Cache:result = mysql_query(MySQL, query, true);
	 	MySQLDataBaseRow = cache_num_rows(MySQL);
		if(MySQLDataBaseRow > 0)
		{
			for(new r = 0; r < MySQLDataBaseRow; r++)
			{
			    VehiclestartupInfo[modelid][v_sModelID] = cache_get_field_content_int(r, "ModelID");
				VehiclestartupInfo[modelid][v_sCreate] = cache_get_field_content_int(r, "Create");
				VehiclestartupInfo[modelid][v_sClass] = cache_get_field_content_int(r, "Class");
				VehiclestartupInfo[modelid][v_sPlatoon][0] = cache_get_field_content_int(r, "Platoon_0");
				VehiclestartupInfo[modelid][v_sPlatoon][1] = cache_get_field_content_int(r, "Platoon_1");
				VehiclestartupInfo[modelid][v_sPlatoon][2] = cache_get_field_content_int(r, "Platoon_2");
				VehiclestartupInfo[modelid][v_sPlatoon][3] = cache_get_field_content_int(r, "Platoon_3");
				VehiclestartupInfo[modelid][v_sPlatoon][4] = cache_get_field_content_int(r, "Platoon_4");
			}
		}
		cache_delete(result);
	}
	return 1;
}
stock DeleteVehiclestartup(ModelID)
{
	format(query, sizeof(query), "DELETE FROM `vehiclestartup` WHERE `ModelID` = '%d' LIMIT 1",VehiclestartupInfo[ModelID][v_sModelID]);
	mysql_query(MySQL, query, false);
	new Rest[v_sInfo];
	Rest[v_sClass] = -1;
	VehiclestartupInfo[ModelID] = Rest;
	return 1;
}
//=============
stock Save_Server_Info()
{
    new query[1024];
	format(query, sizeof(query), "UPDATE `server_info` SET");
	format(query, sizeof(query), "%s `USA_Money` = '%d',", query, CountryInfo_Money[1]);
	format(query, sizeof(query), "%s `Rusia_Money` = '%d'", query, CountryInfo_Money[2]);
	format(query, sizeof(query), "%s WHERE `Number` = '%d'", query, 1);
	mysql_format(MySQL, query, sizeof(query), "%s", query);
    mysql_query(MySQL, query, false);
	return 1;
}
stock Load_Server_Info()
{
    Server_Info_Check = 0;
    new MySQLDataBaseRow, query[256];
	mysql_format(MySQL, query, sizeof(query), "SELECT * FROM `server_info` WHERE `Number` = '%d' LIMIT 1",1);
    new Cache:result = mysql_query(MySQL, query, true);
 	MySQLDataBaseRow = cache_num_rows(MySQL);
	if(MySQLDataBaseRow > 0)
	{
		for(new r = 0; r < MySQLDataBaseRow; r++)
		{
			CountryInfo_Money[1] = cache_get_field_content_int(r, "USA_Money");
			CountryInfo_Money[2] = cache_get_field_content_int(r, "Rusia_Money");
            Server_Info_Check ++;
		}
		cache_delete(result);
	}
	else
	{
	    mysql_format(MySQL, query, sizeof(query), "INSERT INTO `server_info` (`Number`, `USA_Money`, `Rusia_Money`) VALUES ('%d','%d','%d')",
		1, Initial_Money, Initial_Money);
		mysql_query(MySQL, query, false);
	}
	return 1;
}
stock DeleteDropItem(dropid, number)
{
	if(number > 0) DropItemInfo[dropid][iNumber] -= number;
	if(number == -1 || DropItemInfo[dropid][iNumber] <= 0)
	{
	    DestroyObject(DropItemInfo[dropid][iObject]);
		new Rest[iInfo];
		Rest[iObject] = -1;
		Rest[iItemID] = -1;
		DropItemInfo[dropid] = Rest;
	}
	return 1;
}
stock HexToInt(string[])
{
	if(string[0] == 0) return 0;
	new i,
		cur=1,
		res=0;
	for(i = strlen(string); i > 0; i --)
	{
		if (string[i-1]<58) res=res+cur*(string[i-1]-48); else res=res+cur*(string[i-1]-65+10);
		cur=cur*16;
	}
	return res;
}
stock CheckGangzone(playerid, gangzoneid = -1)
{
    new Float:Pos[3], gangzone = -1;
	GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
	if(gangzoneid == -1)
	{
	    for(new g = 0; g < MAX_GANGZONE; g ++)
	    {
	        if(GangzoneInfo[g][gCreate] == 1)
	        {
	            if((Pos[0] > GangzoneInfo[g][gS_PosX]) && (Pos[1] > GangzoneInfo[g][gS_PosY]) && (Pos[0] < GangzoneInfo[g][gE_PosX]) && (Pos[1] < GangzoneInfo[g][gE_PosY])){
	                gangzone = g;break;}
	        }
	    }
	}
	else
	{
	    if((Pos[0] < GangzoneInfo[gangzoneid][gS_PosX]) && (Pos[1] < GangzoneInfo[gangzoneid][gS_PosY]) && (Pos[0] < GangzoneInfo[gangzoneid][gE_PosX]) && (Pos[1] > GangzoneInfo[gangzoneid][gE_PosY]))
	        gangzone = gangzoneid;
	}
	if(gangzone >= 0)
	{
	    for(new o = 0; o < MAX_OCCUPY_AREA; o ++)
	    {
			if((Occupy_AreaInfo[o][oPosX] > GangzoneInfo[gangzone][gS_PosX]) && (Occupy_AreaInfo[o][oPosY] > GangzoneInfo[gangzone][gS_PosY]) && (Occupy_AreaInfo[o][oPosX] < GangzoneInfo[gangzone][gE_PosX]) && (Occupy_AreaInfo[o][oPosY] < GangzoneInfo[gangzone][gE_PosY]))
			    return -1;
		}
		return 1;
	}
	return -1;
}
stock GetOccupyAreaNumber(g)
{
    for(new o = 0; o < MAX_OCCUPY_AREA; o ++)
    {
        if(Occupy_AreaInfo[o][oCreate] == 1)
        {
            if((Occupy_AreaInfo[o][oPosX] > GangzoneInfo[g][gS_PosX]) && (Occupy_AreaInfo[o][oPosY] > GangzoneInfo[g][gS_PosY]) && (Occupy_AreaInfo[o][oPosX] < GangzoneInfo[g][gE_PosX]) && (Occupy_AreaInfo[o][oPosY] < GangzoneInfo[g][gE_PosY]))
                return o;
        }
    }
	return -1;
}
stock GetAreaNumber(o)
{
    for(new g = 0; g < MAX_GANGZONE; g ++)
    {
        if(GangzoneInfo[g][gCreate] == 1)
        {
            if((Occupy_AreaInfo[o][oPosX] > GangzoneInfo[g][gS_PosX]) && (Occupy_AreaInfo[o][oPosY] > GangzoneInfo[g][gS_PosY]) && (Occupy_AreaInfo[o][oPosX] < GangzoneInfo[g][gE_PosX]) && (Occupy_AreaInfo[o][oPosY] < GangzoneInfo[g][gE_PosY]))
                return g;
        }
    }
	return -1;
}
stock GangZoneFlashForAllEx(playerid, OccupyID, g)
{
	if(IsPlayerLogin(playerid) && Occupy_AreaInfo[OccupyID][oCreate] == 1 && Occupy_AreaInfo[OccupyID][oCountry] != PlayerInfo[playerid][pCountry])
    {
	    new color[32];
	    if(PlayerInfo[playerid][pCountry] == 1)
	        strmid(color, COLOR_USA, 0, 32, 32);
	    if(PlayerInfo[playerid][pCountry] == 2)
	        strmid(color, COLOR_RUSIA, 0, 32, 32);
	    GangZoneFlashForAll(GangzoneInfo[g][gGangzone], HexToInt(color));
	    strmid(GangzoneInfo[g][gFlashColor], color, 0, 32, 32);
		return 1;
	}
	return 0;
}
stock ResetGangzone(GangzoneID)
{
	if(GangzoneInfo[GangzoneID][gCreate] == 1)
	{
		GangZoneHideForAll(GangzoneInfo[GangzoneID][gGangzone]);
		GangZoneDestroy(GangzoneInfo[GangzoneID][gGangzone]);
	    GangzoneInfo[GangzoneID][gGangzone] = GangZoneCreate(GangzoneInfo[GangzoneID][gS_PosX],GangzoneInfo[GangzoneID][gS_PosY],GangzoneInfo[GangzoneID][gE_PosX],GangzoneInfo[GangzoneID][gE_PosY]);
	    GangzoneInfo[GangzoneID][gArea] = CreateDynamicRectangle(GangzoneInfo[GangzoneID][gS_PosX],GangzoneInfo[GangzoneID][gS_PosY],GangzoneInfo[GangzoneID][gE_PosX],GangzoneInfo[GangzoneID][gE_PosY]);
	    GangZoneShowForAll(GangzoneInfo[GangzoneID][gGangzone], HexToInt(GangzoneInfo[GangzoneID][gColor]));
		return 1;
	}
	return 0;
}
stock SetAreaColorEx(area, country)
{
    new OccupyID = GetOccupyAreaNumber(area);
    if(Occupy_AreaInfo[OccupyID][oCreate] == 1)
    {
        GangZoneHideForAll(GangzoneInfo[area][gGangzone]);
        if(country == 0){
        	strmid(GangzoneInfo[area][gColor], COLOR_GANGZONE, 0, 32, 32);}
        else if(country == 1){
            strmid(GangzoneInfo[area][gColor], COLOR_USA, 0, 32, 32);}
        else if(country == 2){
			strmid(GangzoneInfo[area][gColor], COLOR_RUSIA, 0, 32, 32);}
        GangZoneShowForAll(GangzoneInfo[area][gGangzone], HexToInt(GangzoneInfo[area][gColor]));
        Occupy_AreaInfo[OccupyID][oCountry] = country;
        SaveOccupyArea(OccupyID); SaveGangzone(area);
		return 1;
    }
	return 0;
}
stock SendOOCNoticeMessage(Message[], color = 0x3DB7CCFF)
{
	SendClientMessageToAll(color, Message);
	for(new i = 0; i < MAX_PLAYERS; i ++) if(IsPlayerConnected(i) && IsPlayerLogin(i)) PlayerPlaySound(i,1058, 0.0, 0.0, 0.0);
	printf(Message);
	return 1;
}
stock SendICNoticeMessage(Message[], color = 0xFF9B37FF)
{
	SendClientMessageToAll(color, Message);
	printf("IC ��ü�� : %s",Message);
	return 1;
}
stock SendCountryMessage(Message[], country, color)
{
	if(country == -1)
	{
	    SendClientMessageToAll(color, Message);
	    printf(Message);
	    return 1;
	}
	else
	{
		for(new i = 0; i < MAX_PLAYERS; i ++)
		{
		    if(IsPlayerLogin(i))
		    {
			    if(PlayerInfo[i][pCountry] == country)
			    {
				    SendClientMessage(i, color, Message);
					printf(Message);
				}
			}
		}
	}
	return 1;
}
stock SetPlayerHealthEx(playerid, Float:Health)
{
	if(Health > 100) { PlayerInfo[playerid][pHealth] = 100.0; SetPlayerHealth(playerid, 100.0); }
	else { SetPlayerHealth(playerid, Health); PlayerInfo[playerid][pHealth] = Health; }
	PlayerInfo[playerid][pAntiHackDelay] = 2;
	SetPlayerShowInfo(playerid);
	return 1;
}
stock SetPlayerArmourEx(playerid, Float:Armour)
{
	if(Armour > 100) {PlayerInfo[playerid][pArmour] = 100.0; SetPlayerArmour(playerid, 100.0); }
    else { SetPlayerArmour(playerid, Armour); PlayerInfo[playerid][pArmour] = Armour; }
    PlayerInfo[playerid][pAntiHackDelay] = 2;
    SetPlayerShowInfo(playerid);
	return 1;
}
stock GivePlayerHealthEx(playerid, Float:Health)
{
    new Float:value;
    GetPlayerHealth(playerid, value);
	value += Health;
	if(value > 100) SetPlayerHealthEx(playerid, 100.0);
	else SetPlayerHealthEx(playerid, value);
	PlayerInfo[playerid][pAntiHackDelay] = 2;
	SetPlayerShowInfo(playerid);
	return 1;
}
stock GivePlayerArmourEx(playerid, Float:Armour)
{
    new Float:value;
    GetPlayerArmour(playerid, value);
	value += Armour;
	if(value > 100) SetPlayerArmourEx(playerid, 100.0);
    else SetPlayerArmourEx(playerid, value);
    PlayerInfo[playerid][pAntiHackDelay] = 2;
    SetPlayerShowInfo(playerid);
	return 1;
}
stock SendAdminMessage(Message[], Color = COLOR_ADMIN, Level = 1)
{
	for(new i = 0; i < MAX_PLAYERS; i ++)
	{
	    if(IsPlayerLogin(i))
	    {
	        if(PlayerInfo[i][pAdmin] > Level)
			{
		    	SendClientMessage(i, Color, Message);
		    }
		}
	}
	print(Message);
	return 1;
}
stock SetPlayerMoneyEx(playerid, money)
{
    ResetPlayerMoney(playerid);
	PlayerInfo[playerid][pMoney] = money;
	GivePlayerMoney(playerid, PlayerInfo[playerid][pMoney]);
	return 1;
}
stock GivePlayerMoneyEx(playerid, money)
{
    ResetPlayerMoney(playerid);
	PlayerInfo[playerid][pMoney] += money;
	GivePlayerMoney(playerid, PlayerInfo[playerid][pMoney]);
	return 1;
}
stock IsPlayerCountryCommander(playerid)
{
	if(PlayerInfo[playerid][pPlatoonType] == 6)
	    if(PlayerInfo[playerid][pPlatoonLevel] == 3) return 1;
	return 0;
}
stock IsPlayerPlatoonLeader(playerid)
{
	if(PlayerInfo[playerid][pPlatoonLevel] == 3) return 1;
	return 0;
}
stock SetPlayerPlatoonLevel(playerid, PlatoonID, level)
{
	PlayerInfo[playerid][pPlatoon] = PlatoonID;
	PlayerInfo[playerid][pPlatoonLevel] = level;
	PlayerInfo[playerid][pPlatoonType] = PlatoonInfo[PlatoonID][p_tType];
	return 1;
}
stock GetPlayerJointCommand(playerid, platoonid, platoonlevel, adminlevel, type = 0)
{
	if(PlayerInfo[playerid][pPlatoonType] == platoonid)
	{
	    if(PlayerInfo[playerid][pPlatoonLevel] >= platoonlevel)
	    {
	        return 1;
	    }
	}
	if(PlayerInfo[playerid][pAdmin] >= adminlevel)
	{
	    return 2;
	}
	if(type == 1) SendMessage(playerid, MessageText[10]);
	return 0;
}
stock GetVehicleStartupInfo(modelid, num)
{
    switch(num)
    {
        case 1 :
        {
            new string[128];
			for(new i = 0; i < MAX_STARTUP_PLATOON; i ++)
			{
		    	//if(!VehiclestartupInfo[modelid][v_sPlatoon][i]) continue;
		    	if(!strlen(string)) { format(string, sizeof(string), "%d�Ҵ�",PlatoonInfo[VehiclestartupInfo[modelid][v_sPlatoon][i]][p_t_Number]); continue; }
				format(string, sizeof(string), "%s | %d�Ҵ�",string,PlatoonInfo[VehiclestartupInfo[modelid][v_sPlatoon][i]][p_t_Number]);
				if(i == MAX_STARTUP_PLATOON - 1 && !strlen(string))
    				strmid(string, "�߰�����", 0, 128, 128);
		    }
		    return string;
		}
		case 2 :
		{
		    new string[128];
		    if(VehiclestartupInfo[modelid][v_sClass] == -1) {strmid(string, "�߰�����", 0, 52, 52); }
			else { format(string, sizeof(string), "%s�̻�",ArmyClass(VehiclestartupInfo[modelid][v_sClass])); }
			return string;
		}
	}
}
stock GetPlayerFrontPos(playerid, &Float:x, &Float:y, &Float:z, Float:distance)
{
    new Float:angle;
    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, angle);
    x += (distance * floatsin(-angle, degrees));
    y += (distance * floatcos(-angle, degrees));
}
stock IsPlayerCloseWeapon(weaponid)
{
	new slot = GetWeaponSlot(weaponid);
	if(slot != 0 && slot != 1 && slot != 11 && slot != 10) return 0;
	return 1;
}
stock SendAroundMessage(playerid, Float:distance, Color1, Color2, Color3, Color4, Color5, Message[], type = 1, player = 1)
{
    new Float:Pos[3], Float:gPos[3], Float:vPos[3];
    new virtualworld = GetPlayerVirtualWorld(playerid);
	if(player == 1) GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	else if(player == 2) { new vehicleid = playerid; GetVehiclePos(vehicleid, Pos[0], Pos[1], Pos[2]); }
	for(new giveplayerid = 0; giveplayerid < MAX_PLAYERS; giveplayerid ++)
	{
		if(IsPlayerConnected(giveplayerid) && IsPlayerLogin(giveplayerid))
		{
		    if(GetPlayerVirtualWorld(giveplayerid) == virtualworld)
		    {
		        GetPlayerPos(giveplayerid, gPos[0], gPos[1], gPos[2]);
		        vPos[0] = (Pos[0] - gPos[0]); vPos[1] = (Pos[1] - gPos[1]); vPos[2] = (Pos[2] - gPos[2]);
		        if(((vPos[0] < distance/16) && (vPos[0] > -distance/16)) && ((vPos[1] < distance/16) && (vPos[1] > -distance/16)) && ((vPos[2] < distance/16) && (vPos[2] > -distance/16)))
				{
				    SendClientMessage(giveplayerid, Color1, Message);
				}
				else if(((vPos[0] < distance/8) && (vPos[0] > -distance/8)) && ((vPos[1] < distance/8) && (vPos[1] > -distance/8)) && ((vPos[2] < distance/8) && (vPos[2] > -distance/8)))
				{
				    SendClientMessage(giveplayerid, Color2, Message);
				}
				else if(((vPos[0] < distance/4) && (vPos[0] > -distance/4)) && ((vPos[1] < distance/4) && (vPos[1] > -distance/4)) && ((vPos[2] < distance/4) && (vPos[2] > -distance/4)))
				{
				    SendClientMessage(giveplayerid, Color3, Message);
				}
				else if(((vPos[0] < distance/2) && (vPos[0] > -distance/2)) && ((vPos[1] < distance/2) && (vPos[1] > -distance/2)) && ((vPos[2] < distance/2) && (vPos[2] > -distance/2)))
				{
				    SendClientMessage(giveplayerid, Color4, Message);
				}
				else if(((vPos[0] < distance) && (vPos[0] > -distance)) && ((vPos[1] < distance) && (vPos[1] > -distance)) && ((vPos[2] < distance) && (vPos[2] > -distance)))
				{
				    SendClientMessage(giveplayerid, Color5, Message);
				}
				if(type == 1) print(Message);
		    }
		}
	}
	return 1;
}
stock PlayerInfoTag(playerid, bool:show)
{
	if(show == true)
	{
	    new string[80], Float:x, Float:y, Float:z;
		PlayerInfo[playerid][pOldClass] = PlayerInfo[playerid][pClass];
		PlayerInfo[playerid][pOldCorps] = PlayerInfo[playerid][pCorps];
		PlayerInfo[playerid][pOldPlatoon] = PlayerInfo[playerid][pPlatoon];
		strmid(PlayerInfo[playerid][pOldPlatoonName], PlatoonInfo[PlayerInfo[playerid][pPlatoon]][p_tName], 0, 128, 128);
	    format(string, sizeof(string), "[���] : %s\n[����] : %s\n[�Ҵ�] : %s", ArmyClass(PlayerInfo[playerid][pClass]),CorpsName(PlayerInfo[playerid][pCorps]), PlatoonInfo[PlayerInfo[playerid][pPlatoon]][p_tName]);
	    if(PlayerInfo[playerid][pInfoTage] == 1)
	    {
	        Update3DTextLabelText(PlayerInfo[playerid][pInfoTageLabel], COLOR_INFOTAG, string);
	    }
	    else
		{
	        GetPlayerPos(playerid, x,y,z);
		    PlayerInfo[playerid][pInfoTage] = 1;
		    PlayerInfo[playerid][pInfoTageLabel] = Create3DTextLabel(string, COLOR_INFOTAG, x, y, z, 10.0, 0);
		    Attach3DTextLabelToPlayer(PlayerInfo[playerid][pInfoTageLabel], playerid, 0, 0, -0.5);
		}
	}
	else if(show == false)
	{
	    if(PlayerInfo[playerid][pInfoTage] == 1) Delete3DTextLabel(PlayerInfo[playerid][pInfoTageLabel]);
	    PlayerInfo[playerid][pInfoTage] = 0;
	}
	return 1;
}
stock IDBan(playerid, giveplayerid, result[])
{
    new string[256];
    format(string, sizeof(string), "���� %s�Կ����� ����� ������ �����Ǿ����ϴ�. [���� : %s]",PlayerInfo[giveplayerid][pAdminName], result);
    SendMessage(playerid, string, COLOR_WARNING);

	new Year, Month, Day;
	getdate(Year, Month, Day);
	strmid(PlayerInfo[playerid][pgIDBanName], PlayerInfo[giveplayerid][pAdminName], 0, 128, 128);

	PlayerInfo[playerid][pIDBan] = 1;
	PlayerInfo[playerid][pIDBanDate][0] = Year;
	PlayerInfo[playerid][pIDBanDate][1] = Month;
	PlayerInfo[playerid][pIDBanDate][2] = Day;
	strmid(PlayerInfo[playerid][pIDBanReason], result, 0, 128, 128);
    KickEx(playerid, 1);
	return 1;
}

stock BanAdd(playerid = -1, ip[] = "none", reason[], giveplayerid = -1, type = 1)
{
    if(type == 1) //������
    {
        new PlayerIP[32];
        GetPlayerIp(playerid, PlayerIP, 32);

        new Year, Month, Day;
        getdate(Year, Month, Day);

        new AdminName[128];
        if(playerid != -1) strmid(AdminName, PlayerInfo[giveplayerid][pAdminName], 0, 128, 128);
		else strmid(AdminName, "None", 0, 128, 128);

		new N_Type[32];
		strmid(N_Type, "������", 0, 32, 32);

        new query[256];
	    mysql_format(MySQL, query, sizeof(query),"INSERT INTO `ban` (`IP`, `Name`, `gA_Name`, `reason`, `Type`,`Year`, `Month`, `Day`) VALUES ('%s', '%s', '%s', '%s', '%s', '%d', '%d', '%d')",
		PlayerIP, PlayerNameEx(playerid), AdminName, reason, N_Type, Year, Month, Day);
		mysql_query(MySQL, query, false);

        KickEx(playerid, 1);

        print("������");
	}
	else if(type == 2) //������
    {
        new PlayerIP[32], ips[4][4];
        GetPlayerIp(playerid, PlayerIP, 32);
        split(PlayerIP, ips, '.');
	    format(PlayerIP, sizeof(PlayerIP),"%s.%s.%s.*",ips[0],ips[1],ips[2]);

        new Year, Month, Day;
        getdate(Year, Month, Day);

	    new AdminName[128];
        if(playerid != -1) strmid(AdminName, PlayerInfo[giveplayerid][pAdminName], 0, 128, 128);
		else strmid(AdminName, "None", 0, 128, 128);

        new N_Type[32];
		strmid(N_Type, "������", 0, 32, 32);

        new query[256];
	    mysql_format(MySQL, query, sizeof(query),"INSERT INTO `ban` (`IP`, `Name`, `gA_Name`, `reason`, `Type`,`Year`, `Month`, `Day`) VALUES ('%s', '%s', '%s', '%s', '%s', '%d', '%d', '%d')",
		PlayerIP, PlayerNameEx(playerid), AdminName, reason, N_Type, Year, Month, Day);
		mysql_query(MySQL, query, false);

        KickEx(playerid, 1);

        print("������");
    }
	else if(type == 3)
	{
	    new Year, Month, Day;
	    getdate(Year, Month, Day);

	    new AdminName[128];
	    if(playerid != -1) strmid(AdminName, PlayerInfo[giveplayerid][pAdminName], 0, 128, 128);
		else strmid(AdminName, "None", 0, 128, 128);

        new N_Type[32];
		strmid(N_Type, "�����ǹ�", 0, 32, 32);

	    new query[256];
	    mysql_format(MySQL, query, sizeof(query),"INSERT INTO `ban` (`IP`, `Name`, `gA_Name`, `reason`, `Type`,`Year`, `Month`, `Day`) VALUES ('%s', '%s', '%s', '%s', '%s', '%d', '%d', '%d')",
		ip, "None", AdminName, reason, N_Type, Year, Month, Day);
		mysql_query(MySQL, query, false);
	}
	return 1;
}

stock GetWeaponNameEx(weaponid)
{
	new weaponname[32];
    GetWeaponName(weaponid, weaponname, sizeof(weaponname));
	return weaponname;
}
stock ChangePlayerCountry(playerid, country)
{
	PlayerInfo[playerid][pCountry] = country;
    SetPlayerPlatoonLevel(playerid, 0, 0);
    //PlayerDataCreate(playerid); // : ���� �� ��Ű���� �ּ� ����
    OnPlayerSpawn(playerid);// ���� Ȯ��
	return 1;
}
stock GivePlayerItemEx(playerid, ItemID, Number)
{
    if(ItemID > 46)
	{
		for(new i = 0; i < MAX_INVENTORY; i ++)
		{
			if(PlayerInfo[playerid][pI_ItemID][i] == ItemID && PlayerInfo[playerid][pI_Number][i] > 0 || PlayerInfo[playerid][pI_Number][i] <= 0)
			{
			    PlayerInfo[playerid][pI_ItemID][i] = ItemID;
      			PlayerInfo[playerid][pI_Number][i] += Number;
      			if(PlayerInfo[playerid][pI_Number][i] <= 0)
      			{
      			    PlayerInfo[playerid][pI_ItemID][i] = 0;
      			    PlayerInfo[playerid][pI_Number][i] = 0;
      			}
      			return 1;
			}
		}
	}
	else if(0 < ItemID <= 46)
	{
	    GivePlayerWeaponEx(playerid, ItemID, Number);
	    return 1;
	}
	return 0;
}
stock RemoveItemEx(playerid, ItemID, Number)
{
	if(ItemID <= 0 || Number <= 0) return 0;
	if(IsPlayerLogin(playerid))
	{
	    if(ItemID > 46)
	    {
	        for(new i = 0; i < MAX_INVENTORY; i ++)
	        {
			    if(PlayerInfo[playerid][pI_Number][i] > 0)
			    {
			        if(PlayerInfo[playerid][pI_ItemID][i] == ItemID)
			        {
			            PlayerInfo[playerid][pI_Number][i] -= Number;
			            if(PlayerInfo[playerid][pI_Number][i] <= 0){
			            	PlayerInfo[playerid][pI_Number][i] = 0;
				        	PlayerInfo[playerid][pI_ItemID][i] = 0;}
				        return 1;
					}
				}
			}
	    }
	    else if(0 < ItemID <= 46 && Number > 0)
		{
		    //RemovePlayerWeaponEx(playerid, ItemID, Number);
		}
	}
	return 0;
}
stock ItemIDFind(playerid, itemid, number = 1)
{
	for(new i = 0 ; i < MAX_INVENTORY; i ++)
	{
	    if(PlayerInfo[playerid][pI_ItemID][i] == itemid && PlayerInfo[playerid][pI_ItemID][i] >= number)
	    {
	        return i;
	    }
	}
    return -1;
}
stock CreateUserColumn()
{
	new query[128], string[128];
	print ( "[INFO] Create User Column . . . [ 30 ~ 60 Second ]" ); //������ ����ȭ �� ������� ��ü ����.
	mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD COLUMN `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,ADD PRIMARY KEY (`ID`);"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pPassword` text"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pName` text"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pSex` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pCountry` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pAdmin` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pAdminName` text"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pTut` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pAge` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pInterior` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pVirtualWorld` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pPosX` float(10,5)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pPosY` float(10,5)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pPosZ` float(10,5)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pAngle` float(10,5)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pNPCQwest` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pPlatoon` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pCorps` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pClass` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pMoney` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pPlayHour` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pPlayMinute` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pPlaySecond` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pHealth` float(10,5)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pArmour` float(10,5)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pPlatoonLevel` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pMedal` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pPlatoonType` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pDeMorgan` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pDeMorganTimer` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pJail` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pJailTimer` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pWarning` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pIDBan` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pgIDBanName` text"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pIDBanDate_0` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pIDBanDate_1` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pIDBanDate_2` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pIDBanReason` text"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pChatBan` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pDie` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pDieTime` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pPhoneFrequency` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pClothes` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pEnlistDate_0` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pEnlistDate_1` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pEnlistDate_2` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pSet_Spec` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pPraise` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pHungry` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pClean` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pDonation` int(10)"); mysql_query(MySQL, query, false);
    mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `pPhoneNum` int(10)"); mysql_query(MySQL, query, false);
    for(new i = 0; i < MAX_INVENTORY; i ++)
    {
        format(string, sizeof(string), "pI_ItemID_%d",i); mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `%s` int(10)", string); mysql_query(MySQL, query, false);
        format(string, sizeof(string), "pI_Number_%d",i); mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `%s` int(10)", string); mysql_query(MySQL, query, false);
    }
    for(new i = 0; i < MAX_WEAPON_SLOT; i ++)
    {
        format(string, sizeof(string), "pWeaponID_%d",i); mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `%s` int(10)", string); mysql_query(MySQL, query, false);
        format(string, sizeof(string), "pAmmo_%d",i); mysql_format(MySQL, query, sizeof(query), "ALTER TABLE `user` ADD `%s` int(10)", string); mysql_query(MySQL, query, false);
    }
    print ( "[INFO] Create User Column Success" ) ;
	return 1;
}
stock C4EmplaceMode(playerid, bool:type)
{
	if(type == true)
	{
	    PlayerInfo[playerid][pC4Emplace] = 1;
	    SetPlayerAttachedObject(playerid, 9, ItemInfo[50][_ModelID], 6);
	}
	if(type == false)
	{
	    PlayerInfo[playerid][pC4Emplace] = 0;
	    RemovePlayerAttachedObject(playerid, 9);
	}
	return 0;
}
stock SetVehicleToRespawnEx(VehicleID)
{
    SetVehicleToRespawn(VehicleID);
	SetTimerEx("_SetVehicleToRespawnEx", 1000, false, "d", VehicleID);
	return 1;
}
stock split(const strsrc[], strdest[][], delimiter)
{
	new i,li,aNum,len;
	while(i <= strlen(strsrc))
	{
	    if(strsrc[i]==delimiter || i==strlen(strsrc))
		{
	        len = strmid(strdest[aNum], strsrc, li, i, 128);
	        strdest[aNum][len] = 0;
	        li = i+1;
	        aNum++;
		}
		i++;
	}
	return 1;
}
stock strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[25];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}
stock CreateDynamicMoveObject(Model, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, Float:x2, Float:y2, Float:z2, Float:rx2, Float:ry2, Float:rz2, VirtualWorld = 0, Interior = 0, type, Float:speed, Float:distance, Message[] = "")
{
	MoveObjectInfo[MoveObjectNumber][mCreate] = 1; MoveObjectInfo[MoveObjectNumber][mSpeed] = speed; MoveObjectInfo[MoveObjectNumber][mType] = type; MoveObjectInfo[MoveObjectNumber][mDistance] = distance;
	if(strlen(Message))
	{
		new string[52];
		format(string, sizeof(string), "%s",Message);
		Create3DTextLabel(string,0x008080FF,x,y,z - 1,10.0,VirtualWorld);
	}
    MoveObjectInfo[MoveObjectNumber][mObjectID] = CreateDynamicObject(Model, x, y, z, rx, ry, rz, VirtualWorld, Interior);
    MoveObjectInfo[MoveObjectNumber][mPosX] = x; MoveObjectInfo[MoveObjectNumber][mPosY] = y; MoveObjectInfo[MoveObjectNumber][mPosZ] = z; MoveObjectInfo[MoveObjectNumber][mPosrX] = rx; MoveObjectInfo[MoveObjectNumber][mPosrY] = ry; MoveObjectInfo[MoveObjectNumber][mPosrZ] = rz;
    MoveObjectInfo[MoveObjectNumber][mPosX2] = x2; MoveObjectInfo[MoveObjectNumber][mPosY2] = y2; MoveObjectInfo[MoveObjectNumber][mPosZ2] = z2; MoveObjectInfo[MoveObjectNumber][mPosrX2] = rx2; MoveObjectInfo[MoveObjectNumber][mPosrY2] = ry2; MoveObjectInfo[MoveObjectNumber][mPosrZ2] = rz2;
	MoveObjectNumber ++;
	return 1;
}
stock SettingON_OFF(setting)
{
	new str[12];
	if(setting == 0 || setting == -1)
	    strmid(str, "OFF", 0, 12, 12);
	else if(setting == 1)
	    strmid(str, "ON", 0, 12, 12);
	return str;
}
stock ObjectNameEx(objectid)
{
	new string[52];
	for(new i = 0; i < sizeof(ItemInfo); i ++)
	{
	    if(ItemInfo[i][_ModelID] == objectid)
	    {
	        strmid(string, ItemInfo[i][_ItemName], 0, 52, 52);
	        break;
	    }
	}
	return string;
}
stock SetVehicleHealthEx(vehicleid, Float:health)
{
	VehicleInfo[vehicleid][vHealth] = health;
	SetVehicleHealth(vehicleid, health);
	return 1;
}
new VehicleNames[][] =
{
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel",
	"Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana", "Infernus",
	"Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
    "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BF Injection",
	"Hunter", "Premier", "Enforcer", "Securicar", "Banshee", "Predator", "Bus",
	"Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach", "Cabbie",
	"Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral",
	"Squalo", "Seasparrow", "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder",
	"Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair", "Berkley's RC Van",
	"Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale",
	"Oceanic","Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy",
	"Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX",
	"Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper",
	"Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking",
	"Blista Compact", "Police Maverick", "Boxville", "Benson", "Mesa", "RC Goblin",
	"Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher", "Super GT",
	"Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stunt",
 	"Tanker", "Roadtrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra",
 	"FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck", "Fortune",
 	"Cadrona", "FBI Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer",
 	"Remington", "Slamvan", "Blade", "Freight", "Streak", "Vortex", "Vincent",
    "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder", "Primo",
	"Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite",
	"Windsor", "Monster", "Monster", "Uranus", "Jester", "Sultan", "Stratium",
	"Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito",
    "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper",
	"Broadway", "Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400",
	"News Van", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
	"Freight Box", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car",
 	"Police Car", "Police Car", "Police Ranger", "Picador", "S.W.A.T", "Alpha",
 	"Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs", "Boxville",
 	"Tiller", "Utility Trailer"
};
stock VehicleNameEx(vehicleid)
{
	new modelname[52];
	format(modelname,sizeof(modelname), "%s", VehicleNames[GetVehicleModel(vehicleid) - 400]);
	return modelname;
}
stock VehicleAct(vehicleid, message[])
{
	new string[128];
    format(string, sizeof(string), "* %s %s", VehicleNameEx(vehicleid), message);
	SendAroundMessage(vehicleid, 10.0, COLOR_ACT, COLOR_ACT, COLOR_ACT, COLOR_ACT, COLOR_ACT, string, _, 2);
	return 1;
}
stock BattalionRadio(playerid, Message[])
{
    if(!PlayerInfo[playerid][pPlatoon]) return SendErrorMessage(playerid, MessageText[20]);
    new string[128], platoonid = PlayerInfo[playerid][pPlatoon], virtualworld = GetPlayerVirtualWorld(playerid);
    new Float:Pos[3], Float:gPos[3], Float:vPos[3], Float:distance = 10.0;
    GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
    format(string, sizeof(string), "[��빫��] %dst %s : %s",PlatoonInfo[platoonid][p_t_Number],PlayerNameEx(playerid, 2),Message);
    for(new i = 0; i < MAX_PLAYERS; i ++)
    {
        if(IsPlayerConnected(i) && IsPlayerLogin(i))
        {
            if(virtualworld == GetPlayerVirtualWorld(i))
            {
	            if(PlayerInfo[playerid][pCountry] == PlayerInfo[i][pCountry])
	            {
	                //SendMessage(i, string, 0xFF8282AA);
	                continue;
	            }
	            GetPlayerPos(i, gPos[0], gPos[1], gPos[2]);
		        vPos[0] = (Pos[0] - gPos[0]); vPos[1] = (Pos[1] - gPos[1]); vPos[2] = (Pos[2] - gPos[2]);
		        if(((vPos[0] < distance/16) && (vPos[0] > -distance/16)) && ((vPos[1] < distance/16) && (vPos[1] > -distance/16)) && ((vPos[2] < distance/16) && (vPos[2] > -distance/16)))
				{
				    SendClientMessage(i, COLOR_FADE1, string);
				}
				else if(((vPos[0] < distance/8) && (vPos[0] > -distance/8)) && ((vPos[1] < distance/8) && (vPos[1] > -distance/8)) && ((vPos[2] < distance/8) && (vPos[2] > -distance/8)))
				{
				    SendClientMessage(i, COLOR_FADE2, string);
				}
				else if(((vPos[0] < distance/4) && (vPos[0] > -distance/4)) && ((vPos[1] < distance/4) && (vPos[1] > -distance/4)) && ((vPos[2] < distance/4) && (vPos[2] > -distance/4)))
				{
				    SendClientMessage(i, COLOR_FADE3, string);
				}
				else if(((vPos[0] < distance/2) && (vPos[0] > -distance/2)) && ((vPos[1] < distance/2) && (vPos[1] > -distance/2)) && ((vPos[2] < distance/2) && (vPos[2] > -distance/2)))
				{
				    SendClientMessage(i, COLOR_FADE4, string);
				}
				else if(((vPos[0] < distance) && (vPos[0] > -distance)) && ((vPos[1] < distance) && (vPos[1] > -distance)) && ((vPos[2] < distance) && (vPos[2] > -distance)))
				{
				    SendClientMessage(i, COLOR_FADE5, string);
				}
			}
        }
    }
    SendCountryMessage(string, PlayerInfo[playerid][pCountry], 0xFF8282AA);
    return 1;
}
stock PlatoonRadio(playerid, Message[])
{
    if(!PlayerInfo[playerid][pPlatoon]) return SendErrorMessage(playerid, MessageText[20]);
    new string[128], platoonid = PlayerInfo[playerid][pPlatoon], virtualworld = GetPlayerVirtualWorld(playerid);
    new Float:Pos[3], Float:gPos[3], Float:vPos[3], Float:distance = 10.0;
    GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
    format(string, sizeof(string), "[�Ҵ빫��] (%dst)%s %s : %s",PlatoonInfo[platoonid][p_t_Number],PlayerNameEx(playerid),ArmyClass(PlayerInfo[playerid][pClass]),Message);
    for(new i = 0; i < MAX_PLAYERS; i ++)
    {
        if(IsPlayerConnected(i) && IsPlayerLogin(i))
        {
            if(virtualworld == GetPlayerVirtualWorld(i))
            {
	            if(PlayerInfo[playerid][pPlatoon] == PlayerInfo[i][pPlatoon])
	            {
	                SendMessage(i, string, 0xFF8282AA);
	                continue;
	            }
	            GetPlayerPos(i, gPos[0], gPos[1], gPos[2]);
		        vPos[0] = (Pos[0] - gPos[0]); vPos[1] = (Pos[1] - gPos[1]); vPos[2] = (Pos[2] - gPos[2]);
		        if(((vPos[0] < distance/16) && (vPos[0] > -distance/16)) && ((vPos[1] < distance/16) && (vPos[1] > -distance/16)) && ((vPos[2] < distance/16) && (vPos[2] > -distance/16)))
				{
				    SendClientMessage(i, COLOR_FADE1, string);
				}
				else if(((vPos[0] < distance/8) && (vPos[0] > -distance/8)) && ((vPos[1] < distance/8) && (vPos[1] > -distance/8)) && ((vPos[2] < distance/8) && (vPos[2] > -distance/8)))
				{
				    SendClientMessage(i, COLOR_FADE2, string);
				}
				else if(((vPos[0] < distance/4) && (vPos[0] > -distance/4)) && ((vPos[1] < distance/4) && (vPos[1] > -distance/4)) && ((vPos[2] < distance/4) && (vPos[2] > -distance/4)))
				{
				    SendClientMessage(i, COLOR_FADE3, string);
				}
				else if(((vPos[0] < distance/2) && (vPos[0] > -distance/2)) && ((vPos[1] < distance/2) && (vPos[1] > -distance/2)) && ((vPos[2] < distance/2) && (vPos[2] > -distance/2)))
				{
				    SendClientMessage(i, COLOR_FADE4, string);
				}
				else if(((vPos[0] < distance) && (vPos[0] > -distance)) && ((vPos[1] < distance) && (vPos[1] > -distance)) && ((vPos[2] < distance) && (vPos[2] > -distance)))
				{
				    SendClientMessage(i, COLOR_FADE5, string);
				}
			}
        }
    }
    print(string);
	return 1;
}
stock CreateTextPickup(pickupid, Float:x, Float:y, Float:z, text[], virtualworld = 0)
{
	if(!strlen(text)) return print("Textpick Error [text blank error]");
    CreatePickup(pickupid,1,x,y,z,0);
    Create3DTextLabel(text, COLOR_WHITE, x,y,z, 10.0, virtualworld);
    return 1;
}
stock IsPlayerVehicleStart(playerid, vehicleid)
{
	if(VehicleInfo[vehicleid][vEngine] == false)
	{
		OnPlayerCommandText(playerid, "/me Ű�� ���������� ���� �õ��� Ų��.");
	    SetTimerEx("VehicleEngenStart", 3000, false, "dd", playerid, vehicleid);
	    return 1;
	}
	else if(VehicleInfo[vehicleid][vEngine] == true)
	{
	    new bool:startup = false,
	        ModelID = GetVehicleModel(vehicleid);
	    if(VehiclestartupInfo[ModelID][v_sCreate] == 1)
		{
		    if(PlayerInfo[playerid][pClass] >= VehiclestartupInfo[ModelID][v_sClass]) startup = true;
		    if(startup == false)
		    {
				for(new i = 0; i < MAX_STARTUP_PLATOON; i ++)
				{
				    if(VehiclestartupInfo[ModelID][v_sPlatoon][i] == PlayerInfo[playerid][pPlatoon])
				    {
				        startup = true;
				        break;
				    }
				}
			}
		}
		if(startup == true)
		{
		    new engine, lights, alarm, doors, bonnet, boot, objective;
			GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(vehicleid, false, lights, alarm, doors, bonnet, boot, objective);
			VehicleInfo[vehicleid][vEngine] = false;
			OnPlayerCommandText(playerid, "/me Ű�� �������� ���� �õ��� ����.");
			VehicleAct(vehicleid, "�õ��� �������ϴ�.");
		    return 1;
		}
	}
	return 0;
}
//==========================�������� ������ �� ���� by.OTACON==========================//
stock CreateObjectCampfire(playerid)
{
	for(new slot = 0; slot < MAX_BONFIRE; slot ++)
	{
	    if(!ObjectCampfire[slot][8])
	    {
	        new Float:pos[3], Float:angle; GetPlayerPos(playerid, pos[0], pos[1], pos[2]); GetPlayerFacingAngle(playerid, angle);
		    pos[0] += (2.0 * floatsin(-angle, degrees));
		    pos[1] += (2.0 * floatcos(-angle, degrees));
		    pos[2] = pos[2] - 1.0;
			ObjectCampfire[slot][0] = CreateDynamicObject(841, pos[0], pos[1], pos[2], 0.000, 0.000, 0.0);
		    ObjectCampfire[slot][1] = CreateDynamicObject(841, pos[0], pos[1] -0.5, pos[2], 0, 0, 0);
		    ObjectCampfire[slot][2] = CreateDynamicObject(841, pos[0], pos[1] -0.5, pos[2], 0, 0, 90);
		    ObjectCampfire[slot][3] = CreateDynamicObject(18688, pos[0] + 0.5, pos[1] -0.5, pos[2] -2, 0, 0, 0);
		    ObjectCampfire[slot][4] = CreateDynamicObject(18688, pos[0] -0.5, pos[1] -0.5, pos[2] -2, 0, 0, 0);
		    ObjectCampfire[slot][5] = CreateDynamicObject(18688, pos[0], pos[1] -0.5, pos[2] -2, 0, 0, 0);
		    ObjectCampfire[slot][6] = CreateDynamicObject(18688, pos[0], pos[1] -0.5, pos[2] -2, 0, 0, 0);
		    ObjectCampfire[slot][7] = CreateDynamicObject(18688, pos[0], pos[1] -0.5, pos[2] -2, 0, 0, 0);
		    ObjectCampfire[slot][8] = 1;
		    PlayerInfo[playerid][pCampfireID] = slot;
			return 1;
		}
	}
	return 0;
}
stock DestroyObjectCampfire(playerid)
{
	new slot = PlayerInfo[playerid][pCampfireID];
	for(new i = 0; i < 8; i ++) DestroyDynamicObject(ObjectCampfire[slot][i]);
	ObjectCampfire[slot][8] = 0;
	PlayerInfo[playerid][pCampfireID] = -1;
	PlayerInfo[playerid][pCampfire] = false;
	return 1;
}
//==========================�������� ������ �� ���� by.OTACON==========================//
