-- MAIN THREAD
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for k,v in pairs(cfg.hotkeys) do
		  if IsControlJustPressed(v.group, k) or IsDisabledControlJustPressed(v.group, k) and GetLastInputMethod(0) then
		    v.pressed()
		  end

		  if IsControlJustReleased(v.group, k) or IsDisabledControlJustReleased(v.group, k) and GetLastInputMethod(0) then
		    v.released()
		  end
		end
	end
end)


-- THIS IS FOR NO DOC COMA
Citizen.CreateThread(function() -- coma thread
  while true do
    Citizen.Wait(1000)
    if vRP.isInComa({}) then
	  if called == 0  then
	    HKserver.canSkipComa({},function(skipper)
	      if skipper then
		    HKserver.docsOnline({},function(docs)
		      if docs == 0 then
			    vRP.notify({"~r~No hay nadie para revivirte.\n~b~Presiona ~g~E~b~ para respawnear."})
			  else
			    vRP.notify({"~g~SAME online.\n~b~Presiona ~g~E~b~ para llamarlos."})
			  end
		    end)
          end
	    end)
	  else
	    called = called - 1
	  end
	else
	  called = 0
	end
  end
end)


