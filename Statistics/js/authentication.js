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
  console.log(username.value);
  console.log(password.value);

    button.addEventListener('click', e => {
      console.log('jalo');
      var email = username.value;
      var pass = password.value;
      if(email!="" && pass!=""){
      firebase.auth().signInWithEmailAndPassword(email, pass)
      .then(function(){
        window.location = "statistics_dashboard.html";
      })

      .catch(function(error){
        alert("The user/password is incorrect. Try again.");
        var errorCode = error.code;
        var errorMessage = error.message;
      });
    }

});
}());
