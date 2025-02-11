<form id="uploadForm">
    <input type="file" id="fileInput" accept=".cpp" multiple>
    <button type="button" onclick="uploadFiles()">📤 Upload Files</button>
    <button type="button" onclick="clearAllFiles()">🧹 Clear</button>

    <div class="search-container">
    <input type="text" id="searchInput" placeholder="🔍 Nhập tên file để tìm..." onkeypress="searchFiles(event)">
</div>


    <button type="button" onclick="exportToExcel()">📥 Import Excel</button>
</form>

<!-- Hiển thị nội dung file -->
<div id="fileContents" class="code-container"></div>