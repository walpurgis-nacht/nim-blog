import jester, re, strutils
include inner

updatePosts()

routes:
  get "/":
    resp index()
  get re"^\/blog\/(\d)$":
    if len(request.matches) > 0:
      resp blog(parseInt(request.matches[0]))
  get "/list":
    resp list()
  error Http404:
    resp Http404, error("Not found")

db.close()
