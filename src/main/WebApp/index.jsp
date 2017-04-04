<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
         <meta charset="UTF-8" />
    </head>
	<style type="text/css">
		/* body{    background: url('images/page1.jpg') no-repeat center center fixed;    
		-webkit-background-size: cover;   
		-moz-background-size: cover;   
		-o-background-size: cover;   
		background-size: cover;} */
		div{
			 margin:0 auto;    
		}
	</style>
	<script type="text/javascript">
		function getImageUrl(){
				var img_path='http://www.tongshuanglong.com:8081/homebgimg/';

				var end_img_num = 100264;
				var beg_img_num = 100000;
				var pname="";
				pname=parseInt(Math.random()*(end_img_num-beg_img_num)+beg_img_num);

				return img_path+'IMG'+pname+'.JPG';
		}
		
	</script>
    <body id="bgbody">
        <div >
           童双龙
        </div> 
		<img id="bg" src="#" width="100%" height="100%" style="right: 0; bottom: 0;position: absolute; top: 0; left: 0; z-index: -1" />  
    </body>
	<script type="text/javascript">
		(function(){
			document.getElementById("bg").src=getImageUrl();
		})(); 
		/* =================第一种，用setInterval实现淡入淡出 beg=================*/
		/* function fadeIn(obj,time){//淡入函数  实现time毫秒后显示，原理是根据透明度来完成的
            var startTime=new Date(); 
            obj.style.opacity=0;//设置下初始值透明度
            obj.style.display="block";
            var timer=setInterval(function(){
                var nowTime=new Date();
                var prop=(nowTime-startTime)/time;
                if(prop>=1){
                    prop=1;//设置最终系数值
                    clearInterval(timer);
                }
                obj.style.opacity=prop;//透明度公式： 初始值+系数*（结束值-初始值）
            },13);//每隔13ms执行一次function函数
        };
        
        function fadeOut(obj,time){
            var startTime=new Date(); 
            obj.style.opacity=1;//设置下初始值透明度
            obj.style.display="block";
            var timer=setInterval(function(){
                var nowTime=new Date();
                var prop=(nowTime-startTime)/time;
                if(prop>=1){
                    prop=1;//设置最终系数值
                    clearInterval(timer);
                }
                obj.style.opacity=1+prop*(0-1);//透明度公式： 初始值+系数*（结束值-初始值）
            },13);//每隔13ms执行一次function函数
        }; */
		/* =================第一种，用setInterval实现淡入淡出 end=================*/

		/* =================第二种，用setTimeout实现淡入淡出 beg=================*/
		var setOpacity = function(elem, opacity) {
			/*
			 * elem : The id of the element; 
			 * opacity: The value of alpha, which is a decimals.
			 */
			if(elem.style.filter) {   //IE
				elem.style.filter = 'alpha(opacity:' + opacity * 100 + ')';
			} else {
				elem.style.opacity = opacity;    
			}
		}
		
		var fadeIn = function(elem, speed) {
			 elem.style.display = "block";
			 setOpacity(elem, 0);

			 var tempOpacity = 0;
			 (function(){
				 setOpacity(elem, tempOpacity);
				 tempOpacity += 0.05;
				 if(tempOpacity <= 1) {
					 setTimeout(arguments.callee, speed);
					 //tempOpacity += 0.05;
				 }
			 })();
}

		var fadeOut = function (elem, speed,img_current_image,callback) {
			 //elem.style.display="block";
			 var tempOpacity = 1;
			 (function(){
				 setOpacity(elem, tempOpacity);
				 tempOpacity -= 0.05;
				 if(tempOpacity > 0) {
					 setTimeout(arguments.callee, speed);
				 }  else {
					 //elem.style.display = "none"; //不可放在匿名函数外面会先执行。
					elem.src = img_current_image;
					callback(elem,speed);
				} 
			 })();
		}

		var fadeTo = function (elem, speed, opacity){
			 var tempOpacity = 0;
			 elem.style.display = "block";
			 (function(){
				 setOpacity(elem, tempOpacity);
				 tempOpacity += 0.05;
				 if(tempOpacity <= opacity) {
					 setTimeout(arguments.callee, speed);
				 }
			 })();
		}	
		/* =================第二种，用setTimeout实现淡入淡出 end=================*/
			
		function toggleBgPicture(){
			/* if ('querySelector' in document) {
				var body = document.querySelector('body');
			} else {
				var body = document.body;
			} */
			
			var imgbg=document.getElementById("bg");
			
			fadeOut(imgbg,100,getImageUrl(),fadeIn);
			
			/* var span = document.getElementById('img_placer');
			span.innerHTML = '<span style="background-image: url('+(img_current_image=img_url())+');width: 0px;height: 0px;display: inline;"></span>';
 */
        }
		setInterval("toggleBgPicture()",300000); 
	</script>
</html>
