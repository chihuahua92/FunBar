var url = "/FunBar/";
var people;
document.onclick = function () {
    var obj = event.srcElement;
    if (obj.type == "submit") {

        var aaa = obj.value;
        document.getElementById("ab").value = aaa;
    }
}

var month_olypic = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
var month_normal = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
var month_name = ["January", "Febrary", "March", "April", "May",
    "June", "July", "Auguest", "September", "October", "November",
    "December"];

var holder = document.getElementById("days");
var prev = document.getElementById("prev");
var next = document.getElementById("next");
var ctitle = document.getElementById("calendar-title");
var cyear = document.getElementById("calendar-year");

var my_date = new Date();
var my_year = my_date.getFullYear();
var my_month = my_date.getMonth();
var my_day = my_date.getDate();
var today = 0;
function dayStart(month, year) {
    var tmpDate = new Date(year, month, 1);
    return (tmpDate.getDay());
}

function daysMonth(month, year) {
    var tmp1 = year % 4;
    var tmp2 = year % 100;
    var tmp3 = year % 400;

    if ((tmp1 == 0 && tmp2 != 0) || (tmp3 == 0)) {
        return (month_olypic[month]);
    } else {
        return (month_normal[month]);
    }
}

function refreshDate() {
    var str = "";

    var totalDay = daysMonth(my_month, my_year);
    var firstDay = dayStart(my_month, my_year);
    
    var sum = 0;
    for (var i = 0; i < firstDay; i++) {
        str += "<li >" + "</li>";
        sum  += 1 ;
    }
    


    for (var i = 1; i <= totalDay; i++) {

        var myclass;
        if ((my_year < my_date.getFullYear())
            || (my_year == my_date.getFullYear() && my_month < my_date
                .getMonth())
            || (my_year == my_date.getFullYear()
                && my_month == my_date.getMonth() && i < my_day)) {
            myclass = " class='lightgrey'";
        } else if (my_year == my_date.getFullYear()
            && my_month == my_date.getMonth() && i == my_day) {
            today = sum+(i-1);
            console.log(i);
            myclass = "class = 'box'";
        } else {
            myclass = "class = 'li'";

        }
        str += "<li tabindex='1' " + myclass + " >" + i + "</li>";
    }
    $("#days").html(str);
    $("#calendar-title").html(month_name[my_month]);
    $("#calendar-year").html(my_year);
}

refreshDate();

pre.onclick = function (e) {
    e.preventDefault();
    my_month--;
    if (my_month < 0) {
        my_year--;
        my_month = 11;
    }
    refreshDate();
    day();
}

next.onclick = function (e) {
    e.preventDefault();
    my_month++;
    if (my_month > 11) {
        my_month = 0;
        my_year++;
    }
    refreshDate();
    day();
}

day();

var date;

function day() {

    var ul = document.getElementById("days");
    var lis = ul.getElementsByTagName("li");

    for (var i = 0; i < lis.length; i++) {
    	
        lis[i].onclick = function () {
        	//$("#slc")[0].selectedIndex = 0;
            $("#days li").removeClass("add");
            $(this).addClass("add");

            date = my_year + "-" + (my_month + 1) + "-"
                + this.firstChild.nodeValue;
            var txt;
            $("#date").val(date);
//            document.getElementById("abc").value = date;
//            document.getElementById("slc").value = 1;
            
            $.ajax({
                url: "http://localhost:8080" + url + "admin/pullTodayRoomStatus",
                type:"POST",
                data: {
                    date:date,
                },
                dataType: "JSON",
                success: function (data) {
                	txt = "";
                	console.log(data)
                	console.log(data)
                	
            		txt += "<span style='color:#003C9D'>今日訂房狀況:</span>";
            		txt += "<table class='table table-striped' style='text-align:center'>";
            		txt += "<thead><tr><th>房型<th>客房數<th>尚可預約間數</tr></thead>";
            		txt += "<tbody>";
                	for(let i =0;i<data.pullTodayRoomStatus.length;i++){
                		if(data.pullTodayRoomStatus[i].room_quantity<5){
                			txt += "<tr><td>"+data.pullTodayRoomStatus[i].room_type+"</td><td>"+data.allroom[i].room_quantity+"</td><td class='tension'>"+data.pullTodayRoomStatus[i].room_quantity+"</td></tr>";
                		}else{
                			txt += "<tr><td>"+data.pullTodayRoomStatus[i].room_type+"</td><td>"+data.allroom[i].room_quantity+"</td><td class='Ample'>"+data.pullTodayRoomStatus[i].room_quantity+"</td></tr>";
                		}
                	}
                	txt += "</tbody></table>";
                    $("#today_status").html(txt);
                }

            })
           

    }
      
    }
}

console.log(today);
$("#days li").get(today).click();
