package grello

class Board {

	String boardName;
	static hasMany = [lists : List]
    static constraints = {
		boardName();
		
    }
}
;