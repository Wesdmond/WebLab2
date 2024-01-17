function parseForm(){
    if(!validator.validateAll()) {
        swal.fire(
            'Неверно заполнена форма!',
            'Проверьте что все поля заполнены, и что R и Y в требуемых пределах',
            'warning'
        )
        return
    }
    sendPoint(
        document.getElementById("X-input").value,
        document.getElementById("Y-input").value.replace(',', '.'),
        document.getElementById("R-input").value.replace(',', '.')
    )
    location.reload()
}

function sendPoint(x, y, r){
    $.ajax({
        type: "GET",
        url: "controller-servlet",
        dataType: "json",
        async: false,
        data: {
            "X": x,
            "Y": y,
            "R": r,
            "timezone": - new Date().getTimezoneOffset()
        }
    });
}