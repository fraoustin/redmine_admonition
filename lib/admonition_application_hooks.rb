require 'redmine'
class AdmonitionApplicationHooks < Redmine::Hook::ViewListener
  def view_layouts_base_html_head(context = {})
    # beware of http://www.redmine.org/issues/3935
    return stylesheet_link_tag("admonition.css", :plugin => "redmine_admonition", :media => "all")
  end
end
