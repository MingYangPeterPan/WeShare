$(function() {
    var page = 1;
    $(".up").click(function() {
        page = $("[name = 'up_value']").val();
        var word = $("[name = 'title_keyword']").val();
        var keyword = URLencode(word);
        window.location.href = "question-list?key=" + keyword + "&currentPage=" + page;
        });
    $(".down").click(function() {
        page = $("[name = 'down_value']").val();
        var word = $("[name = 'title_keyword']").val();
        var keyword = URLencode(word);
        window.location.href = "question-list?key=" + keyword + "&currentPage=" + page;
    });
    $(".go_button").click(function() {
        page = $("[name = 'inputPage']").val();
        var word = $("[name = 'title_keyword']").val();
        var keyword = URLencode(word);
        if (isNaN(page)) {
            $("[name = 'inputPage']").attr("value","");
        }else {
            window.location.href = "question-list?key=" + keyword + "&currentPage=" + page;
        }
    });
    $(".delete_question").click(function() {
        var id = $(this).parent().children().last().val();
        var deleteQuestion = document.getElementById("delete_message");
        deleteQuestion.style.display = "block";
        $("#yes").click(function(){
            window.location.href = "delete-question?question_id=" + id;
            deleteQuestion.style.display = "none";
        });
        $("#no").click(function(){
            deleteQuestion.style.display = "none";
        });
    });
    $(".edit_profile_button").click(function() {
            window.location.href = "edit-profile";
    });
    $(".keyword_button").click(function() {
            var word = $("[name = 'title_keyword']").val();
            var keyword = URLencode(word);
            window.location.href = "question-list?key=" + keyword + "&currentPage=" + page;
    });
    function URLencode(sStr) {
        return escape(sStr).replace(/\+/g, '%2B').replace(/\"/g,'%22').replace(/\'/g, '%27').replace(/\//g,'%2F');
    }
});