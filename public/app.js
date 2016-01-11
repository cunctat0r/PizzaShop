function add_to_cart(id) {
	var key = 'product_' + id;
	var x = window.localStorage.getItem(key);
	x = x * 1 + 1;	
	window.localStorage.setItem(key, x);		
	alert("You want to buy " + get_total_items() + " pizzas");
}

function get_total_items() {
	var total = 0;
	for(var i=0; i<localStorage.length; i++) {
 		var key = localStorage.key(i);
    	var value = localStorage[key];
    	total = total + value * 1;    	
	}
	return total;
}