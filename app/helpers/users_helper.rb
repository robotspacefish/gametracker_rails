module UsersHelper
  def display_avatar(user)
    content_tag :div, class: "pa4 tc" do
      tag.image src: user.get_avatar_url, class: "br-100 pa1 ba b--black-10 h3 w3", alt: "avatar"
    end
  end
end
