package grello

class UserController {

	def index(){
		redirect(controller: 'user', action: 'login')
	}
    def login() { 
		if(session.user){
			redirect(controller: 'board', action: 'index')
		}
		
	}
	def handleLogin = {
		def user = User.findByLogin(params.login)
		if(user){
			if(user.password == params.password){
				session.user = user
				redirect(controller: 'board', action: 'index')
			}
			else{
				flash.message = "Incorrect password for ${params.login}"
				redirect(action: login)
			}
		}
		else{
			flash.message = "User not found for login ${params.login}"
			redirect(action: login)
		}
	}
	
	def register = {}
	
	 def handleRegistration = {
		 def user = new User( params )
		 if(params.password != params.confirm) {
			 	flash.message = "The two passwords you entered don't match!"
				redirect(action:register)
		 			}
		 else {
			 if( user.save() ) {
				 redirect(controller:'user', action:'login')
			 	}
			 else {
				 	flash.user = user
					redirect(action:register)
			 		}
		 		}
	 	}
	 
	 def logout(){
		 session.user = null
		 redirect (controller: 'user', action: 'login')
	 }
}
