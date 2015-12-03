package grello

class Task {
	
	String taskName
	String description
	byte[] document
	List list
	User taskUser
	
	
	static hasMany = [comments: Comments]
	static belongsTo = List
	static constraints = {
		taskName()
		description(maxLength:1000)
		taskUser(nullable: true)
		document(nullable:true, maxSize:1000000)
    }
	
	String toString(){
	taskName
	
	}
	}
