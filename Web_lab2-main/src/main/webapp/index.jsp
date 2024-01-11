<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="models.Point"%>

<%
    ServletContext servletContext = (ServletContext) request.getServletContext();
    List<Point> results = (List<Point>) servletContext.getAttribute("resultsCollection");
    if (results == null) {
        results = new ArrayList<Point>();
    }
%>
<!DOCTYPE HTML>
<html lang="ru-RU">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="author" content="Шабанов Тимофей Олегович">
    <meta name="description" content="Веб-программирование: Лабораторная работа №2">

    <!-- Библиотека компиляции less -->
    <link rel="stylesheet/less" type="text/css" href="styles/styles.less" />
    <script src="https://cdn.jsdelivr.net/npm/less" ></script>

    <!-- Библиотека SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <!-- Библиотека jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>




    <title>Лабораторная работа №2 | Веб-программирование</title>
</head>
<body>

<header>
    <h1>Шабанов Тимофей. P3216 Вариант 2325.</h1>
</header>
    <div id="main-container">
        <div id="form-container">
            <form novalidate onsubmit="parseForm()">

                <div class="input-container" id="X-input-container">
                    <label class="form-label">Введите X:</label>
                    <select name="X-input" id="X-input">
                        <option value="-4">-4</option>
                        <option value="-3">-3</option>
                        <option value="-2">-2</option>
                        <option value="-1">-1</option>
                        <option value="0">0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                    </select>
                </div>

                <div class="input-container" id="Y-input-container">
                    <label for="Y-input" class="form-label">Введите Y:</label>
                    <input id="Y-input" name="Y-input" type="text" value="0" maxlength="5">
                </div>

                <div class="input-container" id="R-input-container">
                    <label for="R-input" class="form-label">Введите R:</label>
                    <input id="R-input" name="R-input" type="text" value="1" maxlength="5">
                </div>
                <div class="input-container" id="buttons-container">
                    <input id='check' class="main-button" name='check' type='submit' value='Проверить'>
                </div>
            </form>
        </div>
            <div id="graph-container">
                <canvas id="graph" width="300" height="300"></canvas>
            </div>
        <div>
            <table id="results">
                <tr>
                    <th>X</th>
                    <th>Y</th>
                    <th>R</th>
                    <th>Результат</th>
                    <th class="hide-me">Текущее время</th>
                    <th class="hide-me">Время работы программы (мкс)</th>
                </tr>
                <% for(Point point: results){ %>
                    <tr>
                        <td><%=point.getX() %></td>
                        <td><%=point.getY() %></td>
                        <td><%=point.getR() %></td>
                        <td class="<%= point.getHTMLClass() %>"><%=point.getStringStatus() %></td>
                        <td class="hide-me"><%=point.getTime()%></td>
                        <td class="hide-me"><%=point.getScriptTime() %></td>
                    </tr>
                <%}%>
            </table>
        </div>
    </div>
<script src="scripts/CanvasPrinter.js"></script>
<script src="scripts/Validator.js"></script>
<script src="scripts/onetime.js"></script>
<script src="scripts/updater.js"></script>
</body>
</html>