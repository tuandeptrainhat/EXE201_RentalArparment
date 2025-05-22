const connection = new signalR.HubConnectionBuilder()
    .withUrl("/chatHub")
    .withAutomaticReconnect()
    .build();

// Use the global variable passed from the Razor view
connection.on("ReceiveMessage", (messageId, senderId, senderName, content, timestamp) => {
    const chatMessages = document.getElementById("chatMessages");
    const isOwnMessage = senderId === currentUserId; // Use currentUserId
    const messageClass = isOwnMessage ? "bg-blue-100 text-right" : "bg-gray-100 text-left";
    const messageHtml = `
        <div class="p-2 my-2 rounded ${messageClass}">
            <strong>${senderName}</strong>: ${content}<br>
            <small>${timestamp}</small>
        </div>`;
    chatMessages.innerHTML += messageHtml;
    chatMessages.scrollTop = chatMessages.scrollHeight;
});

connection.on("UpdateUserStatus", (userId, isOnline) => {
    const statusElement = document.getElementById(`status-${userId}`);
    if (statusElement) {
        statusElement.textContent = isOnline ? "Đang hoạt động" : "Ngoại tuyến";
    }
});

connection.on("NewMessageNotification", (conversationId, senderName, content) => {
    const notification = document.createElement("div");
    notification.className = "bg-yellow-100 p-2 my-2";
    notification.textContent = `Tin nhắn mới từ ${senderName}: ${content}`;
    document.getElementById("notifications").appendChild(notification);
    // Optionally, you might want to click the conversation if it's a new message
    // or highlight it in the sidebar.
});

connection.on("ConversationStarted", (conversationId) => {
    window.location.href = `/Chat/Index?conversationId=${conversationId}`;
});

async function start() {
    try {
        await connection.start();
        console.log("SignalR Connected.");
    } catch (err) {
        console.log(err);
        setTimeout(start, 5000);
    }
}

async function sendMessage(conversationId, content) {
    if (content.trim()) {
        await connection.invoke("SendMessage", conversationId, content);
        document.getElementById("messageInput").value = "";
    }
}

async function startConversation() {
    await connection.invoke("StartConversation", currentUserId); // Use currentUserId
}

connection.onclose(async () => {
    await start();
});

start();