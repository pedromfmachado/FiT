// JavaScript Document



function adicionaExercicio(){




	var val = $("#exercicios_listbox_").val();

	var ids_array = $("#plano_selected_exercicios").val().split(",");
	$("#dados").text("tamanho do array: " + ids_array.length + " tem elemento? " + $.inArray(val,ids_array));
	if($.inArray(val,ids_array) != -1){
		$("#exercicios").text("tem, nao adiciona");
		
	}
	else{
		$("#exercicios").text("nao tem, adiciona");
		$("#plano_selected_exercicios").val($("#plano_selected_exercicios").val() + val + ",");
	}

	$("#exercicios").text($("#plano_selected_exercicios").val());

}


