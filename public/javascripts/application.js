function upvote(user_id) {
	vote(user_id, '/rating/thumbsup', true);
}
function downvote(user_id) {
	vote(user_id, '/rating/thumbsdown', false);
}
function vote(user_id, path, increment) {
	$.ajax({
	  type: 'POST',
	  data: {id : user_id},
	  url: path,
	  success: function(data){
		sel = (increment) ?  "upcount" : "downcount";
		elements = $("." + sel + "_span_" + user_id);
		elements.html(data);
	  }
	});
}