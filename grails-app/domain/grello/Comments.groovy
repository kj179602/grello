package grello

class Comments {
	
	Task task
	User commentCreater
	String commentContent
	
	static belongsTo = Task
	static constraints = {
		
		commentCreater(nullable:false)
		commentContent(nullable:false, maxLength:1000)
		
	}
	
	String toString(){
		return "$commentCreater.firstName" 
		 
	}
	}
