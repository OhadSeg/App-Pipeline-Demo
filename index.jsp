<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title> 
</head>
<body>
    <h1>Login Page</h1> 
    <form method="post" action="">
        <label for="email">Email:</label>
        <input type="text" name="email" id="email" required>
        <br><br>
        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required>
        <br><br>
        <input type="submit" value="Login">
    </form>
    <label id="errorLabel" style="color: red;"></label>

    <%-- Handle form submission --%>
    <%@ page import="java.io.*" %>
    <%@ page import="javax.servlet.*" %>
    <%@ page import="javax.servlet.http.*" %>
    <%
        String errorText = "";
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            boolean isEmailValid = email.contains("@");
            boolean isPasswordValid = password.length() >= 4;

            if (!isEmailValid && !isPasswordValid) {
                errorText = "Wrong email and wrong password.";
            } else if (!isEmailValid) {
                errorText = "Wrong email.";
            } else if (!isPasswordValid) {
                errorText = "Wrong password.";
            } else {
                errorText = "Welcome";
            }
        }
    %>

    <script>
        var errorLabel = document.getElementById('errorLabel');
        errorLabel.textContent = '<%= errorText %>'; 
    </script>
</body>
</html>
