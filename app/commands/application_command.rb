class ApplicationCommand
  def as_json(options = {})
    h = {}
    if success?
      h[:data] = result
    else
      h[:errors] = errors
    end
    h
  end
end
