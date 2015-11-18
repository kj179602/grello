<%@ page import="grello.OperationHistory" %>



<div class="fieldcontain ${hasErrors(bean: operationHistoryInstance, field: 'operationName', 'error')} required">
	<label for="operationName">
		<g:message code="operationHistory.operationName.label" default="Operation Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="operationName" required="" value="${operationHistoryInstance?.operationName}"/>

</div>

