function oyuncuBul( nick ) 
    local oyuncu = getPlayerFromName( nick ) 
    if oyuncu then return oyuncu end 
    for _,oyuncu in pairs( getElementsByType 'player' ) do 
        if string.find( string.gsub( getPlayerName( oyuncu ):lower( ),"#%x%x%x%x%x%x", "" ), nick:lower( ), 1, true ) then return oyuncu end 
    end 
    return false 
end 

local silahVerenAClGrubu = "Founder" --Buradan silah verme yetkisine sahip acl gurubunu belirleyebilirsin.

addCommandHandler( 'silahver', 
    function( source,_,oyuncu,silahID,mermiSayi ) 
	local hesapAdi = getAccountName(getPlayerAccount(source))
    if isObjectInACLGroup("user."..hesapAdi, aclGetGroup(silahVerenAClGrubu))then
        local hedefOyuncu = oyuncuBul( oyuncu ) 
        if hedefOyuncu then 
            if silahID  and mermiSayi then
				giveWeapon( hedefOyuncu,tonumber( silahID ),tonumber( mermiSayi ) ) 
                outputChatBox(getPlayerName( hedefOyuncu ).." İsimli oyuncuya "..silahID.." numaralı silah ve "..mermiSayi.." adet mermi verdin",source,0,255,0 ) 
            else 
                outputChatBox("Hatalı komut kullanımı. [ /silahver oyuncuNick silahID mermiSayi ]",source,255,0,0 ) 
            end  
        else 
            outputChatBox( 'Silah Vermek İstediğiniz Oyuncu Bulunamadı!',source,255,0,0 ) 
        end
	else
		outputChatBox( 'Silah Vermek için yetkin yok!',source,255,0,0 ) 
	end
end)
