module ApplicationHelper
  def gravatar_for user, opts = {}
    opts[:alt] = user.name
    email_digest = Digest::MD5.hexdigest user.email
    image_tag "https://www.gravatar.com/avatar/#{email_digest}?s=#{opts.delete(:size) {40}}",
      opts
  end
end
