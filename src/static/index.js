document.getElementById('create-room').addEventListener('click', function () {
    fetch('/room', {
        method: 'POST'
    })
        .then(response => response.json())
        .then(data => {
            const roomLink = `${window.location.origin}/${data.room_id}`;
            const roomLinkElement = document.getElementById('room-link');
            console.log(roomLinkElement);
            if (roomLinkElement) {
                roomLinkElement.value = roomLink;
            }
        });
});
