package grello

class List {

	String listName;
	Board board;
	Task task;
	
	static belongsTo = Board;
	static hasMany = [task: Task]
	String toString(){
		return "$listName"
	}
    static constraints = {
		listName()
    }
}
