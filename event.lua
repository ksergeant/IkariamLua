local event = {}

event.Demarrer = function()
  
  os.execute("py Connexion.py")
    print("Demarrer")
end

event.Quitter = function()
    love.event.quit()
    print("Quitter")
end

event.Ressources = function()
    print("affiche les ressources")
end

event.Batiments = function()
    print("affiche les Batiments")
end

event.Iles = function()
    print("affiche les iles")
end

event.Cachette = function()
    print("affiche la cachette")
end

event.Plans = function()
    print("affiche les Plans")
end

event.IA = function()
    print("affiche l'IA")
end

return event