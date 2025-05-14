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

