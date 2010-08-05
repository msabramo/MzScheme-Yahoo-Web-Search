(module test-yahoo-web-search mzscheme
        (require "yahoo-web-search.scm")
        (for-each-result (lambda (x) (printf "~a~n" x)) "query=mzscheme"))
