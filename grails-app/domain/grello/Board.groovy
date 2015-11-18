package grello

class Board {

	String boardName;
	static hasMany = [lists : List]
	
	String toString(){
		return "$boardName"
	}
    static constraints = {
		boardName();
		
    }
}
;