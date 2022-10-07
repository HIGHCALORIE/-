<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="" method="post">
        <div class="container">

            <nav class="list">
                <ul>
                    <li><input type="button" value="메뉴 추가"></li>
                    <li><input type="button" value="메뉴 수정"></li>
                    <li><input type="submit" value="메뉴 삭제"></li>
                    <li><a href="뒤로가기.html"><input type="button" value="돌아가기"> </a></li>
                </ul>
            </nav>

            <div class="select">
                <select name="" id="">
                    <option value=" 카테고리" selected>---카테고리 선택---</option>
                    <option value=" main">MAIN</option>
                    <option value="side">SIDE</option>
                    <option value="beverage">BEVERAGE</option>
                </select>

                <input type="text">
                <input type="submit" value="검 색"></li>

            </div>



            <div class="insert_text">

                <table>
                    <tr>
                        <th>번 호</th>
                        <th>카 테 고 리</th>
                        <th>음 식 명</th>
                        <th>단 가</th>
                        <th>설 명</th>
                        <th>이 미 지</th>

                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>

                    </tr>


                </table>

            </div>
        </div>
    </form>
</body>
</html>