// JavaScript Document

/*$(document).ready(function(){
    $("form").submit(function(){
        $("#plano_data").removeAttr("disabled");
    });
});*/


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

function altera_campos(exercicios_array){
  
    var valor_ex = $("#exercicios_listbox_").val();
    var exercicio = getObjects(exercicios_array,'id',valor_ex);
    if(exercicio[0]['tipo'] == "Aeróbico"){
 
      $("#ex_peso").text("Nível");
      $("#ex_series").text("Tempo");
      $("#exercicio_repeticoes").attr("disabled","true");
    }
    else{
      $("#ex_peso").text("Peso");
      $("#ex_series").text("Series");
      $("#exercicio_repeticoes").removeAttr("disabled");
    }
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
          $("#aerobicos").append("<td>" + exercicio[0]['nome']+ "</td><td>" + exercicio[0]['maquina'] + "</td><td>" 
                                + peso + "</td><td>" + series + "</td>");
      
          // escreve na hidden tag o id do exercicio escolhido
		      $("#selected_exercicios").val(exercicios + valor_ex + "|" + peso + '|' + series + '|' + 0 + ",");
          $("#jsalert").text("Exercício associado.");
        }
        else if(exercicio[0]['tipo'] == "Musculação" && peso && series && repeticoes){
          $("#musculacao").append("<td>" + exercicio[0]['nome']+ "</td><td>" + exercicio[0]['maquina'] + "</td><td>" 
                                + peso + "</td><td>" + series + "</td>" + "<td></td>" + repeticoes );


          // escreve na hidden tag o id do exercicio escolhido
		      $("#selected_exercicios").val(exercicios + valor_ex + "|" + peso +'|' + series + '|' + repeticoes + ",");
          $("#jsalert").text("Exercício associado.");
        }
        else{
          $("#jsalert").text("Não preencheu os dados correctamente.");
        }


	}
  else $("#jsalert").text("O exercício já faz parte do plano.");

}

function printError(msg)
{


}
