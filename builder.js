
// The page builder.
var builder = {
  build_page: function() {
    var md = builder.get_presentation();

    var markup = new Showdown.converter().makeHtml(md);

    var slides = builder.split_into_slides(markup);

    slides = builder.strip_notes(slides);

    builder.show_slides(slides);

    builder.set_slide_titles();
  },

  // Render the presentation as a single-page HTML document.  Used for
  // notes and/or presenting on the web.
  build_notes_page: function() {
    var md = builder.get_presentation();

    var html = new Showdown.converter().makeHtml(md);

    builder.show_doc(html);
  },

  split_into_slides: function(markup) {
    return markup.split('<hr />');
  },

  strip_notes: function(slides) {
    var x = slides.map( 
      function(s) { return s.replace(/<h6\s+id="notes"(.|\n|\r)*$/, '') }
    );
    console.log(x);

    return x;
  },

  show_slides: function(slides) {
    slides.forEach(
      function(s) {document.write('<div class=slide>' + s+ '</div>')}
    );
  },

  show_doc: function(doc) {
    document.write(doc);
  },
  
  get_presentation: function() {
    xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", 'presentation.md', false );
    xmlHttp.send( null );
    return xmlHttp.responseText;
  },
  
  // Slide titles determine which one to display.
  set_slide_titles: function() {
    var slides = document.getElementsByClassName('slide');
    if (slides.length == 0) return;

    // HTMLCollection isn't an array, so I can't use filter()
    var slideKids = slides[0].children;
    for (var n = 0; n < slideKids.length; n++) {
      if (slideKids[n].tagName == 'H1') {
        document.title = slideKids[n].innerHTML;
        return;
      }
    }
  },
};
