// Initialize Firebase
(function() {
    var config = {
        apiKey: "AIzaSyCGtYN3lyGjmAOwTdFujyLouz0Cunlb4s4",
        authDomain: "puertadehierro-a797c.firebaseapp.com",
        databaseURL: "https://puertadehierro-a797c.firebaseio.com",
        storageBucket: "puertadehierro-a797c.appspot.com",
        messagingSenderId: "442464985582"
    };
    firebase.initializeApp(config);
    const uList = document.getElementById('list'); //Referencia a lista 
    var big = document.getElementById('big');

    var dbRef = firebase.database().ref().child('text');
    var dbRefList = firebase.database().ref().child('Usuarios/mta1'); // Referencia al hijo Contacto

    dbRef.on('value', snap => big.innerText = snap.val());
    var firebaseRef = firebase.database().ref();
    firebaseRef.child('users').on('value', function(groupSnap) {
        groupSnap.forEach(function(snap) {
            //console.log(snap.val());
            var object = snap.val();
            Object.keys(object).forEach(function(key, index) {
                const li = document.createElement('li');
                li.innerText = (key + ": " + object[key]);
                //li.id = snap.key();
                uList.appendChild(li);
            });
            const li = document.createElement('li');
            li.innerText = snap.val();
            uList.appendChild(li);
        });
    });

}());