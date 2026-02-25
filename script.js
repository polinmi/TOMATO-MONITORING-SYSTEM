function login() {
  var user = document.getElementById("username").value;
  var pass = document.getElementById("password").value;

  if (user === "admin" && pass === "12345") {
    alert("Login successful!");
    window.location.href = "dashboard.html";
  } else {
    alert("Invalid username or password");
  }
}

function logout() {
  alert("Logged out successfully!");
  window.location.href = "index.html";
  
}
