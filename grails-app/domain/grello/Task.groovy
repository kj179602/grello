package grello

class Task {
	
	String taskName
	String description
	
	List list
	User taskUser
		
	static hasMany = [comments: Comments, documents: Document]
	static belongsTo = List
	static constraints = {
		taskName()
		description(maxLength:1000)
		taskUser(nullable: true)
		
    }
	
	String toString(){
	taskName
	
	}
	}
