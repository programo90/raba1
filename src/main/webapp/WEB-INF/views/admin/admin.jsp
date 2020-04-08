 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>B.A. Admin</title>
 <link rel="stylesheet" href="/resources/css/admin/adminmembermanager.css">
  	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
 <script>
 document.getElementsByClassName('adminnav')[0].style.backgroundColor="#e8e8e8";
 </script>
 </head>
 <body>
         <div class="admincontents">
             <div class="admin_userbox">
                 관리자님 환영합니다! <span class="admin_logout"><a href="#">로그아웃</a></span>
             </div>
             <section class="admin_sectionbox">
                 <!-- 여기서 div만들고 시작하세요 controller에 file등록하고 사용하세요! ~~  -->
             <canvas id="myChart" width="10px" height="5px"></canvas>
            </section>
        </div>
        <script>

var ctx = document.getElementById("myChart");

var myChart = new Chart(ctx, {

    type: 'bar',

    data: {

        labels: ["1월", "2월", "3월", "4월", "5월", "6월","7월", "8월", "9월", "10월", "11월", "12월"],

        datasets: [{

            label: '2020년 월매출',

            data: [1721231, 1391234, 901237, 180000, 0, 0,0, 0, 0, 0, 0, 0],

            backgroundColor: [

                'rgba(255, 99, 132, 0.2)',

                'rgba(54, 162, 235, 0.2)',

                'rgba(255, 206, 86, 0.2)',

                'rgba(75, 192, 192, 0.2)',

                'rgba(153, 102, 255, 0.2)',

                'rgba(255, 159, 64, 0.2)'

            ],

            borderColor: [

                'rgba(255,99,132,1)',

                'rgba(54, 162, 235, 1)',

                'rgba(255, 206, 86, 1)',

                'rgba(75, 192, 192, 1)',

                'rgba(153, 102, 255, 1)',

                'rgba(255, 159, 64, 1)'

            ],

            borderWidth: 1

        }]

    },

    options: {

        scales: {

            yAxes: [{

                ticks: {

                    beginAtZero:true

                }

            }]

        }

    }

});

</script>
 </body>
 </html>