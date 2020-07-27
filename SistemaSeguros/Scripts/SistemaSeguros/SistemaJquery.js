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
        else if ($("#CodigoTipoRiesgo").val() == "4" && porc > 50) {
            alert("Póliza de alto riesgo, cobertura debe ser menor al 50%");
            $(this).find("#montoSumar").focus();
            $(this).find("#montoSumar").val('');
            fin = false;
            return false;
        }
        total += (parseFloat($(this).find("#PorcentajeSumar").text().replace(/[^0-9.]/g,'')) * (isNaN(parseFloat($(this).find("#montoSumar").val()))?0:
            parseFloat($(this).find("#montoSumar").val())) / 100);
    });
    if (!fin)
        return false;
    let mesesCobertura = isNaN(parseFloat($("#MesesCobertura").val())) ? 0 : parseFloat($("#MesesCobertura").val());
    mesesCobertura = total * mesesCobertura;
    mesesCobertura = mesesCobertura.toLocaleString('en-US', {
        style: 'currency',
        currency: 'USD',
    });
    $("#PrecioPolizaAdquirida").val(mesesCobertura).change();
}
function setCampo(field) {
    $(field).closest("tr").find("#montoSumar").val('');
    sumALL();
   
    if (field.value == 'on') {
        $(field).closest("tr").find("#montoSumar").removeAttr("disabled");
        $(field).closest("tr").find("#montoSumar").focus();
    }
    else {
        $(field).closest("tr").find("#montoSumar").attr("disabled", "disabled");
        $(field).focus();
    }
}
function VerDetalle(button) {
    //$("#editarDiv").css("display", "");
    //$("#listaDiv").css("display", "none");
    $("#ClienteNombre").val($("#nombreCliente").val()).change();
    $("#ClienteID").val($("#idCliente").val()).change();
    let valor = $(button).closest("tr").find("#idPolizaCliente").text();
    $("#ID_PolizaCliente").val(valor).change();
}

function ValidarMontoSeguro() {
    if (parseFloat($("#PrecioPolizaAdquirida").val()) == 0) {
        alert ("Precio Total debe ser mayor a cero")
        return false;
    }
    return true;
}

function validarFecha(field) {
    var uno = "";
}