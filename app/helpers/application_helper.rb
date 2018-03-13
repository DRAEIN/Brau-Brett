module ApplicationHelper
	def markdown(text)
       renderer = Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
       options = {
      	fenced_code_blocks: true,
      	no_intra_emphasis: true,
      	autolink: true,
      	lax_html_blocks: true,
       }
       Redcarpet::Markdown.new(renderer, options).render(text).html_safe
    end
end
