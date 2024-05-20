#include <a_samp>
#include <dini>
#include <sscanf2>
#include <zcmd>
#include <YSI-Includes\YSI_Coding\y_hooks>

#pragma warning disable 239

// -=-= Modulos -=-= //
#include "../modulos/textdraws.pwn"
#include "../modulos/mapas.pwn"

// -=-= News -=-= //
new bool:Logado[MAX_PLAYERS];
new bool:PegouBike[MAX_PLAYERS];
new Bike[MAX_PLAYERS];

// -=-= Dialog -=-= //
#define DIALOG_LOGIN 1
#define DIALOG_REGISTRO 2

// -=-= Enum -=-= //
enum pInfo
{
    Dinheiro,
	Skin,
	Nivel
};	
new Player[MAX_PLAYERS][pInfo];

main(){}


public OnGameModeInit()
{
	SetGameModeText("Roleplay BR");
	UsePlayerPedAnims();

	// -=-= Spawn
	Create3DTextLabel("Aeroporto LS\nPressione [F] para sair", -1, 1910.6096,-2409.3840,18.3296, 7.0, 0);
	CreatePickup(1239, 23, 1910.6096,-2409.3840,18.3296, 0);
	Create3DTextLabel("Aeroporto LS\nPressione [F] para entrar", -1, 1685.7212,-2237.9993,13.5469, 7.0, 0);
	CreatePickup(1239, 23, 1685.7212,-2237.9993,13.5469, 0);
	Create3DTextLabel("{1E90FF}Aluguel de Bicicletas\n{FFFFFF}Use /bike para pegar uma", -1, 1675.4165,-2261.2625,13.5341, 7.0, 0);
	CreatePickup(19131, 23, 1675.4165,-2261.2625,13.5341, 0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	TogglePlayerControllable(playerid, 0);
	TogglePlayerSpectating(playerid, 1);
	for(new g = 0; g < 7; g++) TextDrawShowForPlayer(playerid, TDlogin[g]);
	for(new p = 0; p < 5; p++) PlayerTextDrawShow(playerid, TDPlogin[playerid][p]);
	SelectTextDraw(playerid, 0xFF4500FF);
	for(new i = 0; i < 20; i++) SendClientMessage(playerid, -1, "");
	SendClientMessage(playerid, -1, "Bem vindo ao servidor {FF4500}San Andreas {FFFFFF}Roleplay");
	return 1;
}

public OnPlayerConnect(playerid)
{
	Logado[playerid] = false;
	PegouBike[playerid] = false;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	SalvarDados(playerid);
	DestroyVehicle(Bike[playerid]);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		new Float:Pos[3]; GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
		if(IsPlayerInRangeOfPoint(i, 30.0, Pos[0], Pos[1], Pos[2]))
		{
			static str[250]; format(str, sizeof(str), "%s [%d] diz: %s", PlayerName(playerid), playerid, text);
			SendClientMessage(i, -1, str);
		}
	}
	return 0;
}

