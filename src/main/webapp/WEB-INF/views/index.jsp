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
		<title>Стартовая страница</title>
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
                <h1 class="text-center">Список всех материалов на складе</h1>
            </div>
            <div class="row center">
                <form:form action="/" method="get">
                    <c:forEach items="${filters}" var="filtersItem">
                        <div class="radio-inline">
                            <label>
                                <input type="radio" name="filter" value="${filtersItem.key}" ${filtersItem.key == checkedFilter ? 'checked' : ''} />
                                ${filtersItem.value}
                            </label>
                        </div>
                    </c:forEach>
                    <button type="submit" class="btn btn-primary">Выбрать</button>
                </form:form>
            </div>
            <div class="row">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th class="text-center">Название</th>
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
            <div>
                <div class="alert alert-info">
                  <strong>Информация!</strong> Вы можете собрать <strong>${countedComputers}</strong> компьютер(ов).
                </div>
            </div>
            <div class="row">
                <nav class="text-center" aria-label="Page navigation">
                    <ul class="pagination pagination-lg">
                        <c:url value="/" var="prev">
                            <c:param name="page" value="${page-1}"/>
                        </c:url>
                        <c:if test="${page > 1}">
                            <li>
                                <a href="<c:out value="${prev}" />" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                            <c:choose>
                                <c:when test="${page == i.index}">
                                    <li class="active"><a href="#">${i.index}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <c:url value="/" var="url">
                                        <c:param name="page" value="${i.index}"/>
                                    </c:url>
                                    <li><a href='<c:out value="${url}" />'>${i.index}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:url value="/" var="next">
                            <c:param name="page" value="${page + 1}"/>
                        </c:url>
                        <c:if test="${page + 1 <= maxPages}">
                            <li>
                                <a href='<c:out value="${next}" />' aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src='<spring:url value="/resources/js/bootstrap.min.js" />'></script>
	</body>
</html>