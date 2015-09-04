mapDiacriticeConv_lower_case = 
  "ă" : "a"
  "â" : "a"
  "î" : "i"
  "ș" : "s"
  "ş" : "s"
  "ț" : "t"
  "ţ" : "t"

mapDiacriticeConv_caps = 
  "Ă" : "A"
  "Â" : "A"
  "Î" : "I"
  "Ș" : "S"
  "Ş" : "S"
  "Ț" : "T"
  "Ţ" : "T"

#return lowercase string if second argument is true (func(string[, boolean]))
strip = (str, case_insensitive_boolean = false) ->
  lowercase_replace = (str_lowercase) ->
    for k, v of mapDiacriticeConv_lower_case
      str_lowercase = str_lowercase.replace(new RegExp(k, 'g'), v)
    str_lowercase
  with_caps_case_replace = (str_with_caps) ->
    str_with_caps = lowercase_replace(str_with_caps)
    for k, v of mapDiacriticeConv_caps
      str_with_caps = str_with_caps.replace(new RegExp(k, 'g'), v)
    str_with_caps

  if case_insensitive_boolean is true
    lowercase_replace(str.toLowerCase())
  else
    with_caps_case_replace(str)




# teste
test_string = "ă, â, î, ș, ş, ț, ţ, â, Ă, Â, Î, Ș, Ț, Ş, Ţ"
caps_exit = "a, a, i, s, s, t, t, a, A, A, I, S, T, S, T"
lowercase_exit = "a, a, i, s, s, t, t, a, a, a, i, s, t, s, t"

console.log test_string

if strip(test_string) == caps_exit
  console.log "Caps sensitive OK:"
else
  console.log "Caps sensitive ERROR"
console.log strip(test_string)

if strip(test_string, true) == lowercase_exit
  console.log "To lowercase OK:"
else
  console.log "To lowercase ERROR"
console.log strip(test_string, true)