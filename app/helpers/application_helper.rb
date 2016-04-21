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
				@url = "/"+@url+"/"
			end
			link_to(name, @url, options)
		else
			link_to(name)
		end
	end
	def oUser=(user)
		@oUser = user
	end
	def oSession=(session)
		@oSession = session
	end
	def session_start()
		@now = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
		if(cookies[:sid])
			@session = Sessions.find_by_sid(cookies[:sid])
		end
		if(@session)
			## TODO - добавить время жизни сессии
		else
			@session = Sessions.new
		end

		@session.dt_access = @now

		if(!@session.save)
			render :json => @session.errors
		end

		cookies.permanent[:sid] = @session.sid

		self.oSession = @session

		if(@oSession.user)
			self.oUser = @oSession.user
		else
			self.oUser = Users.new
		end
	end
end
