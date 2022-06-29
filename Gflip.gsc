//BO2 Gflip By Zoomys
doGflip3()
{
    self endon ("disconnect");
    self endon ("game_ended");
    if(!isDefined(self.Gflip))
    {
        self iPrintLn("Mid air gflip bind activated, press [{+Actionslot 3}]");
        self.Gflip = true;
        while(isDefined(self.Gflip))
        {
            if(self actionslotthreebuttonpressed() && self.MenuOpen == false)
            {
                self thread MidAirGflip();
            }
            wait .001;
        } 
    } 
    else if(isDefined(self.Gflip)) 
    { 
        self iPrintLn("Mid air gflip bind ^1deactivated");
        self notify("stopProne1");
        self.Gflip = undefined; 
    } 
}

GFLIP23(gun)
{
    self iprintln("Gflip Shield");
    self.YO = gun;
}

MidAirGflip()
{
    self endon("stopProne1");
    self setStance("prone");
    wait 0.5;
    keepBombWeap1 = self getCurrentWeapon();
    self giveWeapon(self.YO);
    self setspawnweapon(self.YO);
    wait 0.8;
    self takeWeapon(self.YO);
    self setspawnweapon(keepBombWeap1);
    self setStance("stand");
}

//How to Put it in ur menu


self add_option("SubM23", "Gflip Bind [{+Actionslot 3}]", ::doGflip3);
self add_option("SubM23", "^Riot Shield For Gflip", ::GFLIP23, "riotshield_mp")
