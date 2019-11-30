document.addEventListener("DOMContentLoaded",function(){
//	document.getElementById("productNo").addEventListener("blur",chkNo);
 	document.getElementById("productName").addEventListener("blur",chkName);
	document.getElementById("productDetail").addEventListener("blur",chkDetail);
	document.getElementById("unitPrice").addEventListener("blur",chkPrice);
	document.getElementById("discount").addEventListener("blur",chkDisc);
	document.getElementById("stock").addEventListener("blur",chkStock);
});
	function chkNo(){
		document.getElementById("msgPrice").innerHTML="";
		let theNo = document.getElementById("productNo").value;
		let theNoLen = theNo.length;
		let flag1= false, flag2= false ;
		if (theNo == ""){
		document.getElementById("msgNo").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>請輸入商品編號" ;			
		}else if(theNoLen >= 1) {
			for(let i=0 ; i<theNoLen; i++){
			let NoChr = theNo.charAt(i).toUpperCase();				
		         if(NoChr >= "A" && NoChr <= "Z"){
		            	flag1 = true;
		       }else if(NoChr >= "0" && NoChr <= "9"){
		            	 flag2 = true;
		    }	           
	    } //for迴圈結尾
// 	    if(flag1 &&flag2) return;  //用break會被告知 ‘Illegal break statement’，用return又不會跳出“正確”訊息
	 
		if(flag1 && flag2){
			document.getElementById("msgNo").innerHTML="<img width='25px' height='25px' src='images/sign-ok.png'>正確" ;
		}else{
			 document.getElementById("msgNo").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>請輸入包含數字+英文字母的商品編號";
		}
	}//else if結尾
}// function chkNo結尾
	
	function chkName(){
		document.getElementById("msgPrice").innerHTML="";
		let theName = document.getElementById("productName").value;
		let theNameLen = theName.length;
		let flag1= false , flag2= false;
		if (theName == ""){
			document.getElementById("msgName").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>請輸入商品名稱";			
	}else if (theNameLen >= 2){
			for (i=0; i<theNameLen ; i++){
				let NameChr = theName.charAt(i).toUpperCase();
				let ch = theName.charCodeAt(i);
				if(NameChr >= "A" && NameChr <= "Z"){
					 flag1 = true;
				}else if(ch >= 0x4e00 && ch <= 0x9fff ){
					flag2 = true;
				}
			}//for迴圈結尾
			if(flag1 || flag2){
				document.getElementById("msgName").innerHTML="<img width='25px' height='25px' src='images/sign-ok.png'>正確";
			}else{
				document.getElementById("msgName").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>請輸入兩個以上的中文字或英文字母"
			}
		}//else if結尾
	else{
		document.getElementById("msgName").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>請輸入兩個以上的中文字或英文字母"
	}
}//function chkName結尾
	
	function chkDetail(){
		document.getElementById("msgPrice").innerHTML="";
		let theDetail = document.getElementById("productDetail").value;
		let theDetailLen = theDetail.length;
		let flag1= false, flag2= false;
		if (theDetail == ""){
			document.getElementById("msgDetail").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>請輸入商品說明";			
		}else if (theDetailLen >= 1 && theDetailLen <= 12){
			for (i=0; i<theDetailLen ; i++){
				let DetailChr = theDetail.charAt(i).toUpperCase();
				let ch = theDetail.charCodeAt(i);
				if(DetailChr >= "A" && DetailChr <= "Z"){
					 flag1 = true;
				}else if(ch >= 0x4e00 && ch <= 0x9fff){
					flag2 = true;
				}
			}//for迴圈結尾
			if(flag1 || flag2){
				document.getElementById("msgDetail").innerHTML="<img width='25px' height='25px' src='images/sign-ok.png'>正確"
			}else{
				document.getElementById("msgDetail").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>需輸入中文或英文"
			}		
		}//else if結尾
		else{
			document.getElementById("msgDetail").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>請輸入1個以上12個以下的中文字或英文字母"
		}
	}//function chkDetail結尾
	
	function chkPrice(){
		document.getElementById("msgPrice").innerHTML="";
		let thePrice = document.getElementById("unitPrice").value;
		let thePriceLen = thePrice.length;
		let flag1= false, flag2= false, flag3= false, flag4= false; 
		if(thePrice == ""){
			document.getElementById("msgPrice").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>請輸入商品價格"
		}else if(thePrice == 0){
			document.getElementById("msgPrice").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>價格不可為零"
		}else if(thePriceLen >=1){ 
			for(i=0 ; i<thePriceLen ; i++){
				let PriceChr = thePrice.charAt(i).toUpperCase();
				let ch = thePrice.charCodeAt(i);
				
				if(PriceChr >= "A" && PriceChr <= "Z"){
					flag1 = true;
				}else if(ch >= 0x4e00 && ch <= 0x9fff){
					flag2 = true;
				}else if(thePrice[0] == "0"){
					console.log("開頭數字:" + thePrice[0]);
					flag3 = true;
				}else if(thePrice < 0){
					flag4 = true;
				}
	            		
			}//for迴圈結尾
			if(flag1 || flag2 ){
				document.getElementById("msgPrice").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>不可輸入數字以外的字"
			}else if(flag3){
				document.getElementById("msgPrice").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>開頭數字不可為零"
			}else if (flag4){ 
				document.getElementById("msgPrice").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>價格不可為負數"
			}
			else{		
				document.getElementById("msgPrice").innerHTML="<img width='25px' height='25px' src='images/sign-ok.png'>正確"
			}
		}//else if結尾		
		else{
			document.getElementById("msgPrice").innerHTML="<img width='25px' height='25px' src='images/sign-ok.png'>正確"
		}
		
	}//function chkPrice結尾
	
	function chkDisc(){
		document.getElementById("msgDisc").innerHTML="";
		let theDisc = document.getElementById("discount").value;
		let theDiscLen = theDisc.length;
		let flag1= false, flag2= false ;
		
		if(theDisc == ""){
			document.getElementById("msgDisc").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>請輸入折扣"
		}else if(theDisc == 0){
			document.getElementById("msgDisc").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>若無折扣，請輸入10"
		}else if(theDiscLen >=4){
			document.getElementById("msgDisc").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>不可輸入超過四位數"
		}else if(theDiscLen >= 1){
			for(i=0; i<theDiscLen ; i++){
				if(theDisc[0] =="0"){
					flag1= true;
				}else if(theDisc < 0){
					flag2 = true;
				}
					
			}//for迴圈結尾
			if(flag1){
				document.getElementById("msgDisc").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>開頭數字不可為零"
			}else if(flag2){
				document.getElementById("msgDisc").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>折扣不可為負數"
			}else{
				document.getElementById("msgDisc").innerHTML="<img width='25px' height='25px' src='images/sign-ok.png'>正確"
			}
		}//else if結尾
		else {
			document.getElementById("msgDisc").innerHTML="<img width='25px' height='25px' src='images/sign-ok.png'>正確"
		}
				
	
}
	
	function chkStock(){
		document.getElementById("msgStock").innerHTML="";
		let theStock = document.getElementById("stock").value;
		let theStockLen = theStock.length;
		
		let flag1= false, flag2= false, flag3= false, flag4= false; 
		if(theStock == ""){
			document.getElementById("msgStock").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>請輸入庫存數量"
		}else if(theStock == 0){
			document.getElementById("msgStock").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>庫存不可為零"
		}else if(theStockLen >=1){ 
			for(i=0 ; i<theStockLen ; i++){
				let StockChr = theStock.charAt(i).toUpperCase();
				let ch = theStock.charCodeAt(i);
				
				if(StockChr >= "A" && StockChr <= "Z"){
					flag1 = true;
				}else if(ch >= 0x4e00 && ch <= 0x9fff){
					flag2 = true;
				}else if(theStock[0] == "0"){
					flag3 = true;
				}else if(theStock < 0){
                    flag4=true;
                }
			}//for迴圈結尾
			if(flag1 || flag2 ){
				document.getElementById("msgStock").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>不可輸入數字以外的字"
			}else if(flag3){
				document.getElementById("msgStock").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>開頭數字不可為零"
			}else if(flag4){
				document.getElementById("msgStock").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>庫存不可為負數"
			}else {
				document.getElementById("msgStock").innerHTML="<img width='25px' height='25px' src='images/sign-ok.png'>正確"
			}
		}//else if結尾		
		else{
			document.getElementById("msgStock").innerHTML="<img width='25px' height='25px' src='images/sign-error.png'>請輸入至少一位以上數字"
		}
			
}//function chkStock結尾
	
