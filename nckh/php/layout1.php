
       <!-- File Upload Form -->
        <form id="uploadForm">
            <input type="file" name="file1" id="file1" accept=".cpp,.h5" onchange="displayFileContent(event, 'code1')"> 
            <input type="file" name="file2" id="file2" accept=".cpp,.h5" onchange="displayFileContent(event, 'code2')"> 
        </form>

        <!-- File Content Display -->
        <div class="code-container">
            <div class="code-block">
                <h3>📜 File 1 Content</h3>
                <textarea id="code1" readonly></textarea>
            </div>
            <div class="code-block">
                <h3>📜 File 2 Content</h3>
                <textarea id="code2" readonly></textarea>
            </div>
        </div>
        
        <button id="Excel">📥 Export to Excel</button>