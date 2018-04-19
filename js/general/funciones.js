
function marcarMenu(id){
	$j('#main-menu > ul >li').removeClass('active');
  	$j('#main-menu > ul > li#'+id).addClass('active');
}