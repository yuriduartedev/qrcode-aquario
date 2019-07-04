// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
selector(".menu").addEventListener('click', function () {
  this.classList.toggle('open');
  selector('header').classList.toggle('open');
  selector('.overlay').classList.toggle('open');
});

function selector(s) {
  return document.querySelector(s)
}

$(document).ready(function() {
  $('a[disabled=disabled]').click(function(event){
      event.preventDefault(); // Prevent link from following its href
  });

  // Modal YouTube Stop Close
  $('.modal.youtube-video').on('hidden.bs.modal', function(e) {
    $('iframe', this).each(function() {
      this.contentWindow.postMessage('{"event":"command","func":"stopVideo","args":""}', '*');
    });
  });

  // Modal YouTube Play Open
  $('.modal.youtube-video').on('show.bs.modal', function(e) {
    $('iframe', this).each(function() {      
      this.contentWindow.postMessage('{"event":"command","func":"playVideo","args":""}', '*');
    });
  });
});

function toggleFAB(fab){
	if(document.querySelector(fab).classList.contains('show')){
  	document.querySelector(fab).classList.remove('show');
  }else{
  	document.querySelector(fab).classList.add('show');
  }
}

document.querySelector('.fab .main').addEventListener('click', function(){
	toggleFAB('.fab');
});

document.querySelectorAll('.fab ul li button').forEach((item)=>{
	item.addEventListener('click', function(){
		toggleFAB('.fab');
	});
});