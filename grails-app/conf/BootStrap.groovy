import grello.Board
import grello.User
import grello.List
import grello.Task
class BootStrap {

    def init = { servletContext ->
		new User(
			login: 'log',
			firstName: 'Jane' ,
			lastName: 'Doe' ,
			password: 'log' ,
			email: 'sa@wp.org' 
			).save()
		
		new User(
				login: 'sarah',
				firstName: 'Sarah' ,
				lastName: 'Smith' ,
				password: '12345' ,
				email: 'sb@wp.org'
				).save()
		new User(
					login: 'bill',
					firstName: 'Bill' ,
					lastName: 'Martin' ,
					password: '54321' ,
					email: 'sc@wp.org'
					).save()
					
		new Board(
			boardName: 'tablica', boardAuthor: User.findByFirstName('Jane')).save()
		new Board(
			boardName: 'moja tablica', boardAuthor: User.findByFirstName('Jane')).save()
			
		new List(
			listName: 'lista1',
			board: Board.findByBoardName('tablica')).save()
		new List(
			listName: 'lista2',
			board: Board.findByBoardName('tablica')).save()
		new List(
			listName: 'lista3',
			board: Board.findByBoardName('tablica')).save()
		new List(
			listName: 'lista',
			board: Board.findByBoardName('moja tablica')).save()
	
		new Task(
			taskName: 'zadanie1',
			list: List.findByListName('lista1')).save()
			
    }
	
    def destroy = {
    }
}
