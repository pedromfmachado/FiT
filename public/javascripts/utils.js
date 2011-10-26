// JavaScript Document

function adicionaExercicio(exercicios_arr){

	var ids_exercicios = new Array;

	for(i = 0; i < exercicios_arr.length; i++)
		ids_exercicios.push(exercicios_arr[i].exercicio.id.toString());
	

	var valor_ex = $("#exercicios_listbox_").val();
	var ids_array = $("#plano_selected_exercicios").val().split(",");
	//$("#dados").text("tamanho do array: " + ids_exercicios.length + " tem elemento? " + $.inArray(valor_ex,ids_exercicios));


	if($.inArray(valor_ex,ids_exercicios) == -1 && $.inArray(valor_ex,ids_array) == -1){

		$("#plano_selected_exercicios").val($("#plano_selected_exercicios").val() + valor_ex + ",");
	}

	$("#exercicios").text($("#plano_selected_exercicios").val());

}


