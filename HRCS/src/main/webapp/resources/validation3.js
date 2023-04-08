function checkValues(htmlForm){
	let url = "admin_addCar?";
	
	const id = document.getElementById("id").value;
	const number = document.getElementById("number").value;
	const name = document.getElementById("name").value;
	const location = document.getElementById("location").value;
	
	let check = true;
	
	if(id === ""){
		alert('등록번호가 입력되지 않았습니다.')
		check = false;
	} else if (number === ""){
		alert('차량번호가 입력되지 않았습니다.')
		check = false;
	} else if (name === ""){
		alert('차종이 입력되지 않았습니다.')
		check = false;
	} else if (location === ""){
		alert('배차지역이 입력되지 않았습니다.')
		check = false;
	}
		console.log(check);
	if(check === false){
		location.href = url;
	} else {
		htmlForm.submit();
	}
	
}