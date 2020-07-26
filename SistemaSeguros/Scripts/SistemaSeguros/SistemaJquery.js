function sumALL() {
    let total = 0;
    let fin = true;
    $(".filaTablaSuma").each(function () {
        let porc = isNaN(parseFloat($(this).find("#montoSumar").val())) ? 0 : parseFloat($(this).find("#montoSumar").val());
        if (porc > 100) {
            alert("Porcentaje de Cobertura no puede ser mayor a 100");
            $(this).find("#montoSumar").focus();
            $(this).find("#montoSumar").val('');
            fin = false;
            return false;
        }
        else if ($("#CodigoTipoRiesgo").val() == "2" && porc > 50) {
            alert("Póliza de alto riesgo, cobertura debe ser menor al 50%");
            $(this).find("#montoSumar").focus();
            $(this).find("#montoSumar").val('');
            fin = false;
            return false;
        }
        total += (parseFloat($(this).find("#PorcentajeSumar").text()) * (isNaN(parseFloat($(this).find("#montoSumar").val()))?0:
            parseFloat($(this).find("#montoSumar").val())) / 100);
    });
    if (!fin)
        return false;
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