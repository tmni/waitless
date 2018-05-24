(function () {
	var $ = function(id) { return document.getElementById(id); };

	window.onload = function() {
		
	}

	function preventDefault(e){
    	e.preventDefault();
	}

	function disableScroll(){
	    document.body.addEventListener('touchmove', preventDefault, { passive: false });
	}
	function enableScroll(){
	    document.body.removeEventListener('touchmove', preventDefault, { passive: false });
	}
}());