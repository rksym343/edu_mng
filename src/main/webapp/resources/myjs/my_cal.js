

function makeMyCalendar(y, m) {

	var curDate = new Date();
	var theDate = new Date(y, m, 1); // 각달의 첫 날의 요일값을 구하기 위해 1일을 구함
	var theDay = theDate.getDay(); //요일정보 / for 1일 이전에 빈칸갯수 구하는데 사용

	var last = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
	//매달 총 일수를 저장.

	//윤년 : 4년주기이고 100년 주기 아닐떄 or 400년주기
	if ((y % 4 == 0 && y % 100 != 0) || y % 400 == 0) {
		last[1] = 29; // 윤년에는 2월 일수 변경
	}

	var lastDate = last[m]; //해당달의 총 일수를 last배열에서 꺼내옴

	var row = Math.ceil((theDay + lastDate) / 7);
	// 달력의 필요한 행 수를 구함 
	// (theDay: 1일 시작전 공백)+(lastDate: 각 달의 일 수)를 일주일로 나눈다음
	// 올림을 해서 필요한 행의 수를 구함.
	
	
	var table = "<table class='table table-bordered my-cal'>";
	table += "<thead><tr>";
	table += "<th>일</th>";
	table += "<th>월</th>";
	table += "<th>화</th>";
	table += "<th>수</th>";
	table += "<th>목</th>";
	table += "<th>금</th>";
	table += "<th>토</th>";
	table += "</tr></thead>";

	
	table += "<tbody>";
	var num = 1;
	for (var i = 1; i <= row; i++) {
		table += "<tr>";
		for (var k = 1; k <= 7; k++) {
			if ((i == 1 && k <= theDay) || (num > lastDate)) {
				// 1일 시작전 칸을 공백처리
				// 마지막날 이후 칸을 공백처리
				table += "<td> </td>";
			} else {
				if( y == curDate.getFullYear() && m == (curDate.getMonth()+1) && num == curDate.getDate()){
					table += "<td class='"+num+" day"+k+"'><b>" + num + "</b></td>";
				}else {
					table += "<td class='"+num+"'>" + num + "</td>";
				}
				num++;
			}

		}

		table += "</tr>";
	}
	table += "</tbody>";

	table += "</table>";
	
	return table;
}

function changeCalTitle(){
	 $(".mYear").html(year);
	 $(".mMonth").html(month);
}

 

