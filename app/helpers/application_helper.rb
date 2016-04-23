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
	def in_object(object)
		if ((/#{object.full_path}/).match(request.url))
			link_to(object.header, object.full_path)
		end
	end
	def oUser=(user)
		@oUser = user
	end
	def oSession=(session)
		@oSession = session
	end
	def authenticate()
		if(@oUser.blank? || @oUser.is_published.blank?)
			redirect_to admin_logon_path
		end
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

		self.oUser = @oSession.user
	end
	def sign_in(login,password)
		@user = Users.where("is_published = ? AND login = ? AND password = ?", 1, login, Digest::MD5.hexdigest(password)).first
		logon_by_user(@user)
	end
	def logon_by_user(user)
		if(!user.blank?)
			## привязываем пользователя к сессии ##
			@oSession.user_id = user.id
		
			if(!@oSession.save)
				render :json => @session.errors
			end
		
			@oSession.user = user
			@oUser = @oSession.user
		end
	end
	def sign_out
		@oSession.user_id = 0

		if(!@oSession.save)
			render :json => @session.errors
		end

		@oUser = @oSession.user
	end
end
