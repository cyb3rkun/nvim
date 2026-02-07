;; Capture type specifiers like 'int', 'bool', etc.
; this extends the default queries instead of overriding them all
; extends 

(_
(type) @type)

(class_definition
  body: (body(_))@class.inner)

(variable_statement
(name) @name)

(_
  (name)@name)

; TODO: fix this
(_
  (
   (function_definition)
   (comment)
  ) @function.outer)

(assignment
  left: (subscript (identifier)@name))

(_
  left: (identifier) @name)

(_
 (type) @type.inner)

(_
 (type) @type.outer)

(_
  (attribute_call) @call.outer)

(source
  (comment)+ @comment.outer)
(
 (enum_definition) @enum)

(assignment
  left: (subscript) @assignment.lhs)

(assignment
  left: (attribute) @assignment.lhs)

