angular.module('SeptimoMar')
  .controller('loginCtrl', function ($scope) {

    $j("#left-panel").hide();
    $j("#header").hide();
    $j("body").css("background-image", 'url("images/loginCalavera.png"),url("images/loginBG.jpg")');
    $j("body").css("background-repeat", 'no-repeat, no-repeat');
    $j("body").css("background-size", '33%, cover');
    $j("body").css("background-position", '15% center,0');

  });