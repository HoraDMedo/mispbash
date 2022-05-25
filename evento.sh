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
				
					if [[ $publi == "si" ]]
					
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
				
				
				
				
				fecha=$(date +'%Y-%m-%d')
				
				echo "{'Event':{'date':'${fecha}','threat_level_id':'${amenaza}','info':'${descripcion}','published':${publi2},'analysis':'${analisis}','distribution':'0','Attribute':[{'type':'domain','category':'Network activity','to_ids':false,'distribution':'0','comment':'','value':'Inicio'}]}}" > add-event.json
				cat add-event.json | tr "'" "\""  > add-event-tr.json
									    
				curl -i -H "Accept: application/json" -H "content-type: application/json" -H "Authorization: ${key}" --data "@add-event-tr.json" -k -X POST https://${url}/events
			
				#rm -rf add-event-tr.json
				rm -rf add-event.json
			
				echo ""
				echo ""
				echo ""
				
				echo ${publi2}

			
				
				read  -p ""
				
				
				
				
				
				
				
			elif [[ $eleccion == 2 ]]
			
			then
				elecciondos=0
				while [[ $elecciondos != 3 ]]
				
				do
				clear
			
				echo "=========================="
				echo ""
				echo "Introducir Datos a un evento"
				echo ""
				echo "=========================="
				echo "-----------------------------------------------"
				echo "=========================="
				echo ""
				echo "1. Introducirlos desde la Terminal"
				echo ""
				echo "2. Introducirlos desde archivo txt"
				echo ""
				echo "3. Volver al principio"
				echo ""
				echo "=========================="
				
				read -p "Elige una Opcion: " elecciondos
				
							if [[ $elecciondos == 1 ]]
							
									then
									
										echo "1.		Internal reference"
										echo "2. 	Targeting data"
										echo "3. 	Antivirus detection "
										echo "4.		Payload delivery"
										echo "5.		Artifacts dropped"
										echo "6.  	Payload installation"
										echo "7 		Persistent mechanism"
										echo "8.		Network activity"
										echo "9.		Payload type"
										echo "10.	Attribution"
										echo "11.	External analysis"
										echo "12.	Financial Fraud"
										echo "13. 	Support Tool"
										echo "14.	Social Network"
										echo "15.	Person Other"
										echo ""		
										read -p "Elige Tipo de Dato introducido:  " tipodato
								
										if [[ $tipodato = 1 ]]
										then
										
										tipodatof="Internal reference"
										
										echo "Elige el tipo de texto "
										echo "1.	 text"
										echo "2.	 link"
										echo "3.	 comment"
										echo "4.	 other"
										echo "5.	 hex"
										echo "6.	 anonymised"
										echo "7.	 git-commit-id"
										
										read -p  "Tipo texto: " tipotexto
															tipotextof
															if [[ $tipotexto = 1 ]]
															then tipotextof="text"
															elif [[ $tipotexto = 2 ]]
															then tipotextof="link"
															elif [[ $tipotexto = 3 ]]
															then tipotextof="comment"
															elif [[ $tipotexto = 4 ]]
															then tipotextof="other"
															elif [[ $tipotexto = 5 ]]
															then tipotextof="hex"
															elif [[ $tipotexto = 6 ]]
															then tipotextof="anonymised"
															elif [[ $tipotexto = 7 ]]
															then tipotextof="git-commit-id"
															else
															echo ""
															fi
										
										
										elif [[ $tipodato = 2 ]]
										then
										
										tipodatof="Targeting data"
										
										elif [[ $tipodato = 3 ]]
										then
										
										tipodatof="Antivirus detection "
											
										elif [[ $tipodato = 4 ]]
										then	
										
										tipodatof="Payload delivery"
											
										elif [[ $tipodato = 5 ]]
										then
										
										tipodatof="Artifacts dropped"
											
										elif [[ $tipodato = 6 ]]
										then
										
										tipodatof="Payload installation"
											
										elif [[ $tipodato = 7 ]]
										then
										
										tipodatof="Persistent mechanism"
											
										elif [[ $tipodato = 8 ]]
										then
										
										tipodatof="Network activity"
											
										elif [[ $tipodato = 9 ]]
										then
										
										tipodatof="Payload type"
											
										elif [[ $tipodato = 10 ]]
										then
										
										tipodatof="Attribution"
											
										elif [[ $tipodato = 11 ]]
										then
										
										tipodatof="External analysis"
											
										elif [[ $tipodato = 12 ]]
										then
											
										tipodatof="Financial Fraud"
											
										elif [[ $tipodato = 13 ]]
										then
										
										tipodatof="Support Tool"
										
										elif [[ $tipodato = 14 ]]
										then
										
										tipodatof="Social Network"
										
										elif [[ $tipodato = 15 ]]
										then
										
										tipodatof="Person Other"
										
										else
										echo ""
										fi
								
																clear
			
																curl -i -H "Accept: application/json" -H "content-type: application/json" -H "Authorization: ${key}" -k -X GET https://localhost/events > listado.txt
																clear
																
																echo ""
																echo ""
																lineas=$(cat listado.txt | grep "info" | wc -l)
																cat listado.txt | grep "info" > listadoform.txt
																var=0
																var3=1
																
																while  [[ $var -lt $lineas ]]
																	do

																		let var=var+1
																	
																		caduno=$(cat listado.txt | grep -e "\"id\": \".*\"," | sed -n ${var3}p)
																		caddos=$(cat listado.txt | grep "info" | sed -n ${var}p listadoform.txt)
																		
																		let var3=var3+3
																		echo ${caduno}${caddos}
																		
																		
																	done
				

															echo ""
															read -p " Elige un Evento para Introducir los datos dentro de este (por id) (1, 2, 3.....): " num
															
															rm -rf listado.txt
															rm -rf listadoform.txt
															clear
															echo ""
															echo ""
															while [[ $datoinc != "exit" ]]
															do
																	echo " Pulsar Enter por cada dato introducido"
																	echo " Escribir 'exit' para salir del programa"
																	read -p "Dato a introducir" datoinc
																	
																	
							
																	curl --header "Authorization: ${key} " --header "Accept: application/json" --header "Content-Type: application/json" \
																	-d "{"event_id":"${num}","value":"1.2.3.4","category":"${tipodatof}","type":"default"}" http://localhost/attributes/add/
															done
							
							
								
							elif [[ $elecciondos == 2 ]]
			
									then
									
									echo "dos"
									read -p ""
									
							else
							
								elecciondos=3
				
							fi
			done
				
				
			
			elif [[ $eleccion = 3 ]]
			
			then
			
				clear
			
				echo "Listado de un evento"
				
				clear
			
																curl -i -H "Accept: application/json" -H "content-type: application/json" -H "Authorization: ${key}" -k -X GET https://localhost/events > listado.txt
																clear
																
																echo ""
																echo ""
																lineas=$(cat listado.txt | grep "info" | wc -l)
																cat listado.txt | grep "info" > listadoform.txt
																var=0
																var3=1
																
																while  [[ $var -lt $lineas ]]
																	do

																		let var=var+1
																	
																		caduno=$(cat listado.txt | grep -e "\"id\": \".*\"," | sed -n ${var3}p)
																		caddos=$(cat listado.txt | grep "info" | sed -n ${var}p listadoform.txt)
																		
																		let var3=var3+3
																		echo ${caduno}${caddos}
																		
																		
																	done
				

															echo ""
															read -p " Elige un Evento para ver su contenido (por id) (1, 2, 3.....): " num
															
															rm -rf listado.txt
															rm -rf listadoform.txt
															clear
															
															curl -i -H "Accept: application/json" -H "content-type: application/json" -H "Authorization: ${key}" -k -X GET https://localhost/events/${num}
															
															echo ""
															read -p "Continuar..."
				
			
			
			elif [[ $eleccion = 4 ]]
			
			then
			
				clear
			
				curl -i -H "Accept: application/json" -H "content-type: application/json" -H "Authorization: ${key}" -k -X GET https://localhost/events > listado.txt
				clear
				
				echo ""
				echo ""
				lineas=$(cat listado.txt | grep "info" | wc -l)
				cat listado.txt | grep "info" > listadoform.txt
				var=0
				
				
				while  [[ $var -lt $lineas ]]
					do

						let var=var+1
						caduno="Evento ${var} - "
						caddos=$(cat listado.txt | grep "info" | sed -n ${var}p listadoform.txt)
						
						echo ${caduno}${caddos}
						
						
					done
				

				echo ""
				read -p " Elige un Evento para ver su contenido (NO POR ID) (1, 2 , 3....): " numborrado

				
	
				curl -i -H "Accept: application/json" -H "content-type: application/json" -H "Authorization: ${key}" -k -X DELETE https://${url}/events/${numborrado}

				rm -rf listado.txt
				rm -rf listadoform.txt
	
				read -p ""
			
			else
			
				exit
		
			fi

done



