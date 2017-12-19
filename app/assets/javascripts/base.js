window.onload = function(){
	if (["edit", "new"].map(e => window.location.pathname.indexOf(e) > 0).some(e => e)){

		document.getElementById('tags-view').addEventListener('keyup', function(e){
			  if(e.keyCode == 32){ 
			    var curr = e.target.value;
			    document.getElementById('tags-view').value = "";
			    document.getElementById('product_features_list').value+=" "+normalizeTag(curr)+" ";
			    document.getElementById('tags').innerHTML += spanize(curr);

			    document.querySelector('.info-text').innerHTML = "Click to remove";
			  };
		});
	}

	function spanize(e){
	  return "<span class='label label-info removable' style='margin-left: 5px;'>"+titleize(e)+"</span>";
	}

	function titleize(e) {
	  return e.charAt(0).toUpperCase() + e.slice(1).toLowerCase();
	}

	function normalizeTag(e) {
	  return e.toLowerCase();
	}
}

document.querySelector('body').addEventListener('click', function(e) {
  if (e.target.tagName.toLowerCase() === 'span' && Array.from(e.target.classList).includes('removable')) {
		var toRemove = e.target.innerText;
		var inp = toRemove.toLowerCase()+" ";
		var current = document.getElementById('product_features_list').value;
		document.getElementById('product_features_list').value = current.replace(inp, "");
		e.target.style = "display:none";  	
  }
});

