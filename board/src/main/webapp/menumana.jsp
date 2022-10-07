<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 관리</title>
</head>

<body>
    <form action="" method="post" enctype="mulitpart/form-data">
        <div class="container">

            <nav class="list">
                <ul>
                    <li><input type="" value="" hidden></li>
                    <li><input type="" value="" hidden></li>
                    <li><input type="submit" value="저장"></li>
                    <li><a href="뒤로가기.html"><input type="button" value="돌아가기"> </a></li>
                </ul>
            </nav>




            <div class="insert_img">


                <div class="img">
                    <img src="/img.png" alt="사진영역" style="width:280px; height: 380px;">

                </div>


                <div>
                    <label for="img_up">사진 업로드</label>
                    <input type="file" id="img_up">
                </div>
            </div>
            

            <div class="insert_text">

                <table>
                    <tr>
                        <th>구분</th>
                        <th>입력</th>

                    </tr>

                    <tr>
                        <td>카테고리</td>
                        <td> <select name="" id="">
                                <option value=" main" selected>MAIN</option>
                                <option value="side">SIDE</option>
                                <option value="beverage">BEVERAGE</option>

                            </select>

                        </td>

                    </tr>

                    <tr>
                        <td>메뉴</td>
                        <td> <input type="text"> </td>

                    </tr>

                    <tr>
                        <td>단가</td>
                        <td> <input type="text"> </td>

                    </tr>

                    <tr>
                        <td>기타</td>
                        <td>
                            <label> <input type="checkbox" value="NEW">신메뉴!</label>

                            <label><input type="checkbox" value="signature">시그니쳐!</label>

                        </td>

                    </tr>

                    <tr>
                        <td>활성화</td>
                        <td>
                            <input type="radio" name="onoff" id="on">
                            <label for="on"> 활성화</label>
                            <input type="radio" name="onoff" id="off">
                            <label for="off"> 비활성화</label>


                        </td>

                    </tr>

                </table>

            </div>
        </div>
    </form>
</body>
</html>