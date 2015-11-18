package grello

class Task {
	
	String taskName
	String description
	
	static belongsTo = List
    static constraints = {
		taskName()
		description(maxLength:1000)
    }
}
