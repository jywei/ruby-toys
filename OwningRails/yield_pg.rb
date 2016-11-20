def hug(&block)
  # p block
  var = block
  p "{"
  yield
  # block.call
  p "}"
end

hug { p "me" }
