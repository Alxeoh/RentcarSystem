function checkValues(htmlForm) {

	const startDate = document.getElementById("startDate").value;
	const endDate = document.getElementById("endDate").value;
	const startTime = document.getElementById("startTime").value;
	const endTime = document.getElementById("endTime").value;
	const vehicle_id = document.getElementById("vehicle_id").value;
	
	let url = "carDetailL?vehicle_id=" + vehicle_id;
	let check = true;

	if (startDate === "") {
		alert('예약일이 입력되지 않았습니다.')
		check = false;
	} else if (endDate === "") {
		alert('반납일이 입력되지 않았습니다.')
		check = false;
	} else if (startTime === "") {
		alert('예약시간이 입력되지 않았습니다.')
		check = false;
	} else if (endTime === "") {
		alert('반납시간이 입력되지 않았습니다.')
		check = false;
	}
	console.log(check);
	if (check === false) {
		location.href = url;
	} else {
		htmlForm.submit();
	}

}