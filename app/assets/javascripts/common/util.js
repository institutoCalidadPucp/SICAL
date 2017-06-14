function toggleLockStatus(element, status) {
  if (status == "active") {
    console.log(element.find('.fa-unlock'));
    element.find('.fa-lock').removeClass('fa-lock').addClass('fa-unlock');
  } else {
    element.find('.fa-unlock').removeClass('fa-unlock').addClass('fa-lock');
  }
}