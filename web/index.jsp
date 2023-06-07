<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-22
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="QiYeJianMo.*" %>
<%@ page import="translation.*" %>

<html>
<head>
    <title>城市天气预报</title>
    <style>
        .container {
            width: 800px;
            height: 450px;
            margin: 50px auto;
        }

        .container1 {
            width: 500px;
            height: 30px;
            margin: 50px auto;
        }

        .parent {
            width: 100%;
            height: 30px;
            top: 4px;
            position: relative;
        }

        .parent>input:first-of-type {
            /*输入框高度设置为40px, border占据2px，总高度为42px*/
            width: 380px;
            height: 30px;
            border: 1px solid #ccc;
            font-size: 16px;
            outline: none;
        }

        .parent>input:first-of-type:focus {
            border: 1px solid #317ef3;
            padding-left: 10px;
        }

        .parent>input:last-of-type {
            /*button按钮border并不占据外围大小，设置高度42px*/
            width: 100px;
            height: 30px;
            position: absolute;
            background: #317ef3;
            border: 1px solid #317ef3;
            color: #fff;
            font-size: 16px;
            outline: none;
        }
    </style>
</head>
<body>
<%
    String CityName;
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("text_weather") != null) {
        CityName = request.getParameter("text_weather");
    }
    else {
        CityName = "汕头";
    }
    System.out.println(CityName);
    WeatherWebServiceLocator locator_weather = new WeatherWebServiceLocator();
    WeatherWebServiceSoap_PortType service_weather = locator_weather.getWeatherWebServiceSoap();
    String[] reply_weather = service_weather.getWeatherbyCityName(CityName);
    String day1_icon1 = "image/b_"+reply_weather[8];
    String day1_icon2 = "image/b_"+reply_weather[9];
    String day2_icon1 = "image/b_"+reply_weather[15];
    String day2_icon2 = "image/b_"+reply_weather[16];
    String day3_icon1 = "image/b_"+reply_weather[20];
    String day3_icon2 = "image/b_"+reply_weather[21];
    String[] reply_translation = new String[5];
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("text_word") != null) {
        String Word = request.getParameter("text_word");
        System.out.println(Word);
        EnglishChineseLocator locator_translation = new EnglishChineseLocator();
        EnglishChineseSoap_PortType service_translation = locator_translation.getEnglishChineseSoap();
        reply_translation = service_translation.translatorString(Word);
    }
%>
<div class="container1">
    <form action="./" class="parent" method="post">
        <input type="text" name="text_weather" placeholder="输入要搜索的城市">
        <input type="submit" value="搜索">
    </form>
</div>

<div class="container">
    <h1>
        <%=reply_weather[0]%>-<%=reply_weather[1]%>
    </h1>
    <p>
        <%=reply_weather[10]%>
    </p>
    <p>
        <%=reply_weather[11].replace("\n", "<br>")%>
    </p>
    <table border="0" cellpadding="5" cellspacing="1" bgcolor="#808080">
        <tbody>
        <tr align="center" bgcolor="#c0c0c0">
            <td>城市</td>
            <td>日期 天气</td>
            <td>风向风力</td>
            <td>天气图标</td>
            <td>气温</td>
        </tr>
        <tr align="center" bgcolor="#c0c0c0">
            <td><%=reply_weather[1]%></td>
            <td><%=reply_weather[6]%></td>
            <td><%=reply_weather[7]%></td>
            <td>
                <img src="<%=day1_icon1%>">
                <img src="<%=day1_icon2%>">
            </td>
            <td><%=reply_weather[5]%></td>
        </tr>
        <tr align="center" bgcolor="#c0c0c0">
            <td><%=reply_weather[1]%></td>
            <td><%=reply_weather[13]%></td>
            <td><%=reply_weather[14]%></td>
            <td>
                <img src="<%=day2_icon1%>">
                <img src="<%=day2_icon2%>">
            </td>
            <td><%=reply_weather[12]%></td>
        </tr>
        <tr align="center" bgcolor="#c0c0c0">
            <td><%=reply_weather[1]%></td>
            <td><%=reply_weather[18]%></td>
            <td><%=reply_weather[19]%></td>
            <td>
                <img src="<%=day3_icon1%>">
                <img src="<%=day3_icon2%>">
            </td>
            <td><%=reply_weather[17]%></td>
        </tr>
        </tbody>
    </table>
</div>
<div class="container1">
    <form action="./" class="parent" method="post">
        <input type="text" name="text_word" placeholder="输入要翻译的单词">
        <input type="submit" value="翻译">
    </form>
    <p>
        <%=reply_translation[0]%>-><%=reply_translation[3]%>
    </p>
</div>
</body>
</html>
