function create_question_submit() {
    var questionForm = document.getElementById("create_question_form");
    var question_title = document.getElementById("question_title").value;
    var isSubmit = true;
    var isEndCheck = true;
    if (!question_title) {
        document.getElementById("title_error").innerHTML = "title can not empty";
        isSubmit = false;
        isEndCheck = false;
    } else {
        document.getElementById("title_error").innerHTML = "";
        isEndCheck = true;
    }
    var answer_a = document.getElementById("answer_a").value;
    if (!answer_a) {
        document.getElementById("answer_a_error").innerHTML = "answer can not empty";
        isSubmit = false;
        isEndCheck = false;
    } else {
        document.getElementById("answer_a_error").innerHTML = "";
        isEndCheck = true;
    }
    var answer_b = document.getElementById("answer_b").value;
    if (!answer_b) {
        document.getElementById("answer_b_error").innerHTML = "answer can not empty";
        isSubmit = false;
        isEndCheck = false;
    } else {
        document.getElementById("answer_b_error").innerHTML = "";
        isEndCheck = true;
    }
    var answer_c = document.getElementById("answer_c").value;
    if (!answer_c) {
        document.getElementById("answer_c_error").innerHTML = "answer can not empty";
        isSubmit = false;
        isEndCheck = false;
    } else {
        document.getElementById("answer_c_error").innerHTML = "";
        isEndCheck = true;
    }
     var answer_d = document.getElementById("answer_d").value;
    if (!answer_d) {
        document.getElementById("answer_d_error").innerHTML = "answer can not empty";
        isSubmit = false;
        isEndCheck = false;
    } else {
        document.getElementById("answer_d_error").innerHTML = "";
        isEndCheck = true;
    }
    if (isEndCheck) {
        var options = document.getElementsByName("answer");
        for (var i = 0;i<options.length;i++) {
            isSubmit = false;
            if (options.item(i).checked) {
                isSubmit = true;
                break;
            }
            if (i == options.length-1 && !isSubmit) {
                alert("Please check an right answer.");
                isSubmit = false;
            }
    }
    }
    if (isSubmit) {
        questionForm.submit();
    }
}