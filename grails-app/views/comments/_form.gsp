<%@ page import="grello.Comments" %>



<div class="fieldcontain ${hasErrors(bean: comments, field: 'commentCreater', 'error')} required">
	<label for="commentCreater">
		<g:message code="comments.commentCreater.label" default="Comment Creater" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="commentCreater" name="commentCreater.id" from="${grello.User.list()}" optionKey="id" required="" value="${comments?.commentCreater?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: comments, field: 'commentContent', 'error')} required">
	<label for="commentContent">
		<g:message code="comments.commentContent.label" default="Comment Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="commentContent" required="" value="${comments?.commentContent}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: comments, field: 'task', 'error')} required">
	<label for="task">
		<g:message code="comments.task.label" default="Task" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="task" name="task.id" from="${grello.Task.list()}" optionKey="id" required="" value="${comments?.task?.id}" class="many-to-one"/>

</div>

