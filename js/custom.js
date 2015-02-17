toc = $("ul#toc");
$("#content").find("h2").each(function() {
  h = $(this);
  toc.append("<li><a href='#" + h.attr("id") + "'>" + h.text() + "</a></li>");
});

$('#sidebar').affix({
  offset: {
    top: 200
  }
})

var $body   = $(document.body);

$body.scrollspy({
  target: '#rightCol'
});
