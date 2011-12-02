// JavaScript Document

function alterar_campos(exercicios){
	
	var valor_ex = $("#exercicios_listbox_").val();
	for(i = 0; i < exercicios.length; i++){
		var id = exercicios[i].getElementsByTagName("id")[0].firstChild.nodeValue;
		if(id == valor_ex.toString()){
			
			var tipo = exercicios[i].getElementsByTagName("tipo")[0].firstChild.nodeValue;
			if(tipo == "Aeróbico"){

				$("#ex_peso").text("Nível");
				$("#ex_series").text("Tempo");
				$("#ex_repeticoes").hide();
				$("#exercicio_repeticoes").hide();
			}
			else if(tipo == "Musculação"){

				$("#ex_peso").text("Peso");
				$("#ex_series").text("Series");
				$("#ex_repeticoes").show();
				$("#exercicio_repeticoes").show();
			}
		}
	}
}

function imprime_exercicios(elemento,nome,maquina,peso,series,repeticoes){

	if(repeticoes == 0)
		$(elemento).append("<tr><td>" + nome + "</td><td>" + maquina
								+ "</td><td>" + peso + "</td><td>" + series + "</td></tr>");
	else
		$(elemento).append("<tr><td>" + nome + "</td><td>" + maquina + "</td><td>" 
                                + peso + "</td><td>" + series + "</td><td>" + repeticoes + "</td></tr>");
}

$(document).ready(function(){

	if($("#exercicios_listbox_").val() != undefined){
		var xml = new XMLHttpRequest();
		xml.open("GET","/api/exercicios.xml", false);
		xml.send();
		exercicios = xml.responseXML.documentElement.getElementsByTagName("exercicio");

		alterar_campos(exercicios);

		/*var ex_associados = $("#selected_exercicios").text().split("|");
		console.log(ex_associados);
		for(i = 0; i < ex_associados.length;i++){
		
			var ex = ex_associados[i].split(",");
			for(j = 0; j < exercicios.length; j++){
			
				if(ex[0] == exercicios[i].getElementsByTagName("id")[0].firstChild.nodeValue){
					var tipo = exercicios[i].getElementsByTagName("tipo")[0].firstChild.nodeValue;
					var nome = exercicios[i].getElementsByTagName("nome")[0].firstChild.nodeValue;
					var maquina = exercicios[i].getElementsByTagName("maquina")[0].firstChild.nodeValue;
					if(tipo == "Aeróbico"){
						imprime_exercicios("#aerobicos",nome,maquina,ex[1],ex[2],0);
					}
					else if(tipo == "Musculação"){
						imprime_exercicios("#musculacao",nome,maquina,ex[1],ex[2],ex[3]);
					}
				}
			}
		}*/
	

		$("#exercicios_listbox_").change(function(){
		
			alterar_campos(exercicios);
		});
	}
});


function getObjects(obj, key, val) {
    var objects = [];
    for (var i in obj) {
        if (!obj.hasOwnProperty(i)) continue;
        if (typeof obj[i] == 'object') {
            objects = objects.concat(getObjects(obj[i], key, val));
        } else if (i == key && obj[key] == val) {
            objects.push(obj);
        }
    }
    return objects;
}

function adicionaExercicio(exercicios_arr, all_arr){

	var ids_exercicios = new Array;

	for(i = 0; i < exercicios_arr.length; i++)
		ids_exercicios.push(exercicios_arr[i].exercicio.id.toString());

	// valor do exercicio escolhido
	var valor_ex = $("#exercicios_listbox_").val();
	var selected_exercicios_arr = $("#selected_exercicios").val().split(",");
  	var ids_array = new Array;

  	for(i = 0; i < selected_exercicios_arr.length;i++)
  		ids_array.push(selected_exercicios_arr[i].split("|")[0]);

  	// se o exercicio ainda nao estiver associado ao plano ou se nao estiver ja escrito na hidden tag
	if(valor_ex && $.inArray(valor_ex,ids_exercicios) == -1 && $.inArray(valor_ex,ids_array) == -1) {

        var exercicios = $("#selected_exercicios").val();
        var peso = $("#exercicio_peso").val();
        var series = $("#exercicio_series").val();
        var repeticoes = $("#exercicio_repeticoes").val();


              
        var exercicio = getObjects(all_arr,'id',valor_ex);

        // imprime o exercicio na tabela certa conforme o seu tipo
        if(exercicio[0]['tipo'] == "Aeróbico" && peso && series){
          imprime_exercicios("#aerobicos",exercicio[0]['nome'],exercicio[0]['maquina'],peso,series,0)
      
          // escreve na hidden tag o id do exercicio escolhido
	      $("#selected_exercicios").val(exercicios + valor_ex + "|" + peso + '|' + series + '|' + 0 + ",");
          $("#jsalert").text("Exercício associado.");
        }
        else if(exercicio[0]['tipo'] == "Musculação" && peso && series && repeticoes){
          imprime_exercicios("#musculacao",exercicio[0]['nome'],exercicio[0]['maquina'],peso,series,repeticoes)


          // escreve na hidden tag o id do exercicio escolhido
	      $("#selected_exercicios").val(exercicios + valor_ex + "|" + peso +'|' + series + '|' + repeticoes + ",");
          $("#jsalert").text("Exercício associado.");
        }
        else
          $("#jsalert").text("Não preencheu os dados correctamente.");
        


	}
  	else $("#jsalert").text("O exercício já faz parte do plano.");

}

