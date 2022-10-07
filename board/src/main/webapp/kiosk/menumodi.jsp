<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function validateForm(form) {  // 폼 내용 검증
    if (form.fname.value == "") {
        alert("메뉴 이름을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.price.value == "") {
        alert("메뉴 가격을 입력하세요.");
        form.content.focus();
        return false;
    }
}
</script>

</head>
<body>
   <form action="processaddmenu.jsp" method="post" enctype="mulitpart/form-data" onsubmit="return validateForm(this);">
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
<!--                      <img src="/img.png" alt="사진영역" style="width:280px; height: 380px;">
-->
                </div>


                <div>
                    <label for="img_up">사진 업로드</label>
                    <input type="file" id="img_up" name="img">
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
    
    
                        <td>
                      
                         <select name="category" >
                                <option  value="MAIN">MAIN</option>
                                <option value="SIDE">SIDE</option>
                                <option  value="BEVERAGE">BEVERAGE</option>

                            </select>

                        </td>

                    </tr>
                    
                     <tr>
                        <td>메뉴 아이디</td>
                        <td> <input type="text" name="fid"> </td>

                    </tr>

                    <tr>
                        <td>메뉴 이름</td>
                        <td> <input type="text" name="fname"> </td>

                    </tr>

                    <tr>
                        <td>단가</td>
                        <td> <input type="text" name="price"> </td>

                    </tr>
                    
                        <tr>
                        <td>설 명</td>
                        <td> <input type="text" name="explain"> </td>

                    </tr>
                    

                    <tr>
                        <td>기타</td>
                        <td>
                            <label> <input type="checkbox" name="type" value="NEW">신메뉴!</label>

                            <label><input type="checkbox" name="type" value="signature">시그니쳐!</label>

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