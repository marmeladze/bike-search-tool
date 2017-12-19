window.onload = function(){
	document.getElementById('tags-view').addEventListener('keyup', function(e){
	  if(e.keyCode == 32){ 
	    var curr = e.target.value;
	    document.getElementById('tags-view').value = "";
	    document.getElementById('product_features_list').value+=curr+" ";
	    document.getElementById('tags').innerHTML += spanize(curr);
	  };
	});

	function spanize(e){
	  return "<span class='label label-info' style='margin-left: 5px;'>"+e+"</span>";
	}
}