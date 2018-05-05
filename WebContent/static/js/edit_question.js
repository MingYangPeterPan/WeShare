$(function() {
    var isSubmit = false;
    var isReturn = true;
    $("textarea").change(function() {
        isReturn = false;
        isSubmit = true;
        if (!checkTitle()) {
            isSubmit = false;
        }
    })
    $("input").change(function() {
        isReturn = false;
        isSubmit = true;
        if (!checkTitle()) {
            isSubmit = false;
        }
        if (!checkAnswerA()) {
            isSubmit = false;
        }
        if (!checkAnswerB()) {
            isSubmit = false;
        }
        if (!checkAnswerC()) {
            isSubmit = false;
        }
        if (!checkAnswerD()) {
            isSubmit = false;
        }
    })
    $("#edit_question_submit").click(function() {
        var questionForm = document.getElementById("edit_question_form");
        if (isSubmit) {
            questionForm.submit();
        }
        if(isReturn) {
            window.location.href="question-list";
        }
    });
});

function checkTitle() {
    if ($("#question_title").val().length > 100) {
        $("#title_error").html("title is to long.");
        return false;
    } else {
        $("#full_name_error_message").html("");
    }
    return true;
}

function checkAnswerA() {
    if ($("#answer_a").val().length > 50) {
        $("#answer_a_error").html("answer is to long.");
        return false;
    } else {
        $("#answer_a_error").html("");
    }
    return true;
}

function checkAnswerB() {
    if ($("#answer_b").val().length > 50) {
        $("#answer_b_error").html("answer is to long.");
        return false;
    } else {
        $("#answer_b_error").html("");
    }
    return true;
}

function checkAnswerC() {
    if ($("#answer_c").val().length > 50) {
        $("#answer_c_error").html("answer is to long.");
        return false;
    } else {
        $("#answer_c_error").html("");
    }
    return true;
}

function checkAnswerD() {
    if ($("#answer_d").val().length > 50) {
        $("#answer_d_error").html("answer is to long.");
        return false;
    } else {
        $("#answer_d_error").html("");
    }
    return true;
}
