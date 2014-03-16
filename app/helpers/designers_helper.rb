module DesignersHelper
  
  # Returns the Gravatar (http://gravatar.com/) for the given user.
    def gravatar_for(designer, options = { size: 50 })
      gravatar_id = Digest::MD5::hexdigest(designer.email.downcase)
      size = options[:size]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      image_tag(gravatar_url, alt: designer.name, class: "gravatar")
    end
  end