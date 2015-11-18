package grello

class Task {
	
	String taskName
	String description
	List list
	
	static belongsTo = List
	static constraints = {
		taskName()
		description(maxLength:1000)
    }
	
	String toString(){
		return "$taskName"
	}
	}
