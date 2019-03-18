$(document).ready(function(){
   $('.parallax').parallax();
   $('select').material_select();
   $('ul.tabs').tabs('select_tab', 'tab_id');
   $('.tooltipped').tooltip({delay: 50});
   $('.modal-trigger').leanModal();
   $('.button-collapse').sideNav();
   $('.dropdown-button').dropdown();
   $('.scrollspy').scrollSpy();

});
// $('.disable-button-js').click(function(){
//   $(this).prop("disabled",true);
// });
function PrintElem(elem,e)
{
   $(".button").css("display", "none");
     Popup($('<div/>').append($(elem).clone()).html(),e);
}


function Popup(data,nombre)
{
    var mywindow = window.open('', 'Compra', 'height=400,width=600');
    mywindow.document.write('<html><head><title>KTM-SHOP '+nombre+'</title>');
    mywindow.document.write('</head><body >');
    mywindow.document.write(data);
    mywindow.document.write('</body></html>');
    mywindow.print();
    mywindow.close();
   $(".button").css("display", "block");


    return true;
}

var ValidadorRut = {
    // Valida el rut con su cadena completa "XXXXXXXX-X"
    validaRut: function (rutCompleto) {
        rutCompleto = rutCompleto.replace('‐', '-');
        if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test(rutCompleto))
            return false;
        var tmp     = rutCompleto.split('-');
        var digv    = tmp[1];
        var rut     = tmp[0];
        if (digv == 'K') digv = 'k';

        return (ValidadorRut.dv(rut) == digv);
      },

    dv: function(T){
        var M=0,S=1;
        for(;T;T=Math.floor(T/10))
            S=(S+T%10*(9-M++%6))%11;
        return S?S-1:'k';
    }
}
function format(e)
{
  e = e.replace("-","");
  e = e.replace(".", "");
  e = e.replace(".", "");
  var format = "-" + e.substring(e.length - 1);
        for ( i = e.length - 2; i >= 0; i--)
        {
            format = e.substring(i, i + 1) + format;
        }

  return format;

 }

  function validar(e)
  {
    var labelerror = document.getElementById('tu_rut');
    labelerror.classList.remove("active","red-text");
    labelerror.style.display = "none"
    labelerror.innerHTML = "" ;
    e.classList.remove("invalid");
    var entrada = e.value
    if (entrada.length >= 7 && entrada.length <= 12 )
    {
      var salida = format(entrada)
      e.value= salida
      if (ValidadorRut.validaRut(e.value))
          {
            labelerror.classList.remove("active","red-text");
            labelerror.style.display = "none"
            labelerror.innerHTML = "" ;
            e.classList.remove("invalid");

          }
      else
        {
         e.classList.remove("valid");
         e.classList.add("invalid");
         labelerror.classList.add("active","red-text");
         labelerror.style.display = "block"
         labelerror.innerHTML = "ERROR REVISE EL RUT " ;
        }
    }
    else
    {
       e.classList.remove("valid");
         e.classList.add("invalid");
         labelerror.classList.add("active","red-text");
         labelerror.style.display = "block"
         labelerror.innerHTML = "ERROR REVISE EL RUT " ;

    }
  }
