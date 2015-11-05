import grello.User

class BootStrap {

    def init = { servletContext ->
		new User(
			login: 'log',
			firstName: 'Jane' ,
			lastName: 'Doe' ,
			password: 'log' ,
			email: 'sa@wp.org' 
			).save()
    }
    def destroy = {
    }
}
