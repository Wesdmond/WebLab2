class Validator{
    lastClickedR = null;
    validateAll(){
        return this.validateX() && this.validateY() && this.validateR();
    }

    validateX(){
        // return this.lastSelectedX != null;
        return true;
    }

    validateY(){
        let element = document.getElementById("Y-input");
        let value = element.value.replace(',', '.');
        function isNumeric(n) {
            return !isNaN(parseFloat(n)) && isFinite(n);
        }
        if (!isNumeric(value) || parseFloat(value) > 5 || parseFloat(value) < -3) {
            Swal.fire({
                title: 'Невалидный ввод!',
                text: 'Введите число от -3 до 5',
                icon: 'warning'
            });
            return false;
        }
        return true;
    }

    validateR(){
        let element = document.getElementById("R-input");
        let value = element.value.replace(',', '.');

        function isNumeric(n) {
            return !isNaN(parseFloat(n)) && isFinite(n);
        }
        if (!isNumeric(value) || parseFloat(value) > 4 || parseFloat(value) < 1) {
            Swal.fire({
                title: 'Невалидный ввод!',
                text: 'Введите число от 1 до 4',
                icon: 'warning'
            });
            return false;
        }
        return true;
    }
}