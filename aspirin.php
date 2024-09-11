<?php
include 'db_connection.php'; // Connect to the database

// Get the product ID from the URL
$product_id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Initialize variables
$product_name = '';
$product_description = '';
$product_directions = '';
$product_precautions = '';
$product_price = 0.00;
$product_image = '';

// Fetch product details from the database
if ($product_id > 0) {
    $query = "SELECT * FROM products WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $product_id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $product = $result->fetch_assoc();
        $product_name = htmlspecialchars($product['name']);
        $product_description = htmlspecialchars($product['description']);
        $product_directions = htmlspecialchars($product['directions']);
        $product_precautions = htmlspecialchars($product['precautions']);
        $product_price = number_format($product['price'], 2);
        $product_image = htmlspecialchars($product['image']);
    } else {
        echo '<p>Product not found.</p>';
        exit;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $product_name; ?> - Online Medical Store</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* General Styles */
        body {
            font-family: 'Roboto', Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background: #f4f4f4;
            color: #333;
        }

        /* Header Styles */
        header {
            background-color: #007BFF;
            color: white;
            padding: 20px 0;
            width: 100%;
            text-align: center;
        }

        /* Main Content Styles */
        main {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #007BFF;
        }

        .product-details {
            display: flex;
            gap: 20px;
        }

        .product-details img {
            max-width: 300px;
            border-radius: 5px;
        }

        .cta-button {
            display: inline-block;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s;
            margin-top: 10px;
        }

        .cta-button:hover {
            background-color: #0056b3;
        }

        footer {
            background-color: #343a40;
            color: white;
            padding: 15px 0;
            text-align: center;
        }
    </style>
</head>
<body>

    <header>
        <h1>Online Medical Store</h1>
    </header>
    
    <main>
        <h1><?php echo $product_name; ?></h1>
        <div class="product-details">
            <img src="<?php echo $product_image; ?>" alt="<?php echo $product_name; ?>">
            <div>
                <h2>Description</h2>
                <p><?php echo $product_description; ?></p>
                <h2>Directions for Use</h2>
                <p><?php echo $product_directions; ?></p>
                <h2>Precautions</h2>
                <p><?php echo $product_precautions; ?></p>
                <p><strong>Price: $<?php echo $product_price; ?></strong></p>
                <a href="#" class="cta-button" onclick="addToCart(<?php echo $product_id; ?>, <?php echo $product_price; ?>)">Add to Cart</a>
                <a href="cart.php" class="cta-button">Go to Cart</a>
                <a href="products.php" class="cta-button">Back to Product List</a>
            </div>
        </div>
    </main>
    
    <footer>
        <p>&copy; 2024 Online Medical Store</p>
    </footer>
    
    <script>
        function addToCart(productId, price) {
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            let productIndex = cart.findIndex(item => item.id === productId);

            if (productIndex > -1) {
                cart[productIndex].quantity += 1;
            } else {
                cart.push({ id: productId, price: price, quantity: 1 });
            }

            localStorage.setItem('cart', JSON.stringify(cart));
            alert('Item added to cart!');
        }
    </script>
    
</body>
</html>
