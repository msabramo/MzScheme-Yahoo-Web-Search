Yahoo! Web Search API wrapper for MzScheme
==========================================

Something I messed around with a long time ago when the [Yahoo! Web Search API] (http://developer.yahoo.com/search/web/V1/webSearch.html "Yahoo! Web Search API") first came out and before [MzScheme] (http://www.plt-scheme.org/software/mzscheme/) became [Racket] (http://racket-lang.org/new-name.html).

I have very, very little experience with Scheme so this is likely to possess a high degree of suckiness.

Sample usage from the MzScheme REPL:

    $ mzscheme
    Welcome to MzScheme v4.1.5 [3m], Copyright (c) 2004-2009 PLT Scheme Inc.
    > (require "yahoo-web-search.scm")
    > (for-each-result (lambda (x) (printf "~a~n" x)) "query=mzscheme")
    ((Title () MzScheme) (Summary () The MzScheme package is a subset of the PLT Scheme package; it contains MzScheme and console applications based on it, including the PLT web server, ...) (Url () http://www.plt-scheme.org/software/mzscheme/) (ClickUrl () http://www.plt-scheme.org/software/mzscheme/) (DisplayUrl () www.plt-scheme.org/software/mzscheme/) (ModificationDate () 1279695600) (MimeType () text/html)   (Cache () (Url () http://uk.wrs.yahoo.com/_ylt=A0PDBgnePVRMaAsAXDLdmMwF;_ylu=X3oDMTBwOHA5a2tvBGNvbG8DdwRwb3MDMQRzZWMDc3IEdnRpZAM-/SIG=15tetuk3j/EXP=1280675678/**http%3A//66.218.69.11/search/cache%3Fei=UTF-8%26appid=YahooDemo%26query=mzscheme%26u=www.plt-scheme.org/software/mzscheme/%26w=mzscheme%26d=P5ZODbZfVNYw%26icp=1%26.intl=us) (Size () 3578))  )
    ...

I have not tested this with Racket.
