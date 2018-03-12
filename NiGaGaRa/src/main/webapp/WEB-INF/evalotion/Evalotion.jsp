<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>평가하기!</title>
</head>
<body>

	<div class="col-md-1 col-sm-1 col-xs-1"></div>
	<div class="col-md-10 col-sm-10 col-xs-10">

		<div class="col-md-12 col-sm-12 col-xs-12"
			style="color: black; padding-top: 25px;">
			<h3>평가하기(수취인)</h3>
		</div>
		<form role="form" class="form-horizontal"
			method="post">
			<div class="col-md-12 col-sm-12 col-xs-12 steps pn no-mg-no-pd"
				style="background-color: #d5e1ed; height: auto;">
				<div class="ccol-md-3 col-sm-3 col-xs-3 no-mg-no-pd">
					<input id='op1' name="group" type='checkbox' value="매우만족" checked />
					<label for='op1'>매우만족</label>
				</div>
				<div class="col-md-2 col-sm-2 col-xs-2 no-mg-no-pd">
					<input id='op2' name="group" type='checkbox' value="만족" />
					<label for='op2'>만족</label>
				</div>
				<div class="col-md-2 col-sm-2 col-xs-2 no-mg-no-pd">
					<input id='op3' name="group" type='checkbox' value="보통" />
					<label for='op3'>보통</label>
				</div>
				<div class="col-md-2 col-sm-2 col-xs-2 no-mg-no-pd">
					<input id='op4' name="group" type='checkbox' value="불만족" />
					<label for='op4'>불만족</label>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-3 no-mg-no-pd">
					<input id='op5' name="group" type='checkbox' value="매우불만족" />
					<label for='op5'>매우불만족</label>
				</div>
				<div class="col-md-1 col-sm-1 col-xs-1 no-mg-no-pd"></div>
				<div class="col-md-11 col-sm-11 col-xs-11 no-mg-no-pd"
					style="height: 20px; margin-top: 10px; margin-bottom: 10px; color: #2f78bd;">
					내용작성</div>

				<div class="col-md-1 col-sm-1 col-xs-1 no-mg-no-pd"
					style="height: 120px;"></div>
				<div class="col-md-10 col-sm-10 col-xs-10 no-mg-no-pd"
					style="height: 120px;">
					<textarea
						style="width: 100%; border: 1; overflow: visible; text-overflow: ellipsis; border: #8b929e"
						rows=6 name="gradeContent"></textarea>
				</div>
				<div class="col-md-1 col-sm-1 col-xs-1 no-mg-no-pd"
					style="height: 120px;"></div>
				<div class="col-md-6 col-sm-6 col-xs-6 no-mg-no-pd">
					<input type='submit' value='취소' id='submit'
						onclick="window.close()" />
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6 no-mg-no-pd">
					<input type='submit' value='평가하기' id='submit'
						onclick="javascript:insertPath()" />
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>
