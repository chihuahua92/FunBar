document.addEventListener("DOMContentLoaded",function(){
// document.getElementById("productNo").addEventListener("blur",chkNo);
	// 姓名
	document.getElementById("memberName").addEventListener("blur",ckName);
	document.getElementById("memberId").addEventListener("blur",ckId);
	document.getElementById("memberPwd").addEventListener("blur",ckPwd);
	
});
	function ckName(){
		document.getElementById("noName").innerHTML="";
		let theName = document.getElementById("memberName").value;
		let theNameLen = theName.length;
		let flag1 = false ,flag2 = false;
		if(theName == ""){
			document.getElementById("noName").innerHTML="請輸入名子";				
		}else if (theNameLen >=2){
			for(i=0;i<theNameLen;i++){
				let NameChr = theName.charAt(i).toUpperCase();
				let ch = theName.charCodeAt(i);
				if(NameChr >= "A" && NameChr <= "Z"){
					 flag1 = true;	
			}else if(ch >= 0x4e00 && ch <= 0x9fff ){
				flag2 = true;
		}
	}
			if(flag1 || flag2){
				document.getElementById("noName").innerHTML="正確";
			}else{
				document.getElementById("noName").innerHTML="請輸入兩個以上的中文字或英文字母"
			}
			}
		else{
			document.getElementById("noName").innerHTML="請輸入兩個以上的中文字或英文字母"}
		}
	
	function ckId(){
		document.getElementById("noId").innerHTML="";
		let theId = document.getElementById("memberId").value;
		let theIdLen = theId.length;
		let flag1 =false, flag2 =false;
		if(theId == ""){
			document.getElementById("noId").innerHTML="請輸入帳號";		
		}else if(theIdLen>=6){
			for(i=0;i<theIdLen;i++){
				let IdChr = theId.charAt(i).toUpperCase();
				let ch = theId.charCodeAt(i);
				if(IdChr >= "A" && IdChr <= "Z"){
					 flag1 = true;
			}else if (ch >= 0 && ch<=9){
				flag2 = true;
				
			}
		}
		if(flag1 || flag2){
			document.getElementById("noId").innerHTML="正確";
			$.ajax({
				url:"http://localhost:8080/FunBar/abc",
				type:"POST",
				data:{idno:theId},
				success:function(data){
					console.log(data);
					if(data==1){
						$("#noId").html("此帳號已存在")
					}else{
						$("#noId").html("可以使用")
					}
				}
			})
		}else {
			document.getElementById("noId").innerHTML="請輸入兩個以上的數字或英文字母"
		}
		}
		else{
		document.getElementById("noId").innerHTML="請輸入兩個以上的數字或英文字母"
			
	}
		
			
			
		
	}
	function ckPwd(){
		document.getElementById("noPwd").innerHTML="";
		let thePwd = document.getElementById("memberPwd").value;
		let thePwdVal = thePwd.value;
        let thePwdLen = thePwd.length;

        let flage1 = false, flage2 = false, flage3 = false;

        if (thePwd == "")
            // alert("不可空白");
            document.getElementById("noPwd").innerHTML="請輸入密碼(需超過6個字元且含英文字母、數字、符號)";
        else if (thePwdLen >= 6) {
            // alert("有超過6個")
            // document.getElementById("noPwd").innerHTML="<img src='Lab07/Images/error.png'>有超過6個";
            for (i = 0; i < thePwdLen; i++) {
                let thePwdchr = thePwd.charAt(i).toUpperCase();
                if (thePwdchr >= "A" && thePwdchr <= "Z")
                    flage1 = true;
                else if (thePwdchr >= "0" && thePwdchr <= "9")
                    flage2 = true;
                else if (thePwdchr == "!" || thePwdchr == "@" || thePwdchr == "#" || thePwdchr == "$" || thePwdchr == "%" || thePwdchr == "^" || thePwdchr == "&" || thePwdchr == "*")
                    flage3 = true;
                if (flage1 && flage2 && flage3) break;
            }

            if (flage1 && flage2 && flage3)
                // alert("correct");
                document.getElementById("noPwd").innerHTML="正確";
            else
            //  alert("wrong")
            document.getElementById("noPwd").innerHTML="請輸入密碼(需超過6個字元且含英文字母、數字、符號)";
        }
        else
            // alert("要打6個字以上拉")
            document.getElementById("noPwd").innerHTML="請輸入密碼(需超過6個字元且含英文字母、數字、符號)";
    }

	