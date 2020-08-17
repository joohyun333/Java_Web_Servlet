<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>001 계산기</title>
        <!-- <style>
            input[type=text]{ /* input 태그 중 type="text"인 것만 선택*/
                 
                width: 145px;
                padding: 5px;
                 
                background-color: #e7e7e7;
                border: 1px solid silver;
            }
             
            input[type=button]{
                width: 300px;
                padding: 5px;
                 
                background-color: black;
                color: white;
                border: 1px solid silver;
            }
            input[type=reset]{
                width: 400px;
                padding: 5px;
                 
                background-color: green;
                color: white;
                border: 1px solid silver;
            }
        </style> -->
        <script>
            function calcNow(){
                calc.result_multiply.value = calc_multiply(calc.left.value, calc.right.value);
            }
            function calc_multiply(left, right){
                // 곱하기
                return left * right;
            }
        </script>
    </head>
    <body>
        <form name="calc">
            <td><input type="text" name="left" /></td>
            <td><input type="text" name="right" /></td>
            <td><input type="button" value="=" onClick="calcNow()"/></td>
            <td><input type="text" name="result_multiply" /></td>
        </form>
    </body>
</html>