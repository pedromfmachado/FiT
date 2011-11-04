// JavaScript Document

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
	var ids_array = $("#selected_exercicios").val().split(",");

    // se o exercicio ainda nao estiver associado ao plano ou se nao estiver ja escrito na hidden tag
	if(valor_ex && $.inArray(valor_ex,ids_exercicios) == -1 && $.inArray(valor_ex,ids_array) == -1){
        // escreve na hidden tag o id do exercicio escolhido
		$("#selected_exercicios").val($("#selected_exercicios").val() + valor_ex + "|" + $('#exercicio_peso').val() +
            '|' + $('#exercicio_series').val() + '|' + $('#exercicio_repeticoes').val() + ",");
        var exercicio = getObjects(all_arr,'id',valor_ex);
        $("#exercicios").append(exercicio[0]['nome']+ " - " + exercicio[0]['maquina']);
        console.log($('#selected_exercicios').val());
	}

}



