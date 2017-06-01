function removeCategoryTab(category_id) {
  //category_content = $(".category");
  //category_content.click(function(){
  //  category_content.remove();
  //});
}

function createCategoryTab(){
  category_content =  document.getElementById('category-id')
  category_content.insertAdjacentHTML('beforeend', '<div class="category" id="category-id"> <input id="category-content" type="text"> <span class="fa fa-plus" aria-hidden="true" ></span> <span class="fa fa-times" aria-hidden="true"></span></div>');
  all_tabs = document.getElementById('all-tabs');
  category_content.insertAdjacentHTML('beforeend', '<button class="tablinks" onclick="openData(event, Test)">Muestras</button>');
}


function openData(evt, tabName) {
      var i, tabcontent, tablinks;
      tabcontent = document.getElementsByClassName("tabcontent");
      for (i = 0; i < tabcontent.length; i++) {
          tabcontent[i].style.display = "none";
      }
      tablinks = document.getElementsByClassName("tablinks");
      for (i = 0; i < tablinks.length; i++) {
          tablinks[i].className = tablinks[i].className.replace(" active", "");
      }
      document.getElementById(tabName).style.display = "block";
      evt.currentTarget.className += " active";
  }
