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
		          const uList = document.getElementById('list');
		          var big = document.getElementById('big');

		          var dbRef = firebase.database().ref().child('text');
		          var dbRefList = firebase.child('Contacto');

		          dbRef.on('value', snap => big.innerText = snap.val());
		          /*dbRef.on('value', snap => {
		          	big.innerText = JSON.stringify(snap.val(), null, 3);
		          }*/
		          dbRefList.on('child_added', snap => {
		                  const li = document.createElement('li');
		                  li.innerText = snap.val();
		                  uList.appendChild(li);
		              }

		              //const preObject = document.getElementById('object');

		          }());