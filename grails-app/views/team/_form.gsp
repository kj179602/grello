<%@ page import="grello.Team" %>



<div class="fieldcontain ${hasErrors(bean: team, field: 'teamName', 'error')} required">
	<label for="teamName">
		<g:message code="team.teamName.label" default="Team Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="teamName" required="" value="${team?.teamName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: team, field: 'teamMembers', 'error')} ">
	<label for="teamMembers">
		<g:message code="team.teamMembers.label" default="Team Members" />
		
	</label>
	<g:select name="teamMembers" from="${grello.User.list()}" multiple="multiple" optionKey="id" size="5" value="${team?.teamMembers*.id}" class="many-to-many"/>

</div>

