package grello

class User {

	String login
	String password
	String firstName
	String lastName
	String email
	
    static constraints = {
		login(unique:true,length:5..15)
		password(matches:/[\w\d]+/, length:6..12)
		email(email:true)
		firstName(blank:false)
		lastName(blank:false)
    }
	String toString(){
		firstName
	}
}
