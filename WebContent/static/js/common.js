$(function() {
    var path = window.location.pathname;
    if (path == "/EarlyEducation/page/home/init-data" || path == "/OES/page/question/create-question" || path == "/OES/page/question/update-question") {
    	$("#home").addClass("active");
        $("#about").removeClass();
        $("#question").removeClass();
    }
    if (path == "/EarlyEducation/page/home/about" || path == "/OES/page/exam/create-exam") {
    	$("#about").addClass("active");
        $("#question").removeClass();
        $("#home").removeClass();
    }
    if (path == "/EarlyEducation/page/home/qa" || path == "/OES/page/user/edit-profile") {
        $("#question").addClass("active");
        $("#about").removeClass();
        $("#home").removeClass();
    }
    
    $(function() {
        $("#create_question").click(function() {
        	$("#newQuestion").modal('show');
        	
        });
        
        $("#show_login").click(function() {
        	$("#loginModal").modal('show');
        });
        
        $("#answer_question").click(function() {
        	$("#answerModal").modal('show');
        });
        
        $(".close").click(function() {
    		$("#loginModal").modal('hide');
    		$("#newQuestion").modal('hide');
    		$("#answerModal").modal('hide');
        });
    });
});

function logout() {
    location.href = "/OES/page/user/logout";
}
