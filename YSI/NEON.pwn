/*                                                                                                                                                                                                
  *----------------------------------------------------|              |---------------------------------------------------------*
|                                AUTOR  : CMatus       |              | AUTHOR  : CMatus                                        |
|                                  ROK  : 2016         |              | YEAR    : 2016                                          |
|                               VERZIA  : 1.5          |              | VERSION : 1.5                                           |
|                               PODPORA : SA:MP 0.3.7  |              | SUPPORT : SA:MP 0.3.7                                   |
  *-----------------------------------------------------------------------------------------------------------------------------*
                                                       dOOOOOOOOOOOOOOb        
                                                        dOOOOOOOOOOOOb
                                                         dOOOOOOOOOOb
                                                          dOOOOOOOOb
                                                           dOOOOOOb
                                                            dOOOOb
                                                             dOOb
                                                              OO              
  *-------------------------------------------------*___________________________*-----------------------------------------------*
|                                                  [LICEN�N� A ZMLUVN� PODMIENKY]                                               |
| 1.) Mat�� �er�ava poskytuje produk na str�nke ewolutions.com za podmienok tak ako je ustanoven� ni��ie.                       |
|                                                                                                                               |
|                                                                                                                               |
|    " POU��VATE�OM K�DU " sa rozumie ako fyzick� alebo pr�vnick� osoba, ktor� uskuto�nila stiahnutie/prevziatie produktu,      |
|    respekt�ve pou��va k�d tvorcu.                                                                                             |
|                                                                                                                               |                                                                                                                                                  
|    Pokia� je pou��vate�om k�du pr�vnick�, �i fyzick� osoba, ktor� stiahla/prevzala k�d, respekt�ve pou��va k�d                |
|    pre osobn� potreby, alebo pre potrebu majite�ov in�ch serverov, sa musia riadi� Smernicou Eur�pskeho parlamentu a Rady     |
|    2004/48/ES z 29. apr�la 2004 o vymo�ite�nosti pr�v du�evn�ho vlastn�ctva (Mimoriadne vydanie �. v. E�,                     |
|    kap. 17/zv. 2, �. v. E� L 157, 30. 4. 2004).                                                                               |
*-------------------------------------------------------------------------------------------------------------------------------*
|                                                 [PR�VA POU��VATE�A K�DU]                                                      |
|   1.) Fyzick� alebo pr�vnick� osoba m��e vyu��va� a poskytova� k�d ostatn�m u��vate�om za podmienok s�hlasu s licen�nou       |
|       zmluvou.                                                                                                                |
|   2.) U��vate� k�du dost�va pln� pr�stup k funkci�m k�du, av�ak pou��vate� k�du, nem��e meni� meno autora k�du v zmysle       |
|       paragrafu � 17 Autorsk� z�kon prijat� 1.Janu�ra                                                                         |
|   4.) Ustanovenie Autorsk�ho z�kona sa vz�ahuje na toto dielo, v zmysle paragrafu � 2 odstavec 1 a 2, je toto dielo chr�nen�  |
|       Slovensk�m autorsk�m z�konom platn� vo v�etk�ch krajin�ch.                                                              |
|                                                                                                                               |
*-------------------------------------------------------------------------------------------------------------------------------*
|	PO�AKOVANIE: 																												|
|		� ~�cy�o �kiFi - Cyklus																									|
*-------------------------------------------------------------------------------------------------------------------------------*
*/
/**************************************************************************************************************************************/
	#include " a_samp "     // https://www.sa-mp.com/
/**************************************************************************************************************************************/
	#include YSI\y_commands // https://github.com/Misiur/YSI-Includes
	#include YSI\y_colours  // https://github.com/Misiur/YSI-Includes
	#include YSI\y_dialog   // https://github.com/Misiur/YSI-Includes
/**************************************************************************************************************************************/
	new 
		NEONY  [MAX_PLAYERS],
		SVETLA [MAX_PLAYERS];
	new 
		Neon   [12],
		Svetlo [ 8];
	new 
		NEON          = -1,
		DIALOG_NEON   = -1,
		DIALOG_SVETLO = -1;
/**************************************************************************************************************************************/
	public OnFilterScriptInit(){
	
		NEON          = Dialog_ObtainID();
		DIALOG_NEON   = Dialog_ObtainID();
		DIALOG_SVETLO = Dialog_ObtainID();
	
		return true;
	}
/**************************************************************************************************************************************/
	public OnPlayerConnect(playerid){
	
		NEONY  [playerid] = 
		SVETLA [playerid] = 0;
	
		return true;
	}
/**************************************************************************************************************************************/
	public OnPlayerDisconnect(playerid, reason){
	
		if(NEONY  [playerid]) OdstranitNeon   (playerid);
		if(SVETLA [playerid]) OdstranitSvetla (playerid);
	
		return true;
	}
/**************************************************************************************************************************************/
	public OnPlayerDeath(playerid){
	
		if(NEONY  [playerid]) OdstranitNeon   (playerid);
		if(SVETLA [playerid]) OdstranitSvetla (playerid);
	
		return true;
	}
/**************************************************************************************************************************************/
	public OnPlayerExitVehicle(playerid, vehicleid){ 
	
		if(NEONY  [playerid]) OdstranitNeon   (playerid);
		if(SVETLA [playerid]) OdstranitSvetla (playerid);
	
		return true;
	}
