function sumALL() {
    let total = 0;
    $(".filaTablaSuma").each(function () {
        total += (parseFloat($(this).find("#PorcentajeSumar").text()) * (isNaN(parseFloat($(this).find("#montoSumar").val()))?0:
            parseFloat($(this).find("#montoSumar").val())) / 100);
    });
    let mesesCobertura = isNaN(parseFloat($("#MesesCobertura").val())) ? 0 : parseFloat($("#MesesCobertura").val());
    $("#PrecioPolizaAdquirida").val(total * mesesCobertura).change();
}
function setCampo(field) {
    $(field).closest("tr").find("#montoSumar").val('');
    sumALL();
   
    if (field.value == 'on') {
        $(field).closest("tr").find("#montoSumar").removeAttr("readonly");
        $(field).closest("tr").find("#montoSumar").focus();
    }
    else {
        $(field).closest("tr").find("#montoSumar").attr("readonly", "true");
        $(field).focus();
    }
}
function SetIDClient(valor) {
    $("#FK_IDCliente").val(valor).change();
}