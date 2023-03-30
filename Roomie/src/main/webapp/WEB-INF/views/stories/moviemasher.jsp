<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>React App</title>
    <link rel="stylesheet" type="text/css" href="./resources/stories_edit_react/src/css/custom.css">
  </head>
  <body>
    <div id='root'></div>
    <script src="./resources/stories_edit_react/dist/react-html5-video-editor.js"></script>
    <input type="file" id="videoInput">
    <script type="text/javascript">
    	ReactHtml5VideoEditor.render_editor('', './resources/image/KakaoTalk_Video_20230208_1703_11_457.mp4');
/* 		const videoInput = document.getElementById('videoInput');
		videoInput.addEventListener('change', () => {
		const file = videoInput.files[0];
		const url = URL.createObjectURL(file);
		const props = { video: url };

		ReactHtml5VideoEditor.render_editor('', url);
    }); */
    </script>
  </body>
  <!-- 
  
  console.log(this.formatTime(this.props.currentTime))
  this.props.currentTime // 현재 시간
  this.props.duration // 총 시간
  
  
   -->
</html>