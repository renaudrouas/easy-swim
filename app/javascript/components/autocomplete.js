function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var poolAddress = document.getElementById('pool_address');
    var poolAddressSearch = document.getElementById('pool_address_search');

    if (poolAddress) {
      var autocomplete = new google.maps.places.Autocomplete(poolAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(poolAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
    if (poolAddressSearch) {
      var autocomplete = new google.maps.places.Autocomplete(poolAddress, { types: [ 'geocode' ] });
        }
      });
    }
    var userAddress = document.getElementById('user_address');

    if (userAddress) {
      var autocomplete = new google.maps.places.Autocomplete(userAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(userAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
    var query = document.getElementById('query');

    if (query) {
      var autocomplete = new google.maps.places.Autocomplete(query, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(query, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }


export { autocomplete };

