Spree::Admin::NavigationHelper.module_eval do
  def link_to_new(options = {})
    url = options[:url] || new_object_url
    title = options[:title] || Spree.t(:new)
    options[:data] = { action: 'new' }
    link_to_with_icon('plus', title, url, options)
  end
end