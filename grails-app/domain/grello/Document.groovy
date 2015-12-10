package grello

class Document {

	String documentName
	Task task
	String[] document
	
	static belongsTo = Task
    static constraints = {
		documentName()
		task()
		document(nullable: true, maxSize:1000000)
		
		
    }
	
	String toString(){
		"$documentName" 
	}
}
