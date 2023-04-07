function checkValues(htmlForm){
	let url = "modify?";
	
	const id = document.getElementById("id").value;
	const number = document.getElementById("number").value;
	const name = document.getElementById("name").value;
	const hourRate = document.getElementById("hourRate").value;
	
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
	} else if (hourRate === ""){
		alert('주행시간이 입력되지 않았습니다.')
		check = false;
	}
		console.log(check);
	if(check === false){
		location.href = url;
	} else {
		htmlForm.submit();
	}
	
}