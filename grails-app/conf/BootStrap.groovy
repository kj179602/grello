import grello.User

class BootStrap {

    def init = { servletContext ->
		new User(
			login: 'Kasia',
			firstName: 'Katarzyna' ,
			lastName: 'Jordan' ,
			password: 'qwert' ,
			email: 'sa@wp.org' 
			).save()
    }
    def destroy = {
    }
}
