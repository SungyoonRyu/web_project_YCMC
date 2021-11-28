	function delete_comment(i){
		var urlkey = $(location).attr('search');
		var boardID = urlkey.substring(urlkey.lastIndexOf("=")+1);
		var commentContent = $('#'+"commentContent"+i).text();
		console.log(boardID);
		var data={
			boardID: boardID,
			commentUser:$('#'+"commentUser"+i).text(),
			CommentDate:$('#'+"CommentDate"+i).text(),
			commentContent:$('#'+"commentContent"+i).text()
		};
		console.log(data);
		$.ajax({
			type:"Get",
			url:"commentdeleteAction",
			data :data,
			success:function(data){
				alert("에러");
			},
			error:function(request,status,error){
				alert("삭제 완료 ");
				location.reload();
			},
			complete:function(data,textStatus){
				
			}
		});
		
	}