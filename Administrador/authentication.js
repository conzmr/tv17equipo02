(function() {
    var config = {
        apiKey: "AIzaSyCGtYN3lyGjmAOwTdFujyLouz0Cunlb4s4",
        authDomain: "puertadehierro-a797c.firebaseapp.com",
        databaseURL: "https://puertadehierro-a797c.firebaseio.com",
        storageBucket: "puertadehierro-a797c.appspot.com",
        messagingSenderId: "442464985582"
    };
    firebase.initializeApp(config);
    const auth = firebase.auth();
    auth.createUserWithEmailAndPassword(email, pass);
    const txtEmail = document.getElementById('txtEmail');
    const txtPassword = document.getElementById('txtPassword');
    const btnLogin = document.getElementById('btnLogin');
    const btnSignUp = document.getElementById('btnSignUp');
    const btnLogOut = document.getElementById('btnLogOut');
    btnLogin.addEventListener('click', e => {
        const email = txtEmail.value;
        const pass = txtPassword.value;
        const auth = firebase.auth();

        const promise = auth.signInWithEmailAndPassword(email, pass);
        promise.catch(e => console.log(e.message));

    });
    btnSignUp.addEventListener('click', e => {
        const email = txtEmail.value;
        const pass = txtPassword.value;
        const auth = firebase.auth();

        const promise = auth.createUserWithEmailAndPassword(email, pass);
        promise.catch(e => console.log(e.message));
    });

    btnLogOut.addEventListener('click', e => {
        firebase.auth().singOut();
    });

    firebase.auth().onAuthStateChanged(firebaseUser => {
        if (firebaseUser) {
            console.log(firebaseUser);
            btnLogOut.classList.remove('hide');
        } else {
            console.log('not logged in');
            btnLogOut.classList.add('hide');
        }
    });
}());