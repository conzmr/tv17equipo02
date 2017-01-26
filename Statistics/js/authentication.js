(function(){
  var config = {
    apiKey: "AIzaSyCGtYN3lyGjmAOwTdFujyLouz0Cunlb4s4",
    authDomain: "puertadehierro-a797c.firebaseapp.com",
    databaseURL: "https://puertadehierro-a797c.firebaseio.com",
    storageBucket: "puertadehierro-a797c.appspot.com",
    messagingSenderId: "442464985582"
  };

  firebase.initializeApp(config);

  var username = document.getElementById('username');
  var password = document.getElementById('passwd');
  var button = document.getElementById('btn');

  button.addEventListener('click', e => {
    console.log('jalo');
    var email = username.value;
    var pass = password.value;
    firebase.auth().signInWithEmailAndPassword(email, pass)
    .then(function(){
      console.log("me metiiiiii");
      window.location = "statistics_dashboard.html";
    })

    .catch(function(error){
      console.log("no me metiiiiii");
      document.getElementById('error').innerHTML = "ERROR";
      var errorCode = error.code;
      var errorMessage = error.message;
    });

});
}());
