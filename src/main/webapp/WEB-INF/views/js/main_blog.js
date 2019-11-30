var requestUrl = $('.requestUrl').text();
$('.blogSlick').slick({
	centerMode: true,
	centerPadding: '60px',
	slidesToShow: 3,
	autoplay: true,
	autoplaySpeed: 3000,
	responsive: [
	  {
	    breakpoint: 768,
	    settings: {
	      arrows: false,
	      centerMode: true,
	      centerPadding: '40px',
	      slidesToShow: 3
	    }
	  },
	  {
	    breakpoint: 480,
	    settings: {
	      arrows: false,
	      centerMode: true,
	      centerPadding: '40px',
	      slidesToShow: 1
	    }
	  }
	]
});
	
function hiddenContent() {
	$(".blog-title").each(function() {
		let len = 10;
		let txt=$(this).text().trim();
		if(txt.length>len){
			txt=txt.substr(0,len);
		}
		$(this).html(txt);
	});

	$(".blog-content").each(function(){
		let id = $(this).data("blogid");
		let len = 10;
		let txt=$(this).text().trim();
	  if(txt.length>len){
		txt=txt.substr(0,len);
	  }
	  $(this).html(txt+" ......<div style='margin:10px'></div><div><a class='btn btn-info page-btn' href='" + requestUrl + "/blog/" + id + "'>閱讀詳細內容</a></div>");
  });
}
hiddenContent();