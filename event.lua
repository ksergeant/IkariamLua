local event = {}
event.Demarrer = function()
    os.execute("perl Ikariam.pl")

end

event.Quitter = function()
    love.event.quit()
end

event.Ressources = function()
    print("affiche les ressources")
end

--function eventDemarrer()
  
   -- os.execute("perl Ikariam.pl")
    
--end
  
  
--function eventQuitter()
    
   -- love.event.quit()
    
--end

return event