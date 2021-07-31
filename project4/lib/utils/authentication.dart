final Map<String, Map<String, String>> users = {
  "ataatasoy": {"password": "ataatasoy", "email": "ataatasoy@email.com"},
  "sarptekin": {"password": "sarptekin", "email": "sarptekin@email.com"},
  "endrisuknaj": {"password": "endrisuknaj", "email": "endrisuknaj@email.com"},
  "ataykaylar": {"password": "ataykaylar", "email": "ataykaylar@email.com"},
};

bool signIn(username, password) {
  print(users[username]?["password"] == password);
  return users[username]?["password"] == password;
}

bool signUp(username, password, email) {
  if (users.containsKey(username)) {
    return false;
  } else {
    users[username] = {"password": password, "email": email};
    return true;
  }
}
