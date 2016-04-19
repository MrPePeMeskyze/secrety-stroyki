module ApplicationHelper
	def full_title(page_title)
		standart_title = '"Секреты Стройки" - cтроительные услуги.'
		if page_title.empty?
			standart_title
		else
			"#{page_title}"
		end
	end
	def link_to_object(name, object, options = {})
		if(object.full_path?)
			@url = object.full_path
			## Добавляем закрывающий слэш к ссылку, если ссыдка не содержит параметров и не ссылка на сайт
			if(!(/\?/).match(@url) && !(/(\.\w+|\/)$/).match(@url))
				@url = @url + "/"
			end
			link_to(name, @url, options)
		else
			link_to(name)
		end
	end
end
