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
    
    <form id="storiesForm" name="storiesForm" method="POST" enctype="multipart/form-data" action="/roomie/storiesUploadPro.ya">
    	<input type="file" id="videoInput" name="videoInput">
    	<input type="hidden" id="start" name="start" value="0">
    	<input type="hidden" id="end" name="end" value="100">
    	<input type="hidden" id="duration" name="duration" value="0">
    	<input type="hidden" name="STORY_MEM" value="${MEM_ID}">
    	<input type="button" onclick="check(this.form)" value="업로드">
    </form>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript">

 		const videoInput = document.getElementById('videoInput');
		videoInput.addEventListener('change', () => {
			const file = videoInput.files[0];
			const url = URL.createObjectURL(file);
			const props = { video: url };
			
			if (file.name.substr(-3) == "mp4") {
				ReactHtml5VideoEditor.render_editor('', url);
			}
    	});
    </script>
    
    <script>
    	// start 시작 구간
    	function times_start(start) {
    		$('#start').val(start);
    	}
    	
    	// end 끝난 구간
    	function times_end(end) {
    		$('#end').val(end);
    	}
    	
    	// duration 총 시간
    	function times_duration(duration) {
    		// duration = Math.floor(duration)
    		$('#duration').val(duration);
    	}
    </script>
    <script>
		function check() {
			var start = parseInt(document.getElementById("start").value);
			var end = parseInt(document.getElementById("end").value);
			var duration = parseInt(document.getElementById("duration").value);

			start = start * 0.01 * duration; // 영상 시작 시간
			end = end * 0.01 * duration; // 영상 끝난 시간

			if (start == 0 && end == 0 && duration > 5) {
				alert("영상 시간은 5초이하만 업로드 가능합니다.");
				return false;
			}
			
			if (start > end) {
				alert("영상 끝나는 구간이 시작하는 구간보다 값이 작습니다.");
				return false;
			}
			
			if ((end - start) > 5) {
				alert("영상 시간은 5초이하만 업로드 가능합니다.");
				return false;
			}
			
			document.storiesForm.submit();
		}
    </script>
  </body>
</html>