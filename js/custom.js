// toc = $("ul#toc");
// $("#content").find("h2").each(function() {
//   h = $(this);
//   toc.append("<li><a href='#" + h.attr("id") + "'>" + h.text() + "</a></li>");
// });

$('#toc').toc({
    listType: 'ul',
    noBackToTopLinks: true,
    headers: 'h2, h3',
    title: ''
});

$('#sidebar').affix({
  offset: {
    top: 200
  }
});

$(document.body).scrollspy({
  target: '#rightCol'
});
