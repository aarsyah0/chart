<?php
session_start();
include('../koneksi/koneksi.php');  // Make sure this file contains the correct database connection

// Check if the request is valid
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get the product_id from the incoming POST request (JSON)
    $data = json_decode(file_get_contents("php://input"), true);

    if (isset($data['product_id'])) {
        $product_id = $data['product_id'];
        $user_id = $_SESSION['user']['user_id']; // Get user_id from session
        $quantity = 1; // Default quantity, can be updated if needed

        // Check if the product is already in the user's cart
        $check_query = "SELECT * FROM cart WHERE user_id = ? AND product_id = ?";
        $stmt = $conn->prepare($check_query);
        $stmt->bind_param("ii", $user_id, $product_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            // If the product is already in the cart, update the quantity
            $update_query = "UPDATE cart SET quantity = quantity + 1 WHERE user_id = ? AND product_id = ?";
            $stmt = $conn->prepare($update_query);
            $stmt->bind_param("ii", $user_id, $product_id);
            if ($stmt->execute()) {
                echo json_encode(['success' => true, 'message' => 'Product quantity updated']);
            } else {
                echo json_encode(['success' => false, 'message' => 'Failed to update cart']);
            }
        } else {
            // If the product is not in the cart, add it
            $insert_query = "INSERT INTO cart (user_id, product_id, quantity, added_at) VALUES (?, ?, ?, NOW())";
            $stmt = $conn->prepare($insert_query);
            $stmt->bind_param("iii", $user_id, $product_id, $quantity);
            if ($stmt->execute()) {
                echo json_encode(['success' => true, 'message' => 'Product added to cart']);
            } else {
                echo json_encode(['success' => false, 'message' => 'Failed to add product to cart']);
            }
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Product ID is missing']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request']);
}

$conn->close();
?>
