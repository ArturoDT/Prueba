<%@page session="true"%>
<%
    HttpSession sesionAbierta = request.getSession();
    sesionAbierta.invalidate();
%>
<script>
    location.href="../Login.jsp";
</script>