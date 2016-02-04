document.body.onload = function () {
  console.info('document ready');
  confirmDelete();
  getTodoDone();
};

// TODO: ajax로 변경
function confirmDelete() {
  var table = document.querySelector('table');
  table.addEventListener("click", function () {
    if (event.target.name == "btn_delete") {
      event.preventDefault();
      var con = confirm("Do you really want to delete it?");
      if (con) {
        var form = event.target.parentElement;
        form.submit();
      }
    }
  });
}

function getTodoDone() {
  var table = document.querySelector('table');
  table.addEventListener('click', function () {
    if (event.target.type == 'checkbox') {
      var checkbox = event.target;
      var todo = checkbox.parentElement.nextElementSibling;
      var status = '';

      if (checkbox.checked) {
        todo.innerHTML = "<s>" + todo.innerHTML + "</s>";
        status = 'done';
      } else {
        todo.innerHTML = todo.firstChild.innerHTML;
        status = 'not-yet';
      }

      var url = '/todos/' + checkbox.name + '/' + status;
      xhrRequest("PUT", url);
    }
  });
}

function xhrRequest(method, url, callback) {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatchange = function () {
    if (xhr.readyState == 4) {
      if (xhr.status >= 200 && xhr.status < 300 || xhr.status == 304) {
          callback(xhr.response.Text);
      } else {
          alert("Request was unsuccessful: " + xhr.status);
      }
    }
  };
  xhr.open(method, url, true);
  xhr.send(null);
  return xhr;
}
