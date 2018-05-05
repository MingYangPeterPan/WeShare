$(function() {
    var isSubmit = true;
    var isReturn = true;
    $("input").change(function() {
        isReturn = false;
        isSubmit = true;
        if (!checkSubmitEmail()) {
            isSubmit = false;
        }
        if (!checkSubmitMobil()) {
            isSubmit = false;
        }
        if (!checkSubmitPassword()) {
            isSubmit = false;
        }
        if (!checkSubmitFullName()) {
            isSubmit = false;
        }
        if (!checkSubmitAddress()) {
            isSubmit = false;
        }
    })
    $(".profile_submit").click(function() {
        var questionForm = document.getElementById("edit_profile_form");
        if($("#password").val() != $("#confrimpassword").val()) {
            $("#confirm_password_error_message").html("Two passwords are inconsistent");
            isSubmit = false;
        } else {
            $("#confirm_password_error_message").html("");
        }
        if (isSubmit) {
            questionForm.submit();
        }
        if(isReturn) {
            window.location.href="profile-list";
        }
    });
});
function checkSubmitEmail() {
    if ($("#email").val() == "") {
        $("#emailconfirmMsg").html("email is not empty!");
        return false;
    } else {
        $("#emailconfirmMsg").html("");
    }
    if (!$("#email").val().match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)) {
        $("#emailconfirmMsg").html("email format is incorrect!");
        return false;
    } else {
        $("#emailconfirmMsg").html("");
    }
    return true;
}
function checkSubmitMobil() {
    if ($("#mobile").val() == "") {
        $("#phoneconfirmMsg").html("phone number is not empty");
        return false;
    } else {
        $("#phoneconfirmMsg").html("");
    }
    if (!$("#mobile").val().match(/^(((13[0-9]{1})|170|188|159)+\d{8})$/)) {
        $("#phoneconfirmMsg").html("phone number format is incorrect");
        return false;
    } else {
        $("#phoneconfirmMsg").html("");
    }
    return true;
}

function checkSubmitPassword() {
    if ($("#password").val() != "") {
        if($("#password").val().length<6) {
            $("#password_error_message").html("Password length can not be less than 6 numbers");
            $("#password").focus();
            return false;
        }else {
            $("#password_error_message").html("");
        }
    } else {
        $("#password_error_message").html("");
    }
    if ($("#confrimpassword").val() != "") {
        if($("#confrimpassword").val().length<6) {
            $("#confirm_password_error_message").html("Password length can not be less than 6 numbers");
            $("#confrimpassword").focus();
            return false;
        }else {
            $("#confirm_password_error_message").html("");
        }
    } else {
        $("#confirm_password_error_message").html("");
    }
    return true;
}
function checkSubmitFullName() {
    if ($("#full_name").val().length > 20) {
        $("#full_name_error_message").html("full name is to long.");
        return false;
    } else {
        $("#full_name_error_message").html("");
    }
    return true;
}
function checkSubmitAddress() {
    if ($("#address").val().length > 50) {
        $("#addressconfirmMsg").html("address is to long.");
        return false;
    } else {
        $("#addressconfirmMsg").html("");
    }
    return true;
}