public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
    if(!success) return SendClientMessage(playerid, -1, "[{FF0000}ERRO{FFFFFF}] {FF0000}Comando inexistente!");
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys == KEY_SECONDARY_ATTACK)
	{
		if(IsPlayerInRangeOfPoint(playerid, 1.0, 1910.6096,-2409.3840,18.3296))
		{
			SetPlayerPos(playerid, 1685.7614,-2239.5645,13.5469);
			SetPlayerFacingAngle(playerid, 177.5654);
		}
		if(IsPlayerInRangeOfPoint(playerid, 1.0, 1685.7212,-2237.9993,13.5469))
		{
			SetPlayerPos(playerid, 1912.1544,-2409.4741,18.3296);
			SetPlayerFacingAngle(playerid, 271.7756);
		}
	}
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_LOGIN)
	{
		if(response)
		{
			if(strcmp(inputtext, dini_Get(Arquivo(playerid), "Senha")) == 0)
			{
				CarregarDados(playerid);
				SetSpawnInfo(playerid, 0, Player[playerid][Skin], 1942.8358,-2418.5146,18.3296,354.7380, 0, 0, 0, 0, 0, 0);
				SpawnPlayer(playerid);

				TogglePlayerControllable(playerid, 1);
				TogglePlayerSpectating(playerid, 0);
				for(new g = 0; g < 7; g++) TextDrawHideForPlayer(playerid, TDlogin[g]);
				for(new p = 0; p < 5; p++) PlayerTextDrawHide(playerid, TDPlogin[playerid][p]);
				CancelSelectTextDraw(playerid);
                for(new i = 0; i < 20; i++) SendClientMessage(playerid, -1, "");
				new mensagem[150]; format(mensagem, sizeof(mensagem), "[{FF4500}SA{FFFFFF}] Bem-Vindo ao servidor! {FF4500}%s", PlayerName(playerid));
				SendClientMessage(playerid, -1, mensagem);
				Logado[playerid] = true;
				SetPlayerColor(playerid, 0xFFFFFF99);
			}
			else
			{
				SendClientMessage(playerid, -1, "[{FF4500}SA{FFFFFF}] {FF0000}Senha Incorreta!");
			}
		}
		else
		{

		}
	}
	if(dialogid == DIALOG_REGISTRO)
	{
		if(response)
		{
			dini_Create(Arquivo(playerid));
			dini_Set(Arquivo(playerid), "Senha", inputtext);

			SetSpawnInfo(playerid, 0, 154, 1942.8358,-2418.5146,18.3296,354.7380, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
			TogglePlayerControllable(playerid, 1);
			TogglePlayerSpectating(playerid, 0);
			for(new g = 0; g < 7; g++) TextDrawHideForPlayer(playerid, TDlogin[g]);
			for(new p = 0; p < 5; p++) PlayerTextDrawHide(playerid, TDPlogin[playerid][p]);
			CancelSelectTextDraw(playerid);

            Player[playerid][Dinheiro] = 8000;
			Player[playerid][Skin] = 154;
			Player[playerid][Nivel] = 1;
				

			SetPlayerScore(playerid, 1);
			SetPlayerColor(playerid, 0xFFFFFF99);
			SalvarDados(playerid);
            for(new i = 0; i < 20; i++) SendClientMessage(playerid, -1, "");
			new mensagem[150]; format(mensagem, sizeof(mensagem), "[{FF4500}SA{FFFFFF}] Bem-Vindo ao servidor! {FF4500}%s", PlayerName(playerid));
			SendClientMessage(playerid, -1, mensagem);
			Logado[playerid] = true;
		}
		else
		{
			
		}
	}
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
    if(playertextid == TDPlogin[playerid][0]) //registrar
	{
		if(dini_Exists(Arquivo(playerid)))
		{
			new str[300];
			format(str, sizeof(str), "{FFFFFF}Conta: {FF4500}%s\n{FFFFFF}Status: {00FF00}Registrada\n\n{FF4500}* {FFFFFF}Digite uma senha para logar no servidor!", PlayerName(playerid));
			ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT, "{FF4500}San Andreas {FFFFFF}- Login", str, "Confirmar", "Fechar");
		}
		else
		{
			new str[300];
			format(str, sizeof(str), "{FFFFFF}Conta: {FF4500}%s\n{FFFFFF}Status: {FF0000}Sem Registro\n\n{FF4500}* {FFFFFF}Digite uma senha para se registrar no servidor!", PlayerName(playerid));
			ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_INPUT, "{FF4500}San Andreas {FFFFFF}- Registro", str, "Confirmar", "Fechar");
		}
	}
	if(playertextid == TDPlogin[playerid][1]) //recuperar senha
	{
		SendClientMessage(playerid, -1, "[{FF4500}SA{FFFFFF}] Va ate nosso discord e abra um ticket! so iremos ajudar caso seu discord seja vinculado a conta");
		SendClientMessage(playerid, -1, "[{FF4500}SA{FFFFFF}] Discord: {FF4500}discord.gg/sarp");
	}
	if(playertextid == TDPlogin[playerid][2]) //informacoes servidor
	{
		SendClientMessage(playerid, -1, "[{FF4500}SA{FFFFFF}] Mais informacoes do servidor no discord, {FF4500}discord.gg/sarp");
	}
	if(playertextid == TDPlogin[playerid][3]) //creditos do servidor
	{
		static str[431];
		strcat(str, "{FF4500}-=-=-=-=-=-=-=-= Creditos SARP -=-=-=-=-=-=-=-=");
		strcat(str, "\n\n{FFFFFF}Equipe de Desenvolvimento de Criadores");
		strcat(str, "\n\t{FF4500}* {FFFFFF}Fundador & CEO: {FF4500}Trem_bala & GB_30k");
		strcat(str, "\n\n{FFFFFF}Agradecimento aos contribuidores");
		strcat(str, "\n\t{FF4500}* {FFFFFF}Criacao da Primeira Versao da gamemode: {FF4500}Trem_bala & GB_30l");
		strcat(str, "\n\n{008000}Nome Discord para atendimento, suporte e vendas:");
		strcat(str, "\n\t{008000} Trem_bala: {FF4500}Trem_bala_noise - Para compras, suporte e problemas na conta");
		ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "{FF4500}Infinety City {FFFFFF}- Roleplay", str, "Fechar", #);
	}
	if(playertextid == TDPlogin[playerid][4]) //sair do servidor
	{
		SetTimerEx("DelayKick", 2000, false, "i", playerid);
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}


