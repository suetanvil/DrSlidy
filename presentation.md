# Presentations with DrSlidy

## Slidy + Markdown = Slidy.MD = DrSlidy

###### Notes

This is an introduction to DrSlidy, a quick-and-dirty-ish
Markdown-based slide system.

-----------------------------------------------------
# Features

* Write in Markdown
* Add undisplayed presentation notes
* Present with any decent modern browser
* Publish on the web as is, or:
 * As [one page](simple.html)
 * [Raw markdown](presentation.md)

###### Notes

## This Section

This Notes section is not visible on the slide itself so you can use
it for your own notes.  (But keep in mind that it **does** show up in
the "one page" format, so no swearing!)

## The Presentation Source

Quickslides embedded the Markdown inside an HTML file script section;
DrSlidy uses a separate Markdown file instead.

We care about this for three reasons:

Firstly, it separates stuff out.  You only need to edit
`presentation.md`; nothing else.

Secondly, the slides depend on some pretty advanced browser features
aimed at sighted viewers.  If you want to put your slides on the web,
visually impaired visitors or those who just don't want to use a
JavaScript-based browser are out of luck.  But with DrSlidy, you just
need to provide a link to `simple.html` or (if they're **really**
constrained) `presentation.md`.

Finally, it lets you publish the notes of the presentation as well.
Just link to `simple.html` and the whole thing renders in one
not-too-ugly HTML page.

-----------------------------------------------------
# Using It

1. Fetch from git(hub).
2. Edit presentation.md to contain your presentation
3. Open index.html in your preferred browser.

<meta name="copyright" content="Copyright &#169; 2016 Chris Reuter"/> 

###### Notes

You don't strictly need to use git (or any version control system) at
all, but you should because it's the twenty-first century and we are
not barbarians.

Also: note the meta tag (only visible in the raw Markdown).  That sets
the copyright attribute used by slidey.js.  You can put it anywhere in
the presentation where Markdown allows HTML.

-----------------------------------------------------
# Running the Browser

Firefox:

    firefox index.html

Chrome:

    chrome --disable-web-security index.html

Safari (on OS X):

    open -a Safari.app index.html


###### Notes

Unfortunately, not all browsers allow JavaScript to read files off the
local disk, even if they are in the same location as the current web
page.  Safari and Firefox do (the latter with a deprecation warning)
but Chrome needs the `--disable-web-security` flag.

I don't know about other browsers.

If you have trouble, you could also just use a static server.

-----------------------------------------------------
# Local Server

Alternately, just use a local server:

    bash server/server.sh

(Make sure this works **before** your presentation.)

###### Notes

There are lots of ways to launch a simple static web server on a
modern Unix(ish) system, but none of them are standard.

`server.sh` is a `bash` script that tries a bunch of different
one-line static http server options to see if any of them work.  If
you're lucky, it'll work for you out of the box.  If not, you may
still be able to poke at it until it works for you.

-----------------------------------------------------
# History and Attribution

* Based on [slidy](https://www.w3.org/Talks/Tools/Slidy2) by Dave Raggett
* Markdown converter by John Fraser
* [Toby Ho](http://tobyho.com/2010/11/08/quick-and-dirty-presentations/) [combined them](https://github.com/airportyh/QuickSlides).
* [Chris Reuter](https://github.com/suetanvil) tidied it up a bit and added some features.

###### Notes

This is the result of a bunch of incremental hacking I did to
QuickSlides as I made my own presentations.

-----------------------------------------------------
# The End

It's available [on Github](https://github.com/suetanvil/DrSlidy).

That's all, Folks.




