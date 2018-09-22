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
		<title>Поиск материала</title>
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
                <form action="/search/" method="get" class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Введите название" name="text">
                    </div>
                    <button type="submit" class="btn btn-primary">Поиск</button>
                </form>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
        <div class="container">
            <c:choose>
                <c:when test="${empty parts}">
                    <div class="starter-template">
                        <h1 class="text-center">Данные не найдены.</h1>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="starter-template">
                        <h1 class="text-center">Таблица найденных данных</h1>
                    </div>
                </c:otherwise>
            </c:choose>
            <c:if test="${!empty parts}">
                <div class="row">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="text-center">Название детали</th>
                                <th class="text-center">Потребность</th>
                                <th class="text-center">Количество на складе</th>
                                <th class="text-center">Изменить</th>
                                <th class="text-center">Удалить</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${parts}" var="part">
                            <tr>
                                <td class="text-center">${part.name}</td>
                                <td class="text-center">${part.necessity ? "Да" : "Нет"}</td>
                                <td class="text-center">${part.quantity}</td>
                                <td class="text-center">
                                    <a href="/edit/?part=${part.id}" class="btn btn-info btn-sm">Изменить</a>
                                </td>
                                <td class="text-center">
                                    <a href="/delete/?part=${part.id}" class="btn btn-danger btn-sm">Удалить</a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src='<spring:url value="/resources/js/bootstrap.min.js" />'></script>
	</body>
</html>