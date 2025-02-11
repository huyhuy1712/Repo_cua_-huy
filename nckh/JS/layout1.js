
function displayFileContent(event, textareaId) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById(textareaId).value = e.target.result;
        };
        reader.readAsText(file);
    }
}


document.getElementById('Excel').addEventListener('click', function() {
    let data = [
        ['File Name', 'Content'],
        ['File 1', document.getElementById('code1').value],
        ['File 2', document.getElementById('code2').value]
    ];
    
    let wb = XLSX.utils.book_new();
    let ws = XLSX.utils.aoa_to_sheet(data);
    XLSX.utils.book_append_sheet(wb, ws, "C++ Files");
    XLSX.writeFile(wb, "files_content.xlsx");
});


// Lấy phần tử sidebar và nút toggle
const sidebar = document.getElementById("sidebar");
const toggleBtn = document.querySelector(".toggle-btn");

function toggleMenu() {
    sidebar.classList.toggle("active");

    if (sidebar.classList.contains("active")) {
        toggleBtn.innerHTML = "✖"; // Icon đóng
    } else {
        toggleBtn.innerHTML = "☰"; // Icon mở
    }
}
