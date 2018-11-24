function validateForm() {

    //Les expressions régulières
    var nameRegExp = new RegExp(/^[A-Z][a-z|A-Z]*(?:[\s-][A-Z][a-z|A-Z]*)*$/);
    var eMailRegExp = new RegExp(/^[\w|.-_]{1,}@[\w-]+(?:\.[a-z]{2,6})+$/i);
    var telRegExp = new RegExp(/\(\d{3}\)\s*\d{3}-\d{4}/);
    var subjectRegExp = new RegExp(/^.{1,30}$/);
    var messageRegExp = new RegExp(/^.{1,130}$/);

    //Tableau des regexp
    var regExpArray = [nameRegExp, eMailRegExp, telRegExp, subjectRegExp, messageRegExp];

    var contactForm = document.getElementById("contactForm");

    //Tableau des label qui fonctionnent comme message d'erreur. Créé avec getElementsByClassName; ils ont tous
    //la classe 'errror-message'
    var errMsgArray = contactForm.getElementsByClassName("error-message");

    //Au moment où le bouton envoyer est clické, vide les messages d'erreur
    for (var i in errMsgArray) {
        errMsgArray[i].innerText = "";
    }

    //Le tableau des champs d'entrée. Comme le tableau des messages d'erreur, il est créé
    //avec getElementsByClassName; ils ont tous la classe 'must-validate'.
    var inputArray = contactForm.getElementsByClassName("must-validate");

    //Le tableau du feedback. Placé dans le message d'erreur associé si le champ d'entrée
    //ne valide pas.
    var errFeedBackArray = ["Caractères permis: espace, trait d'union",
        "Exemple: asdfg123@domaine.ext",
        "Exemple: (012)345-6789",
        "30 caractères maximum",
        "130 caractères maximum"]

    //Les quatre tableaux sont synchronisés; l'index 0 des regexp correspond à l'index 0 des champs
    //d'entrée, l'index 0 des messages d'erreur et l'index 0 des feedback d'erreur, etc etc.

    //Devient vrai si un champ n'est pas rempli. Donne un message d'erreur différent de celui
    //obtenu si le champ ne valide pas.
    var fieldsUnset = false;

    //Devient vrai si un champ ne valide pas.
    var failedValidation = false;

    //Détermine si un champ est vide en le comparant avec un regexp d'un seul charactère '.'
    for (var i in inputArray) {
        if (new RegExp(".").test(inputArray[i].value) == false) {
            //Le message d'erreur associé devient 'veuillez remplir ce champ'
            errMsgArray[i].innerText = "Veuillez remplir ce champ";

            //Change la classe du champ d'entrée associé à is-invalid, lui donnant une bordure rouge.
            inputArray[i].className = "form-control must-validate is-invalid";

            //fieldsUnset devient
            fieldsUnset = true;
        }
    }

    //Compare séquentiellement chaque champ d'entrée avec son expression régulière associée.
    for (var i in regExpArray) {
        if (regExpArray[i].test(inputArray[i].value)) {

            //Si valide, vide le message d'erreur et donne la classe 'is-valid', lui donnant une
            //bordure verte
            errMsgArray[i].innerText = "";
            inputArray[i].className = "form-control must-validate is-valid";
        }
        else {
            //Sinon, donne la classe 'is-invalid', place le bon message d'erreur dans son label
            //d'erreur, et failedValidation devient vrai.
            inputArray[i].className = "form-control must-validate is-invalid";
            if (errMsgArray[i].innerText == "")
                errMsgArray[i].innerText = errFeedBackArray[i];
            failedValidation = true;
        }
    }

    //Si un champ n'est pas rempli, place le message d'erreur 'tous les champs ne sont pas remplis'
    //sous le bouton envoyer
    if (fieldsUnset) {
        errMsgArray[errMsgArray.length - 1].innerText = "Tous les champs ne sont pas remplis";

        //return false empêche la réinitialisation de la page
        return false;
    }
    //Si un champ n'est pas valide, place un différent message d'erreur sous le bouton envoyer.
    else if (failedValidation) {
        errMsgArray[errMsgArray.length - 1].innerText = "Un ou plusieurs champs invalides";
        return false;
    }
    //Sinon, donne la class btn-success au bouton envoyer, lui donnant une apparence verte de
    //grand succès.
    else {
        event.srcElement.className = "btn btn-success";
        event.srcElement.innerText = "Succès!";
    }
}

//ATTENTION: Ces fonctions ne fonctionnent pas dans Firefox!!

//Annule l'input quand l'usager tente de surpasser le nombre maximal de caractères
//dans le champ sujet et message. Placé dans l'événement keypress.
function enforceMaxChars(event, max) {
    //Nombre de caractères déjà entrés
    var nbrChars = event.srcElement.value.length;

    //Si le nombre est plus grand ou égal au max, prévient l'action par défaut du onkeypress.
    if (nbrChars >= max) {
        event.preventDefault();
    }
}

//Affiche le nombre de caractères déjà entrés et le nombre maximal de caractères pour aider l'usager.
//Placé dans l'événement input parce que le backspace ne déclenche pas l'événement keypress.
function displayCharacterLimit(event, max) {
    //Trouve le bon message d'erreur
    var errorDisplay = event.srcElement.parentElement.getElementsByClassName("error-message")[0];
    //Trouve le nombre de caractères déjà entrés
    var nbrChars = (event.srcElement.value.length).toString();
    max = max.toString();

    //Affichage
    errorDisplay.innerText = (nbrChars + '/' + max);
}