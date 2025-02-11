
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

function uploadFiles() {
    const input = document.getElementById('fileInput');
    const fileContentsDiv = document.getElementById('fileContents');

    if (input.files.length === 0) {
        alert('Vui lòng chọn ít nhất một file!');
        return;
    }

    for (let file of input.files) {
        if (!file.name.endsWith('.cpp')) {
            alert('Chỉ được phép tải lên file .cpp!');
            continue;
        }

        // Kiểm tra nếu file đã tồn tại (tránh trùng lặp)
        const fileId = `file-${btoa(file.name)}`;
        if (document.getElementById(fileId)) {
            alert(`File "${file.name}" đã được tải lên!`);
            continue;
        }

        const reader = new FileReader();
        reader.onload = function(event) {
            const content = event.target.result;
            const fileBlock = document.createElement('div');
            fileBlock.classList.add('code-block');
            fileBlock.id = fileId;
            fileBlock.innerHTML = `
                <h3>📜 ${file.name}</h3>
                <button class="delete-btn" onclick="removeFile('${fileId}')">X</button>
                <textarea readonly>${content}</textarea>
            `;
            fileContentsDiv.appendChild(fileBlock);
        };
        reader.readAsText(file);
    }
}

// Xóa một file cụ thể
function removeFile(fileId) {
    const fileBlock = document.getElementById(fileId);
    if (fileBlock) {
        fileBlock.remove();
    }
}

// Xóa toàn bộ file đã tải lên
function clearAllFiles() {
    document.getElementById('fileContents').innerHTML = '';
}

function searchFiles(event) {
    if (event.key === "Enter") { // Chỉ tìm khi nhấn Enter
        event.preventDefault(); 
        const searchValue = document.getElementById("searchInput").value.toLowerCase();
        const fileBlocks = document.querySelectorAll(".code-block");

        if(searchValue === ''){
            fileBlocks.forEach(block => {
                   block.style.display = "block";
            });
        }

        else{
            fileBlocks.forEach(block => {
                const fileName = block.querySelector("h3").innerText.toLowerCase();
                if (fileName.includes(searchValue)) {
                    block.style.display = "block"; // Hiện file phù hợp
                } else {
                    block.style.display = "none"; // Ẩn file không phù hợp
                }
            });
        }
    }
}
