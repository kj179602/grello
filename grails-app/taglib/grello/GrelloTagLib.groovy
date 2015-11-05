package grello

class GrelloTagLib {
    //static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	def loginToggle = {
		
		out << "<div>"
		if (session.user){
		out << "<span style='float:left'>"
		out << "Welcome ${session.user.firstName}."
		out << "</span><span style='float:right;margin-right:30px;padding:10px'>"
				
		out << "<a href='${createLink(controller:'user', action:'logout')}'>"
		out << "Logout</a></span>"
		}
		out << "</div><br/>"
		}
}
