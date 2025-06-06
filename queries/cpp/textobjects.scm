; extends

(_
  (type_identifier) @type.inner)

(_
  (primitive_type) @type.inner)

(_
  (qualified_identifier) @type.outer)

(_
  (type_qualifier) @type.qualifier)

(_
  (enumerator) @enum)

; with the following we can select function names, namespace id and 
; variable names, might add class name in future
(function_declarator
  (field_identifier) @name)

(field_declaration
  declarator: (field_identifier) @name)

(declaration
  declarator: (function_declarator
     declarator:(identifier) @name) )

(qualified_identifier
  (namespace_identifier) @name)

(class_specifier
  name: (type_identifier) @name)
