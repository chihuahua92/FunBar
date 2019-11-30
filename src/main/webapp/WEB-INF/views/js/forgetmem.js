document.addEventListener("DOMContentLoaded",function(){
// document.getElementById("productNo").addEventListener("blur",chkNo);
	// 姓名

	document.getElementById("memberPwd").addEventListener("blur",ckPwd);
	
});
	
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

	