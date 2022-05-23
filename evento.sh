#!/usr/bin/env bash

eleccion=0
clear

################# Aqui Introducir la AUTH KEY del Usuario de MISP

key="BY4iFENwRG1ySB6cFnEPtVdfFCmtHFAberWRq3B6"


################# Aqui Introducir la URL DE de MISP

url="localhost"

######################################################################


while [[ $eleccion != 5 ]]
 
do  
clear
        echo "======================================="
        echo "Programa para la creacion del un evento"
        echo "======================================="
        echo "======================================="
        echo "          1. Crear un Evento           "
        echo "          2. Añadir Datos a un Evento  "
        echo "          3. Listar un Evento          "
        echo "          4. Borrar Un Evento          "
        echo "          5. Salir del Programa        "
        echo "======================================="
        echo "======================================="
        echo ""

        read -p "Elige una Opcion :" eleccion



		if [[ $eleccion == 1 ]]
		
			then
			
			
			
				clear
			
				echo "======Creacion de Un evento======"
				echo ""
				echo " Nivel de Amenaza                "
				echo " 				              	   "
				echo " 1. High (Alto)  			       "
				echo " 2. Medio (Alto)  		       "
				echo " 3. Bajo (Alto)  			       "
				echo " 4. Undefined (Indefinido)       "
				echo ""
				read -p "Elige una Opcion :" amenaza
				
				echo "======Info Rapida del Evento ======"
				echo ""
				echo ""
				echo ""
				read -p "Descripcion Rapida del Evento: " descripcion
				
				echo "======¿Publicar el evento?======"
				echo ""
				echo " si o no (sin mayus)            "
				echo ""
				echo ""
				read -p "Descripcion Rapida :" publi
				
					if [[ $publi == si ]]
					
					then
						publi2=true
					else
						publi2=false
					fi
				
				
				echo "======¿Analisis?======"
				echo ""
				echo " 1. Inicial   			   "
				echo " 2. On Going (En Transcurso) "
				echo " 3. Completado (Completado)  "
				echo ""
				read -p "Elige una opcion :" analisis
				
				
				
				
				fecha=$(date +'%d-%m-%Y')
				
				echo "{'Event':{'date':'${fecha}','threat_level_id':'${amenaza}','info':'${descripcion}','published':${publi2},'analysis':'${analisis}','distribution':'0','Attribute':[{'type':'domain','category':'Network activity','to_ids':false,'distribution':'0','comment':'','value':'test.com'}]}}" > add-event.json
					  
				curl -i -H "Accept: application/json" -H "content-type: application/json" -H "Authorization: ${key}" \
				--data "@add-event.json" -k -X POST https://$url/events
				
			
				
				read  -p ""
				
				
				
				
				
				
				
			elif [[ $eleccion == 2 ]]
			
			then
			
				clear
			
			
				echo "Eleccion 2"
				read -p ""
			
			elif [[ $eleccion = 3 ]]
			
			then
			
				clear
			
				echo "Eleccion 3"
				read -p ""
			
			elif [[ $eleccion = 4 ]]
			
			then
			
				clear
			
				echo "Eleccion 4"
				read -p ""
			
			else
			
				exit
		
			fi

done


