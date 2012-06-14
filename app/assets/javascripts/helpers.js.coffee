HAML.globals = ->
  globals = {
  # Other global data or functions here
  }

  for key, template of JST
    if helper = key.match /^helpers\/(.+)/
      globals[helper[1]] = template

  globals