document.getElementById('loginForm').addEventListener('submit', async function(event) {
    event.preventDefault();
    
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    
    const response = await fetch('/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ username, password })
    });
    
    const result = await response.json();
    
    const messageElement = document.getElementById('message');
    if (result.success) {
        window.location.href = '/home.html';
    } else {
        messageElement.textContent = 'Login failed: ' + result.message;
        messageElement.className = 'error';
    }
});
