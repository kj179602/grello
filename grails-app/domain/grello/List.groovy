package grello

class List {

	String listName;
	Board board;
		
	static belongsTo = Board;
	static hasMany = [tasks: Task]
	
    static constraints = {
		listName()
    }
	
	String toString(){
		return "$listName"
	}
}
