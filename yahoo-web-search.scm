(module yahoo-web-search mzscheme

(require (lib "uri-codec.ss" "net")
         (lib "url.ss" "net")
         (lib "xml.ss" "xml")
         (lib "1.ss" "srfi"))

(define *root-url*  "http://search.yahooapis.com/WebSearchService/V1/webSearch?appid=YahooDemo&")
(current-alist-separator-mode 'amp) ; Yahoo API doesn't like semicolons in the query string. Use ampersands instead.
(collapse-whitespace #t)

(define-struct result (title summary url click-url display-url modification-date mime-type cache))

(define (do-command parameters)
  (let* ((url-string  (string-append *root-url* parameters))
         (url         (string->url url-string)))
    (document-element (read-xml (get-pure-port url)))))

(define (result->struct x)
  (let* (
         (ht (make-hash-table))
         (title "") 
         (summary "")
         (aurl "")
         (click-url "")
         (display-url "")
         (modification-date "")
         (mime-type "")
         (cache "")
         (func (lambda (y) 
                 (when (list? y)
                       (let ((head (car y)) (value (caddr y)))
                         (hash-table-put! ht head value)
                         (cond
                          ((equal? head 'Title) (set! title value))
                          ((equal? head 'Summary) (set! summary value))
                          ((equal? head 'Url) (set! aurl value))
                          ((equal? head 'ClickUrl) (set! click-url value))
                          ((equal? head 'DisplayUrl) (set! display-url value))
                          ((equal? head 'ModificationDate) (set! modification-date value))
                          ((equal? head 'MimeType) (set! mime-type value))
                          ((equal? head 'Cache) (set! cache value))))))))
    (map func x)
    (make-result title summary aurl click-url display-url modification-date mime-type cache)))

(define (for-each-result proc parameters)
  (let* ((filter-pred (lambda (x) (and (list? x) (equal? (car x) 'Result)))))
    (map proc (map cddr (filter filter-pred (cdddr (xml->xexpr (do-command parameters))))))))

(define (for-each-line proc . port+mode)
  (let while ()
    (let ((line (apply read-line port+mode)))
      (unless (eof-object? line)
              (proc line)
              (while)))))

; (for-each-line 
;  (lambda (line) (printf "~a~n" line))
;  port)

(provide for-each-result)

)
