;; extends

; Highlights the contents of `@Query` annotations as SQL
(annotation
  (constructor_invocation
    (user_type) @type
    (#eq? @type "Query")

    (value_arguments
      (value_argument
        (string_literal
          ((string_content) @injection.content
            (#set! injection.language "sql")))))))

; Follows intellij style highlighting based on comments. In short adding the
; following will highlight the string of a property declaration.
;
; // language=json
; val someProp = """
; { "data": [1, 2, 3] 
; """
((line_comment)
  @injection.language .
  [
    (property_declaration
      (string_literal
        (string_content) @injection.content))
    (property_declaration
      (call_expression
        (navigation_expression
          (string_literal
            (string_content) @injection.content))))
    (call_expression
      (navigation_expression
        (string_literal
          (string_content) @injection.content)))
  ]

  (#match?  @injection.language "^\/\/ language=.+$")
  (#gsub! @injection.language "^// language=(.+)$" "%1")
  (#set! injection.combined)
)

