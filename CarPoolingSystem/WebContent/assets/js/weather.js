 var geoJSON;
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {
            lat: 41.00688, 
            lng: -91.967137
          },
          scrollwheel: false,
          zoom: 13
         
        });
        
  $(document).ready(function(){
	  
    $.get("http://api.openweathermap.org/data/2.5/weather", 
     {"zip":"52557","APPID":"a81b4671a45c3965a6f5281447d75847"})
     .done(successful)
     .fail(error);

     $.get("http://api.openweathermap.org/data/2.5/forecast", 
     {"zip":"52557","APPID":"a81b4671a45c3965a6f5281447d75847"})
     .done(successforecast)
     .fail(error);

     $("#info-button").click(function(){
        $("#info").hide("slide", { direction: "right" }, 500);
        $("#info-button2").show();
     });

     $("#info-button2").click(function(){
        $("#info").show("slide", { direction: "right" }, 500);
        $("#info-button2").hide();
     });

  function successforecast(data){
      console.log(data.list);
      var weekly = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ];
      var forecast = data.list;
      //  $("<div>").addClass("fivedays").append($("<img>").attr({
      //         "src" : "header.jpg",
      //         alt : "header_img"
      //     })).appendTo("#l_container").attr({"id" : "d" + i}
      //     ).addClass("container");
        for (var i = 4; i < forecast.length; i += 8) {
          var k = parseFloat(forecast[i].main.temp);
          var f = 9 / 5 * (k - 273) + 32;
          var icon = forecast[i].weather[0].icon;
          var description = forecast[i].weather[0].description;
          var date = new Date(forecast[i].dt_txt);
          var days = weekly[date.getDay()];
          $("<div>").addClass("fivedays").append("<h3 class= 'days'>"+ days + " " + date.getDate() + "</h3>").append($("<img class='w_icons'>").attr({
              "src" : "http://openweathermap.org/img/w/" + icon + ".png",
              alt : "icon"
          })).appendTo("#l_container").addClass("daily").attr({
              "id" : "d" + i}
          ).addClass("containers");
          $("<span>").html("<br>" + f.toFixed(2) + "&deg;F" + " <br><em>" + description + "</em><br>").appendTo("#d" + i);
        }
   
  }

function successful(data){

  search();
  resetData();
  geoJSON.features.push(jsonToGeoJson(data));
  drawIcons(geoJSON);
  currentweather(data);
  //Popup
       map.data.addListener('click', function(event) {
          var far=9/5*(event.feature.getProperty("temperature") - 273) + 32;
          infowindow.setContent(
          "<img class='w_icons' src=" + event.feature.getProperty("icon") + ">"
          + "<br /><strong>" + event.feature.getProperty("city") + "</strong>"
          + "<br />" + far.toFixed(0) + "&deg;F"
          + "<br />" + event.feature.getProperty("weather")
          + "<br />" +"Humidity: " + event.feature.getProperty("humidity")
          + "<br />" +"Wind Speed: " + event.feature.getProperty("windSpeed")
          );
          infowindow.setOptions({
              position:{
                lat: event.latLng.lat(),
                lng: event.latLng.lng()
              },
              pixelOffset: {
                width: 0,
                height: -15
              }
            });
          infowindow.open(map);
        }); 
  }
  function error(){
    alert('please try again');
  }
  function currentweather(data){
    $('#weather').html(data.name+", "+data.sys.country).attr("style","font-weight:bold;text-decoration:underline");
    $("<img>").attr({"src":"http://openweathermap.org/img/w/"+data.weather[0].icon+".png",alt:"icon"})
        .appendTo("#Icon").addClass("w_icons");
        var k= parseFloat(data.main.temp);
        var f=9/5*(k - 273) + 32;
        $("<p>").html(f.toFixed(2)+ "&deg;F").appendTo("#WeatherIcon");
        $("<p>").html(data.weather[0].main+": "+data.weather[0].description).appendTo("#WeatherIcon");
        $("<p>").html("Humidity: " +data.main.humidity+" <br>Pressure: " +data.main.pressure).appendTo("#WeatherIcon");
        $("<p>").html("Wind Speed: " +data.wind.speed).appendTo("#WeatherIcon");
  }
  function search(){
    $('<input>').attr({"id":"destination", placeholder:"Enter destination", type: "text"}).appendTo("#search");
    $('<input>').attr({value:"Search", type: "button"}).appendTo("#search").click(function(){
    if(isNaN($('#destination').attr('value'))){ 
        $.get("http://api.openweathermap.org/data/2.5/weather", 
          {"q":$('#destination').attr('value'),"APPID":"a81b4671a45c3965a6f5281447d75847"})
          .done(dynamicsuccess)
          .fail(error);
        $.get("http://api.openweathermap.org/data/2.5/forecast", 
          {"q":$('#destination').attr('value'),"APPID":"a81b4671a45c3965a6f5281447d75847"})
          .done(dynamicforecast)
          .fail(error); 
    }else {
      $.get("http://api.openweathermap.org/data/2.5/weather", 
          {"zip":$('#destination').attr('value'),"APPID":"a81b4671a45c3965a6f5281447d75847"})
          .done(dynamicsuccess)
          .fail(error);
        $.get("http://api.openweathermap.org/data/2.5/forecast", 
          {"zip":$('#destination').attr('value'),"APPID":"a81b4671a45c3965a6f5281447d75847"})
          .done(dynamicforecast)
          .fail(error);
    }  
    });
  }
  function dynamicsuccess(data){
    resetData();
    geoJSON.features.push(jsonToGeoJson(data));
    drawIcons(geoJSON);
    $("#WeatherIcon").html("<span id = \"Icon\"></span>");
    currentweather(data);
    map.setCenter({
      lat: data.coord.lat, lng: data.coord.lon
    }); 
    //Popup
       map.data.addListener('click', function(event) {
          var far=9/5*(event.feature.getProperty("temperature") - 273) + 32;
          infowindow.setContent(
          "<img class='w_icons' src=" + event.feature.getProperty("icon") + ">"
          + "<br /><strong>" + event.feature.getProperty("city") + "</strong>"
          + "<br />" + far.toFixed(0) + "&deg;F"
          + "<br />" + event.feature.getProperty("weather")
          + "<br />" +"Humidity: " + event.feature.getProperty("humidity")
          + "<br />" +"Wind Speed: " + event.feature.getProperty("windSpeed")
          );
          infowindow.setOptions({
              position:{
                lat: event.latLng.lat(),
                lng: event.latLng.lng()
              },
              pixelOffset: {
                width: 0,
                height: -15
              }
            });
          infowindow.open(map);
        }); 
  }
  function dynamicforecast(data){
    $("#l_container").html("");
    successforecast(data)
  }
  //Instantiating infowindow Popup
  var infowindow = new google.maps.InfoWindow();
  var drawIcons = function (weather) {
     map.data.addGeoJson(geoJSON);
     // Set the flag to finished
     gettingData = false;
  };
  var resetData = function () {
    geoJSON = {
      type: "FeatureCollection",
      features: []
    };
    map.data.forEach(function(feature) {
      map.data.remove(feature);
    });
  };
  var jsonToGeoJson = function (weatherItem) {
      var feature = {
        type: "Feature",
        properties: {
          city: weatherItem.name,
          weather: weatherItem.weather[0].main,
          temperature: weatherItem.main.temp,
          min: weatherItem.main.temp_min,
          max: weatherItem.main.temp_max,
          humidity: weatherItem.main.humidity,
          pressure: weatherItem.main.pressure,
          windSpeed: weatherItem.wind.speed,
          windDegrees: weatherItem.wind.deg,
          windGust: weatherItem.wind.gust,
          icon: "http://openweathermap.org/img/w/"
                + weatherItem.weather[0].icon  + ".png",
          coordinates: [weatherItem.coord.lon, weatherItem.coord.lat]
        },
        geometry: {
          type: "Point",
          coordinates: [weatherItem.coord.lon, weatherItem.coord.lat]
        }
      };
      // Set the custom marker icon
      map.data.setStyle(function(feature) {
        return {
          icon: {
            url: feature.getProperty('icon'),
            anchor: new google.maps.Point(25, 25)
          }
        };
      });
      // returns object
      return feature;
    };
  });
  
}
      
        