/**************************************************************************************************************************************/
	public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
		
		if(dialogid == NEON){

	        if(response){

	            switch (listitem){

	               	case 0:{  
	
	               		Dialog_Show(playerid, DIALOG_STYLE_LIST, 
	               			"TUNING - NEONY",
	               				DARK_GREEN "M" WHITE "ODR�   " "\n"\
	               				DARK_GREEN "�" WHITE "ERVEN� " "\n"\
	               				DARK_GREEN "Z" WHITE "ELEN�  " "\n"\
	               				DARK_GREEN "B" WHITE "IELY   " "\n"\
	               				DARK_GREEN "R" WHITE "U�OV�  " "\n"\
	               				DARK_GREEN "�" WHITE "LT�    " "\n"\
	               				RED        "O" WHITE "DSTR�NI�    ", 
	               			"POTVRDI�", "ZAVRIE�",DIALOG_NEON);
	            	}
	            	case 1:{ 
	            		
	            		Dialog_Show(playerid, DIALOG_STYLE_LIST, 
	            			"TUNING - SVETL�",
	            				DARK_GREEN "M" WHITE "ODR�   " "\n"\
	            				DARK_GREEN "Z" WHITE "ELEN�  " "\n"\
	            				DARK_GREEN "B" WHITE "IELY   " "\n"\
	            				DARK_GREEN "�" WHITE "ERVEN� " "\n"\
	            				RED        "O" WHITE "DSTR�NI�    ", 
	            		"POTVRDI�", "ZAVRIE�",DIALOG_SVETLO);
	            	}
	            }
	        }
	    }  
		if(dialogid == DIALOG_NEON){

	        if(response){

	            switch (listitem){

	               	case 0 : VytvoritNeon (playerid, 0, 1,18648);				
					case 1 : VytvoritNeon (playerid, 2, 3,18647);		
					case 2 : VytvoritNeon (playerid, 4, 5,18649);		
					case 3 : VytvoritNeon (playerid, 6, 7,18652);		
					case 4 : VytvoritNeon (playerid, 8, 9,18651);			
					case 5 : VytvoritNeon (playerid,10,11,18650);
					case 6 : OdstranitNeon(playerid);
	            }
	        }
	    }   
	    if(dialogid == DIALOG_SVETLO){
	
	        if(response){
	
	            switch (listitem){
	
					case 0 : VytvoritSvetlo (playerid,0,1,19298);
					case 1 : VytvoritSvetlo (playerid,2,3,19297);
					case 2 : VytvoritSvetlo (playerid,4,5,19295);
					case 3 : VytvoritSvetlo (playerid,6,7,19296);		
					case 4 : OdstranitSvetla(playerid);
	            }
	        }
	    }
		return true;
	}
/**************************************************************************************************************************************/
	YCMD:neon(playerid,params[],help){ 
	
		if(Vozidla(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER) Dialog_Show(playerid, DIALOG_STYLE_LIST, "TUNING","{006600}N"WHITE"EONY\n{006600}S"WHITE"VETLA", "POTVRDI�", "ZAVRIE�",NEON);
		else SendClientMessage(playerid, X11_RED, "[ ! ] "WHITE"NEM�TE TUNOVA� NEKOMPATIBILN� VOZIDLO");
		
		return true;
	}
/**************************************************************************************************************************************/
	stock 
		VytvoritNeon(playerid,ID1,ID2,OBJECT){

		if(NEONY[playerid]) return SendClientMessage(playerid, X11_RED,"[ ! ] "WHITE"U� M�TE NAMONTOVAN� NE�NY");
		Neon[ID1] =  CreateObject(OBJECT,0,0,0,0,0,0);
		Neon[ID2] =  CreateObject(OBJECT,0,0,0,0,0,0);
		AttachObjectToVehicle(Neon[ID1], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		AttachObjectToVehicle(Neon[ID2], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		NEONY[playerid] = 1;

		return true;
	}
	stock 
		VytvoritSvetlo(playerid,ID1,ID2,OBJECT){

		if(SVETLA[playerid]) return SendClientMessage(playerid, X11_RED,"[ ! ] "WHITE"U� M�TE NAMONTOVAN� SVETL�");
		Svetlo[ID1] = CreateObject(OBJECT,0,0,0,0,0,0);
		Svetlo[ID2] = CreateObject(OBJECT,0,0,0,0,0,0);
		AttachObjectToVehicle(Svetlo[ID1], GetPlayerVehicleID(playerid), 0.679999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
		AttachObjectToVehicle(Svetlo[ID2], GetPlayerVehicleID(playerid), -0.729999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
		SVETLA[playerid] = 1;

		return true;
	}
	stock 
		OdstranitNeon(playerid){
	
		for(new i; i<=9; i++) GetVehicleModel(GetPlayerVehicleID(DestroyObject(Neon[i])));
	
		NEONY[playerid] = 0;
	}
	stock
		OdstranitSvetla(playerid){
	
		for(new i; i<=7; i++) GetVehicleModel(GetPlayerVehicleID(DestroyObject(Svetlo[i])));
		
		SVETLA[playerid] = 0;
	}
	stock 
		Vozidla(playerid){
	
		new 
			DaneVozdila = GetVehicleModel(GetPlayerVehicleID(playerid));
		
		switch(DaneVozdila){
	
			case 480,533,439,555,499,422,482,498,609,524,578,455,403,414,582,443,514,600,413,515,440,543,605,459,531,408,552,478,456,
			     554,536,575,534,567,535,566,576,412,568,424,573,579,400,500,444,556,557,470,489,495,416,433,431,438,437,523,427,490,
			     528,407,544,596,598,597,599,432,601,420,445,504,401,518,527,542,507,562,585,419,526,604,466,492,474,546,517,410,551,
			     516,467,426,436,547,405,580,560,550,549,540,491,529,421,602,429,496,402,541,415,589,587,565,494,502,503,411,559,603,
			     475,506,451,558,477 : return true;
		}
	
		return false;
	}
/**************************************************************************************************************************************/