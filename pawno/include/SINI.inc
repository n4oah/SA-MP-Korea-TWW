/*
_____________________________________________________

Namo Server Header SINI
_____________________________________________________

Description:
	INI Write,Read

_____________________________________________________
Function:

    INI_Exist(filename[])
	INI_Open(filename[])
	INI_Close()
	INI_Write(section[],key[],value[])
	INI_WriteInt(section[],key[],value[])
	INI_WriteFloat(section[],key[],value[])
	INI_Read(key[],bool:seek=true)
	
_____________________________________________________

Example:

	main()
	{
		INI_Open("Test.txt",Read);
		printf("ServerName:%s",INI_Read("ServerName"));
		INI_Close();
	}

______________________________________________________
Version 0.2

______________________________________________________

*/

#if defined _SINI_included
	#endinput
#endif

#define _SINI_included
#pragma library SINI

#define MAX_FUNC_NAME 200


#if !defined DEBUG
	#define DEBUG 0
#endif



#define INI_ReadInt(%0) strval(INI_Read(%0))
#define INI_ReadFloat(%0) floatstr(INI_Read(%0))

#if !defined MAX_STRING
	#define MAX_STRING 255
#endif

new
	File:g_hIniFile,
	bool:g_bOpend = false,
	e_fmode:g_efmode;
	
enum
	e_fmode{ Read , Write };

stock INI_Remove(filename[])
{
	return fremove(filename);
}

stock INI_Exist(filename[])
{
	if(fexist(filename)) return 1;
	else return 0;
}
stock INI_Open(filename[],e_fmode:fmode)
{
	if(fexist(filename) || fmode==Write)
	{
		if(g_bOpend) fclose(g_hIniFile);
		g_hIniFile=fopen(filename,(fmode==Read)?io_read:io_write);
		g_efmode=fmode;
		g_bOpend=true;
	}
	return 1;
}
stock INI_Close()
{
	if(g_bOpend==true )
	{
		g_bOpend=false;
		fclose(g_hIniFile);
	}
}
stock INI_WriteFloat(key[],Float:value)
{
	new szBuf[MAX_STRING];
	format(szBuf,sizeof szBuf,"%f",value);
	return INI_Write(key,szBuf);
}
stock INI_WriteInt(key[],value)
{
	new szBuf[MAX_STRING];
	format(szBuf,sizeof szBuf,"%d",value);
	return INI_Write(key,szBuf);
}

stock INI_Write(key[],value[])
{
	new
		szBuf[MAX_STRING];
	
    if(!g_bOpend||g_efmode!=Write) return 0;

	format(szBuf,sizeof szBuf,"%s=%s",key,value);
	for(new i=0,l=strlen(key)+strlen(value)+1; i<l; i++)
	{
	    fputchar(g_hIniFile,szBuf[i],false);
	}
	fwrite(g_hIniFile,"\r\n");
	return 1;
}

stock INI_Read(key[],bool:seek=true)
{
    if(!g_bOpend||g_efmode!=Read) goto turn;

	
	new
		szReadBuf[MAX_STRING],
		sResult[MAX_STRING];

	if(seek)fseek(g_hIniFile);
	while(fread(g_hIniFile,szReadBuf) )
	{
		szReadBuf[(strfind(szReadBuf,"\n")!=-1)?strfind(szReadBuf,"\n")-1:
		(strfind(szReadBuf,"\r")!=-1)?strfind(szReadBuf,"\r")-1:strlen(szReadBuf)]=EOS;
	    if(strcmp(szReadBuf,key,false,strlen(key))==0 &&strfind(szReadBuf,"=")!=-1  &&strlen(key)==strfind(szReadBuf,"="))
	    {
	        strmid(sResult,szReadBuf,strfind(szReadBuf,"=")+1,strlen(szReadBuf),255);
			return sResult;
		}
	}
	turn:return sResult;
}







