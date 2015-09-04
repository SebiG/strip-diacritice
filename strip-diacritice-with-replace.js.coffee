strip = (str, case_insensitive_boolean = false) ->
  lowercase_replace = (str_lowercase) ->
    str_lowercase
      .replace(/ă/g,"a")
      .replace(/â/g,"a")
      .replace(/î/g,"i")
      .replace(/ș/g,"s").replace(/ş/g,"s")
      .replace(/ț/g,"t").replace(/ţ/g,"t")
  with_caps_case_replace = (str_with_caps) ->
    str_with_caps = lowercase_replace(str_with_caps)
    str_with_caps
      .replace(/Ă/g, "A")
      .replace(/Â/g, "A")
      .replace(/Î/g, "I")
      .replace(/Ș/g, "S").replace(/Ş/g,"S")
      .replace(/Ț/g, "T").replace(/Ţ/g,"T")

  if case_insensitive_boolean is true
    lowercase_replace(str.toLowerCase())
  else
    with_caps_case_replace(str)


test_string = "ă, â, î, ș, ş, ț, ţ, â, Ă, Â, Î, Ș, Ț, Ş, Ţ"

console.log strip(test_string)
console.log strip(test_string, true)