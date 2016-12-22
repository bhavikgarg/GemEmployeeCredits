window.onload = function () {
    var empId = localStorage.getItem("employeeID");
    if (empId == undefined || empId == 0 || empId == null) {
        window.location = "/App";
    }
}