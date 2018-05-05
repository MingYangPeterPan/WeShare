$(function() {
	if($("#isHidd").val() ==1){
	    $("#loginModal").modal('show');
	}
    $("#login").click(function() {
		$("#loginModal").modal('show');
    });
    $(".close").click(function() {
		$("#loginModal").modal('hide');
    });
});