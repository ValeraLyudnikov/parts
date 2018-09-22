<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html land="ru">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Изменение информации о материале</title>
		<link href='<spring:url value="/resources/css/style.css"/>' rel="stylesheet" />

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
	</head>
	<body>
        <nav class="navbar navbar-default navbar-static-top blue">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/">Computer Parts</a>
                    </div>
                    <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                    <li><a href="/add/">Добавить</a></li>
                </ul>
                <form:form action="/search/" method="get" class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" path="text" class="form-control" placeholder="Введите название" name="text"/>
                    </div>
                    <button type="submit" class="btn btn-primary">Поиск</button>
                </form:form>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
        <div class="container">
            <div class="starter-template">
                <h1 class="text-center">Изменение информации о материале</h1>
            </div>
            <div class="row">
                <form:form action="/edit/" method="post" modelAttribute="part">
                    <spring:bind path="id">
                        <form:hidden path="id" />
                    </spring:bind>
                    <spring:bind path="name">
                        <div class="form-group">
                            <label for="name">Название запчасти:</label>
                            <form:input path="name" type="text" class="form-control" id="name" value="${part.name}" required="required" />
                            <form:errors path="name" class="text-danger" />
                        </div>
                    </spring:bind>
                    <spring:bind path="necessity">
                        <div class="form-group">
                            <label for="necessity">Требуется при сборке компьютера?</label>
                            <form:select path="necessity" id="necessity" class="form-control" >
                                <c:choose>
                                <c:when test="${part.necessity}">
                                    <form:option value="1" selected="true">Да</form:option>
                                    <form:option value="0" >Нет</form:option>
                                </c:when>
                                <c:otherwise>
                                    <form:option value="0" selected="true">Нет</form:option>
                                    <form:option value="1" >Да</form:option>
                                </c:otherwise>
                                </c:choose>
                            </form:select>
                        </div>
                    </spring:bind>
                    <spring:bind path="quantity">
                        <div class="form-group">
                            <label for="name">Количество</label>
                            <form:input path="quantity" type="text" class="form-control" id="name" value="${part.quantity}" required="required" />
                            <form:errors path="quantity" class="text-danger"/>
                        </div>
                    </spring:bind>
                    <button type="submit" class="btn btn-default">Изменить</button>
                </form:form>
            </div>
        </div>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src='<spring:url value="/resources/js/bootstrap.min.js" />'></script>
	</body>
</html>