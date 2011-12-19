// JavaScript Document

function get_estatisticas(){

    var mes = $("#mes").val();
    var ano = $("#ano").val();
    var taid = $("#_taid option:selected").val();
    var conteudo = "taid="+taid+"&ano="+ano+"&mes="+mes;
    var estatistica = parseInt($("#tipo_estatistica option:selected").val());

    

    switch(estatistica){

        case 0:
            jQuery.get("estatisticasmodalidadesemana.xml?", conteudo,

            function(data){    

                grafico = data.getElementsByTagName("estatistica");
                var imagem = grafico[0].getElementsByTagName("message")[0].firstChild.nodeValue;

                $("#imagem_estatistica").attr("src",imagem);

            });
            break;
        
        case 1:
            jQuery.get("estatisticasmodalidade.xml?", conteudo,

            function(data){    

                grafico = data.getElementsByTagName("estatistica");
                var imagem = grafico[0].getElementsByTagName("message")[0].firstChild.nodeValue;

                $("#imagem_estatistica").attr("src",imagem);

            });
            break;
        
        case 2:
            jQuery.get("estatisticasmodalidadeprofessor.xml?", conteudo,

            function(data){    

                grafico = data.getElementsByTagName("estatistica");
                var imagem = grafico[0].getElementsByTagName("message")[0].firstChild.nodeValue;

                $("#imagem_estatistica").attr("src",imagem);

            });
            break;
        
        case 3:
            jQuery.get("estatisticasaulasprofessor.xml?", conteudo,

            function(data){    

                grafico = data.getElementsByTagName("estatistica");
                var imagem = grafico[0].getElementsByTagName("message")[0].firstChild.nodeValue;

                $("#imagem_estatistica").attr("src",imagem);

            });
            break;
        
        case 4:
            jQuery.get("totalginasio.xml?", conteudo,

            function(data){    

                grafico = data.getElementsByTagName("estatistica");
                var imagem = grafico[0].getElementsByTagName("message")[0].firstChild.nodeValue;

                $("#imagem_estatistica").attr("src",imagem);

            });
            break;
        default:
            break;
    }

}

function dar_feedback(url, token, aula_id, valor){
    
    var conteudo = "token="+token+"&aula_id="+aula_id+"&valor="+valor;
    jQuery.post(url+"api/feedbacks.xml", conteudo,

    function(data){    

        feedback = data.getElementsByTagName("feedback");

        alert(feedback[0].getElementsByTagName("message")[0].firstChild.nodeValue);

    });
}

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

function getGinasios(){

    var xml = new XMLHttpRequest();
    xml.open("GET","/ginasiosperto.xml?cidade="+$("#_cidade option:selected").text() + "&km=" + $("#distancia").val(), false);
    xml.send();
    ginasios = xml.responseXML.documentElement.getElementsByTagName("ginasio");

    $("#ginasios").html("");
    $("#ginasios").append("<tr><th>Nome</th></tr>");

    for(i = 0; i < ginasios.length; i++)
    {
        var id = ginasios[i].getElementsByTagName("id")[0].firstChild.nodeValue;
        var nome = ginasios[i].getElementsByTagName("nome")[0].firstChild.nodeValue;

        $("#ginasios").append("<tr><td><a href=\"/ginasios/" + id + "\">" + nome + "</a></td><td><a rel=\"nofollow\" data-method=\"delete\" data-confirm=\"Tem a certeza que deseja apagar este ginásio?\" href=\"/ginasios/" + id + "\">Apagar</a></td>");
    }
}

$(document).ready(function(){

    if($("#estatisticas")){
        
        get_estatisticas();
        $("#mes").change(function(){get_estatisticas();});
        $("#ano").change(function(){get_estatisticas();});
        $("#_taid").change(function(){get_estatisticas();});
        $("#tipo_estatistica").change(function(){get_estatisticas();});

    }
        if($("#mes").val() != undefined){
	        $("#mes").change(function(){
		

		        var mes = $("#mes").val();
		        var ano = $("#ano").val();
                var query = "/pagamentos/?mes="+mes+"&ano="+ano;
		        $("#link_ver").attr("href",query);

	        });
        }
    


        if($("#ano").val() != undefined){
    	    $("#ano").change(function(){
    		
                
    		    var mes = $("#mes").val();
    		    var ano = $("#ano").val();
    		    var query = "";
                if(mes != undefined)
                    query += "/pagamentos?ano="+ano+"&mes="+mes;
                else{
                    var link = $("#link_ver").attr("href");
                    var id = link.split('/')[2];

                    query += "/users/"+id+"/pagamentos?ano="+ano;
                }
                
                $("#link_ver").attr("href",query);

    	    });
        }
	

	if($("#todos:checked").length == 1)
		$("#ginasios_select").attr('disabled','true');
	
  	$("#todos").change(function(){

			if($("#todos:checked").length == 1)
				$("#ginasios_select").attr('disabled','true');
			
			else
				$("#ginasios_select").removeAttr('disabled');
			
			
	});

	if($("#distancia").val() != undefined)
		getGinasios();

    $("#_cidade").change(function(){getGinasios()});
    $("#distancia").change(function(){getGinasios()});

    if($("#exercicios_listbox_").val() != undefined){
	    var xml = new XMLHttpRequest();
	    xml.open("GET","/api/exercicios.xml", false);
	    xml.send();
	    exercicios = xml.responseXML.documentElement.getElementsByTagName("exercicio");

	    alterar_campos(exercicios);


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

