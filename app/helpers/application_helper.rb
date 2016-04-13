module ApplicationHelper
	def full_title(page_title)
		standart_title = '"Секреты Стройки" - cтроительные услуги.'
	if page_title.empty?
		standart_title
	else
		"#{page_title}"
	end
end