// ===== Comandos ===== //
CMD:bike(playerid)
{
	if(!IsPlayerInRangeOfPoint(playerid, 1.5, 1675.4165,-2261.2625,13.5341))
		return 1;
	if(PegouBike[playerid] == true)
	{
		SendClientMessage(playerid, -1, "[{FF4500}SA{FFFFFF}] Voce pegou uma bike a pouco tempo");
	}
	else
	{
		DestroyVehicle(Bike[playerid]);
		Bike[playerid] = CreateVehicle(510, 1670.9321,-2261.3455,13.5264,33.7269, 1, 1, 0);
		PutPlayerInVehicle(playerid, Bike[playerid], 0);
		SetTimerEx("TempoBike", 120000, false, "i", playerid);
		PegouBike[playerid] = true;
	}
	return 1;
}

// ===== STOCKS ===== //
stock Arquivo(playerid)
{
	new file[120];
	format(file, sizeof(file), "Contas/%s.ini", PlayerName(playerid));
	return file;
}

stock PlayerName(playerid)
{
	new nome[24];
	GetPlayerName(playerid, nome, sizeof(nome));
	return nome;
}

// ===== PUBLICS ===== //
forward DelayKick(playerid);
public DelayKick(playerid)
{
	Kick(playerid);
	return 1;
}

forward TempoBike(playerid);
public TempoBike(playerid)
{
	PegouBike[playerid] = false;
	return 1;
}

// ===== BANCO DE DADOS ===== //
stock SalvarDados(playerid)
{
    Player[playerid][Dinheiro] = GetPlayerMoney(playerid);
	Player[playerid][Skin] = GetPlayerSkin(playerid);
	Player[playerid][Nivel] = GetPlayerScore(playerid);
    
    dini_IntSet(Arquivo(playerid), "Dinheiro", Player[playerid][Dinheiro]);
	dini_IntSet(Arquivo(playerid), "Skin", Player[playerid][Skin]);
	dini_IntSet(Arquivo(playerid), "Nivel", Player[playerid][Nivel]);
	return 1;
}

stock CarregarDados(playerid)
{
    Player[playerid][Dinheiro] = dini_Int(Arquivo(playerid), "Dinheiro");
	Player[playerid][Skin] = dini_Int(Arquivo(playerid), "Skin");
	Player[playerid][Nivel] = dini_Int(Arquivo(playerid), "Nivel");

    GivePlayerMoney(playerid, dini_Int(Arquivo(playerid), "Dinheiro"));
	SetPlayerSkin(playerid, dini_Int(Arquivo(playerid), "Skin"));
	SetPlayerScore(playerid, dini_Int(Arquivo(playerid), "Nivel"));
	return 1;
}