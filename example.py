from selenium import webdriver
import time
import requests
import json

from selenium.webdriver.chrome.options import Options
chrome_path = "chromedriver"

fichierVille1 = "Villes/Ville1.json"
fichierVille2 = "Villes/Ville2.json"
fichierVille3 = "Villes/Ville3.json"
fichierVille4 = "Villes/Ville4.json"
fichierVille5 = "Villes/Ville5.json"
fichierVille6 = "Villes/Ville6.json"
fichierVille7 = "Villes/Ville7.json"
fichierVille8 = "Villes/Ville8.json"
fichierVille9 = "Villes/Ville9.json"

fichierIsland1 = "Island/Island1.json"
fichierIsland2 = "Island/Island2.json"
fichierIsland3 = "Island/Island3.json"
fichierIsland4 = "Island/Island4.json"
fichierIsland5 = "Island/Island5.json"
fichierIsland6 = "Island/Island6.json"
fichierIsland7 = "Island/Island7.json"
fichierIsland8 = "Island/Island8.json"
fichierIsland9 = "Island/Island9.json"

urlVille1 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=city&currentCityId=2558&ajax=1'     #Souffre
urlVille2 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=city&currentCityId=3638&ajax=1'     #Marbre
urlVille3 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=city&currentCityId=4480&ajax=1'     #Cristal
urlVille4 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=city&currentCityId=7666&ajax=1'     #Vin
urlVille5 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=city&currentCityId=22870&ajax=1'    #Marbre2
urlVille6 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=city&currentCityId=26121&ajax=1'    #Marbre3
urlVille7 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=city&currentCityId=26371&ajax=1'    #Vin2
urlVille8 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=city&currentCityId=27167&ajax=1'    #Cristal2
urlVille9 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=city&currentCityId=29036&ajax=1'    #Cristal3

urlIsland1 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=island&currentCityId=2558&ajax=1'
ulrIsland2 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=island&currentCityId=3638&ajax=1'
urlIsland3 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=island&currentCityId=4480&ajax=1'
urlIsland4 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=island&currentCityId=7666&ajax=1'
urlIsland5 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=island&currentCityId=22870&ajax=1'
urlIsland6 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=island&currentCityId=26121&ajax=1'
urlIsland7 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=island&currentCityId=26371&ajax=1'
urlIsland8 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=island&currentCityId=27167&ajax=1'
urlIsland9 = 'https://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=island&currentCityId=29036&ajax=1'


chrome_options = Options()
chrome_options.add_argument("--window-size=1920,1080")
#driver = Chrome(chrome_options=chrome_options)
driver = webdriver.Chrome(chrome_path,chrome_options=chrome_options)

def Traitement(url, fichier):
    driver.get(url)
    time.sleep(2)
    page = driver.page_source
    file = open(fichier,"w")
    file.write(page)
    file.close()

def Connexion():
    
    driver.get('https://lobby.ikariam.gameforge.com/fr_FR/')

    driver.find_element_by_xpath("""//*[@id="loginRegisterTabs"]/ul/li[1]/span""").click() # se connecter

    search_box = driver.find_element_by_name('email')
    search_box.click()
    search_box.send_keys('email')

    search_box = driver.find_element_by_name('password') # mdp
    search_box.click()
    search_box.send_keys('motdepasse')
    driver.find_element_by_xpath("""//*[@id="loginForm"]/p/button[1]/span""").click() #bouton connexion
    time.sleep(5) 
    driver.find_element_by_xpath("""//*[@id="joinGame"]/button/span[2]""").click()
    time.sleep(8)

    Traitement(urlVille1, fichierVille1)
    Traitement(urlIsland1, fichierIsland1)

    Traitement(urlVille2, fichierVille2)
    Traitement(ulrIsland2, fichierIsland2)

    Traitement(urlVille3, fichierVille3)
    Traitement(urlIsland3, fichierIsland3)

    Traitement(urlVille4, fichierVille4)
    Traitement(urlIsland4, fichierIsland4)

    Traitement(urlVille5, fichierVille5)
    Traitement(urlIsland5, fichierIsland5)

    Traitement(urlVille6, fichierVille6)
    Traitement(urlIsland6, fichierIsland6)

    Traitement(urlVille7, fichierVille7)
    Traitement(urlIsland7, fichierIsland7)

    Traitement(urlVille8, fichierVille8)
    Traitement(urlIsland8, fichierIsland8)

    Traitement(urlVille9, fichierVille9)
    Traitement(urlIsland9, fichierIsland9)
    

