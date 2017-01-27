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

		  /*dbRef.on('value', snap => {
		  	big.innerText = JSON.stringify(snap.val(), null, 3);
		  }*/
		  var mex = 0;
		  var us = 0;
		  var can = 0; 
		  var arrGender= [{gender:"male", c:0},{gender:"female", c:0}]; //SEXO
		  var arrAges = [{}]
		  var dbRefCountries = firebase.database().ref().child('users');
		  dbRefCountries.on('child_added', snap => {
		  	if(snap.val().country=='Mexico'){
		  		mex++;
		  	}else if(snap.val().country=='USA'){
		  		us++;
		  	}else{
		  		can++;
		  	}
			  const li = document.createElement('li');
			  li.innerText = "Mexico: "+mex;
			  uList.appendChild(li);
			  const lu = document.createElement('li');
			  lu.innerText = "USA: "+us;
			  uList.appendChild(lu);
			  const la = document.createElement('li');
			  la.innerText = "Canada: "+can;
			  uList.appendChild(la);
		  	
			  if(snap.val().gender=="M"){ //SEXO
			  	arrGender[0].c++;			//SEXO
			  }else if(snap.val().gender=="F"){ //SEXO
			  	arrGender[1].c++; 			//SEXO
			  }
			  console.log("M: "+arrGender[0].c); //SEXO
			  console.log("F: "+arrGender[1].c); //SEXO
			});
			var dbRefSpecialties = firebase.database().ref().child('specialties'); //DOCTORES
			dbRefSpecialties.on('child_added', function(snap){ //DOCTORES 
				console.log(snap.val().Doctor.name);
				console.log(snap.val().Doctor.email);
			});

		  //const preObject = document.getElementById('object');
}());