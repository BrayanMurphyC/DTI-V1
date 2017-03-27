module ApplicationHelper
  def markdown(content)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      lax_spacing: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end

  def form_image_select(event)
    return image_tag event.cover.url,
                     id: 'image-preview',
                     class: 'responsive-img' if event.cover.exists?
    image_tag 'placeholder.png', id: 'image-preview', class: 'responsive-img'
  end

  def form_logo_select(event)
    return image_tag event.photo.url,
                     id: 'photo-preview',
                     class: 'responsive-img' if event.photo.exists?
    image_tag 'placeholder.png', id: 'photo-preview', class: 'responsive-img'
  end

  def form_cover_article_select(articulo)
    return image_tag articulo.cover_article.url,
                     id: 'cover_article-preview',
                     class: 'responsive-img' if articulo.cover_article.exists?
    image_tag 'placeholder.png', id: 'cover_article-preview', class: 'responsive-img'
  end

  def form_profile_select(subscriber)
    return image_tag subscriber.profile.url(:medium),
                     id: 'profile-preview',
                     class: 'responsive-img' if subscriber.profile.exists?
    image_tag 'placeholder_profile.png', id: 'profile-preview', class: 'responsive-img'
  end

  def form_profile_select2(ponente)
    return image_tag ponente.profile.url(:medium),
                     id: 'profile-preview2',
                     class: 'responsive-img' if ponente.profile.exists?
    image_tag 'placeholder_profile.png', id: 'profile-preview2', class: 'responsive-img'
  end


  def resource_name
    :subscriber
  end

  def resource
    @resource ||= Subscriber.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:subscriber]
  end

  def resource_class
    devise_mapping.to
  end

end
