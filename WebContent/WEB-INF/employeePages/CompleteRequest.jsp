<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="employeeHeader.jsp" %>

	<div class="content-wrapper">
		<div class="col-md-12" id="page-content">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">Filters</h3>
				</div>
				<div class="panel-body">
					<div class="col-lg-7">
						<form class="form-horizontal" action="completedrequestsearch" method='POST' onSubmit="return checkInputOr()">
							<label for="requestID" class="col-lg-2 control-label">Request ID : </label>
							<div class="col-lg-10">
		       					<input type="text" class="form-control" name="requestID" placeholder="Request ID">
		      				</div>
		      				<br><br>
		      				<label class="col-lg-2 control-label">OR</label>
		      				<br><br>
		      				<label for="userID" class="col-lg-2 control-label">User ID : </label>
							<div class="col-lg-10">
		       					<input type="text" class="form-control" name="userID" placeholder="User ID">
		      				</div>
		      				<br><br>
		      				<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
						    <button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
			<c:if test="${ role != 'ROLE_REGULAR'}">
				<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">Internal Requests</h3>
				</div>
				<div class="panel-body no-padding">
					<table id="content-table">
						<thead>
							<tr>
								<th class="active">Request ID</th>
								<th class="active">Employee ID</th>
								<th class="active">Type</th>
								<th class="active">Current Value</th>
								<th class="active">Requested Value</th>
								<th class="active">Status</th>
								<th class="active">Approver</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
                        		<c:when test="${empty internal_list}">
                        			<tr>
                                    	<td colspan="2">No Completed Request</td>
                                	</tr>
                        		</c:when>
                        		<c:otherwise>
                        			<c:forEach items="${internal_list}" var="request">
										<tr>
											<td style="text-align:center">${request.id}</td>
											<td style="text-align:center">${request.requesterid}</td>
											<td style="text-align:center">${request.request_type}</td>
											<td style="text-align:center">${request.current_value}</td>
											<td style="text-align:center">${request.requested_value}</td>
											<td style="text-align:center">${request.status}</td>
											<td style="text-align:center">${request.approver}</td>
										</tr>
									</c:forEach>
                        		</c:otherwise>
                        	</c:choose>	
						</tbody>
					</table>
				</div>
			</div>
			</c:if>
			
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">External Requests</h3>
				</div>
				<div class="panel-body no-padding">
					<table id="content-table">
						<thead>
							<tr>
								<th class="active">Request ID</th>
								<th class="active">Employee ID</th>
								<th class="active">Type</th>
								<th class="active">Current Value</th>
								<th class="active">Requested Value</th>
								<th class="active">Status</th>
								<th class="active">Approver</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
                        		<c:when test="${empty external_list}">
                        			<tr>
                                    	<td colspan="2">No Completed Request</td>
                                	</tr>
                        		</c:when>
                        		<c:otherwise>
                        			<c:forEach items="${external_list}" var="request">
								<tr>
									<td style="text-align:center">${request.id}</td>
									<td style="text-align:center">${request.requesterid}</td>
									<td style="text-align:center">${request.request_type}</td>
									<td style="text-align:center">${request.current_value}</td>
									<td style="text-align:center">${request.requested_value}</td>
									<td style="text-align:center">${request.status}</td>
									<td style="text-align:center">${request.approver}</td>
							</tr>
							</c:forEach>
                        		</c:otherwise>
                        	</c:choose>	
						</tbody>
					</table>
				</div>
			</div>
			
		</div>
	</div> <!-- .content-wrapper -->
	
</main> 

<script type="text/javascript">
	$(document).ready(function() {
		sideNavigationSettings();
	});
	</script>

</body>
</html>