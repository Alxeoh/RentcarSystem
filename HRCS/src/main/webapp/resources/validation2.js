function checkValues(htmlForm){
	let url = "regist?";
	
	const id = document.getElementById("id").value;
	const password = document.getElementById("password").value;
	const name = document.getElementById("name").value;
	
	let check = true;
	
	if(id === ""){
		alert('아이디가 입력되지 않았습니다.')
		check = false;
	} else if (password === ""){
		alert('패스워드가 입력되지 않았습니다.')
		check = false;
	} else if (name === ""){
		alert('이름이 입력되지 않았습니다.')
		check = false;
	}
		console.log(check);
	if(check === false){
		location.href = url;
	} else {
		htmlForm.submit();
	}
	
}