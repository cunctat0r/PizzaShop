function add_to_cart(id) {
	var key = 'product_' + id;
	var x = window.localStorage.getItem(key);
	x = x * 1 + 1;	
	window.localStorage.setItem(key, x);		
	update_orders_input();
}

function update_orders_input() {
	var orders = cart_get_orders();
	$('#orders_input').val(orders);
}

function get_total_items() {
	var total = 0;
	for(var i=0; i<localStorage.length; i++) {
 		var key = localStorage.key(i);
 		if (key.indexOf('product_') == 0) {
 			var value = localStorage[key];
    		total = total + value * 1;
 		}
    	
	}
	return total;
}

function cart_get_orders() {
	var orders = '';
	for(var i=0; i<localStorage.length; i++) {
 		var key = localStorage.key(i);
 		if (key.indexOf('product_') == 0) {
 			var value = localStorage[key];
    		orders = orders + key + '=' + value + ',';
 		}
    	
	}
	return orders;	
}