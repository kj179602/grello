package grello

class Board {

	String boardName;
	User boardAuthor;
	
	static hasMany = [lists : List]
	static constraints = {
		boardName()
		boardAuthor()
   }
	
	String toString(){
		return "$boardName"
	}
}
