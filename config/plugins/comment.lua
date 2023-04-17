local status_comment, comment = pcall(require, "Comment")
if not status_comment then
  print("Comment не подключен!")
  return
end

comment.setup()
