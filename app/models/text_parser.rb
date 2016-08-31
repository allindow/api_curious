class TextParser < OpenStruct

  def author
    from[:username]
  end
end
