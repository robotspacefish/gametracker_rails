module UsersHelper
  def display_avatar(user)
    content_tag :div, class: "pa4 tc" do
      tag.image src: user.get_avatar_url, height: 40, alt: "avatar"
    end
  end
end
