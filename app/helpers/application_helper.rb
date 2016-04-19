module ApplicationHelper
	def full_title(page_title)
		standart_title = '"Секреты Стройки" - cтроительные услуги.'
		if page_title.empty?
			standart_title
		else
			"#{page_title}"
		end
	end
	def link_to_object(object, text)
		if(object.full_path)
			url = object.full_path
		end
		content_tag(:a) do
			link_to text, url
		end
	end
end
