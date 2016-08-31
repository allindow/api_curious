class MediaParser < OpenStruct

  def low_res_url
    images[:low_resolution][:url]
  end

  def like_count
    likes[:count]
  end

  def standard_url
    images[:standard_resolution][:url]
  end

  def caption_text
    caption[:text]
  end

end
