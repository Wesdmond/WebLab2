
const validator = new Validator();
window.onload = function () {
    const canvasPrinter = new CanvasPrinter();
    canvasPrinter.drawStartImage()

    document.querySelector("input[type=text][id=Y-input]")
        .addEventListener("focusout", validator.validateY);

    let r = document.querySelector("input[type=text][id=R-input]");
    let lastR = sessionStorage.getItem('R');
    if (lastR !== null) r.value = lastR;
    document.querySelector("input[type=text][id=R-input]")
        .addEventListener("focusout", () => {
            if (validator.validateR()) {
                canvasPrinter.redrawAll(r.value);
                validator.lastClickedR = r.value;
                sessionStorage.setItem('R', r.value);
            }
        });

    canvasPrinter.canvas.addEventListener('click', function(event) {
        canvasPrinter.parseClick(event)
    });
    // Not auto update page after form submit
    $('form').submit(function(e) {
        e.preventDefault();
    })
}