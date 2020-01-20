json.text  @comment.text
json.post_id  @comment.post_id
json.user_id  @comment.user_id
json.user_name  @comment.user.name
json.date  @comment.created_at.strftime("%Y/%m/%d(%a) %H:%M")
