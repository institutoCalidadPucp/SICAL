function toggleLockStatus(element, status) {
  if (status == "active") {
    console.log(element.find('.fa-unlock'));
    element.find('.fa-lock').removeClass('fa-lock').addClass('fa-unlock');
    element.attr("title","Desactivar");
  } else {
    element.find('.fa-unlock').removeClass('fa-unlock').addClass('fa-lock');
    element.attr("title","Activar");
  }
}