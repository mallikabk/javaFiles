<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<form action="register">
<h1 style="text-align: center;color:blue"><u>Registration Form</u></h1>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Id:</label>
  <input type="text" class="form-control" id="exampleFormControlInput1" name="id" placeholder="Enter your id">
</div>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Name:</label>
  <input type="text" class="form-control" id="exampleFormControlInput1" name="name"  placeholder="Enter your name">
</div>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Address:</label>
  <input type="text" class="form-control" id="exampleFormControlInput1" name="add" placeholder="Enter ypur address"><br>

<button type="submit" class="btn btn-primary btn-lg">Register</button><br><br>
<a href="display">ViewAllCustomers</a>
</div>
</form>
</body>
</html>