# Première connexion de purge
Connexion()
driver.quit()

# Seconde connexion de purge
chrome_options = Options()
chrome_options.add_argument("--window-size=1920,1080")
#driver = Chrome(chrome_options=chrome_options)
driver = webdriver.Chrome(chrome_path,chrome_options=chrome_options)

Connexion()
driver.quit()

print("Done Données")

rechercheSupprimer = "<html><head></head><body>"    # Balise de début à supprimer de tous les ficihers
rechercheVille = ",\"spiesInside\""                   # Balise de recherche pour les fichiers "Ville"
rechercheIsland = ",\"isOwnCityOnIsland\""            # Balise de recherche pour les fichiers "Island"
baliseFin = "}}]]"   # Balise à rajouter à la fin de tous les fichiers

def FiltreFichier(fichier, motSupp, rechercheM, baliseF):
    # 1 -> Recherche et suppression de la balise du début

    f = open(fichier, "r") # Ouverture du fichier en lecture
    contents = f.read()
    pos = contents.find(motSupp)
    if pos > -1:
        print("Le mot à été trouvé à la position", pos)
        dataFile = open (fichier, "w") # Ouverture du fichier en écriture
        newContents = contents.replace(motSupp, "", 1) # Suppression du mot recherché
        dataFile.write(newContents)
        dataFile.close() 

    # 2 -> Recherche et suppression de la balise recherchée

    f = open(fichier, "r")
    # Lecture du fichier 
    contents = f.read()
    # Coupage du fichier à l'endroit recherché
    final = contents.split(rechercheM)

    # 3 -> # Recherche de la balise de fin et ajout si elle est manquante
    
    pos = final[0].find(baliseF) 
    f = open(fichier, "w")
    f.write(final[0])

    # Vérification de la balise de fin du fichier
    if pos < 0:
        print("Balise de fin non trouvée on l'ajoute")
        f = open(fichier, "a")
        f.write(baliseF)

    f.close()

FiltreFichier(fichierVille1, rechercheSupprimer, rechercheVille, baliseFin)
FiltreFichier(fichierVille2, rechercheSupprimer, rechercheVille, baliseFin)
FiltreFichier(fichierVille3, rechercheSupprimer, rechercheVille, baliseFin)
FiltreFichier(fichierVille4, rechercheSupprimer, rechercheVille, baliseFin)
FiltreFichier(fichierVille5, rechercheSupprimer, rechercheVille, baliseFin)
FiltreFichier(fichierVille6, rechercheSupprimer, rechercheVille, baliseFin)
FiltreFichier(fichierVille7, rechercheSupprimer, rechercheVille, baliseFin)
FiltreFichier(fichierVille8, rechercheSupprimer, rechercheVille, baliseFin)
FiltreFichier(fichierVille9, rechercheSupprimer, rechercheVille, baliseFin)

FiltreFichier(fichierIsland1, rechercheSupprimer, rechercheIsland, baliseFin)
FiltreFichier(fichierIsland2, rechercheSupprimer, rechercheIsland, baliseFin)
FiltreFichier(fichierIsland3, rechercheSupprimer, rechercheIsland, baliseFin)
FiltreFichier(fichierIsland4, rechercheSupprimer, rechercheIsland, baliseFin)
FiltreFichier(fichierIsland5, rechercheSupprimer, rechercheIsland, baliseFin)
FiltreFichier(fichierIsland6, rechercheSupprimer, rechercheIsland, baliseFin)
FiltreFichier(fichierIsland7, rechercheSupprimer, rechercheIsland, baliseFin)
FiltreFichier(fichierIsland8, rechercheSupprimer, rechercheIsland, baliseFin)
FiltreFichier(fichierIsland9, rechercheSupprimer, rechercheIsland, baliseFin)

print("Done Formatage fichier")
