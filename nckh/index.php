<?php
// Danh sách layout hợp lệ
$allowedLayouts = ['layout1', 'layout2', 'default'];

// Kiểm tra layout từ POST hoặc GET
$layout = $_POST['layout'] ?? $_GET['layout'] ?? 'layout1';

// Nếu layout không hợp lệ, đặt mặc định là layout1
if (!in_array($layout, $allowedLayouts)) {
    $layout = 'layout1';
}

// Chuyển hướng nếu layout chưa có trên URL (chỉ khi dùng GET)
if (!isset($_GET['layout'])) {
    header("Location: index.php?layout=$layout");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload C++ Files</title>
    <link rel="stylesheet" href="css/<?php echo htmlspecialchars($layout); ?>.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
</head>
<body>
    <div class="container">
        <h2>📂 Upload and Display C++ Files 🚀</h2>
        
        <!-- Toggle Sidebar Button -->
        <button class="toggle-btn" onclick="toggleMenu()">☰</button>

        <!-- Sidebar Menu -->
        <div id="sidebar" class="sidebar">
            <form action="index.php" method="GET">
                <input type="hidden" name="layout" value="layout1">
                <button type="submit">📄 Show 2 File Content</button>
            </form>

            <form action="index.php" method="GET">
                <input type="hidden" name="layout" value="layout2">
                <button type="submit">📂 Upload Multiple Files</button>
            </form>
        </div>

        <?php require "php/$layout.php"; ?>

    </div>

    <script src="JS/<?php echo htmlspecialchars($layout); ?>.js"></script>
</body>
</html>
